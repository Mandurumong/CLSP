package com.project.clsp.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data

@Setter
@Getter
public class PagingDto {
	// ����������
		private int nowPage;
		// ����������
		private int startPage; 
		// ��������
		private int endPage;
		// �Խñ� �� ����
		private int total; 
		// �������� �� ����
		private int cntPerPage;
		// ������������ 
		private int lastPage; 
		// sql ������ start
		private int start; 
		// sql ������ end
		private int end;
		private int cntPage = 5;
		
		public PagingDto() {
		}
		
		public PagingDto(int total, int nowPage, int cntPerPage) {
			setNowPage(nowPage);
			setCntPerPage(cntPerPage);
			setTotal(total);
			calcLastPage(getTotal(), getCntPerPage());
			calcStartEndPage(getNowPage(), cntPage);
			calcStartEnd(getNowPage(), getCntPerPage());
		}
		// ���� ������ ������ ���
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
		}
		// ����, �� ������ ���
		public void calcStartEndPage(int nowPage, int cntPage) {
			setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
			if (getLastPage() < getEndPage()) {
				setEndPage(getLastPage());
			}
			setStartPage(getEndPage() - cntPage + 1);
			if (getStartPage() < 1) {
				setStartPage(1);
			}
		}
		// DB �������� ����� start, end�� ���
		public void calcStartEnd(int nowPage, int cntPerPage) {
			setEnd(nowPage * cntPerPage);
			setStart(getEnd() - cntPerPage + 1);
		}
}
