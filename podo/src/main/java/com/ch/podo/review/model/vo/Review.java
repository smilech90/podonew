package com.ch.podo.review.model.vo;

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
public class Review {
	
	private int id;
	private String image;				// 프로필 이미지
	private String nickname;			// 사용자 닉네임
	private String content;
	private int inappropriateCount;
	private int spoilerCount;
	private int likeCount;				// 리뷰 좋아요 갯수
	private int spoilerCheck;
	private String status;
	
}
