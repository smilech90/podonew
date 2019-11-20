package com.ch.podo.review.model.service;

import java.util.ArrayList;

import com.ch.podo.review.model.vo.Review;

public interface ReviewService {
	
	//영화 리뷰 보기
	ArrayList<Review> selectReviewList();
	
	//영화 리뷰 삭제
	int deleteReview(int id);
	
	//영화 리뷰 작성
	int reviewWrite(Review r);

}
