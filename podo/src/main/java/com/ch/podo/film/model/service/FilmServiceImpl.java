package com.ch.podo.film.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.film.model.dao.FilmDao;
import com.ch.podo.film.model.vo.Film;
import com.ch.podo.film.model.vo.Genre;

@Service("filmService")
public class FilmServiceImpl implements FilmService {
	
	@Autowired
	private FilmDao filmDao;
	
	@Override
	public int getListCount() {
		return filmDao.getListCount();
	}

	@Override
	public int selectKeywordFilmListCount(String keyword) {
		return filmDao.selectKeywordFilmListCount(keyword);
	}

	@Override
	public ArrayList<Film> selectKeywordFilmList(String keyword, PageInfo pi) {
		return filmDao.selectKeywordFilmList(keyword, pi);
	}

	@Override
	public ArrayList<Genre> selectAllGenreList() {
		return filmDao.selectAllGenreList();
	}

	@Override
	public ArrayList<Film> selectFilterFilmList(Film film) {
		return filmDao.selectFilterFilmList(film);
	}

	
}
