package com.project.ProjectSPBMarket.qareply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ProjectSPBMarket.alram.AlramService;
import com.project.ProjectSPBMarket.member.MemberService;

@Service
public class QaReplyService {

	@Autowired
	private QaReplyMapper mapper;
	@Autowired
	private MemberService mService;
	@Autowired
	private AlramService aService;

//	댓글 추가
	public void addQaReply(QaReply r) {
		mapper.insert(r);
		r.setQaReply_num(mapper.selectSeqCurrval());
		System.out.println(r);
//		aService.addAlramByQaReply(r);
	}

//	댓글 내용 가져오기
	public QaReply getQaReply(int qareply_num) {
//		한개의 댓글 내용
		QaReply r = mapper.select(qareply_num);
//		댓글의 자식 댓글목록
		ArrayList<QaReply> rList = getListByParent_qareply_num(qareply_num);
		for (int i = 0; i < rList.size(); i++) {
			QaReply cQaReply = rList.get(i);
			cQaReply.setMember(mService.getMember(cQaReply.getUser_id()));
			rList.set(i, cQaReply);
		}
		r.setChild_qareply(rList);
		System.out.println(rList);
		r.setMember(mService.getMember(r.getUser_id()));
		return r;
	}

//	제품번호의 댓글 가져오기
	public ArrayList<QaReply> getQaReplyListByProduct_num(int qa_num) {
		ArrayList<QaReply> list = mapper.selectListByProduct_num(qa_num);
		for (int i = 0; i < list.size(); i++) {
			list.set(i, getQaReply(list.get(i).getQaReply_num()));
//			부모가 없는 댓글만 리스트에 넣는다.
			if (list.get(i).getParent_qareply_num() != -1) {
				list.remove(i);
				i--;
			}
		}
		return list;
	}

//	작성자의 댓글 목록
	public ArrayList<QaReply> getQaReplyListByWriter_id(String user_id) {
		return mapper.selectListByUser_id(user_id);
	}

//	댓글의 하위 댓글만 가져오기
	private ArrayList<QaReply> getListByParent_qareply_num(int parent_qareply_num) {
		return mapper.selectListByParent_qareply_num(parent_qareply_num);
	}

//	댓글 수정
	public void editQaReply(QaReply r) {
		mapper.update(r);
	}

//	댓글 삭제
	public void deleteQaReply(int qareply_num) {
		mapper.delete(qareply_num);
	}

	public void deleteParentQaReply(int qareply_num) {
		mapper.deleteParent(qareply_num);
	}

//	현재 번호
	public int getSeqCurrval() {
		return mapper.selectSeqCurrval();
	}

}
