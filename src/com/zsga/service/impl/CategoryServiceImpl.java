package com.zsga.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zsga.dao.CategoryMapper;
import com.zsga.domain.Category;
import com.zsga.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Resource
	private CategoryMapper categoryMapper;

	@Override
	public Category findCategoryByName(String name) {
		Category category = categoryMapper.queryCategoryByName(name);
		return category;
	}

}
