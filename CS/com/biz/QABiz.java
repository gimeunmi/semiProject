package com.qa.biz;

import java.sql.Connection;

import com.qa.dao.QADao;
import com.qa.dto.QADto;

import common.JDBCTemplate;

public class QABiz extends JDBCTemplate {
	
		private QADao dao = new QADao();
		
		public boolean answerLogic(QADto dto) {
			Connection con = getConnection();
			
			int parentgroupno = dto.getGroupno();
			int parentgroupsq = dto.getGroupsq();
			
			//update
			int countRes = dao.countAnswer(con, parentgroupno, parentgroupsq);
			int updateRes = dao.updateAnswer(con, parentgroupno, parentgroupsq);
			
			//insert	
			int insertRes = dao.insertAnswer(con, dto);
			
			//update와 insert의 성공여부 확인: 둘다 성공이면 커밋, 아니면 롤백
			if(countRes==updateRes && insertRes>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
			close(con);
			System.out.println("05. db종료\n");
						
			return (countRes==updateRes && insertRes>0) ? true : false;
		}
	}
