package dev.mvc.gfree;

import java.util.HashMap;
import java.util.List;

public interface GfreeInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="gfreeVO">
   * @param gfreeVO ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(GfreeVO gfreeVO);

  /**
   * ����
   * <update id="update" parameterType="gfreeVO">
   * @param gfreeVO
   * @return
   */
  public int update(GfreeVO gfreeVO);
  
  /**
   * ����
   * <update id="update_cnt" parameterType="gfreeVO">
   * @param gfreeVO
   * @return
   */
  public int update_cnt(int cm_no);  

  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param cm_no
   * @return
   */
  public int delete(int cm_no);  
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="gfreeVO" parameterType="int">
   * @param cm_no �۹�ȣ
   * @return
   */
  public GfreeVO read(int cm_no); 
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int count(HashMap hashmap);  

  /**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="gfreeVO">
   * @param hashMap
   * @return 1:���� 0:����
   */
  public int updateAnsnum(GfreeVO gfreeVO);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="gfreeVO">
   * @param GfreeVO
   * @return 1:���� 0:����
   */

  public int reply(GfreeVO gfreeVO);
  
  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list" resultType="MfVO" parameterType="HashMap" >
   * @param Map �˻�/����¡
   * @return ��ü ��� �Ǵ� �˻� ���
   */
  public List<GfreeVO> list(HashMap<String, Object> Map);
 
  /**
   * ���ñ۸� �ҷ����� ���
   * @param cm_no
   * @return
   */
  public List<GfreeVO> listmenu(int cm_no);  
  
  /**
   * ���۸� �ҷ����� ���
   * @param cm_no
   * @return
   */
  public List<GfreeVO> bonlist();  
  
  /**
   * ���ñ��� �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="gfreeVO" parameterType="int">
   * @param cm_no �۹�ȣ
   * @return
   */
  public GfreeVO bonread(int grpno); 
  
  /**
   * ����� �ִ밪 ��ȸ
   * @param cm_no
   * @return
   */
  public int maxlist();    

  /**
   * ����� �ּҰ� ��ȸ
   * @param cm_no
   * @return
   */
  public int minlist();  
  
}
