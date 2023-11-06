package com.clovers.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession db;
	
	public boolean login(Map<String,String> param) {
		
		return db.selectOne("member.logintry",param);
	}
	
}
