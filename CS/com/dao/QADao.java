package com.qa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qa.dto.QADto;

import common.JDBCTemplate;

public class QADao extends JDBCTemplate{
	
	public List<QADto> selectAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<QADto>res = new ArrayList<QADto>();
		
		String sql = " SELECT * FROM QA_BOARD ORDER BY GROUPNO DESC, GROUPSQ ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query준비: "+ sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query실행 및 리턴");
			while(rs.next()) {
				QADto dto = new QADto();
				dto.setBoardno(rs.getInt(1));
				dto.setGroupno(rs.getInt(2));
				dto.setGroupsq(rs.getInt(3));
				dto.setTitletab(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setRegId(rs.getString(7));
				dto.setRegdate(rs.getDate(8));
				dto.setModdate(rs.getDate(9));
				dto.setCategory(rs.getString(10));
				
				res.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db종료\n");
		}		
		return res;
	}
	
	public QADto selectOne(int boardno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		QADto res = new QADto();
		
		String sql = " SELECT * FROM QA_BOARD WHERE BOARDNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, boardno);
			System.out.println("03. query준비: "+sql);
			
			rs=pstm.executeQuery();
			System.out.println("04. query실행 및 리턴");
			
			while(rs.next()) {
				res.setBoardno(rs.getInt(1));
				res.setGroupno(rs.getInt(2));
				res.setGroupsq(rs.getInt(3));
				res.setTitletab(rs.getInt(4));
				res.setTitle(rs.getString(5));
				res.setContent(rs.getString(6));
				res.setRegId(rs.getString(7));
				res.setRegdate(rs.getDate(8));
				res.setModdate(rs.getDate(9));
				res.setCategory(rs.getString(10));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}			
		return res;		
	}
	
	public int insert(QADto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO QA_BOARD " +
						" VALUES(BOARDNOSQ.NEXTVAL, GROUPNOSQ.NEXTVAL, 1, 0, ?,?,?, SYSDATE, SYSDATE, ?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, dto.getRegId());
			pstm.setString(4, dto.getCategory());
			System.out.println("03. query준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db종료\n");
		}	
		return res;		
	}
	
	public int update(QADto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE QA_BOARD SET TITLE=?, CONTENT=?, MOD_DT=SYSDATE WHERE BOARDNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3,  dto.getBoardno());
			System.out.println("03. query준비: "+ sql);
		
			res = pstm.executeUpdate();
			System.out.println("04. query실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db종료\n");
		}
		return res;
	}
	
	public int delete(int boardno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM QA_BOARD WHERE BOARDNO=? ";		
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, boardno);
			System.out.println("03. query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db종료\n");
		}		
		return res;
	}

	public int countAnswer(Connection con, int parentgroupno, int parentgroupsq) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;
		
		String sql = " SELECT COUNT(*) FROM QA_BOARD WHERE GROUPNO=? AND GROUPSQ>? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, parentgroupno);
			pstm.setInt(2, parentgroupsq);
			System.out.println("03. query준비: "+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query실행 및 리턴");
			
			while(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("04. query 실행 및 리턴");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}		
		return res;
	}

	public int updateAnswer(Connection con, int parentgroupno, int parentgroupsq) {
		PreparedStatement pstm = null;
		int res = 0;
		
		/*
		 * UPDATE QA_BOARD SET GROUPSQ = GROUPSQ + 1
			WHERE GROUPNO = (SELECT GROUPNO FROM QA_BOARD WHERE BOARDNO=2)
				AND GROUPSQ > (SELECT GROUPSQ FROM QA_BOARD WHERE BOARDNO=2);
		 */
		String sql = " UPDATE QA_BOARD SET GROUPSQ  = GROUPSQ + 1 "
							+ " WHERE GROUPNO=? AND GROUPSQ>?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, parentgroupno);
			pstm.setInt(2, parentgroupsq);
			System.out.println("03. query준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		return res;
	}

	public int insertAnswer(Connection con, QADto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		/*
		 * INSERT INTO QA_BOARD
			VALUES(BOARDNOSQ.NEXTVAL,
						(SELECT GROUPNO FROM QA_BOARD WHERE BOARDNO=2),
						(SELECT GROUPSQ FROM QA_BOARD WHERE BOARDNO=2)+1,
						(SELECT TITLETAB FROM QA_BOARD WHERE BOARDNO=2)+1,
						'RE:두번째 글', '2번 글의 답글입니다(2)', '유저2', SYSDATE
			);
		 */
		String sql = " INSERT INTO QA_BOARD VALUES(BOARDNOSQ.NEXTVAL, ?,?,?,?,?,?, SYSDATE, SYSDATE, ?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getGroupno());
			pstm.setInt(2, dto.getGroupsq()+1);
			pstm.setInt(3,  dto.getTitletab()+1);
			pstm.setString(4, dto.getTitle());
			pstm.setString(5, dto.getContent());
			pstm.setString(6, dto.getRegId());
			pstm.setString(7, dto.getCategory());
			System.out.println("03. query준비: "+ sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		return res;
	}
	
	
	
	
}
