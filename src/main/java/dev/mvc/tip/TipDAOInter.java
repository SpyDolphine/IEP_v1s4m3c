package dev.mvc.tip;

import java.util.HashMap;
import java.util.List;

import dev.mvc.servey.ServeyVO;

public interface TipDAOInter {
  /**
   * 항목 등록
   * <insert id="create" parameterType="tipVO">
   * @param 설문조사 항목 등록할 객체
   * @return 결과
   */
  public int create(TipVO tipVO);
  
  /**
   * 홈페이지 질문 목록
   * <select id="list" resultType="tipVO">
   * @return 리스트
   */
  public List<TipVO> list(HashMap Map);

  /**
   * 항목 수정합니다.
   * <update id="update" parameterType="tipVO">
   * @param tipVO
   * @return 결과
   */
  public int update(TipVO tipVO);
 
  /**
   * 항목 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param tp_no 삭제할 항목 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int tp_no);
  /**
  * 한건의 레코드 조회
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param tp_no
  * @return
  */
  public TipVO read(int tp_no);

  /**
   * 검색된 레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색조건
   * @return
   */
  public int count(HashMap hashmap); 
  
}