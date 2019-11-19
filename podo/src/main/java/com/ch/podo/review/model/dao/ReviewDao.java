package com.ch.podo.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.podo.review.model.vo.Review;

@Repository("reviewDao")
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
							 
	public ArrayList<Review> selectReviewList() {
		
		ArrayList<Review> list = (ArrayList)sqlSession.selectList("reviewMapper.selectReviewList");
		
		return list;
	}
	
	

}
