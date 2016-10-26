package dev.mvc.serveyboard;

import java.util.List;

public interface ServeyboardDAOInter {
  /**
   * 항목 등록
   * <insert id="create" parameterType="ServeyboardVO">
   * @param 설문조사 항목 등록할 객체
   * @return 결과
   */
  public int create(ServeyboardVO ServeyboardVO);
  
  /**
   * 전체 목록
   * <select id="list" resultType="ServeyboardVO">
   * @return 설문조사
   */
  public List<ServeyboardVO> list();
  
  /**
  * 한건의 레코드 조회
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public ServeyboardVO read(int sb_no);
  
  /**
   * 항목 수정합니다.
   * <update id="update" parameterType="ServeyboardVO"> 
   * @param ServeyboardVO
   * @return 결과
   */
  public int update(ServeyboardVO ServeyboardVO);
 
  /**
   * 항목 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param serveyno 삭제할 항목 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int sb_no);
  
  /**
   * 설문조사 항목 총합
   * <select id="sum" resultType="ServeyVO" parameterType="int">
   * @param sb_no 합계를 수할 게시판 번호
   * @return 총합
   */
  public int max();
}