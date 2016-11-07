package dev.mvc.TQNA;

import java.util.HashMap;
import java.util.List;

public interface TqnaDAOInter {
  
  public List<TqnaVO> list();
  /** 
   * 등록 <insert id="create" parameterType="TqnaVO">
   * 
   * @param tqnaVO
   * @return
   */
  public int create(TqnaVO tqnaVO);
  /**
   * 한건의 레코드 조회 <select id="read" resultType="TqnaVO" parameterType="int">
   * 
   * @param qa_no
   *          글 번호
   * @return
   */
  public TqnaVO read(int qa_no);

  /**
   * 수정처리 <update id="update" parameterType="TqnaVO">
   * 
   * @param vo
   * @return
   */
  public int update(TqnaVO vo);

  /**
   * 삭제 처리 <delete id="delete" parameterType="int">
   * 
   * @param qa_no
   * @return
   */
  public int delete(int qa_no);

  /**
   * 검색된 레코드 수 <select id="count" resultType="int" parameterType="HashMap" >
   * 
   * @param hashmap
   *          검색 조건
   * @return
   */ 
  public int count(HashMap hashmap);

  /**
   * 답변 순서를 변경합니다.
   * <update id='updateAnsnum' parameterType="TqnaVO">
   * @param vo
   * @return 1: 성공, 0: 실패
   */
  public int updateAnsnum(TqnaVO vo);
  
  /**
   * 답변 등록
   * <insert id="reply" parameterType="TqnaVO"> 
   * @param vo
   * @return 1: 성공, 0: 실패
   */
  public int reply(TqnaVO vo);
  
  /**
   * 답변 기능을 지원하는 목록
   * <select id="list1" resultType="TqnaVO" parameterType="HashMap" > 
   * @param map 검색/페이징
   * @return 전체목록 또는 검색 목록
   */
  public List<TqnaVO> list1(HashMap<String, Object> map);
 
}
