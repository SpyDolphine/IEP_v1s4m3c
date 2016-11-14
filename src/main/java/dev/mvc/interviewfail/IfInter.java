package dev.mvc.interviewfail;

import java.util.List;

public interface IfInter {
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="IfVO">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(IfVO ifvo);
  
  /**
   * 전체 목록
   * <select id="list" resultType="IfVO">
   * @return 목록
   */
  public List<IfVO> list(); 
  
  /**
   * 한건의 레코드 조회
   * <select id="read" resultType="IfVO" parameterType="int">
   * @param if_no 글번호
   * @return
   */
  public IfVO read(int if_no);  
  
  /**
   * 수정
   * <update id="update" parameterType="IfVO">
   * @param ifVO
   * @return
   */
  public int update(IfVO ifVO);
  
  /**
   * 댓글조회수
   * @param if_no
   * @return
   */
  public int update_cnt(int if_no);    

  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param if_no
   * @return
   */
  public int delete(int if_no);  
  
  /**
   * 많이본 글 목록
   * <select id="list" resultType="IfVO">
   * @return 목록
   */
  public List<IfVO> manylist();   
}