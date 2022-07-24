package com.spring.user.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.user.dao.UserDao;
import com.spring.user.vo.UserVo;
@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVo login(HashMap<String, Object> map) {
		UserVo vo = sqlSession.selectOne("user.login", map);
		
		return vo;
	}

	@Override
	public int insertUser(HashMap<String, Object> map) {
		return sqlSession.insert("user.insertUser", map);
	}

	@Override
	public int idCheck(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("user.idCheck", map);
		return result;
	}

	@Override
	public int nicknameCheck(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("user.nicknameCheck", map);
		return result;
	}

	@Override
	public int emailCheck(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("user.emailCheck", map);
		return result;
	}

	@Override
	public UserVo getUserInfo(String userid) {
		return sqlSession.selectOne("user.getUserInfo",userid);
	}

	@Override
	public void updateUser(HashMap<String, Object> map) {
		sqlSession.update("user.updateUser", map);
		
	}

}
