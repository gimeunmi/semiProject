package com.prj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import com.prj.dto.MemberDto;
import com.prj.dao.MemberDao;

import common.JDBCTemplate;

public class MemberDao extends JDBCTemplate{
	
	/* 관리자기능(ADMIN)
	
	*/
	// 회원 전체
	public List<MemberDto> selectAll() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MemberDto> res = new ArrayList<MemberDto>();
		
		String sql = " SELECT * FROM MEMBER ORDER BY MYNO DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				MemberDto tmp = new MemberDto();
				tmp.setMyno(rs.getInt(1));
				tmp.setMyid(rs.getString(2));
				tmp.setMypw(rs.getString(3));
				tmp.setMyname(rs.getString(4));
				tmp.setMyaddr(rs.getString(5));
				tmp.setMyphone(rs.getString(6));
				tmp.setMyenabled(rs.getString(8));
				tmp.setMyrole(rs.getString(9));
				
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	
	// 가입된 회원
	public List<MemberDto> selectEnabled() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MemberDto> res = new ArrayList<MemberDto>();
		
		String sql = " SELECT * FROM MEMBER WHERE MYENABLED='Y' ORDER BY MYNO DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				MemberDto tmp = new MemberDto();
				tmp.setMyno(rs.getInt(1));
				tmp.setMyid(rs.getString(2));
				tmp.setMypw(rs.getString(3));
				tmp.setMyname(rs.getString(4));
				tmp.setMyaddr(rs.getString(5));
				tmp.setMyphone(rs.getString(6));
				tmp.setMyenabled(rs.getString(8));
				tmp.setMyrole(rs.getString(9));
				
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	// 회원 등급 조정
	public int updateRole(int myno, String myrole) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MEMBER SET MYROLE=? WHERE MYNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, myrole);
			pstm.setInt(2, myno);
			System.out.println("03. query 준비 : " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res > 0) {	// 성공했다면~
				commit(con);
			} else {
				rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	
	
	/* 사용자기능(USER)
	 
	*/
	// 로그인
	public MemberDto login(String id, String pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = new MemberDto();
		
		String sql = " SELECT * FROM MEMBER WHERE MYID=? AND MYPW=? AND MYENABLED=? ";
		// 아이디랑 패스워드가 모두 일치할 때, 가입여부가 'Y'일 때 모든 정보를 검색함
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			pstm.setString(3, "Y");
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.setMyno(rs.getInt(1));
				res.setMyid(rs.getString(2));
				res.setMypw(rs.getString(3));
				res.setMyname(rs.getString(4));
				res.setMyaddr(rs.getString(5));
				res.setMyphone(rs.getString(6));
				res.setMyenabled(rs.getString(8));
				res.setMyrole(rs.getString(9));
				// 값 담아줌
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	// 내 정보 조회
	public MemberDto selectUser(int myno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = null;
		
		String sql = " SELECT * FROM MEMBER WHERE MYNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res = new MemberDto();
				res.setMyno(rs.getInt(1));
				res.setMyid(rs.getString(2));
				res.setMypw(rs.getString(3));
				res.setMyname(rs.getString(4));
				res.setMyaddr(rs.getString(5));
				res.setMyphone(rs.getString(6));
				res.setMyenabled(rs.getString(8));
				res.setMyrole(rs.getString(9));
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	
	// 아이디 중복 체크
	public String idChk(String id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = null;
		
		String sql = " SELECT * FROM MEMBER WHERE MYID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res = rs.getString(2);
				// 두번째 컬럼(id값)만 가져와서 저장해줌
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	
	// 회원가입
	public int insertUser(MemberDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO MEMBER VALUES(MYNOSEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, 'Y', 'USER') ";
		
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyid());
			pstm.setString(2, dto.getMyname());
			pstm.setString(3, dto.getMypw());
			pstm.setString(4, dto.getMypostcode());
			pstm.setString(5, dto.getMyaddr());
			pstm.setString(6, dto.getMyadd_addr());
			pstm.setString(7, dto.getMyphone());
			pstm.setString(8, dto.getMygender());
			System.out.println("03. query 준비 : " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	
	// 내 정보 수정
	public boolean updateUser(MemberDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MEMBER SET MYADDR=?, MYPHONE=?, MYEMAIL=? WHERE MYNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyaddr());
			pstm.setString(2, dto.getMyphone());
			pstm.setInt(4, dto.getMyno());
			System.out.println("03. query 준비 : " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return (res>0)? true : false;
	}
	
	
	// 회원 탈퇴
	public boolean deleteUser(int myno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MEMBER SET MYENABLED='N' WHERE MYNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);
			System.out.println("03. query 준비 : " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return (res>0)? true : false;
	}
}
