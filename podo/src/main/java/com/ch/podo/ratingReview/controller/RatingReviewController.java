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
	
	@RequestMapping("ratingReview.do")
	public ModelAndView ratingReview(ModelAndView mv) {
		
		ArrayList<RatingReview> list = ratingReviewService.selectRatingReviewList();
		
		mv.addObject("list",list).setViewName("ratingReview/ratingReviewList");
		
		
		System.out.println(list);
		
		return mv;
	}

}
