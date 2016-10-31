package dev.mvc.ifree;

import java.util.HashMap;
import java.util.List;

public interface IfreeInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="IfreeVO">
   * @param ifreeVO ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(IfreeVO ifreeVO);

  /**
   * ����
   * <update id="update" parameterType="IfreeVO">
   * @param ifreeVO
   * @return
   */
  public int update(IfreeVO ifreeVO);
  
  /**
   * ����
   * <update id="update_cnt" parameterType="IfreeVO">
   * @param ifreeVO
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
   * <select id="read" resultType="IfreeVO" parameterType="int">
   * @param cm_no �۹�ȣ
   * @return
   */
  public IfreeVO read(int cm_no); 
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int count(HashMap hashmap);  

  /**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="IfreeVO">
   * @param hashMap
   * @return 1:���� 0:����
   */
  public int updateAnsnum(IfreeVO ifreeVO);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="IfreeVO">
   * @param GfreeVO
   * @return 1:���� 0:����
   */

  public int reply(IfreeVO ifreeVO);
  
  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list" resultType="MfVO" parameterType="HashMap" >
   * @param Map �˻�/����¡
   * @return ��ü ��� �Ǵ� �˻� ���
   */
  public List<IfreeVO> list(HashMap<String, Object> Map);
 
  /**
   * ���ñ۸� �ҷ����� ���
   * @param cm_no
   * @return
   */
  public List<IfreeVO> listmenu(int cm_no);  
  
  /**
   * ���۸� �ҷ����� ���
   * @param cm_no
   * @return
   */
  public List<IfreeVO> bonlist();  
  
  /**
   * ���ñ��� �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="IfreeVO" parameterType="int">
   * @param cm_no �۹�ȣ
   * @return
   */
  public IfreeVO bonread(int grpno); 
  
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
