package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	private BoardMapper mapper;
	
	
	@Override
	public void register(BoardVO vo) {
		// mapper.insert(vo);
		mapper.insertSelectKey(vo); // 글 등록시 글 번호 알기
	}

	@Override
	public BoardVO get(Long bno) {
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO vo) {
		return (mapper.update(vo)==1);
	}

	@Override
	public boolean remove(Long bno) {
		return (mapper.delete(bno)==1);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public Long count() {
		return mapper.count();
	}

}
