package com.ch.podo.detailFilm.model.service;

import java.util.ArrayList;

import com.ch.podo.detailFilm.model.vo.DetailFilm;
import com.ch.podo.image.model.vo.Image;
import com.ch.podo.review.model.vo.Review;

public interface DetailFilmService {
	
	// 1. 영화 상세정보 보기 서비스
	DetailFilm selectDetailFilm(int id);
	
	// 1_2. 영화 상세정보 볼때 리뷰 리스트
	ArrayList<Review> selectReivewList(int id);
	
	// 1_3. 영화 상세정보 볼때 이미지
	Image selectFilmImage(int detailId);

	// 2. 영화 상세정보 수정 자료 입력
	int detailFilmInsert(DetailFilm df, int uId);

	// 2_2. 영화 포스터 수정 입력
	int filmImageInsert(String filmImage, int detailId);

	
}
