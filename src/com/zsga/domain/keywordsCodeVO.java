package com.zsga.domain;

import org.springframework.stereotype.Repository;

@Repository
public class keywordsCodeVO {
	private String keywords;
	private String code;
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
}
