package com.univora.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.univora.mypage.model.dto.AttachFile;
import com.univora.mypage.model.dto.OpenLecture;

public class MyLectureDao {
	
	private static final String NAMESPACE = "lecture";

	public int updateMyLectureDetail(SqlSession session, OpenLecture lecture) {
		return session.update(NAMESPACE + ".updateLecture", lecture);
	}

	public void uploadFile(SqlSession session, AttachFile uploadFile) {
		 session.insert(NAMESPACE + ".insertUpload", uploadFile);
		
	}

}
