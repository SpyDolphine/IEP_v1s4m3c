package dev.mvc.servey;

import java.util.List;

import dev.mvc.category.CategoryVO;

public interface ServeyDAOInter {
  /**
   * �׸� ���
   * <insert id="create" parameterType="ServeyVO">
   * @param �������� �׸� ����� ��ü
   * @return ���
   */
  public int create(ServeyVO serveyVO);
  
  /**
   * ��ü ���
   * <select id="list" resultType="ServeyVO">
   * @return �������� �׸�
   */
  public List<ServeyVO> list(int sb_no);
  
  /**
  * �Ѱ��� ���ڵ� ��ȸ
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public ServeyVO read(int serveyno);
  
  /**
   * �������� �׸� ����
   * <select id="sum" resultType="ServeyVO" parameterType="int">
   * @param sb_no �հ踦 ���� �Խ��� ��ȣ
   * @return ����
   */
  public int sum(int sb_no);
  
  /**
   * �׸� �����մϴ�.
   * <update id="update" parameterType="ServeyVO"> 
   * @param serveyVO
   * @return ���
   */
  public int update(ServeyVO serveyVO);
 
  /**
   * �׸� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param serveyno ������ �׸� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int serveyno); 
  
  /**
   * ������� �����մϴ�.
   * <update id="percent" parameterType="ServeyVO"> 
   * @param serveyVO
   * @return ���
   */
  public int persent(ServeyVO serveyVO);
  
  /**
   * ��ǥ�� �ݿ��մϴ�
   * <update id="vote" parameterType="ServeyVO"> 
   * @param serveyVO
   * @return ���
   */
  public int vote(int serveyno);
  
}