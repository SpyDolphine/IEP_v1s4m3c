package dev.mvc.tip;

import java.util.HashMap;
import java.util.List;

import dev.mvc.servey.ServeyVO;

public interface TipDAOInter {
  /**
   * �׸� ���
   * <insert id="create" parameterType="tipVO">
   * @param �������� �׸� ����� ��ü
   * @return ���
   */
  public int create(TipVO tipVO);
  
  /**
   * Ȩ������ ���� ���
   * <select id="list" resultType="tipVO">
   * @return ����Ʈ
   */
  public List<TipVO> list(HashMap Map);

  /**
   * �׸� �����մϴ�.
   * <update id="update" parameterType="tipVO">
   * @param tipVO
   * @return ���
   */
  public int update(TipVO tipVO);
 
  /**
   * �׸� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param tp_no ������ �׸� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int tp_no);
  /**
  * �Ѱ��� ���ڵ� ��ȸ
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param tp_no
  * @return
  */
  public TipVO read(int tp_no);

  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int count(HashMap hashmap); 
  
}