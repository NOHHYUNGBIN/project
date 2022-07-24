package com.spring.user.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.user.dao.UserDao;
import com.spring.user.service.UserService;
import com.spring.user.vo.UserVo;
@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private   UserDao    userDao;
	
	@Override
	public UserVo login(HashMap<String, Object> map) {
		UserVo   vo   =   userDao.login( map );
		
		return   vo;
	}

	@Override
	public int insertUser(HashMap<String, Object> map) {
		return userDao.insertUser(map);
		
	}

	@Override
	public void updateUser(HashMap<String, Object> map) {
		userDao.updateUser(map);
	}

	@Override
	public int idCheck(HashMap<String, Object> map) {
		int result = userDao.idCheck(map);
		return result;
	}

	@Override
	public int nicknameCheck(HashMap<String, Object> map) {
		int result = userDao.nicknameCheck(map);
		return result;
	}

	@Override
	public int emailCheck(HashMap<String, Object> map) {
		int result = userDao.emailCheck(map);
		return result;
	}

	@Override
	public UserVo getUserInfo(String userid) {
		return userDao.getUserInfo(userid);
	}

}
