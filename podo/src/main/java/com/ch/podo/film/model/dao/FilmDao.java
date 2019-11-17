package com.ch.podo.film.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.film.model.vo.Film;
import com.ch.podo.film.model.vo.Genre;

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

	public ArrayList<Genre> selectAllGenreList() {
		return (ArrayList)sqlSession.selectList("filmMapper.selectAllGenreList");
	}

}
