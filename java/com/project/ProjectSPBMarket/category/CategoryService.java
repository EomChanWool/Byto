package com.project.ProjectSPBMarket.category;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {

	@Autowired
	private CategoryMapper mapper;

	public void addCategory(int type, Category c) {
		switch (type) {
		case 1:
			mapper.insertCategory1(c);
			break;

		}
	}

	public Category getCategory(int type, int category_num) {
		Category c = null;
		switch (type) {
		case 1:
			c = mapper.selectCategory1(category_num);
			break;
//	
		}
		return c;
	}

	public ArrayList<Category> getCategoryList(int type, int parent_category_num) {
		ArrayList<Category> list = null;
		switch (type) {
		case 1:
			list = mapper.selectAllCategory1();
			break;
		
		}
		return list;
	}

	public void editCategory(int type, Category c) {
		switch (type) {
		case 1:
			mapper.updateCategory1(c);
			break;

		}
	}

	public void deleteCategory(int type, int num) {
		switch (type) {
		case 1:
			mapper.deleteCategory1(num);
			break;

		}
	}

	public int getNum(int type) {
		int category_num = 0;
		switch (type) {
		case 1:
			category_num = mapper.getNum1();
			break;

		}
		return category_num;
	}
}
