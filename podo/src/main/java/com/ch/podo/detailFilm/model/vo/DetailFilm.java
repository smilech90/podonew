package com.ch.podo.detailFilm.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class DetailFilm {
	
	private int id;						// 영화 상세정보 번호
	private int title;					// 영화 제목
	private String titleEng;			// 영화 영어 제목
	private String director;			// 감독
	private int releaseYear;			// 제작 년도
	private String productionCountry;	// 제작 국가
	private String productionStatus;	// 개봉상태
	private int genre;					// 장르
	private int id2;					// 디테일 정보 번호
	private String synobsys;			// 시놉시스
	private String trivia;				// 트리비아
	private String trailer;				// 예고편 링크
	private String footage;				// 스틸 영상
	private String status;				// 영화 정보상태
	private int memberId;				// 멤버 번호
	private int filmId;					// 영화 번호
	
}
