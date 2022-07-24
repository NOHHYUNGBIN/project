package com.spring.rest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PagingVo;
import com.spring.board.vo.ReplyVo;

@RestController
public class ReplyController {

	@Autowired
	private BoardService boardService;
	
	@ResponseBody
	@RequestMapping(value = "/reply/insertReply", method = RequestMethod.GET, headers = "Accept=application/json")
	public void insertReply(@RequestParam HashMap<String, Object> map) {
		boardService.insertReply(map);
		
	}
	@ResponseBody
	@RequestMapping(value = "/reply/getReply", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<ReplyVo> ajaxGetReply(@RequestParam HashMap<String, Object> map, PagingVo vo
			,@RequestParam(value="nowPage", required=false)String nowPage
			,@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int viewIdx = Integer.parseInt((String) map.get("idx"));
		int total = boardService.countReply(viewIdx);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		map.put("vo",vo);
		List<ReplyVo> replyList = boardService.getReply(map);
		return replyList;
	}

	@RequestMapping("/reply/updateReply")
	public void updateReply(@RequestParam HashMap<String, Object> map) {
		boardService.updateReply(map);
	}
	@RequestMapping("/reply/deleteReply")
	public void deleteReply(@RequestParam HashMap<String, Object> map) {
		boardService.deleteReply(map);
	}
	
}