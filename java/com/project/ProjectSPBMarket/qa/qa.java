package com.project.ProjectSPBMarket.qa;

import java.sql.Date;
import java.util.ArrayList;

import com.project.ProjectSPBMarket.qareply.QaReply;

public class qa {

	private int qa_num;
	private String qa_title;
	private String qa_content;
	private Date qa_date;
	private int qa_hits;
	private String qa_user;
	private ArrayList<QaReply> qa_replys;
	
	
	
	public ArrayList<QaReply> getQa_replys() {
		return qa_replys;
	}

	public void setQa_replys(ArrayList<QaReply> qa_replys) {
		this.qa_replys = qa_replys;
	}

	public qa() {
		super();
	}



	public qa(int qa_num, String qa_title, String qa_content, Date qa_date, int qa_hits, String qa_user,
			ArrayList<QaReply> qa_replys) {
		super();
		this.qa_num = qa_num;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_date = qa_date;
		this.qa_hits = qa_hits;
		this.qa_user = qa_user;
		this.qa_replys = qa_replys;
	}

	public int getQa_num() {
		return qa_num;
	}

	public void setQa_num(int qa_num) {
		this.qa_num = qa_num;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public Date getQa_date() {
		return qa_date;
	}

	public void setQa_date(Date qa_date) {
		this.qa_date = qa_date;
	}

	public int getQa_hits() {
		return qa_hits;
	}

	public void setQa_hits(int qa_hits) {
		this.qa_hits = qa_hits;
	}

	public String getQa_user() {
		return qa_user;
	}

	public void setQa_user(String qa_user) {
		this.qa_user = qa_user;
	}

	@Override
	public String toString() {
		return "qa [qa_num=" + qa_num + ", qa_title=" + qa_title + ", qa_content=" + qa_content + ", qa_date=" + qa_date
				+ ", qa_hits=" + qa_hits + ", qa_user=" + qa_user + ", qa_replys=" + qa_replys + "]";
	}

	

	
}
