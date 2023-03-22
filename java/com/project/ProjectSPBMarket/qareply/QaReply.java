package com.project.ProjectSPBMarket.qareply;

import java.sql.Date;
import java.util.ArrayList;

import com.project.ProjectSPBMarket.member.Member;

public class QaReply {

	private int qareply_num;
	private String user_id, qareply_content;
	private int qa_num;
	private Date qareply_date;
	private int parent_qareply_num;
	private ArrayList<QaReply> child_qareply;
	private Member member;
	
	
	
	public int getQareply_num() {
		return qareply_num;
	}

	public void setQareply_num(int qareply_num) {
		this.qareply_num = qareply_num;
	}

	public String getQareply_content() {
		return qareply_content;
	}

	public void setQareply_content(String qareply_content) {
		this.qareply_content = qareply_content;
	}

	public int getQa_num() {
		return qa_num;
	}

	public void setQa_num(int qa_num) {
		this.qa_num = qa_num;
	}

	public Date getQareply_date() {
		return qareply_date;
	}

	public void setQareply_date(Date qareply_date) {
		this.qareply_date = qareply_date;
	}


	public QaReply() {
	}

	

	public QaReply(int qareply_num, String user_id, String qareply_content, int qa_num, Date qareply_date,
			int parent_qareply_num, ArrayList<QaReply> child_qareply, Member member) {
		super();
		this.qareply_num = qareply_num;
		this.user_id = user_id;
		this.qareply_content = qareply_content;
		this.qa_num = qa_num;
		this.qareply_date = qareply_date;
		this.parent_qareply_num = parent_qareply_num;
		this.child_qareply = child_qareply;
		this.member = member;
	}

	public int getQaReply_num() {
		return qareply_num;
	}

	public void setQaReply_num(int qareply_num) {
		this.qareply_num = qareply_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getQaReply_content() {
		return qareply_content;
	}

	public void setQaReply_content(String qareply_content) {
		this.qareply_content = qareply_content;
	}

	public int getProduct_num() {
		return qa_num;
	}

	public void setProduct_num(int qa_num) {
		this.qa_num = qa_num;
	}

	public Date getQaReply_date() {
		return qareply_date;
	}

	public void setQaReply_date(Date qareply_date) {
		this.qareply_date = qareply_date;
	}

	public int getParent_qareply_num() {
		return parent_qareply_num;
	}

	public void setParent_qareply_num(int parent_qareply_num) {
		this.parent_qareply_num = parent_qareply_num;
	}

	public ArrayList<QaReply> getChild_qareply() {
		return child_qareply;
	}

	public void setChild_qareply(ArrayList<QaReply> child_qareply) {
		this.child_qareply = child_qareply;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "QaReply [qareply_num=" + qareply_num + ", user_id=" + user_id + ", qareply_content=" + qareply_content
				+ ", qa_num=" + qa_num + ", qareply_date=" + qareply_date + ", parent_qareply_num=" + parent_qareply_num
				+ ", child_qareply=" + child_qareply + ", member=" + member + "]";
	}

	
	

}