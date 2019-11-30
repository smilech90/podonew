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
		
		int FilmlistCount = likeService.myPageLikeFilmListCount(id);
		PageInfo filmPi = Pagination.setPageLimit(currentPage, FilmlistCount, 5, 12);
		ArrayList<Like> likeFilmList = likeService.myPageSelectLikeFilm(id, filmPi);
		
		mv.addObject("likeFilmList", likeFilmList).addObject("FilmlistCount", FilmlistCount).addObject("filmPi", filmPi).addObject("tab", tab).setViewName("member/myPage");
		return mv;
	}
	
	@RequestMapping("myPageSelectLikeUser.do")
	public ModelAndView myPageSelectLikeUser(String tab, String id, ModelAndView mv,  @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int UserlistCount = likeService.myPageLikeUserListCount(id);
		System.out.println("유저카운트 : "+UserlistCount);
		PageInfo userPi = Pagination.getPageInfo(currentPage, UserlistCount);
		ArrayList<Like> likeUserList = likeService.myPageSelectLikeUser(id, userPi);
		System.out.println("유저리스트 : "+likeUserList);
		
		mv.addObject("likeUserList", likeUserList).addObject("UserlistCount", UserlistCount).addObject("userPi", userPi).addObject("tab", tab).setViewName("member/myPage");
		return mv;
	}
	
	@RequestMapping("myPageSelectLikeReview.do")
	public ModelAndView myPageSelectLikeReview(String tab, String id, ModelAndView mv,  @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int ReviewlistCount = likeService.myPageLikeReviewListCount(id);
		System.out.println("리뷰카운트 : "+ReviewlistCount);
		PageInfo reviewPi = Pagination.getPageInfo(currentPage, ReviewlistCount);
		ArrayList<Like> likeReviewList = likeService.myPageSelectLikeReview(id, reviewPi);
		System.out.println("리뷰리스트 : "+likeReviewList);
		
		mv.addObject("likeReviewList", likeReviewList).addObject("ReviewlistCount", ReviewlistCount).addObject("reviewPi", reviewPi).addObject("tab", tab).setViewName("member/myPage");
		return mv;
	}
	
	
}
