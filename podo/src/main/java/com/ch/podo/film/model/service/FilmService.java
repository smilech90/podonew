package com.ch.podo.film.model.service;

import java.util.ArrayList;
import java.util.Map;

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
	ArrayList<Film> selectFilterFilmMap(Map<String, Object> map);
	
	
	
	
	
	
	// 1_1. 관리자 영화 게시판 총 갯수 조회용 서비스
	int getFilmListCount();
	
	// 1_2. 현재 페이지에 보여질 영화 리스트 조회용 서비스
	ArrayList<Film> selectFilmList(PageInfo pi);
	

	/*
	
	// 2. 영화 등록하기 서비스
	int insertFilm(Film f);
	
	
	// 3. 영화 상세보기 서비스
	Film selectFilm(int id);
	
	// 4. 수정 및 삭제하고자 하는 영화 조회용 서비스
	Film selectUpdateFilm(int id);
	
	// 5. 영화 삭제용 서비스
	int deleteFilm(int id);
	
	// 6. 영화 수정용 서비스
	int updateFilm(Film f);
	
	*/
	

}
