package com.ch.podo.member.model.service;

import com.ch.podo.member.model.vo.Member;

public interface MemberService {

	// 1_1. 회원 가입 
	int insertMember(Member mem);
	
	// 1_2. 아이디 중복체크 서비스
	int idCheck(String id);
	
	// 1_3. 닉네임 중복체크 서비스
	int nickCheck(String nick);
	
	// 3. 로그인 서비스
	Member selectLoginMember(Member mem);
	
	// 4. 회원 정보 수정
	int updateMember(Member mem);
	
	// 4_1. 비밀번호 변경 시 기존 비밀번호와 일치 여부 확인 서비스
	int originPwdCheck(String originPwd, String email);
	
	// 5. 회원 탈퇴
	int deleteMember(String id);
}
