package dev.mvc.license;

import java.util.List;

public interface LicenseDAOInter {

  /**
   * 게시판 글 전체 목록입니다.
   * <select id="list" resultType="LicenseVO">
   * @return
   */
  public List<LicenseVO> list();
  /** 
   * 등록 <insert id="create" parameterType="LicenseVO">
   * 
   * @param licenseVO 
   * @return
   */ 
  public int create(LicenseVO licenseVO);
  /**
   * 한건의 레코드 조회 <select id="read" resultType="LicenseVO" parameterType="int">
   * 
   * @param lc_no
   *          글 번호
   * @return
   */
  public LicenseVO read(int lc_no);

  /**
   * 수정처리 <update id="update" parameterType="LicenseVO">
   * 
   * @param vo
   * @return
   */
  public int update(LicenseVO vo);

  /**
   * 삭제 처리 <delete id="delete" parameterType="int">
   * 
   * @param lc_no
   * @return
   */ 
  public int delete(int lc_no);

}
