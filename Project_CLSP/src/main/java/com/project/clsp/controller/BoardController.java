package com.project.clsp.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.clsp.model.PagingDto;
import com.project.clsp.service.IBoardService;
import com.project.clsp.service.IMemberService;

@Controller
public class BoardController {

	@Autowired
	IBoardService boardService;
	
	@Autowired
	IMemberService memberService;
	
	@RequestMapping("/board")
	public String boardList(@RequestParam(required=true)int fbNum, Model model, HttpServletRequest req) {
		
		String referer = req.getHeader("Referer");
		System.out.println("referer "+ referer);
		
		// ��۵� �ҷ�����
		List<Map<String, Object>> replies = boardService.getReplies(fbNum);
		// �Խñ� �ҷ�����
		Map<String, Object> board = boardService.getBoardView(fbNum);
		System.out.println("board "+ board);
		
		// ��ȸ��
		// �������󿡼� ��û�� �ι��ϴ� ������ ��ȸ���� 2�� �����ϰ��־���
		// ���� ��û�� �Ǻ��ϱ� ���� ��û ����� ���۷��� �̿�, ���� ��û���� ��ȸ���� ������Ű���� ��
		if(referer != null) {
			if(referer.split("clsp")[1].contains("fbNum") ) {
				boardService.updateHit(fbNum, board.get("FB_COUNT").toString());
			}
		}
		
		
		model.addAttribute("board", board);
		model.addAttribute("replies", replies);
		
		return "/board/view";
	}
	
	@RequestMapping("board/list")
	public String boardList(@RequestParam(required=false, defaultValue="1")int page,
			@RequestParam(required = false, defaultValue = "all")String category,
			@RequestParam(required = false)String type,
			@RequestParam(required = false)String keyword,
			HttpServletRequest req, Model model) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("type", type);
		map.put("keyword", keyword);
		
		int cnt = boardService.getBoardCount(map);
		
		PagingDto paging  = new PagingDto(cnt, page, 10);
		
		//����¡�� �Ǿ���ϹǷ� ����¡ ������ ���
		map.put("start", paging.getStart());
		map.put("end", paging.getEnd());
		
		Enumeration<String> attributes = req.getSession().getAttributeNames();
		while (attributes.hasMoreElements()) {
		    String attribute = (String) attributes.nextElement();
		    System.err.println(attribute+" : "+req.getSession().getAttribute(attribute));
		}
		
		List<Map<String, Object>> list = boardService.getBoards(map);
		
		model.addAttribute("paging", paging);
		model.addAttribute("boardList", list);
		
		return "board/list";
	}
	
	@GetMapping(value="board/reply/write")
	public String boardReplyWriteForm(Model model, @RequestParam(required=true) int fbNum) {
		Map<String, Object> board = boardService.getBoardView(fbNum);
		model.addAttribute("board", board);
		return "/board/repWrite";
	}
	
	@RequestMapping(value="/board/write", method=RequestMethod.GET )
	public String boardWriteForm(Model model) {
		return "/board/write";
	}

	@PostMapping(value="board/write")
	public String boardWrite(@RequestParam Map<String,Object> map, Model model, HttpServletRequest req) {
		String referer = req.getHeader("Referer");
		System.out.println("referer "+ referer);
		System.out.println("write map : "+ map);
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		map.put("userId", id);
		
		// ����� ���
		if(map.get("group") != null) {
			if(referer != null) {
			boardService.insertReplyBoard(map);
			}
			
		}else {
			// �Խñ� �ۼ�	
			if(referer != null) {
				boardService.insertBoard(map);
			}
		}
		
		// �ۼ��� �Խñ��� �ε��� ��������
		int fbNum = boardService.currentBoardIdx();
					
		return "redirect:/board?fbNum="+fbNum;
		
	}
	
	@GetMapping(value="/board/edit")
	public String boardEditForm(Model model, @RequestParam(required=true) int fbNum) {
		Map<String, Object> board = boardService.getBoardView(fbNum);
		model.addAttribute("board", board);
		
		return "board/freeBoard_modify";
	}

	@PostMapping(value="board/edit")
	public String boardEdit(@RequestParam Map<String,Object> map, Model model, HttpServletRequest req) {
		String referer = req.getHeader("Referer");
		System.out.println("referer "+ referer);
		System.out.println("map "+ map);
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		map.put("userId", id);
		
		// �Խñ� ����
		boardService.updateBoard(map);
		
		// �ۼ��� �Խñ��� �ε��� ��������
		int fbNum = Integer.parseInt(map.get("fbNum").toString());
		
	
		return "redirect:/board?fbNum="+fbNum;
		
	}
	
	@GetMapping(value="/board/delete")
	public String boardDelete(@RequestParam(required=true) int fbNum, HttpServletRequest req) {
		
		// �Խñ� ����
		boardService.deleteBoard(fbNum);
		
	
		return "redirect:/board/list";
		
	}
	
	@PostMapping(value="/reply/write")
	public String replyWrite(@RequestParam Map<String,Object> map, Model model, HttpServletRequest req) {
		String referer = req.getHeader("Referer");
		System.out.println("referer "+ referer);
		System.out.println("map "+ map);
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		map.put("replyUserId", id);
		System.out.println("userId "+ id);
		
		
		// ��� �ۼ�
		if(referer != null) {
			boardService.insertReply(map);
		}
		
		// �ۼ��� �Խñ��� �ε��� ��������
		String fbNum = map.get("fbNum").toString();
		
		return "redirect:/board?fbNum="+fbNum;
		
	}
	
	@GetMapping(value="/reply/delete")
	public String replyDelete(@RequestParam(required=true) int fbNum, @RequestParam(required=true) int replyNum, HttpServletRequest req) {
		
		boardService.replyDelete(replyNum);
		
	
		return "redirect:/board?fbNum="+fbNum;
		
	}

}
