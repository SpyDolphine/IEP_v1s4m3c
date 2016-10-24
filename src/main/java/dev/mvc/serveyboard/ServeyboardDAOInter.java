package dev.mvc.serveyboard;

import java.util.List;

import dev.mvc.category.CategoryVO;

public interface ServeyboardDAOInter {
  /**
   * �׸� ���
   * <insert id="create" parameterType="ServeyboardVO">
   * @param �������� �׸� ����� ��ü
   * @return ���
   */
  public int create(ServeyboardVO ServeyboardVO);
  
  /**
   * ��ü ���
   * <select id="list" resultType="ServeyboardVO">
   * @return ��������
   */
  public List<ServeyboardVO> list();
  
  /**
  * �Ѱ��� ���ڵ� ��ȸ
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public ServeyboardVO read(int sb_no);
  
  /**
   * �׸� �����մϴ�.
   * <update id="update" parameterType="ServeyboardVO"> 
   * @param ServeyboardVO
   * @return ���
   */
  public int update(ServeyboardVO ServeyboardVO);
 
  /**
   * �׸� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param serveyno ������ �׸� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int serveyno); 
  
}