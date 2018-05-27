package com.zsga.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsga.domain.User;
import com.zsga.service.QuestionService;
import com.zsga.service.impl.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserServiceImpl userServiceImpl;
	
	@RequestMapping("index")
	public String index(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginId");
		return "index";
	}
	
	@RequestMapping("login")
	public String login(String userName, String userPwd, Model model, HttpServletRequest request) {
		User result = userServiceImpl.findUser(userName, userPwd);
		if (result != null) {
			model.addAttribute("user", result);
			HttpSession session = request.getSession();
			session.setAttribute("loginId", result.getUserId());
			session.setAttribute("user", result);
			return "main/main";
		} else {
			model.addAttribute("message", "用户名密码错误");
			return "index";
		}
	}
	
	@RequestMapping("toRegister")
	public String toRegister() {
		return "main/register";
	}
	
	@RequestMapping("register")
	public String register(User user) {
		userServiceImpl.saveUser(user);
		return "index";
	}
}
