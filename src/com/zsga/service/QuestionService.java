package com.zsga.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zsga.domain.Category;
import com.zsga.domain.Question;

public interface QuestionService {
	public List<Category> findCategory();
	public void addQuestion(Question question);
	public void editQuestion(Question question);
	public void removeQuestion(int id);
	public PageInfo<Question> findQuestion(String code, Integer page, Integer rows);
	public PageInfo<Question> findResolvedQuestion(Integer page, Integer rows);
	public Question findQuestionById(int id);
	public Question findQuestionAndUser(int id);
	public void resolveQuestion(int questionid);
	public void updateReplyed(int questionid);
	public PageInfo<Question> searchQuestion(String keywords,String code,Integer page, Integer rows);
	public PageInfo<Question> searchResolvedQuestion(String keywords,Integer page, Integer rows);
}
