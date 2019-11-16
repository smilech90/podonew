package com.ch.podo.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.podo.member.model.dao.MemberDao;
import com.ch.podo.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member selectLoginMember(Member mem) {
		return memberDao.selectLoginMember(mem);
	}
	
	
	
}
