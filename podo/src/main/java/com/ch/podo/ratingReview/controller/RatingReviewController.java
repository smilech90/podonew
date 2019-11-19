package com.ch.podo.ratingReview.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.ratingReview.model.service.RatingReviewService;
import com.ch.podo.ratingReview.model.vo.RatingReview;

@Controller
public class RatingReviewController {
	
	
	@Autowired
	private RatingReviewService ratingReviewService;
	
	@RequestMapping("ratingDetailReview.do")
	public ModelAndView selectRatingReviewDetailView(int id,ModelAndView mv) {
		
		RatingReview rr = ratingReviewService.selectRatingReviewDetailView(id);
		
		mv.addObject("rr",rr).setViewName("ratingReview/ratingDetailReview");
		
		
		System.out.println(rr);
		
		return mv;
	}

}
