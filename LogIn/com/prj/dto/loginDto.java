package com.prj.dto;



public class loginDto {
	private int myno;
	private String myid;
	private String mypw;
	private String myname;
	private int mypostcode;
	private String myaddr;
	private String myadd_addr;
	private String myphone;
	private String myemail;
	private String mygender;
	private String myenabled;
	private String myrole;
	
	public loginDto() {
		super();
	}

	public loginDto(int myno, String myid, String mypw, String myname, int mypostcode, String myaddr, String myadd_addr,
			String myphone, String myemail, String mygender, String myenabled, String myrole) {
		super();
		this.myno = myno;
		this.myid = myid;
		this.mypw = mypw;
		this.myname = myname;
		this.mypostcode = mypostcode;
		this.myaddr = myaddr;
		this.myadd_addr = myadd_addr;
		this.myphone = myphone;
		this.myemail = myemail;
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

	public String getMypw() {
		return mypw;
	}

	public void setMypw(String mypw) {
		this.mypw = mypw;
	}

	public String getMyname() {
		return myname;
	}

	public void setMyname(String myname) {
		this.myname = myname;
	}

	public int getMypostcode() {
		return mypostcode;
	}

	public void setMypostcode(int mypostcode) {
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

	public String getMyemail() {
		return myemail;
	}

	public void setMyemail(String myemail) {
		this.myemail = myemail;
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