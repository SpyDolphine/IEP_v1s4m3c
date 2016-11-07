package dev.mvc.APP;

import java.util.List;

public interface AppDAOInter {

  public List<AppVO> list(); 
  /** 
   * ��� <insert id="create" parameterType="AppVO">
   * 
   * @param appVO 
   * @return
   */ 
  public int create(AppVO appVO);
  /**
   * �Ѱ��� ���ڵ� ��ȸ <select id="read" resultType="AppVO" parameterType="int">
   * 
   * @param ap_no
   *          �� ��ȣ
   * @return
   */
  public AppVO read(int ap_no);

  /**
   * ����ó�� <update id="update" parameterType="AppVO">
   * 
   * @param vo
   * @return
   */
  public int update(AppVO vo);

  /**
   * ���� ó�� <delete id="delete" parameterType="int">
   * 
   * @param ap_no
   * @return
   */ 
  public int delete(int ap_no);

}
