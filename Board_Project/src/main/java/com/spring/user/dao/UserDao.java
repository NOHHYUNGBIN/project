package com.spring.user.dao;

import java.util.HashMap;

import com.spring.user.vo.UserVo;

public interface UserDao {

	UserVo login(HashMap<String, Object> map);

	int insertUser(HashMap<String, Object> map);

	int idCheck(HashMap<String, Object> map);

	int nicknameCheck(HashMap<String, Object> map);

	int emailCheck(HashMap<String, Object> map);

	UserVo getUserInfo(String userid);

	void updateUser(HashMap<String, Object> map);

}
