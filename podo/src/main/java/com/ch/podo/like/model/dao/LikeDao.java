package com.ch.podo.like.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.podo.like.model.vo.Like;

@Repository("likeDao")
public class LikeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertLikeFilm(Like like) {
		return sqlSession.insert("filmMapper.insertLikeFilm", like);
	}

	public int deleteLikeFilm(Like like) {
		return sqlSession.delete("filmMapper.deleteLikeFilm", like);
	}
	
}
