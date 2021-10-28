package com.faq.dto;

import java.util.Date;

public class FAQDto {

	private int faqSeq;
	private String category;
	private String regId;
	private Date regDt;
	private Date modDt;
	private String title;
	private String content;
	private int viewCnt;
	
	public FAQDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FAQDto(int faqSeq, String category, String regId, Date regDt, Date modDt, String title, String content,
			int viewCnt) {
		super();
		this.faqSeq = faqSeq;
		this.category = category;
		this.regId = regId;
		this.regDt = regDt;
		this.modDt = modDt;
		this.title = title;
		this.content = content;
		this.viewCnt = viewCnt;
	}
	public int getFaqSeq() {
		return faqSeq;
	}
	public void setFaqSeq(int faqSeq) {
		this.faqSeq = faqSeq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}
	public Date getModDt() {
		return modDt;
	}
	public void setModDt(Date modDt) {
		this.modDt = modDt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	
	
	
}
