package com.spring.user.service;

import java.util.HashMap;

import com.spring.user.vo.UserVo;

public interface UserService {

	UserVo login(HashMap<String, Object> map);

	int insertUser(HashMap<String, Object> map);

	void updateUser(HashMap<String, Object> map);

	int idCheck(HashMap<String, Object> map);

	int nicknameCheck(HashMap<String, Object> map);

	int emailCheck(HashMap<String, Object> map);

	UserVo getUserInfo(String userid);

}
