package com.itbank.mvcproject;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	public void insert(BoardDTO dto) throws Exception {
		myBatis.insert("board.insert", dto);
	}
	public void delete(BoardDTO dto) throws Exception {
		myBatis.delete("board.delete", dto);
	}
	public void update(BoardDTO dto) throws Exception {
		myBatis.update("board.update", dto);
	}
	public BoardDTO select(BoardDTO dto) throws Exception {
		return myBatis.selectOne("board.select", dto);
	}
	public List<BoardDTO> selectAll() throws Exception {
		
		List<BoardDTO> list = myBatis.selectList("board.selectAll");
		return list;
	}

}
