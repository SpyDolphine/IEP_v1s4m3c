package dev.mvc.aboutme;

import java.util.List;

import dev.mvc.servey.ServeyVO;

public interface AboutmeDAOInter {
  /**
   * 항목 등록
   * <insert id="create" parameterType="aboutmeVO">
   * @param 설문조사 항목 등록할 객체
   * @return 결과
   */
  public int create(AboutmeVO aboutmeVO);
  
  /**
   * 홈페이지 질문 목록
   * <select id="list" resultType="aboutmeVO">
   * @return 리스트
   */
  public List<AboutmeVO> list();

  /**
   * 항목 수정합니다.
   * <update id="update" parameterType="aboutmeVO">
   * @param aboutmeVO
   * @return 결과
   */
  public int update(AboutmeVO aboutmeVO);
 
  /**
   * 항목 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param am_no 삭제할 항목 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int am_no);
  /**
  * 한건의 레코드 조회
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public AboutmeVO read(int am_no); 
  
}