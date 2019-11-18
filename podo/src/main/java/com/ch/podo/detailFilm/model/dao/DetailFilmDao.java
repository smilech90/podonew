package com.ch.podo.detailFilm.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.podo.detailFilm.model.vo.DetailFilm;
import com.ch.podo.review.model.vo.Review;

@Repository("dfDao")
public class DetailFilmDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public DetailFilm selectDetailFilm(int id) {
		
		DetailFilm df = sqlSession.selectOne("detailFilmmapper.selectDetailFilm", id);
		System.out.println(df);
		return df;
	}
	
	public ArrayList<Review> selectReivewList(int id){
		
		ArrayList<Review> list = (ArrayList)sqlSession.selectList("detailFilmmapper.selectReivewList", id);
		System.out.println(list);
		return list;
	}
	
	// HashMap 수정 필요
	public int detailFilmInsert(DetailFilm df, int uId) {
		HashMap map= new HashMap();
		
		map.put("df", df);
		map.put("uId", uId);
		System.out.println(map);
		
		return sqlSession.insert("detailFilmmapper.insertDetailFilm", map);
		
	}
	
	
}
