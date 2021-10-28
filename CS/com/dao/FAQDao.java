package com.faq.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.faq.dto.FAQDto;

import common.JDBCTemplate;

public class FAQDao extends JDBCTemplate{
	
	public List<FAQDto> selectAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<FAQDto>res = new ArrayList<FAQDto>();
		
		String sql = " SELECT * FROM FAQ_BOARD ORDER BY FAQ_SEQ DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query준비: "+ sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query실행 및 리턴");
			while(rs.next()) {
				FAQDto dto = new FAQDto();
				dto.setFaqSeq(rs.getInt(1));
				dto.setCategory(rs.getString(2));
				dto.setRegId(rs.getString(3));
				dto.setRegDt(rs.getDate(4));
				dto.setModDt(rs.getDate(5));
				dto.setTitle(rs.getString(6));
				dto.setContent(rs.getString(7));
				dto.setViewCnt(rs.getInt(8));
				
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

	public FAQDto selectOne(int noticeSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		FAQDto res = new FAQDto();
		
		String sql = " SELECT * FROM FAQ_BOARD WHERE FAQ_SEQ=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, noticeSeq);
			System.out.println("03. query준비: "+sql);
			
			rs=pstm.executeQuery();
			System.out.println("04. query실행 및 리턴");
			
			while(rs.next()) {
				res.setFaqSeq(rs.getInt(1));
				res.setCategory(rs.getString(2));
				res.setRegId(rs.getString(3));
				res.setRegDt(rs.getDate(4));
				res.setModDt(rs.getDate(5));
				res.setTitle(rs.getString(6));
				res.setContent(rs.getString(7));
				res.setViewCnt(rs.getInt(8));
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

	public int insert(FAQDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO FAQ_BOARD(FAQ_SEQ, REG_DT, MOD_DT, VIEW_CNT, TITLE, CONTENT, REG_ID) " +
						" VALUES(FAQ_SEQ_TABLE.NEXTVAL, SYSDATE, SYSDATE, 0, ?, ?, ?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, dto.getRegId());
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

	public int update(FAQDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE FAQ_BOARD SET TITLE=?, CONTENT=?, MOD_DT=SYSDATE WHERE FAQ_SEQ=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3,  dto.getFaqSeq());
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

	public int delete(int noticeSeq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM FAQ_BOARD WHERE FAQ_SEQ=? ";		
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, noticeSeq);
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
	
	
	
	
	
	
	
	
	
	
}
