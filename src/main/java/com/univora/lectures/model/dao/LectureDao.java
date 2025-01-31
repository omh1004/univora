package com.univora.lectures.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.univora.lectures.model.dto.Lectures;
import com.univora.lectures.model.dto.MyClass;
import com.univora.lectures.model.dto.Review;

public class LectureDao {

	 public List<Lectures> selectAllLectures(SqlSession session) {
	        // MyBatis Mapper 호출
	        return session.selectList("lecture.selectAllLectures");
	    }


	  // 강좌 상세 조회
    public Lectures selectLectureDetail(SqlSession session, String lectureNo) {
	        // MyBatis Mapper 호출
	        return session.selectOne("lecture.selectLectureDetail", lectureNo);
	    }
	
    
//    public List<Review> selectLectureReviews(SqlSession session, String lectureNo) {
//        // MyBatis 매퍼 쿼리를 통해 데이터 가져오기
//    		
//    	 List<Review> reviews = session.selectList("lecture.selectLectureReviews", lectureNo);
//    	    
//    	    return reviews;
//    }

    
 // LectureDao.java
    public List<Review> selectLectureReviewsSortedByLikes(SqlSession session, String lectureNo) {
        return session.selectList("lecture.selectLectureReviewsSortedByLikes", lectureNo);
    }

    public List<Review> selectLectureReviewsSortedByLatest(SqlSession session, String lectureNo) {
        return session.selectList("lecture.selectLectureReviewsSortedByLatest", lectureNo);
    }

    
    
    // 강좌 검색
    public List<Lectures> searchLectures(SqlSession session, String query) {
        return session.selectList("lecture.searchLectures", query);
    }
    
    
    // 장바구니 담기 클릭시 수강바구니 추가
    public int insertLectureToBasket(SqlSession session, String lectureNo, String memberNo) {
        Map<String, String> params = new HashMap<>();
        params.put("lectureNo", lectureNo);
        params.put("memberNo", memberNo);
        return session.insert("lecture.insertLectureToBasket", params);
    }


	public MyClass getMyclassLectureByNo(SqlSession session, String lectureNo) {
		 return session.selectOne("lecture.getMyclassLectureByNo", lectureNo);
	}
	
	
	 // 수강생 여부 확인
    public boolean checkStudentEnrollment(SqlSession session, String lectureNo, String memberNo) {
        int count = session.selectOne("lecture.checkStudentEnrollment", 
                                      Map.of("lectureNo", lectureNo, "memberNo", memberNo));
        System.out.println("수강생 여부 : " + lectureNo);
        System.out.println("수강생 여부 : " + memberNo);
        return count > 0; // 강의에 등록되어 있다면 true 반환
    }


	public int getCountLectureBaskectByLectureNo(SqlSession session,String lectureNo, String memberNo) {
		  int count = session.selectOne("lecture.getCountLectureBaskectByLectureNo", 
                  Map.of("lectureNo", lectureNo, "memberNo", memberNo));
		  return count; 
	}
}
