package com.ch.podo.member.model.service;

import com.ch.podo.member.model.vo.Member;

public interface MemberService {
	
	// 1. 로그인 서비스
	Member selectLoginMember(Member mem);
	
}
