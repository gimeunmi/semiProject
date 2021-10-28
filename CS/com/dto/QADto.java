package com.qa.dto;

import java.util.Date;

public class QADto {
	private int boardno;
	private int groupno;
	private int groupsq;
	private int titletab;
	private String title;
	private String content;
	private String regId;
	private Date regdate;
	private Date moddate;
	private String category;
	
	public QADto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QADto(int boardno, int groupno, int groupsq, int titletab, String title, String content, String regId,
			Date regdate, Date moddate, String category) {
		super();
		this.boardno = boardno;
		this.groupno = groupno;
		this.groupsq = groupsq;
		this.titletab = titletab;
		this.title = title;
		this.content = content;
		this.regId = regId;
		this.regdate = regdate;
		this.moddate = moddate;
		this.category = category;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public int getGroupsq() {
		return groupsq;
	}
	public void setGroupsq(int groupsq) {
		this.groupsq = groupsq;
	}
	public int getTitletab() {
		return titletab;
	}
	public void setTitletab(int titletab) {
		this.titletab = titletab;
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
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModdate() {
		return moddate;
	}
	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	

}
