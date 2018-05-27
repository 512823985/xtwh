package com.zsga.service;

import java.util.List;

import com.zsga.domain.Reply;

public interface ReplyService {
	public void addReply(Reply reply);
	public List<Reply> findReplyList(int questionid);
}
