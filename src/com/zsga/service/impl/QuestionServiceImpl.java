package com.zsga.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zsga.dao.QuestionMapper;
import com.zsga.domain.Category;
import com.zsga.domain.Question;
import com.zsga.domain.keywordsCodeVO;
import com.zsga.service.QuestionService;
import com.zsga.utils.GotLocalIP;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Resource
	private QuestionMapper questionMapper;

	@Override
	public List<Category> findCategory() {
		return questionMapper.queryCategory();
	}

	@Override
	public void addQuestion(Question question) {
		question.setIp(GotLocalIP.getLocalIP());
		questionMapper.insertQuestion(question);
	}

	@Override
	public PageInfo<Question> findQuestion(String code, Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<Question> list = questionMapper.queryQuestionList(code);
		PageInfo<Question> pageInfo = new PageInfo<Question>(list);
		pageInfo.setNavigatePages(4);
		return pageInfo;
	}

	@Override
	public Question findQuestionById(int id) {
		Question question = questionMapper.queryQuestionById(id);
		return question;
	}
	
	@Override
	public Question findQuestionAndUser(int id) {
		return questionMapper.queryQuestionAndUser(id);
	}

	@Override
	public void editQuestion(Question question) {
		question.setIp(GotLocalIP.getLocalIP());
		questionMapper.updateQuestion(question);
	}

	@Override
	public void removeQuestion(int id) {
		questionMapper.delQuestion(id);
	}

	@Override
	public void resolveQuestion(int questionid) {
		questionMapper.resolvedQuestion(questionid);
	}

	@Override
	public PageInfo<Question> findResolvedQuestion(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<Question> list = questionMapper.queryResolvedQuestionList();
		PageInfo<Question> pageInfo = new PageInfo<Question>(list);
		pageInfo.setNavigatePages(4);
		return pageInfo;
	}

	@Override
	public void updateReplyed(int questionid) {
		questionMapper.updateReplyed(questionid);
	}

	@Override
	public PageInfo<Question> searchQuestion(String keywords, String code, Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		keywordsCodeVO kcvo = new keywordsCodeVO();
		kcvo.setKeywords(keywords);
		kcvo.setCode(code);
		List<Question> list = questionMapper.search(kcvo);
		PageInfo<Question> pageInfo = new PageInfo<Question>(list);
		pageInfo.setNavigatePages(4);
		return pageInfo;
	}

	@Override
	public PageInfo<Question> searchResolvedQuestion(String keywords,Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<Question> list = questionMapper.searchResolved(keywords);
		PageInfo<Question> pageInfo = new PageInfo<Question>(list);
		pageInfo.setNavigatePages(4);
		return pageInfo;
	}

}
