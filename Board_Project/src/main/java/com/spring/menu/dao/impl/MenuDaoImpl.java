package com.spring.menu.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.menu.dao.MenuDao;
import com.spring.menu.vo.MenuVo;
@Repository("menuDao")
public class MenuDaoImpl implements MenuDao {
	
	@Autowired
	private SqlSession sqlSession; 

	@Override
	public List<MenuVo> getMenuList() {
		
		List<MenuVo> menuList = sqlSession.selectList("menu.menuList");
		return menuList;
	}

}
