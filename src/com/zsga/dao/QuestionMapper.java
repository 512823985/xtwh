package com.zsga.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zsga.domain.Category;
import com.zsga.domain.Question;
import com.zsga.domain.keywordsCodeVO;

public interface QuestionMapper {
	List<Category> queryCategory();
	void insertQuestion(Question question);
	void updateQuestion(Question question);
	void delQuestion(int id);
	List<Question> queryQuestionList(String code);
	List<Question> queryResolvedQuestionList();
	Question queryQuestionAndUser(int id);
	Question queryQuestionById(int id);
	void resolvedQuestion(int questionid);
	void updateReplyed(int questionid);
	List<Question> search(keywordsCodeVO kcvo);
	List<Question> searchResolved(String keywords);
}
