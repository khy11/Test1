package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.logging.annotations.Log;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService service;
	//목록보기
	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		service.getList(cri).forEach(vo -> log.info(vo));
	}
	//글등록
	@Test
	public void testRegister() {
		BoardVO vo = new BoardVO();
		vo.setTitle("난제목");
		vo.setContent("난내용");
		vo.setWriter("테스터1");
		service.register(vo);
	}
	
	//글삭제
	@Test
	public void testRemove() {
		log.info("삭제된 글의 개수는:"+ service.remove(3L));
	}
	
	//글수정
	@Test
	public void testModify() {
		BoardVO vo = new BoardVO();
		vo.setBno(5L);
		vo.setTitle("aaaa");
		vo.setContent("bbbbbbb");
		vo.setWriter("ccccc");
		
		
		log.info("수정된 글의 개수는:" + service.modify(vo));
	}
	
	//글상세보기
	@Test
	public void testGet() {
		
		log.info("상세보기:" + service.get(1L));
	}
	
}
