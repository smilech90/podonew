package com.ch.podo.film.model.service;

import java.util.ArrayList;

import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.film.model.vo.Film;
import com.ch.podo.film.model.vo.Genre;

public interface FilmService {

	// 1. 영화 데이터 전체 개수 조회 서비스
	int getListCount();
	
	// 2. 영화 키워드 검색 결과 개수 조회 서비스
	int selectKeywordFilmListCount(String keyword);

	// 3. 영화 키워드 검색 서비스
	ArrayList<Film> selectKeywordFilmList(String keyword, PageInfo pi);
	
	// 4. 전체 장르 목록 불러오기 서비스
	ArrayList<Genre> selectAllGenreList();
	
	// 5. 영화 필터 검색 서비스
	ArrayList<Film> selectFilterFilmList(Film film);
	
	

}
