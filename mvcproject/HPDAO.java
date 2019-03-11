package com.itbank.mvcproject;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HPDAO {
	
	private Logger logger = LoggerFactory.getLogger(HPDAO.class);
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<HPDTO> selectAllPaging(PagingVo paging) {
		logger.info("selectPaging : " + paging);
		 
		return sqlSession.selectList("hp.selectAllPaging", paging);
	}
	
	public List<HPDTO> selectLoPaging(PagingVo paging){
		logger.info("selectLoPaging : " + paging);
		 
		return sqlSession.selectList("hp.selectLoPaging", paging);
		
	}

	public int selectTotalPaging() {
		logger.info("selectTotalPaging");
		return sqlSession.selectOne("hp.selectTotalPaging");
	}
	
	public int selectPaging(HPDTO dto) {
		logger.info("selectPaging");
		return sqlSession.selectOne("hp.selectPaging" ,dto);
	}

	public boolean listInsert(HPDTO list) {
		logger.info("listInsert : " + list);
		return sqlSession.insert("hp.listInsert", list)==1 ? true : false;
	}
	public boolean deleteAll() {
		logger.info("deleteAll");
		return sqlSession.delete("hp.deleteAll")==0 ? true : false;
	}
	
	public List<HPDTO> selectLo(HPDTO dto) {
		return sqlSession.selectList("hp.selectLo", dto);
	}
	
	public void insertHP(HPDTO dto){
		sqlSession.insert("hp.insert", dto);
	}
	/*public void insertHP(HPDTO dto){
		sqlSession.insert("hp.insert", dto);
	}
	
	public void update(HPDTO dto) throws Exception {
		myBatis.update("hp.update", dto);
	}

	
	 * public void selectCheck(HPDTO dto) throws Exception {
	 * myBatis.update("hp.selectCheck", dto); }
	 
	@Override
	public void delete(HPDTO dto) throws Exception {
		myBatis.delete("hp.delete", dto);
	}
	@Override
	public void insertHP(HPDTO dto) throws Exception {
		myBatis.insert("hp.insert", dto);
	}
	@Override
	public List<HPDTO> selectAll() throws Exception {
		return myBatis.selectList("hp.selectAll");
	}
	@Override
	public HPDTO select(HPDTO dto) throws Exception {
		return myBatis.selectOne("hp.select", dto);
	}
	
*/
}
