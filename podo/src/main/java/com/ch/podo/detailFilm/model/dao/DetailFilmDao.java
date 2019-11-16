package com.ch.podo.detailFilm.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.podo.detailFilm.model.vo.DetailFilm;

@Repository("dfDao")
public class DetailFilmDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public DetailFilm selectDetailFilm(int id) {
		
		DetailFilm df = sqlSession.selectOne("detailFilmmapper.selectDetailFilm", id);
		
		System.out.println(df);
		
		return df;
	}

}
