package com.ch.podo.detailFilm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.detailFilm.model.service.DetailFilmService;
import com.ch.podo.detailFilm.model.vo.DetailFilm;
import com.ch.podo.image.model.vo.Image;
import com.ch.podo.review.model.vo.Review;

@Controller
public class DetailFilmController {
	
	@Autowired
	private DetailFilmService dfService;
	
	@RequestMapping("detailFilm.do")
	public ModelAndView selectDetailFilm(int id, ModelAndView mv) {
		
		// 영화 상세정보 
		DetailFilm df = dfService.selectDetailFilm(id);
		// id, detailId, titleKor, titleEng, director, actor, trailer, synopsys, trivia
		
		// 포스터 이미지
		Image i = dfService.selectFilmImage(df.getDetailId());
		
		// 리뷰 리스트
		ArrayList<Review> rl = dfService.selectReivewList(id);
		
		mv.addObject("df",df).addObject("rl",rl).addObject("i",i).setViewName("detailFilm/detailFilmView");
		return mv; 
	}
	
	// 수정 페이지로 이동
	@RequestMapping("detailFilmUpdate.do")
	public ModelAndView detailFilmUpdateView(int id, ModelAndView mv) {
		
		// 영화 상세정보
		DetailFilm df = dfService.selectDetailFilm(id);
		
		// 포스터 이미지
		Image i = dfService.selectFilmImage(df.getDetailId());
		
		ArrayList<Review> rl = dfService.selectReivewList(id);
		mv.addObject("df",df).addObject("rl",rl).addObject("i",i).setViewName("detailFilm/detailFilmUpdate");
		
		return mv;	
	}
	
	// 수정 정보 insert
	@RequestMapping("detailFilmInsert.do")
	public ModelAndView detailFilmInsert(DetailFilm df, int uId, String filmImage, ModelAndView mv) {
		
		
		int result = dfService.detailFilmInsert(df, uId);
		int result2 = dfService.filmImageInsert(filmImage, df.getDetailId());
		
		// 배우 검색 창 구현 -> 배우 검색 -> 배우 선택해서 확인 -> 배우 번호/ df.detailId랑 tb_film_actor에 insert
		
		mv.addObject("id", df.getId()).setViewName("redirect:detailFilm.do");
		
		return mv;

	}
	
	
}
