package com.ch.podo.ratingReview.model.service;

import java.util.ArrayList;

import com.ch.podo.ratingReview.model.vo.RatingReview;

public interface RatingReviewService {
	
	// 영화 방사형그래프 상세리뷰 보기
	RatingReview selectRatingReviewDetailView(int id);

}
