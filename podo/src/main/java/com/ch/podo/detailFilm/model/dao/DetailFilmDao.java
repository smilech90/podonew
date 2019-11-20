package com.ch.podo.detailFilm.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.podo.detailFilm.model.vo.DetailFilm;
import com.ch.podo.image.model.vo.Image;
import com.ch.podo.review.model.vo.Review;

@Repository("dfDao")
public class DetailFilmDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public DetailFilm selectDetailFilm(int id) {
		
		DetailFilm df = sqlSession.selectOne("detailFilmmapper.selectDetailFilm", id);
		
		System.out.println("df : " + df);
		return df;
	}
	
	public ArrayList<Review> selectReivewList(int id){
		
		ArrayList<Review> list = (ArrayList)sqlSession.selectList("detailFilmmapper.selectReivewList", id);
		return list;
	}
	
	// HashMap 수정 필요
	public int detailFilmInsert(DetailFilm df, int uId) {
		HashMap map= new HashMap();
		
		map.put("df", df);
		map.put("uId", uId);
		return sqlSession.insert("detailFilmmapper.insertDetailFilm", map);
	}
	
	// 포스터 이미지 불러오기
	public Image selectFilmImage(int detailId) {
		
		Image i = sqlSession.selectOne("detailFilmmapper.selectFilmImage", detailId);
		
		return i;
	}

	// 포스터 이미지 수정
	public int filmImageInsert(String filmImage, int detailId) {
		
		HashMap map= new HashMap();
		
		map.put("filmImage", filmImage);
		map.put("detailId", detailId);
		
		return sqlSession.insert("detailFilmmapper.filmImageInsert", map);
	}
	
	
}
