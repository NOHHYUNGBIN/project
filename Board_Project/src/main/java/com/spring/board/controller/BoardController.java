package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PagingVo;
import com.spring.board.vo.ReplyVo;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	@Autowired
	private  MenuService  menuService;
	@RequestMapping("/board/list")
	public String selectBoard(PagingVo vo, Model model, int menu_id, String menu_name
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
        	, @RequestParam(defaultValue="nickname") String search_option //기본 검색 옵션값을 작성자로 한다.
        	, @RequestParam(defaultValue="") String keyword ) {  //키워드의 기본값을 ""으로 한다.
		
		int total = boardService.countBoard(menu_id,search_option,keyword);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		List<MenuVo> menuList = menuService.getMenuList(); 
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		HashMap<String,Object> map = new HashMap<String,Object>();

		map.put("vo",vo);
		map.put("menu_id", menu_id);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		List<BoardVo> boardList = boardService.selectBoard(map);
		model.addAttribute("paging", vo);
		model.addAttribute("search_option", search_option);
		model.addAttribute("keyword", keyword);
		model.addAttribute("menu_id", menu_id);
		model.addAttribute("menu_name", menu_name);
		model.addAttribute("menuList", menuList);
		model.addAttribute("viewAll", boardList);
		return "/board/list";
	}
	@RequestMapping("/board/view")
	public ModelAndView view(@RequestParam HashMap<String,Object> map, PagingVo vo
			,@RequestParam(value="nowPage", required=false)String nowPage
			,@RequestParam(value="cntPerPage", required=false)String cntPerPage) {

		ModelAndView mv = new ModelAndView();
		BoardVo boardVo = boardService.getView(map);
		int viewIdx = boardVo.getIdx();
		boardService.updateReadCount(viewIdx);
		int total = boardService.countReply(viewIdx);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		map.put("vo",vo);
		int menu_id = Integer.parseInt((String)map.get("menu_id")); 
		String menu_name = (String)map.get("menu_name");
		//reply 처리
		List<ReplyVo> replyList = boardService.getReply(map);
		mv.addObject("paging", vo);
		mv.addObject("replyList",replyList);
		mv.addObject("view", boardVo);
		mv.addObject("menu_id", menu_id); 
		mv.addObject("menu_name", menu_name);
		mv.setViewName("/board/view");
		return mv;
	}

	@RequestMapping("/board/writeForm")
	public ModelAndView writeForm(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		List<MenuVo> menuList = menuService.getMenuList(); 
		int menu_id = Integer.parseInt((String)map.get("menu_id")); 
		String menu_name = (String)map.get("menu_name");
		mv.addObject("menu_id", menu_id); 
		mv.addObject("menu_name", menu_name);
		mv.addObject("menuList", menuList);
		mv.setViewName("/board/write");	
		return mv;
	}

	@RequestMapping("/board/write")
	public ModelAndView write(@RequestParam HashMap<String, Object> map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int menu_id = Integer.parseInt((String)map.get("menu_id")); 
		String menu_name = (String)map.get("menu_name");
		System.out.println("넘어온request"+request);
		boardService.insertBoard(map);
		mv.addObject("menu_id", menu_id);
		mv.addObject("menu_name", menu_name);
		mv.setViewName("redirect:/board/list");
		return mv;
	}

	@RequestMapping("/board/updateForm")
	public ModelAndView updateForm(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		int menu_id = Integer.parseInt((String)map.get("menu_id")); 
		String menu_name = (String)map.get("menu_name");
		BoardVo boardVO = boardService.getView(map);
		mv.addObject("menu_id", menu_id);
		mv.addObject("menu_name", menu_name);
		mv.addObject("update", boardVO);
		mv.setViewName("/board/update");
		return mv;
	}

	@RequestMapping("/board/update")
	public ModelAndView update(@RequestParam HashMap<String,Object> map) {
		ModelAndView mv = new ModelAndView();
		int idx = Integer.parseInt((String) map.get("idx"));
		int menu_id = Integer.parseInt((String)map.get("menu_id")); 
		String menu_name = (String)map.get("menu_name");
		boardService.updateBoard(map);
		mv.addObject("menu_id", menu_id);
		mv.addObject("menu_name", menu_name);
		mv.setViewName("redirect:/board/view?idx="+idx);
		return mv;
	}
	// 실제로는 삭제된 게시글 입니다 라는 내용으로 업데이트 됨.
	@RequestMapping("/board/delete")
	public ModelAndView delete(@RequestParam HashMap<String,Object> map) {
		ModelAndView mv = new ModelAndView();
		int menu_id = Integer.parseInt((String)map.get("menu_id")); 
		String menu_name = (String)map.get("menu_name");
		boardService.deleteBoard(map);
		mv.addObject("menu_id", menu_id);
		mv.addObject("menu_name", menu_name);
		mv.setViewName("redirect:/board/list");
		return mv;
		
	}
}
