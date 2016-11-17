package dev.mvc.license;

import java.util.List;

public interface LicenseDAOInter {

  /**
   * �Խ��� �� ��ü ����Դϴ�.
   * <select id="list" resultType="LicenseVO">
   * @return
   */
  public List<LicenseVO> list();
  /** 
   * ��� <insert id="create" parameterType="LicenseVO">
   * 
   * @param licenseVO 
   * @return
   */ 
  public int create(LicenseVO licenseVO);
  /**
   * �Ѱ��� ���ڵ� ��ȸ <select id="read" resultType="LicenseVO" parameterType="int">
   * 
   * @param lc_no
   *          �� ��ȣ
   * @return
   */
  public LicenseVO read(int lc_no);

  /**
   * ����ó�� <update id="update" parameterType="LicenseVO">
   * 
   * @param vo
   * @return
   */
  public int update(LicenseVO vo);

  /**
   * ���� ó�� <delete id="delete" parameterType="int">
   * 
   * @param lc_no
   * @return
   */ 
  public int delete(int lc_no);

}
