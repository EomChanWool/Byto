package com.project.ProjectSPBMarket.category;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {

	// 카테고리 추가
	void insertCategory1(Category c);

	

	// 카테고리 선택
	Category selectCategory1(int category_num);

	

	// 카테고리 전체 선택
	ArrayList<Category> selectAllCategory1();



	// 카테고리 수정
	void updateCategory1(Category c);

	

	// 카테고리 삭제
	void deleteCategory1(int category_num);

	

	int getNum1();

	

}
