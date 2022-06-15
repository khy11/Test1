package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor //필드값을 받는 기본생성자 자동으로 만듦
public class Criteria {

	//페이지 번호, 한 페이지당 갯수 
	private int pageNum=1;
	private int amount=10;
	
	//1.기본생성자 -> 기본값 1,10
	public Criteria() {
//	this(1,10); pageNum과 amount에 1,10대입과 같은 의미
	
	}
	//2.추가생성자 -> 값 넣어서 만들기
	
}
