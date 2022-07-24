package com.spring.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.user.service.UserService;
import com.spring.user.vo.UserVo;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	// --------------------------------------
	// 로그인
	// 로그인 폼을 띄우는 부분
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "/login/loginform";
	}

	// 로그인 처리하는 부분 = 로그인처리 : session 처리, cookie
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpSession session, @RequestParam HashMap<String, Object> map,
			RedirectAttributes rttr) {

		String returnURL = "";
		if (session.getAttribute("login") != null) {
			// 기존의 login 세션값이 존재한다면
			session.removeAttribute("login");
		}

		// 로그인체크
		UserVo vo = userService.login(map);
		if (vo != null) {
			String sessionId = vo.getUserid();
			String sessionName = vo.getUsername();
			String sessionNickname = vo.getNickname();
			String sessionEmail = vo.getEmail();
			session.setAttribute("login", vo); // 세션 "login" <- vo
			session.setAttribute("userid", sessionId); // 세션 "userid" <- vo
			session.setAttribute("username", sessionName); // 세션 "userid" <- vo
			session.setAttribute("nickname", sessionNickname); // 세션 "userid" <- vo
			session.setAttribute("email", sessionEmail); // 세션 "userid" <- vo
			returnURL = "redirect:/"; // root 로 이동, home.jsp
		} else {
			rttr.addFlashAttribute("msg", false);
			returnURL = "redirect:/login"; // 로그인실패시 로그인폼으로
		}

		return returnURL;
	}

	// 로그이웃처리
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 전체를 날려버림
		return "redirect:/";
	}

	// 회원가입,회원정보수정--------------------------------------

	// 회원가입폼으로 이동
	@RequestMapping("/registerform")
	public String registerForm() {
		return "/login/registerform";
	}

	// 아이디 중복체크 AJAX
	@ResponseBody
	@RequestMapping(value = "/login/idCheck", method = RequestMethod.POST, headers = "Accept=application/json")
	public int idCheck(@RequestParam HashMap<String, Object> map) {
		int result = userService.idCheck(map);
		return result;
	}

	// 별명중복체크 AJAX
	@ResponseBody
	@RequestMapping(value = "/login/nicknameCheck", method = RequestMethod.POST, headers = "Accept=application/json")
	public int nicknameCheck(@RequestParam HashMap<String, Object> map) {
		int result = userService.nicknameCheck(map);
		return result;
	}

	// 이메일중복체크 AJAX
	@ResponseBody
	@RequestMapping(value = "/login/emailCheck", method = RequestMethod.POST, headers = "Accept=application/json")
	public int emailCheck(@RequestParam HashMap<String, Object> map) {
		int result = userService.emailCheck(map);
		return result;
	}

	// 회원가입
	@RequestMapping("/login/insertUser")
	public String insertUser(@RequestParam HashMap<String, Object> map,
		HttpServletResponse reponse) throws IOException {
		PrintWriter out = reponse.getWriter();
		int result = userService.insertUser(map);
		out.print(result);
		return "redirect:/login";		
	}
	// 회원정보 수정전 가입된 정보를 가져오기
	@RequestMapping("/useredit")
	public ModelAndView userEditForm(@RequestParam String userid) {
		ModelAndView mv = new ModelAndView();
		UserVo uservo = userService.getUserInfo(userid);
		mv.addObject("user", uservo);
		mv.setViewName("/login/userEditform");
		return mv;
	}
	@RequestMapping("/login/updateUser")
	public String updateUser(@RequestParam HashMap<String, Object> map,
		HttpServletResponse reponse) throws IOException {
		PrintWriter out = reponse.getWriter();
		userService.updateUser(map);
		return "redirect:/login";		
	}

}
