package com.itbank.mvcproject;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reservationdao")
public class ReservationDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	public List<ReservationDTO> select(HashMap<String, Object> map) {
		List<ReservationDTO> list = myBatis.selectList("reservation.res", map);
		return list;
	}
	
	public void insert(ReservationDTO dto) throws Exception{
		myBatis.insert("reservation.insert", dto);
	}
	
	public List<ReservationDTO> search(String id) throws Exception{
		List<ReservationDTO> list = myBatis.selectList("reservation.select", id);
		return list;
	}
	
	public void update(String uid) {
		myBatis.update("reservation.update", uid);
	}
}
