package dev.mvc.APP;

import java.util.List;

public interface AppDAOInter {

  public List<AppVO> list(); 
  /** 
   * 등록 <insert id="create" parameterType="AppVO">
   * 
   * @param appVO 
   * @return
   */ 
  public int create(AppVO appVO);
  /**
   * 한건의 레코드 조회 <select id="read" resultType="AppVO" parameterType="int">
   * 
   * @param ap_no
   *          글 번호
   * @return
   */
  public AppVO read(int ap_no);

  /**
   * 수정처리 <update id="update" parameterType="AppVO">
   * 
   * @param vo
   * @return
   */
  public int update(AppVO vo);

  /**
   * 삭제 처리 <delete id="delete" parameterType="int">
   * 
   * @param ap_no
   * @return
   */ 
  public int delete(int ap_no);

}
