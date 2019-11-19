package com.ch.podo.like.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.podo.film.model.vo.Film;
import com.ch.podo.like.model.dao.LikeDao;
import com.ch.podo.like.model.vo.Like;

@Service("likeService")
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private LikeDao likeDao;
	
	@Override
	public int insertLikeFilm(Like like) {
		return likeDao.insertLikeFilm(like);
	}

	@Override
	public int deleteLikeFilm(Like like) {
		return likeDao.deleteLikeFilm(like);
	}

	@Override
	public Map<Integer, Film> selectLikedFilmMap(int id) {
		return likeDao.selectLikedFilmMap(id);
	}
	
}
