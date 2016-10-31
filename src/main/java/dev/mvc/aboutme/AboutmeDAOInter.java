package dev.mvc.aboutme;

import java.util.HashMap;
import java.util.List;

public interface AboutmeDAOInter {
  /**
   * �׸� ���
   * <insert id="create" parameterType="aboutmeVO">
   * @param �������� �׸� ����� ��ü
   * @return ���
   */
  public int create(AboutmeVO aboutmeVO);
  
  /**
   * Ȩ������ ���� ���
   * <select id="list" resultType="aboutmeVO">
   * @return ����Ʈ
   */
  public List<AboutmeVO> list(HashMap Map);
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int count(HashMap hashmap);  
  
  /**
   * �׸� �����մϴ�.
   * <update id="update" parameterType="aboutmeVO">
   * @param aboutmeVO
   * @return ���
   */
  public int update(AboutmeVO aboutmeVO);
 
  /**
   * �׸� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param am_no ������ �׸� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int am_no);
  /**
  * �Ѱ��� ���ڵ� ��ȸ
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public AboutmeVO read(int am_no); 
  
}