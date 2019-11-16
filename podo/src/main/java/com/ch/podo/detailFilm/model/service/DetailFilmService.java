package com.ch.podo.detailFilm.model.service;

import com.ch.podo.detailFilm.model.vo.DetailFilm;

public interface DetailFilmService {
	
	// 1. 영화 상세정보 보기 서비스
	DetailFilm selectDetailFilm(int id);
	
}
