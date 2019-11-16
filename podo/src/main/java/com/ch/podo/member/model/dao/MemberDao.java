package com.ch.podo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.podo.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectLoginMember(Member mem) {
		return sqlSession.selectOne("memberMapper.selectLoginMember", mem);
	}
	
	
}
