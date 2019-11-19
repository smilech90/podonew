package com.ch.podo.detailFilm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.detailFilm.model.service.DetailFilmService;
import com.ch.podo.detailFilm.model.vo.DetailFilm;
import com.ch.podo.review.model.service.ReviewService;
import com.ch.podo.review.model.vo.Review;

@Controller
public class DetailFilmController {
	
	@Autowired
	private DetailFilmService dfService;
	
	@RequestMapping("detailFilm.do")
	public ModelAndView selectDetailFilm(int id, ModelAndView mv) {
		
		DetailFilm df = dfService.selectDetailFilm(id);
		
		ArrayList<Review> rl = dfService.selectReivewList(id);
		
		mv.addObject("df",df).addObject("rl",rl).setViewName("detailFilm/detailFilmView");
		return mv; 
	}
	
	// 수정 페이지로 이동
	@RequestMapping("detailFilmUpdate.do")
	public ModelAndView detailFilmUpdateView(int id, ModelAndView mv) {
		
		DetailFilm df = dfService.selectDetailFilm(id);
		
		ArrayList<Review> rl = dfService.selectReivewList(id);
		mv.addObject("df",df).addObject("rl",rl).setViewName("detailFilm/detailFilmUpdate");
		
		return mv;	
	}
	
	// 수정 정보 insert
	@RequestMapping("detailFilmInsert.do")
	public ModelAndView detailFilmInsert(DetailFilm df, int uId, ModelAndView mv) {
		
		int result = dfService.detailFilmInsert(df, uId);
		
		mv.addObject("id", df.getId()).setViewName("redirect:detailFilm.do");
		
		return mv;

		
	}
	
	
}
