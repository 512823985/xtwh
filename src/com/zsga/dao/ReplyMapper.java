package com.zsga.dao;

import java.util.List;

import com.zsga.domain.Reply;

public interface ReplyMapper {
	public void insertReply(Reply reply);
	List<Reply> queryReplyList(int questionid);
}
