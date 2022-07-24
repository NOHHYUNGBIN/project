package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PagingVo;
import com.spring.board.vo.ReplyVo;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public BoardVo getView(HashMap<String, Object> map) {
		return (BoardVo) sqlSession.selectOne("board.getView", map);
	}

	@Override
	public void insertBoard(HashMap<String, Object> map) {
		sqlSession.insert("board.insertBoard", map);

	}

	@Override
	public void updateBoard(HashMap<String, Object> map) {
		sqlSession.update("board.updateBoard", map);
	}

	@Override
	public void deleteBoard(HashMap<String, Object> map) {
		sqlSession.update("board.deleteBoard", map);
	}

	@Override
	public List<BoardVo> selectBoard(HashMap<String, Object> map) {
		PagingVo vo = (PagingVo) map.get("vo"); // map에 vo가 담겨있을때는 mapper에서 다이렉트로 꺼내 쓰지 못하므로 DaoImpl에서 vo타입으로 map에서
												// 끄집어내고 필요한 내용물만 map에 다시담는다.
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		List<BoardVo> boardList = sqlSession.selectList("board.selectBoard", map);
		return boardList;
	}

	@Override
	public int countBoard(int menu_id,String search_option, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("menu_id", menu_id);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("board.countBoard", map);
	}

	@Override
	public void updateReadCount(int viewIdx) {
		sqlSession.update("board.updateReadCount", viewIdx);
	}

	@Override
	public List<ReplyVo> getReply(HashMap<String, Object> map) {
		PagingVo vo = (PagingVo) map.get("vo");
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		List<ReplyVo> replyList = sqlSession.selectList("board.getReply", map);
		return replyList;
	}

	@Override
	public void insertReply(HashMap<String, Object> map) {
		sqlSession.insert("board.insertReply", map);
	}

	@Override
	public void updateReply(HashMap<String, Object> map) {
		sqlSession.update("board.updateReply", map);
	}
	@Override
	public void deleteReply(HashMap<String, Object> map) {
		sqlSession.delete("board.deleteReply", map);
	}

	@Override
	public int countReply(int viewIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("idx", viewIdx);
		return sqlSession.selectOne("board.countReply", map);
	}
	/*
	 * @Override public List<ReplyVo> ajaxGetReply(HashMap<String, Object> map) {
	 * List<ReplyVo> replyList = sqlSession.selectList("board.ajaxGetReply", map);
	 * return replyList; }
	 */

}
