package com.itbank.mvcproject;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.media.jfxmedia.track.Track.Encoding;


@Controller
public class BoardController {
	
	@Autowired
	BoardDAO dao;
	
	@RequestMapping("insert.do")
	public void insert(BoardDTO boardDTO) throws Exception {
		System.out.println(boardDTO.getTitle());
		System.out.println(boardDTO.getContent());
		System.out.println(boardDTO.getWriter());
		dao.insert(boardDTO);
	}
	
	@RequestMapping("delete.do")
	public void delete(BoardDTO boardDTO) throws Exception {
		System.out.println(boardDTO.getWriter());
		dao.delete(boardDTO);
	}
	
	@RequestMapping("update.do")
	public void update(BoardDTO boardDTO) throws Exception {
		dao.update(boardDTO);
	}
	
	@RequestMapping("select.do")
	public void select(BoardDTO boardDTO, Model model) throws Exception {
		System.out.println(boardDTO.getWriter());
		
		
		boardDTO = dao.select(boardDTO);
		model.addAttribute("boardDTO", boardDTO);
	}
	
	@RequestMapping("selectAll.do")
	public String selectAll(Model model) throws Exception {
		List<BoardDTO> list = dao.selectAll();
		model.addAttribute("list", list);
		return "redirect:list.jsp";
	}
	
	
	@RequestMapping("list")
	@ResponseBody
	public List<BoardDTO> list() throws Exception {
		List<BoardDTO> list = dao.selectAll();
		return list;
	}
	
}
