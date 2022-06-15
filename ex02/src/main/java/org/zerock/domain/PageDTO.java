package org.zerock.domain;

import lombok.Data;

@Data
public class PageDTO {
	//페이지바 이전페이지 ,다음페이지,시작값,끝값
	private boolean prev,next;
	private int startPage, endPage;
	
	private long total; //전체 개수파악
	private Criteria cri; // 몇개씩 보여줄지, 현재페이지 정보 
	
	public PageDTO(Criteria cri, long total) {
		this.cri = cri;
		this.total=total;
		
		//끝페이지 바 
//		endPage = 올림( 현재페이지 / 10) * 10
		endPage = (int)Math.ceil(cri.getPageNum()/10.0) * 10; // 더블값이 됨 -> 다시 int로 변환 
				//10.0인 이유는 더블값을 해야 올림처리가 가능함(현재페이지,10이 모두 정수라서 소수필요해서 10.0)
		//첫페이지 바
		startPage = endPage-9;
		//이전페이지 바
		prev = startPage !=1; // 스타트페이지 바가 1이 아니다 =>>TRUE (시작값이 1이 아니다)
		
		//진짜마지막페이지바 번호 = 올림(전체글 개수 / 한페이지에 보여줄 개수)
//		int realEnd = (int)Math.ceil((double)total/cri.getAmount());
		int realEnd = (int)Math.ceil(total * 1.0 /cri.getAmount());
		
		if(endPage > realEnd) //마지막 페이지바 번호가 실제 페이지바 번호보다 크다면  
			endPage=realEnd; //마지막 페이지바 번호를 실제페이지바 값으로 변경
		
		next = endPage < realEnd; 
	}
}