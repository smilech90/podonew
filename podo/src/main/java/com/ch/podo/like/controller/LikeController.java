package com.ch.podo.like.controller;

import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.common.Pagination;
import com.ch.podo.film.model.vo.Film;
import com.ch.podo.like.model.service.LikeService;
import com.ch.podo.like.model.vo.Like;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

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
		PageInfo userPi = Pagination.getPageInfo(currentPage, UserlistCount);
		ArrayList<Like> likeUserList = likeService.myPageSelectLikeUser(id, userPi);
		
		mv.addObject("likeUserList", likeUserList).addObject("UserlistCount", UserlistCount).addObject("userPi", userPi).addObject("tab", tab).setViewName("member/myPage");
		return mv;
	}
	
	@RequestMapping("myPageSelectLikeReview.do")
	public ModelAndView myPageSelectLikeReview(String tab, String id, ModelAndView mv,  @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int ReviewlistCount = likeService.myPageLikeReviewListCount(id);
		PageInfo reviewPi = Pagination.getPageInfo(currentPage, ReviewlistCount);
		ArrayList<Like> likeReviewList = likeService.myPageSelectLikeReview(id, reviewPi);
		
		mv.addObject("likeReviewList", likeReviewList).addObject("ReviewlistCount", ReviewlistCount).addObject("reviewlikePi", reviewPi).addObject("tab", tab).setViewName("member/myPage");
		return mv;
	}
	
	
	
	
	
	
	
	@RequestMapping("userPageSelectLikeReview.do")
	public ModelAndView userPageSelectLikeReview(String tab, String id, String loginUserId, ModelAndView mv,  @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		String userId = id;
		Like likeUser = likeService.selectLikeUser(userId,loginUserId);	// 유저페이지 조회 시 라이크 여부
		int ReviewlistCount = likeService.myPageLikeReviewListCount(id);
		PageInfo reviewPi = Pagination.getPageInfo(currentPage, ReviewlistCount);
		ArrayList<Like> likeReviewList = likeService.myPageSelectLikeReview(id, reviewPi);
		
		mv.addObject("likeUser", likeUser).addObject("likeReviewList", likeReviewList).addObject("ReviewlistCount", ReviewlistCount).addObject("reviewlikePi", reviewPi).addObject("tab", tab).setViewName("member/userPage");
		return mv;
	}
	
	@RequestMapping("userPageSelectLikeFilm.do")
	public ModelAndView userPageSelectLikeFilm(String tab, String id, String loginUserId, ModelAndView mv,  @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		String userId = id;
		Like likeUser = likeService.selectLikeUser(userId,loginUserId);	// 유저페이지 조회 시 라이크 여부
		int FilmlistCount = likeService.myPageLikeFilmListCount(id);
		PageInfo filmPi = Pagination.setPageLimit(currentPage, FilmlistCount, 5, 12);
		ArrayList<Like> likeFilmList = likeService.myPageSelectLikeFilm(id, filmPi);
		
		mv.addObject("likeUser", likeUser).addObject("likeFilmList", likeFilmList).addObject("FilmlistCount", FilmlistCount).addObject("filmPi", filmPi).addObject("tab", tab).setViewName("member/userPage");
		return mv;
	}
	
	@RequestMapping("userPageSelectLikeUser.do")
	public ModelAndView userPageSelectLikeUser(String tab, String id, String loginUserId, ModelAndView mv,  @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		String userId = id;
		Like likeUser = likeService.selectLikeUser(userId,loginUserId);	// 유저페이지 조회 시 라이크 여부
		int UserlistCount = likeService.myPageLikeUserListCount(id);
		PageInfo userPi = Pagination.getPageInfo(currentPage, UserlistCount);
		ArrayList<Like> likeUserList = likeService.myPageSelectLikeUser(id, userPi);
		
		mv.addObject("likeUser", likeUser).addObject("likeUserList", likeUserList).addObject("UserlistCount", UserlistCount).addObject("userPi", userPi).addObject("tab", tab).setViewName("member/userPage");
		return mv;
	}
	
	
	// 리뷰 좋아요
	@RequestMapping("likeReviewClick.do")
	public void likeReviewClick(Like like, String status,HttpServletResponse response) throws JsonIOException, IOException {
		
		int result = 0;

		
		if(status.equals("like")) {
			result = likeService.insertLikeReview(like);
				
		}else {
			result = likeService.deleteLikeReview(like);
		}
		Gson gson=new Gson();
		gson.toJson(result,response.getWriter());
	}
	

	
	// 관리자 메인 - 좋아요 제일 많이 받은 영화, 회원, 리뷰
/*	@RequestMapping("manyLike.do")
	public ModelAndView manyLike(HttpSession session, ModelAndView mv) {
		
		ArrayList<Like> list = likeService.likeList();
		String fNolist="";
		String mNolist="";
		String rNolist="";
				
		for(int i=0;i<list.size();i++) {
			
			if(list.get(i).getType() == 1) {
				fNolist += list.get(i).getTargetId();
	
				if(i != list.size()-1) {
					fNolist += ",";
				}
				
//				int result1 = likeService.filmLike(fNolist);
				
			}else if(list.get(i).getType() == 2) {
				mNolist += list.get(i).getTargetId();
				
				if(i != list.size()-1) {
					mNolist += ",";
				}
				
//				int result2 = likeService.memberLike(mNolist);
				
			}else if(list.get(i).getType() == 3) {
				rNolist += list.get(i).getTargetId();
				
				if(i != list.size()-1) {
					rNolist += ",";
				}
				
//				int result3 = likeService.reviewLike(rNolist);
				
			}
		}
		
		mv.addObject("list", list)
		  .setViewName("admin.do");
		
		return mv;
		
	}
*/

}
