package dev.mvc.servey;

import java.util.List;

import dev.mvc.category.CategoryVO;

public interface ServeyDAOInter {
  /**
   * 항목 등록
   * <insert id="create" parameterType="ServeyVO">
   * @param 설문조사 항목 등록할 객체
   * @return 결과
   */
  public int create(ServeyVO serveyVO);
  
  /**
   * 전체 목록
   * <select id="list" resultType="ServeyVO">
   * @return 설문조사 항목
   */
  public List<ServeyVO> list(int sb_no);
  
  /**
  * 한건의 레코드 조회
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public ServeyVO read(int serveyno);
  
  /**
   * 설문조사 항목 총합
   * <select id="sum" resultType="ServeyVO" parameterType="int">
   * @param sb_no 합계를 수할 게시판 번호
   * @return 총합
   */
  public int sum(int sb_no);
  
  /**
   * 항목 수정합니다.
   * <update id="update" parameterType="ServeyVO"> 
   * @param serveyVO
   * @return 결과
   */
  public int update(ServeyVO serveyVO);
 
  /**
   * 항목 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param serveyno 삭제할 항목 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int serveyno); 
  
  /**
   * 백분율을 저장합니다.
   * <update id="percent" parameterType="ServeyVO"> 
   * @param serveyVO
   * @return 결과
   */
  public int persent(ServeyVO serveyVO);
  
  /**
   * 투표를 반영합니다
   * <update id="vote" parameterType="ServeyVO"> 
   * @param serveyVO
   * @return 결과
   */
  public int vote(int serveyno);
  
}