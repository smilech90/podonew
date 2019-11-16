package com.ch.podo.detailFilm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.podo.detailFilm.model.dao.DetailFilmDao;
import com.ch.podo.detailFilm.model.vo.DetailFilm;

@Service("dfService")
public class DetailFilmServiceImpl implements DetailFilmService{
	
	@Autowired
	private DetailFilmDao dfDao;
	
	
	@Override
	public DetailFilm selectDetailFilm(int id) {
		
		return dfDao.selectDetailFilm(id);
	}
	
	

}
