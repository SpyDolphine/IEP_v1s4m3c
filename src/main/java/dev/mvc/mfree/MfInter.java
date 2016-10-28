package dev.mvc.mfree;

import java.util.HashMap;
import java.util.List;

public interface MfInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="MfVO">
   * @param mfVO ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(MfVO mfVO);

  /**
   * ����
   * <update id="update" parameterType="MfVO">
   * @param mfVO
   * @return
   */
  public int update(MfVO mfVO);

  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param cm_no
   * @return
   */
  public int delete(int cm_no);  
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="MfVO" parameterType="int">
   * @param cm_no �۹�ȣ
   * @return
   */
  public MfVO read(int cm_no); 
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int count(HashMap hashmap);  

  /**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="MfVO">
   * @param hashMap
   * @return 1:���� 0:����
   */
  public int updateAnsnum(MfVO mgVO);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="MfVO">
   * @param blogVO
   * @return 1:���� 0:����
   */

  public int reply(MfVO mfVO);
  
  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list" resultType="MfVO" parameterType="HashMap" >
   * @param Map �˻�/����¡
   * @return ��ü ��� �Ǵ� �˻� ���
   */
  public List<MfVO> list(HashMap<String, Object> Map);  
}
