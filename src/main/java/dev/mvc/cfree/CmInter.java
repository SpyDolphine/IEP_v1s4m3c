package dev.mvc.cfree;

import java.util.HashMap;
import java.util.List;

public interface CmInter {
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="CmVO">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(CmVO cmVO);

  /**
   * 수정
   * <update id="update" parameterType="CmVO">
   * @param cmVO
   * @return
   */
  public int update(CmVO cmVO);

  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param cm_no
   * @return
   */
  public int delete(int cm_no);  
  
  /**
   * 한건의 레코드 조회
   * <select id="read" resultType="CmVO" parameterType="int">
   * @param cm_no 글번호
   * @return
   */
  public CmVO read(int cm_no); 
  
  /**
   * 검색된 레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색조건
   * @return
   */
  public int count(HashMap hashmap);  
  
  /**
   * 답변 기능을 지원하는 목록
   * <select id="list2" resultType="CmVO" parameterType="HashMap" >
   * @param Map 검색/페이징
   * @return 전체 목록 또는 검색 목록
   */
  public List<CmVO> list(HashMap Map);

  /**
   * 좋아요 
   * <update id="likeup" parameterType="CmVO">
   * @param gfreeVO
   * @return
   */
  public int likeup(int cm_no); 
  
  /**
   * 좋아요 
   * <update id="likedown" parameterType="CmVO">
   * @param gfreeVO
   * @return
   */
  public int likedown(CmVO cmVO); 
  
  /**
   * 좋아요 
   * <update id="heartup" parameterType="CmVO">
   * @param gfreeVO
   * @return
   */
  public int heart(CmVO cmVO); 
  
}
