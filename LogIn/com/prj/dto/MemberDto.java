package com.prj.dto;

public class MemberDto {
	private int myno;
	private String myid;
	private String myname;
	private String mypw;
	private String mypostcode;
	private String myaddr;
	private String myadd_addr;
	private String myphone;
	private String mygender;
	private String myenabled;
	private String myrole;
	
	
	public MemberDto() {
		super();
	}


	public MemberDto(int myno, String myid, String myname, String mypw, String mypostcode, String myaddr,
			String myadd_addr, String myphone, String mygender, String myenabled, String myrole) {
		super();
		this.myno = myno;
		this.myid = myid;
		this.myname = myname;
		this.mypw = mypw;
		this.mypostcode = mypostcode;
		this.myaddr = myaddr;
		this.myadd_addr = myadd_addr;
		this.myphone = myphone;
		this.mygender = mygender;
		this.myenabled = myenabled;
		this.myrole = myrole;
	}


	public int getMyno() {
		return myno;
	}


	public void setMyno(int myno) {
		this.myno = myno;
	}


	public String getMyid() {
		return myid;
	}


	public void setMyid(String myid) {
		this.myid = myid;
	}


	public String getMyname() {
		return myname;
	}


	public void setMyname(String myname) {
		this.myname = myname;
	}


	public String getMypw() {
		return mypw;
	}


	public void setMypw(String mypw) {
		this.mypw = mypw;
	}


	public String getMypostcode() {
		return mypostcode;
	}


	public void setMypostcode(String mypostcode) {
		this.mypostcode = mypostcode;
	}


	public String getMyaddr() {
		return myaddr;
	}


	public void setMyaddr(String myaddr) {
		this.myaddr = myaddr;
	}


	public String getMyadd_addr() {
		return myadd_addr;
	}


	public void setMyadd_addr(String myadd_addr) {
		this.myadd_addr = myadd_addr;
	}


	public String getMyphone() {
		return myphone;
	}


	public void setMyphone(String myphone) {
		this.myphone = myphone;
	}


	public String getMygender() {
		return mygender;
	}


	public void setMygender(String mygender) {
		this.mygender = mygender;
	}


	public String getMyenabled() {
		return myenabled;
	}


	public void setMyenabled(String myenabled) {
		this.myenabled = myenabled;
	}


	public String getMyrole() {
		return myrole;
	}


	public void setMyrole(String myrole) {
		this.myrole = myrole;
	}

	
	
}
