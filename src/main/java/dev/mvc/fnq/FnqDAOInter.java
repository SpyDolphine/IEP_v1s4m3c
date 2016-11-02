package dev.mvc.fnq;

import java.util.HashMap;
import java.util.List;

import dev.mvc.servey.ServeyVO;

public interface FnqDAOInter {
  /**
   * �׸� ���
   * <insert id="create" parameterType="FnqVO">
   * @param �������� �׸� ����� ��ü
   * @return ���
   */
  public int create(FnqVO fnqVO);
  
  /**
   * Ȩ������ ���� ���
   * <select id="list" resultType="FnqVO">
   * @return ����Ʈ
   */
  public List<FnqVO> listh(HashMap Map);
  
  /**
   * ȸ�� ���� ���
   * <select id="list" resultType="FnqVO">
   * @return ����Ʈ
   */
  public List<FnqVO> listc(HashMap Map);
  
  /**
   * �׸� �����մϴ�.
   * <update id="update" parameterType="FnqVO">
   * @param fnqVO
   * @return ���
   */
  public int update(FnqVO fnqVO);
 
  /**
   * �׸� 1�� ����
   * <delete id="delete" parameterType="HashMap">
   * @param fq_no ������ �׸� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(HashMap hashMap);
  /**
  * �Ѱ��� ���ڵ� ��ȸ
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public FnqVO read(int fq_no); 
  
  /**
   * �˻��� Ȩ���������ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int countH(HashMap hashmap); 
  
  /**
   * �˻��� ȸ�緹�ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int countC(HashMap hashmap); 
}