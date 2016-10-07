package dev.mvc.app;

import java.util.List;

import dev.mvc.app.AppVO; 

  
public interface AppDAOInter {
 
  /** 
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="AppVO">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(AppVO vo);
  
  
  /**
   * 회원 전체 목록
   * <select id="list" resultType="AppVO">
   * @return 회원 목록
   */ 
  public List<AppVO> list();
  
  /**
   * App를 수정합니다.
   * <update id="update" parameterType="AppVO"> 
   * @param appVO
   * @return 수정된 레코드 갯수
   */
  public int update(AppVO vo);
  
  /**
   * 레코드 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param codeno 삭제할 code 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int ap_no); 
}