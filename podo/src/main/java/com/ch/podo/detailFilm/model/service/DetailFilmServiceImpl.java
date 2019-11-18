package com.ch.podo.detailFilm.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.podo.detailFilm.model.dao.DetailFilmDao;
import com.ch.podo.detailFilm.model.vo.DetailFilm;
import com.ch.podo.review.model.vo.Review;

@Service("dfService")
public class DetailFilmServiceImpl implements DetailFilmService{
	
	@Autowired
	private DetailFilmDao dfDao;
	
	// 영화 상세 정보
	@Override
	public DetailFilm selectDetailFilm(int id) {	
		return dfDao.selectDetailFilm(id);
	}

	// 영화 리뷰리스트
	@Override
	public ArrayList<Review> selectReivewList(int id) {
		return dfDao.selectReivewList(id);
	}

	// 영화 상세정보 추가 입력
	@Override
	public int detailFilmInsert(DetailFilm df, int uId) {

		return dfDao.detailFilmInsert(df, uId);

	}
	
	

}
