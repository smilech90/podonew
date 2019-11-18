package com.ch.podo.review.model.service;

import java.util.ArrayList;

import com.ch.podo.review.model.vo.Review;

public interface ReviewService {
	
	//영화 리뷰 보기
	ArrayList<Review> selectReviewList();

}
