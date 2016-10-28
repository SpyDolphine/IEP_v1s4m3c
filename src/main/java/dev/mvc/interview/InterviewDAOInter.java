package dev.mvc.interview;

import java.util.List;

public interface InterviewDAOInter {
  /**
   * �׸� ���
   * <insert id="create" parameterType="InterviewVO">
   * @param �������� �׸� ����� ��ü
   * @return ���
   */
  public int create(InterviewVO interviewVO);
  
  /**
   * Ȩ������ ���� ���
   * <select id="list" resultType="InterviewVO">
   * @return ����Ʈ
   */
  public List<InterviewVO> list();

  /**
   * �׸� �����մϴ�.
   * <update id="update" parameterType="InterviewVO">
   * @param aboutmeVO
   * @return ���
   */
  public int update(InterviewVO interviewVO);
 
  /**
   * �׸� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param iv_no ������ �׸� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int iv_no);
  /**
  * �Ѱ��� ���ڵ� ��ȸ
  * <select id="read" resultType="InterviewVO">
  * @param blogno
  * @return
  */
  public InterviewVO read(int iv_no); 
  
}