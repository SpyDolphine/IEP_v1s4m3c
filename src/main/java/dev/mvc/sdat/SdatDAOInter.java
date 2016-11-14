package dev.mvc.sdat;

import java.util.HashMap;
import java.util.List;

public interface SdatDAOInter {
  
  /**
   * ���
   * <insert id="create" parameterType="sdatVO">
   * @param sdatVO
   * @return
   */
  public int create(SdatVO sdatVO);
  
  /**
   * ��� ���(���ø��)
   * @param sc_no
   * @return
   */
  public List<SdatVO> sdatlist(int sc_no); 
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="ReplyVO" parameterType="int">
   * @param rno �۹�ȣ
   * @return
   */
  public SdatVO read(int sc_no);
  
  /**
   * �Ѱ��� ��� ��ȸ
   * <select id="sdatread" resultType="SdatVO" parameterType="int">
   * @param rno �۹�ȣ
   * @return
   */
  public SdatVO sdatread(int sd_no);
  
  /**
   * ����
   * <update id="update" parameterType="SdatVO">
   * @param sdatVO
   * @return
   */
  public int update(SdatVO sdatVO);
 
  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param sd_no
   * @return
   */
  public int delete(int sd_no);  
  
  /**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="ReplyVO">
   * @param hashMap
   * @return 1:���� 0:����
   */
  public int updateAnsnum(SdatVO sdatVO);
  
  /**
   * �亯 ���
   * <insert id="sdat" parameterType="SdatVO">
   * @param sdatVO
   * @return 1:���� 0:����
   */
  public int sdat(SdatVO sdatVO);
  
  /**
   * ��õ ���
   * @param sd_no
   * @return
   */
  public int likeup(int sd_no); 
  
  /**
   * ����õ ���
   * @param sd_no
   * @return
   */
  public int likedown(int sd_no);   
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="replycnt" parameterType="int">
   * @return
   */
  public int sdatcnt(int sc_no);
}