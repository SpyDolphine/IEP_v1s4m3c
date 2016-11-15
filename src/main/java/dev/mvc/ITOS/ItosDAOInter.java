package dev.mvc.ITOS;

import java.util.HashMap;
import java.util.List;

public interface ItosDAOInter {
  
  public List<ItosVO> list();
  /** 
   * 등록 <insert id="create" parameterType="ItosVO">
   * 
   * @param itosVO
   * @return
   */
  public int create(ItosVO itosVO);
  /**
   * 한건의 레코드 조회 <select id="read" resultType="ItosVO" parameterType="int">
   * 
   * @param io_no
   *          글 번호
   * @return
   */
  public ItosVO read(int io_no);

  /**
   * 수정처리 <update id="update" parameterType="ItosVO">
   * 
   * @param vo
   * @return
   */
  public int update(ItosVO vo);

  /**
   * 삭제 처리 <delete id="delete" parameterType="int">
   * 
   * @param io_no
   * @return
   */
  public int delete(int io_no);

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
   * <update id='updateAnsnum' parameterType="ItosVO">
   * @param vo
   * @return 1: 성공, 0: 실패
   */
  public int updateAnsnum(ItosVO vo);
  
  /**
   * 답변 등록
   * <insert id="reply" parameterType="ItosVO"> 
   * @param vo
   * @return 1: 성공, 0: 실패
   */
  public int reply(ItosVO vo);
  
  /**
   * 답변 기능을 지원하는 목록
   * <select id="list1" resultType="ItosVO" parameterType="HashMap" > 
   * @param map 검색/페이징
   * @return 전체목록 또는 검색 목록
   */
  public List<ItosVO> list1(HashMap map);
  

}
