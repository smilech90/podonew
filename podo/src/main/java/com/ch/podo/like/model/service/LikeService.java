package com.ch.podo.like.model.service;

import com.ch.podo.like.model.vo.Like;

public interface LikeService {
	
	// 1. 영화 좋아요 서비스
	int insertLikeFilm(Like like);
	
	// 2. 영화 좋아요 취소 서비스
	int deleteLikeFilm(Like like);
	
}
