package com.ch.podo.ratingReview.model.service;

import java.util.ArrayList;

import com.ch.podo.ratingReview.model.vo.RatingReview;

public interface RatingReviewService {
	
	// 영화 방사형그래프 리뷰 보기
	ArrayList<RatingReview> selectRatingReviewList();

}
