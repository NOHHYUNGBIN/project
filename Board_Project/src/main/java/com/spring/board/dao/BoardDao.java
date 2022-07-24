package com.spring.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PagingVo;
import com.spring.board.vo.ReplyVo;

public interface BoardDao {

	BoardVo getView(HashMap<String, Object> map);

	void insertBoard(HashMap<String, Object> map);

	void updateBoard(HashMap<String, Object> map);

	void deleteBoard(HashMap<String, Object> map);

	List<BoardVo> selectBoard(HashMap<String, Object> map);

	int countBoard(int menu_id, String search_option, String keyword);

	void updateReadCount(int viewIdx);

	List<ReplyVo> getReply(HashMap<String, Object> map);

	void insertReply(HashMap<String, Object> map);

	void updateReply(HashMap<String, Object> map);

	void deleteReply(HashMap<String, Object> map);

	int countReply(int viewIdx);

	//List<ReplyVo> ajaxGetReply(HashMap<String, Object> map);

}
