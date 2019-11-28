package com.ch.podo.image.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.podo.image.model.vo.Image;

@Repository("imageDao")
public class ImageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertFilmImage(Image img) {
		return sqlSession.insert("imageMapper.insertFilmImage", img);
	}
	
	
	
}
