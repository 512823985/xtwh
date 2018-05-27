package com.zsga.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zsga.dao.ReplyMapper;
import com.zsga.domain.Reply;
import com.zsga.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Resource
	private ReplyMapper replyMapper;

	@Override
	public void addReply(Reply reply) {
		replyMapper.insertReply(reply);
	}

	@Override
	public List<Reply> findReplyList(int questionid) {
		return replyMapper.queryReplyList(questionid);
	}
	
}
