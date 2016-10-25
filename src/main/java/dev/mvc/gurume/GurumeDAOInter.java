package dev.mvc.gurume;

import java.util.*;

import dev.mvc.gurume.GurumeVO;

public interface GurumeDAOInter {

  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="GurumeVO">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(GurumeVO gurumeVO);
  

  /**
   * 전체 목록
   * <select id="list" resultType="GurumeVO">
   * @return 회원 목록
   */
  public List<GurumeVO> list();
  
  /**
   *  수정합니다.
   * <update id="update" parameterType="GurumeVO"> 
   * @param gurumeVO
   * @return 수정된 레코드 갯수
   */
  
  public GurumeVO read(int gu_no);
  
  public int update(GurumeVO gurumeVO);
  
  /**
   * 레코드 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param mno 삭제할 회원 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int gu_no);


  public int cntup(int gu_no); 
  
  public List<GurumeVO> list4(HashMap Map);
  
  public int count(HashMap hashMap);
  /**
   * 한건의 레코드의 우선 순위를 높임입니다.
   * <update id="up" parameterType="CodeVO">
   * @param GurumeVO
   * @return 변경된 레코드 갯수
   *//*
  public int up(GurumeVO vo);
 
  *//**
   * 한건의 레코드의 우선 순위를 낮춥니다.
   * <update id="down" parameterType="CodeVO">
   * @param GurumeVO
   * @return 변경된 레코드 갯수
   *//*
  public int down(GurumeVO vo);
 */
}