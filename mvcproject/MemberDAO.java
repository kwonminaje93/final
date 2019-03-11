package com.itbank.mvcproject;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberdao")
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	/*public List<MemberDTO> select(String id) {
		System.out.println(id);
		List<MemberDTO> list = myBatis.selectList("member.select", id);
		System.out.println(list.size());
		return list;
	}*/
	
	public void insert(MemberDTO memberDTO) {
		myBatis.insert("member.insert", memberDTO);
		System.out.println("등록 완료");
	}
	
	//	로그인한 id의 이름과 입력한 이름 비교
	public String nameCheck(String id, String name) {
		List<MemberDTO> list = myBatis.selectList("member.nameCheck", id);
		if(id != null) {
			if(name.equals(list.get(0).getName())){
				name = list.get(0).getName();
			} else {
				name = "로그인한 id의 이름과 똑같은 이름을 입력해주세요";
			}
		}
		return name;
	}
	
	public String login(HashMap<String, Object> map) {
		List<MemberDTO> list = myBatis.selectList("member.login", map);
		
		MemberDTO dto = null;
		String id = null;
		
		if(list != null) {
			for(int i = 0; i < list.size(); i++) {
				
				dto = list.get(i);
				
				if(dto.getId() != null) {
					id = dto.getId();
				} else {
					id = "아이디 또는 비밀번호를 확인해 주세요.";
				}
			} 
			
		} else {
			id = "아이디 또는 비밀번호를 확인해 주세요.";
		}
		return id;
	}
	
	public void update(MemberDTO dto) throws Exception {
	      myBatis.update("member.update", dto);
	   }
	   
	   public void delete(MemberDTO dto) throws Exception {
	      myBatis.delete("member.delete", dto);
	   }
	
	   public List<MemberDTO> select(MemberDTO dto) throws Exception {
		      return myBatis.selectList("member.select", dto);
		   }

}
