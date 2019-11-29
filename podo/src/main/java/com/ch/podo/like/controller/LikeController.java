package com.ch.podo.like.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.common.Pagination;
import com.ch.podo.like.model.service.LikeService;
import com.ch.podo.like.model.vo.Like;

@Controller
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	
	@ResponseBody
	@RequestMapping("likeClick.do")
	public int likeClick(Like like, String status) {
		
		int result = 0;
		
		if(status.equals("like")) {
			result = likeService.insertLikeMem(like);
				
		}else {
			result = likeService.deleteLikeMem(like);
		}
		return result;
	}

	@RequestMapping("myPageSelectLikeFilm.do")
	public ModelAndView myPageSelectLikeFilm(String tab, String id, ModelAndView mv,  @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int FilmlistCount = likeService.myPageLikeReviewListCount(id);
		PageInfo filmPi = Pagination.setPageLimit(currentPage, FilmlistCount, 5, 12);
		ArrayList<Like> likeFilmList = likeService.myPageSelectLikeFilm(id, filmPi);
		
		mv.addObject("likeFilmList", likeFilmList).addObject("FilmlistCount", FilmlistCount).addObject("filmPi", filmPi).addObject("tab", tab).setViewName("member/myPage");
		return mv;
	}
	
	
	
}
