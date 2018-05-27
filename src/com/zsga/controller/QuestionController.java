package com.zsga.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zsga.domain.Category;
import com.zsga.domain.Question;
import com.zsga.domain.Reply;
import com.zsga.service.CategoryService;
import com.zsga.service.QuestionService;
import com.zsga.service.ReplyService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Resource
	private QuestionService questionService;
	@Resource
	private ReplyService replyService;
	@Resource
	private CategoryService categoryService;
	
	@RequestMapping("welcome")
	public String welcome() {
		return "welcome";
	}
	
	@RequestMapping("list")
	public String list(String code, String page, Model model) {
		int currPage = 1;
		if (page != null) {//第一次访问,page=null
			currPage = Integer.parseInt(page);
		}
		PageInfo<Question> pageInfo = questionService.findQuestion(code, currPage, 10);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("code", code);
		return "main/listQuestion";
	}

	@RequestMapping("toAdd")
	public String toAdd(String userid, Model model) {
		model.addAttribute("userid", userid);
		return "main/addQuestion";
	}
	
	@RequestMapping("add")
	public String add(Question question) {
		String code = (categoryService.findCategoryByName(question.getCategory())).getCode();
		question.setCode(code);
		questionService.addQuestion(question);
		return "forward:/question/list.do?code="+question.getCode();
	}
	
	@RequestMapping("toEdit")
	public String toEdit(String id, Model model){
		Question question = questionService.findQuestionById(Integer.parseInt(id));
		model.addAttribute("question", question);
		return "main/editQuestion";
	}
	
	@RequestMapping("edit")
	public String edit(Question question) {
		questionService.editQuestion(question);
		return "forward:/question/list.do";
	}
	
	@RequestMapping("view")
	public String view(String id,String resolved, Model model) {
		if ("true".equals(resolved)) {
			model.addAttribute("resolved", true);
		}
		Question question = questionService.findQuestionAndUser(Integer.parseInt(id));
		model.addAttribute("question", question);
		List<Reply> replyList = replyService.findReplyList(Integer.parseInt(id));
		model.addAttribute("replyList", replyList);
		return "main/viewQuestion";
	}

	@RequestMapping("del")
	public @ResponseBody String del(String id) {
		questionService.removeQuestion(Integer.parseInt(id));
		return "删除成功";
	}
	
	@RequestMapping("requestCategory")
	public @ResponseBody List<Category> requestCategory() {
		List<Category> list = questionService.findCategory();
		return list;
	}
	
	@RequestMapping("resolved")
	public String resolved(String questionid) {
		questionService.resolveQuestion(Integer.parseInt(questionid));
		return "redirect:/question/resolvedList.do";
	}
	
	@RequestMapping("resolvedList")
	public String resolvedList(String page, Model model) {
		int currPage = 1;
		if (page != null) {//第一次访问,page=null
			currPage = Integer.parseInt(page);
		}
		PageInfo<Question> pageInfo = questionService.findResolvedQuestion(currPage, 10);
		model.addAttribute("pageInfo", pageInfo);
		return "main/listResolvedQuestion";
	}
	
	@RequestMapping("search")
	public String search(@Param("keywords")String keywords,@Param("code")String code, Model model, String page, Integer rows) {
/*		String k = null;
		String c = null;
		try {
			k = new String(keywords.getBytes("iso-8859-1"),"UTF-8");
			c = new String(code.getBytes("iso-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}*/
		int currPage = 1;
		if (page != null) {//第一次访问,page=null
			currPage = Integer.parseInt(page);
		}
		PageInfo<Question> pageInfo = (PageInfo<Question>) questionService.searchQuestion(keywords,code,currPage, 10);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("keywords", keywords);
		model.addAttribute("code", code);
		return "main/listSearchQuestion";
	}
	
	@RequestMapping("searchResolved")
	public String searchResolved(@Param("keywords")String keywords,Model model, String page, Integer rows) {
	/*	String k = null;
		try {
			k = new String(keywords.getBytes("iso-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}*/
		int currPage = 1;
		if (page != null) {//第一次访问,page=null
			currPage = Integer.parseInt(page);
		}
		PageInfo<Question> pageInfo = (PageInfo<Question>) questionService.searchResolvedQuestion(keywords,currPage, 10);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("keywords", keywords);
		return "main/listSearchResolvedQuestion";
	}
}
