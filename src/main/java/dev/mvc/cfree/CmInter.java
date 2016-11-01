package dev.mvc.cfree;

import java.util.HashMap;
import java.util.List;

public interface CmInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="CmVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(CmVO cmVO);

  /**
   * ����
   * <update id="update" parameterType="CmVO">
   * @param cmVO
   * @return
   */
  public int update(CmVO cmVO);

  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param cm_no
   * @return
   */
  public int delete(int cm_no);  
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="CmVO" parameterType="int">
   * @param cm_no �۹�ȣ
   * @return
   */
  public CmVO read(int cm_no); 
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int count(HashMap hashmap);  
  
  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list2" resultType="CmVO" parameterType="HashMap" >
   * @param Map �˻�/����¡
   * @return ��ü ��� �Ǵ� �˻� ���
   */
  public List<CmVO> list(HashMap Map);

  /**
   * ���ƿ� 
   * <update id="likeup" parameterType="CmVO">
   * @param gfreeVO
   * @return
   */
  public int likeup(int cm_no); 
  
  /**
   * ���ƿ� 
   * <update id="likedown" parameterType="CmVO">
   * @param gfreeVO
   * @return
   */
  public int likedown(CmVO cmVO); 
  
  /**
   * ���ƿ� 
   * <update id="heartup" parameterType="CmVO">
   * @param gfreeVO
   * @return
   */
  public int heart(CmVO cmVO); 
  
}
