package dev.mvc.interview;

import java.util.List;

public interface InterviewDAOInter {
  /**
   * 항목 등록
   * <insert id="create" parameterType="InterviewVO">
   * @param 설문조사 항목 등록할 객체
   * @return 결과
   */
  public int create(InterviewVO interviewVO);
  
  /**
   * 홈페이지 질문 목록
   * <select id="list" resultType="InterviewVO">
   * @return 리스트
   */
  public List<InterviewVO> list();

  /**
   * 항목 수정합니다.
   * <update id="update" parameterType="InterviewVO">
   * @param aboutmeVO
   * @return 결과
   */
  public int update(InterviewVO interviewVO);
 
  /**
   * 항목 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param iv_no 삭제할 항목 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int iv_no);
  /**
  * 한건의 레코드 조회
  * <select id="read" resultType="InterviewVO">
  * @param blogno
  * @return
  */
  public InterviewVO read(int iv_no); 
  
}