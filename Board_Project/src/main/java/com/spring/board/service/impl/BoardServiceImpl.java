package com.spring.board.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PagingVo;
import com.spring.board.vo.ReplyVo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDAO;

	@Override
	public BoardVo getView(HashMap<String, Object> map) {
		return boardDAO.getView(map);
	}
	@Override
	public void insertBoard(HashMap<String, Object> map) {
		boardDAO.insertBoard(map);
		
	}
	@Override
	public void updateBoard(HashMap<String, Object> map) {
		boardDAO.updateBoard(map);
		
	}
	@Override
	public void deleteBoard(HashMap<String, Object> map) {
		boardDAO.deleteBoard(map);
		
	}
	@Override
	public List<BoardVo> selectBoard(HashMap<String, Object> map) {
		return boardDAO.selectBoard(map);
	}
	@Override
	public int countBoard(int menu_id, String search_option, String keyword) {
		return boardDAO.countBoard(menu_id, search_option, keyword);
	}
	@Override
	public void updateReadCount(int viewIdx) {
		boardDAO.updateReadCount(viewIdx);
	}
	//Reply 처리
	@Override
	public List<ReplyVo> getReply(HashMap<String, Object> map) {
		return boardDAO.getReply(map);
	}
	@Override
	public void insertReply(HashMap<String, Object> map) {
		boardDAO.insertReply(map);
		
	}
	@Override
	public void updateReply(HashMap<String, Object> map) {
		boardDAO.updateReply(map);
	}
	@Override
	public void deleteReply(HashMap<String, Object> map) {
		boardDAO.deleteReply(map);
	}
	@Override
	public int countReply(int viewIdx) {
		return boardDAO.countReply(viewIdx);
	}
	/*
	 * @Override public List<ReplyVo> ajaxGetReply(HashMap<String, Object> map) {
	 * return boardDAO.ajaxGetReply(map); }
	 */

}
