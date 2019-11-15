package com.ch.podo.ratingReview.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.podo.ratingReview.model.vo.RatingReview;

@Repository("ratingReviewDao")
public class RatingReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<RatingReview> selectRatingReviewList() {
		
		ArrayList<RatingReview> list = (ArrayList)sqlSession.selectList("ratingReviewMapper.selectRatingReviewList");
			
		return list;
	}
	
}
