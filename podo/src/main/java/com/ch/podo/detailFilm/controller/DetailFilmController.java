package com.ch.podo.detailFilm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.detailFilm.model.service.DetailFilmService;
import com.ch.podo.detailFilm.model.vo.DetailFilm;

@Controller
public class DetailFilmController {
	
	@Autowired
	private DetailFilmService dfService;
	
	@RequestMapping("detailFilm.do")
	public ModelAndView selectDetailFilm(int id, ModelAndView mv) {
		
		DetailFilm df = dfService.selectDetailFilm(id);
		
		mv.addObject("df",df).setViewName("detailFilm/detailFilmView");
				
		return mv; 
	}
}
