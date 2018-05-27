package com.zsga.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsga.domain.Reply;
import com.zsga.domain.User;
import com.zsga.service.QuestionService;
import com.zsga.service.ReplyService;
import com.zsga.utils.GotLocalIP;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Resource
	private ReplyService replyService;
	@Resource
	private QuestionService questionService;
	
	@RequestMapping("toReply")
	public String toReply(String questionid,Model model) {
		model.addAttribute("questionid", questionid);
		return "main/toReply";
	}
	
	@RequestMapping("reply")
	public String reply(String questionid,String content, HttpServletRequest request) {
		Reply reply = new Reply();
		User user = (User) request.getSession().getAttribute("user");
		reply.setPhone(user.getUserPhone());
		reply.setUsername(user.getUserName());
		reply.setQuestionid(Integer.parseInt(questionid));
		reply.setContent(content);
		reply.setIp(GotLocalIP.getLocalIP());
		replyService.addReply(reply);
		questionService.updateReplyed(Integer.parseInt(questionid));
		return "forward:/question/view.do?id="+questionid;
	}
}
