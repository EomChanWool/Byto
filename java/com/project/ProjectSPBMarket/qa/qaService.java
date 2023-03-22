package com.project.ProjectSPBMarket.qa;

import java.util.List;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ProjectSPBMarket.qareply.QaReplyService;
import com.project.ProjectSPBMarket.util.CalcDate;

@Service
public class qaService {

	@Autowired
	private qaMapper mapper;
	
	@Autowired
	private QaReplyService rService;
	
	public void addqa(qa n) {
		mapper.insertqa(n);
	}
	
	//	조회수 추가테스트
	public void editqaHit(int qa_num) {
		mapper.updateHit(qa_num);
	}
	
	
	
	public List selectAllqa() {
		return mapper.selectAllqa();
	}
	
	public qa selectqaByNum(int qa_num) {
		return mapper.selectqa(qa_num);
	}
	
	public void qaHits(int qa_num) {
		mapper.qaHits(qa_num);
	}
	
	public void editqa(qa n) {
		mapper.updateqa(n);
	}
	
	public void delete(int qa_num) {
		mapper.deleteqa(qa_num);
	}
}
