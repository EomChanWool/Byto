package com.project.ProjectSPBMarket.qareply;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QaReplyMapper {

	void insert(QaReply r);

	QaReply select(int qareply_num);

	ArrayList<QaReply> selectListByProduct_num(int qa_num);

	ArrayList<QaReply> selectListByUser_id(String user_id);

	ArrayList<QaReply> selectListByParent_qareply_num(int parent_qareply_num);

	void update(QaReply r);

	void delete(int qareply_num);

	void deleteParent(int qareply_num);

	int selectSeqCurrval();

}
