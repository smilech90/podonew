package com.ch.podo.ratingReview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.podo.ratingReview.model.service.RatingReviewService;

@Controller
public class RatingReviewController {
	
	
	@Autowired
	private RatingReviewService ratingReviewService;

}
