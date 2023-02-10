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
		
		StringBuffer referer = req.getRequestURL();
		String gueryString = req.getQueryString();
		System.out.println("referer "+ referer);
		System.out.println("gueryString" + gueryString);
		
		// 댓글들 불러오기
		List<Map<String, Object>> replies = boardService.getReplies(fbNum);
		
		// 게시글 불러오기
		Map<String, Object> board = (Map)boardService.getBoardView(fbNum).get(null);
		System.out.println("board "+ board);
		System.out.println("fb_num" + board.get("FB_NUM"));
		
		// 조회수
		// 브라우저상에서 요청을 두번하는 오류로 조회수가 2씩 증가하고있었음
		// 실제 요청만 판별하기 위해 요청 헤더의 리퍼러를 이용, 실제 요청에만 조회수를 증가시키도록 함
		if(referer != null) {
			System.out.println("조회수 조회");
			if(gueryString.contains("fbNum") ) {
				System.out.println("들어옴");
				boardService.updateHit(fbNum, board.get("FB_COUNT").toString());
			}
			else {
				System.out.println("문제");
			}
		}	
		model.addAttribute("board", board);
		model.addAttribute("replies", replies);
		
		return "/board/view";
	}
	//list
	@RequestMapping("/board/list")
	public String boardList(@RequestParam(required=false, defaultValue="1")int page,
			@RequestParam(required = false, defaultValue = "all")String category,
			@RequestParam(required = false)String type,
			@RequestParam(required = false)String keyword,
			HttpServletRequest req, Model model) {
		
		// 검색을 위한 파라미터 맵
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("type", type);
		map.put("keyword", keyword);
		
		int cnt = boardService.getBoardCount(map);
		
		PagingDto paging  = new PagingDto(cnt, page, 10);
		
		// 페이징도 되어야하므로 페이징 데이터도 담기
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
	
	@GetMapping(value="/board/reply/write")
	public String boardReplyWriteForm(Model model, @RequestParam(required=true) int fbNum) {
		Map<String, Object> board = boardService.getBoardView(fbNum);
		model.addAttribute("board", board);
		return "/board/repWrite";
	}
	
	@GetMapping(value="/board/write")
	public String boardWriteForm(Model model) {
		return "/board/write";
	}

	@PostMapping(value="/board/write")
	public String boardWrite(@RequestParam Map<String,Object> map, Model model, HttpServletRequest req) {
			
		String referer = req.getHeader("Referer");
		System.out.println("referer "+ referer);
		System.out.println("write map : "+ map);
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("user_id").toString();
		map.put("userId", id);
		
		// 답글일 경우
		if(map.get("group") != null) {
			if(referer != null) {
				boardService.insertReplyBoard(map);
			}
			
		}else {
			// 게시글 작성	
			if(referer != null) {
				boardService.insertBoard(map);
			}
		}
		
		// 작성한 게시글의 인덱스 가져오기
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
		
		// 게시글 수정
		boardService.updateBoard(map);
		System.out.println("map 업데이트");
		
		// 작성한 게시글의 인덱스 가져오기
		System.out.println(map.get("fbNum"));
		
		int fbNum = Integer.parseInt(map.get("fbNum").toString());
		
	
		return "redirect:/board?fbNum="+fbNum;
		
	}
	
	@GetMapping(value="/board/delete")
	public String boardDelete(@RequestParam(required=true) int fbNum, HttpServletRequest req) {
		
		// 게시글 삭제
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
		
		
		// 댓글 작성
		if(referer != null) {
			boardService.insertReply(map);
		}
		
		// 작성한 게시글의 인덱스 가져오기
		String fbNum = map.get("fbNum").toString();
		
		return "redirect:/board?fbNum="+fbNum;
		
	}
	
	@GetMapping(value="/reply/delete")
	public String replyDelete(@RequestParam(required=true) int fbNum, @RequestParam(required=true) int replyNum, HttpServletRequest req) {
		
		boardService.replyDelete(replyNum);
		
	
		return "redirect:/board?fbNum="+fbNum;
		
	}

}
