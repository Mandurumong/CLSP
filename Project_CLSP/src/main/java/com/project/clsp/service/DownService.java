package com.project.clsp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.clsp.dao.IBoardRepository;
import com.project.clsp.dao.IMemberRepository;
import com.project.clsp.model.MemberDto;

@Service
public class DownService implements IDownService{

	@Autowired
	private IMemberRepository memberRepository;
	
	@Autowired
	private IBoardRepository boardRepository;
	
	@Override
	public void excelMDown(MemberDto memberDto, HttpServletResponse response){
		
		List<MemberDto> memberList = memberRepository.memberList();
		
		try {
			Workbook workbook = new HSSFWorkbook();
			
			Sheet sheet = workbook.createSheet("CLSP_회원관리");
			
			Row row = null;
			Cell cell = null;
			int rowNo = 0;
			
			//테이블 헤더용 스타일
			CellStyle headStyle = workbook.createCellStyle();
			
			//데이터용 스타일
			CellStyle bodyStyle = workbook.createCellStyle(); 
			
			//헤더명 설정
			String[] headerArray = {"아이디", "비밀번호", "이메일", "가입일", "등급"};
			row = sheet.createRow(rowNo++);
			for(int i=0; i < headerArray.length; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyle);
				cell.setCellValue(headerArray[i]);
			}
			
			//데이터 넣기
			for(MemberDto excelDate : memberList) {
				
				row = sheet.createRow(rowNo++);
				cell = row.createCell(0);
				cell.setCellValue(excelDate.getUser_id());
				
				cell = row.createCell(1);
				cell.setCellValue(excelDate.getUser_pw());
				
				cell = row.createCell(2);
				cell.setCellValue(excelDate.getUser_email());
				
				cell = row.createCell(3);
				cell.setCellValue(excelDate.getReg_date());
				
				cell = row.createCell(4);
				cell.setCellValue(excelDate.getUser_level());
			}
			
			//컨텐츠 타입과 파일명 지정
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment; filename="+ java.net.URLEncoder.encode("CLSP_회원관리.xls", "UTF8"));
			
			//excel 출력
			workbook.write(response.getOutputStream());
			workbook.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void excelBDown(Map<String, Object> map, HttpServletResponse response) {
		
		List<Map<String, Object>> boardList = boardRepository.getBoards(map);
		
		try {
			Workbook workbook = new HSSFWorkbook();
			
			Sheet sheet = workbook.createSheet("CLSP_게시글관리");
			
			Row row = null;
			Cell cell = null;
			int rowNo = 0;
			
			//테이블 헤더용 스타일
			CellStyle headStyle = workbook.createCellStyle();
			
			//데이터용 스타일
			CellStyle bodyStyle = workbook.createCellStyle(); 
			
			//헤더명 설정
			String[] headerArray = {"FB_NUM", "제목", "내용", "카테고리", "작성자", "조회수", "작성일", "FB_GROUP", "FB_STEP", "FB_INDENT"};
			row = sheet.createRow(rowNo++);
			for(int i=0; i < headerArray.length; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyle);
				cell.setCellValue(headerArray[i]);
			}
			
			//데이터 넣기
			for(Map<String, Object> board : boardList) {
				row = sheet.createRow(rowNo++);
				cell = row.createCell(0);
				cell.setCellValue((String)board.get("FB_CAREGORY"));
				
				cell = row.createCell(1);
				cell.setCellValue((Integer)board.get("FB_NUM"));
				
				cell = row.createCell(2);
				cell.setCellValue((String)board.get("FB_TITLE"));
				
				cell = row.createCell(3);
				cell.setCellValue((String)board.get("FB_USERID"));
				
				cell = row.createCell(4);
				cell.setCellValue((String)board.get("FB_DATE"));
			}
			
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment; filename="+ java.net.URLEncoder.encode("CLSP_게시글관리.xls", "UTF8"));
			
			//excel 출력
			workbook.write(response.getOutputStream());
			workbook.close();
		
	}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}

