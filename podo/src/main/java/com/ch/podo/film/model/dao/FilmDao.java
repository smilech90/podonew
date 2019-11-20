package com.ch.podo.film.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.film.model.vo.Film;
import com.ch.podo.film.model.vo.Genre;
import com.ch.podo.like.model.vo.Like;
import com.ch.podo.ratingFilm.model.vo.RatingFilm;

@Repository("filmDao")
public class FilmDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("filmMapper.getListCount");
	}

	public int selectKeywordFilmListCount(String keyword) {
		return sqlSession.selectOne("filmMapper.selectKeywordFilmListCount", keyword);
	}
	
	public ArrayList<Film> selectKeywordFilmList(String keyword, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("filmMapper.selectKeywordFilmList", keyword, rowBounds);
	}

	public ArrayList<Film> selectFilterFilmList(Film film) {
		return (ArrayList)sqlSession.selectList("filmMapper.selectFilterFilmList", film);
	}

	public ArrayList<Film> selectFilterFilmMap(Map<String, Object> map) {
		return (ArrayList)sqlSession.selectList("filmMapper.selectFilterFilmMap", map);
	}

	public ArrayList<Genre> selectAllGenreList() {
		return (ArrayList)sqlSession.selectList("filmMapper.selectAllGenreList");
	}
	
	
	
	
	
	
	
	
	
	
	
	public int getFilmListCount() {
		return sqlSession.selectOne("filmMapper.getFilmListCount");
	}
	
	public ArrayList<Film> selectFilmList(PageInfo pi){

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Film> list = (ArrayList)sqlSession.selectList("filmMapper.selectFilmList",null, rowBounds);
		
		return list;
	}
	
	
	/*

	
	public int insertFilm(Film f) {
		return sqlSession.insert("filmMapper.insertFilm", f);
	}
	
	
	public Film selectFilm(int id) {
		return sqlSession.selectOne("filmMapper.selectFilm", id);
	}
	
	public int deleteFilm(int id) {
		return sqlSession.update("filmMapper.deleteFilm", id);
	}
	
	public int updateFilm(Film f) {
		return sqlSession.update("filmMapper.updateFilm", f);
	}
	
	*/

}
