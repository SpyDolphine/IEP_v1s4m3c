package dev.mvc.STUDY;

import java.util.HashMap;
import java.util.List;

import dev.mvc.STUDY.StudyVO;


public interface StudyDAOInter {

    /**
     * 레코드를 등록합니다.
     * <insert id="create" parameterType="Study">
     * @param vo 등록할 데이터 객체
     * @return 등록된 레코드 수
     */
    public int create(StudyVO vo);
    
    /**
     * 스터디 게시물 목록
     * <select id="list1" resultType="hashMap">
     * @return 리스트
     */
    public List<StudyVO> list(HashMap hashMap); 
    
    /**
     * 검색된 레코드 수
     * <select id="count" resultType="int" parameterType="HashMap" > 
     * @param hashmap 검색 조건
     * @return
     */
    public int count(String gate);
    
    /**
     * 한건의 레코드 조회 <select id="read" resultType="StudyVO" parameterType="int">
     * 
     * @param sy_no
     *          글 번호
     * @return
     */
    public StudyVO read(int sy_no);

    /**
     * 수정처리 <update id="update" parameterType="StudyVO">
     * 
     * @param vo
     * @return
     */
    public int update(StudyVO vo);

    /**
     * 삭제 처리 <delete id="delete" parameterType="int">
     * 
     * @param sy_no
     * @return
     */ 
    public int delete(int sy_no);
    
    
    
  }
  

