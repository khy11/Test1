package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	//글등록
	public void register(BoardVO vo);
	
	//글상세보기
	public BoardVO get(Long bno);
	
	//글수정
	public boolean modify(BoardVO vo);
	
	//글삭제
	public boolean remove(Long bno);
	
	//목록보기
	public List<BoardVO> getList(Criteria cri);
	
	//퀴즈
	public Long count();
}




