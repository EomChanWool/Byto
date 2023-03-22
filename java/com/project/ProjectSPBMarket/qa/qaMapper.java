package com.project.ProjectSPBMarket.qa;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.ProjectSPBMarket.product.Product;

//import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface qaMapper {


	void insertqa(qa n);	//
	
	List selectAllqa();		//
	
	qa selectqa(int qa_num);	//
	
	void updateqa(qa n);
	
	void qaHits(int qa_num);
	
	void deleteqa(int qa_num);
	
//	조회수 추가 댓글 추가
	void updateHit(int qa_num);
	
//	제품 상세보기 댓글 추가
	qa select(int qa_num);
	
}
