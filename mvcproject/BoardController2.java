package com.itbank.mvcproject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 
@Controller
public class BoardController2 {
    
    private Logger logger = LoggerFactory.getLogger(BoardController2.class);
    
    @Autowired
    HPDAO dao;
    
    @RequestMapping("selectLo")
    public String paging(HPDTO hpDTO,PagingVo paging, Model model) throws Exception{
    	
    	List<HPDTO> lists;
    	paging.setTotal(dao.selectTotalPaging());
    	if(hpDTO.getLocation()==null) {
    		System.out.println("없음");
    	
    		lists = new ArrayList<HPDTO>();
    		lists = dao.selectAllPaging(paging);
    		
    	}else {
    		System.out.println("있음");
    		lists = new ArrayList<HPDTO>();
    		paging.setLocation(hpDTO.getLocation());
    		paging.setLocation2(hpDTO.getLocation2());
    		System.out.println(paging.getLocation());
    		System.out.println(paging.getLocation2());
    		System.out.println(paging.getStart());
    		System.out.println(paging.getLast());
    		lists = dao.selectLoPaging(paging);
    		
    	}
    	String inputCheckIn = hpDTO.getInputCheckIn();
    	if(inputCheckIn == null) {
    		inputCheckIn = "0000-00-00";
    	}
    	String inputCheckOut = hpDTO.getInputCheckOut();
    	if(inputCheckOut == null) {
    		inputCheckOut = "0000-00-00";
    	}
    	model.addAttribute("inputCheckIn", inputCheckIn);
    	model.addAttribute("inputCheckOut", inputCheckOut);
    	model.addAttribute("lists", lists);
    	model.addAttribute("p", paging);
    	return "selectLo";
    }
    
    
    @RequestMapping(value="/list.do", method=RequestMethod.GET)
    public String list(String num){
    	
    	Random ran = new Random();
    	/*for (int i = 0; i < Integer.parseInt(num); i++) {
            service.listInsert(new ListDto(ran.nextInt(100000000)+""));
        }*/
    	return "redirect:/paging.do";
    }
    
    @RequestMapping(value="/remove.do")
    public String remove(){
    	logger.info("remove");
    	dao.deleteAll();
    	return "redirect:/paging.do";
    }    
    @RequestMapping("insertHP")
	public void insertHP(HPDTO hpDTO) throws Exception{
		dao.insertHP(hpDTO);
		
	}
    /*
  	//지역검색
  	@RequestMapping("selectLo")
  	public void selectLo(HPDTO hpDTO, Model model) throws Exception {
  		
  		List<HPDTO> hpList = dao2.selectLo(hpDTO);
  		
  		//String name = list[i].substring(0, list[i].toString().indexOf("_"));
  		
  		System.out.println("호출 확인 OK.....");
  		
  		model.addAttribute("hpList", hpList);
  		
  	}*/
    // 3. Controller
}









