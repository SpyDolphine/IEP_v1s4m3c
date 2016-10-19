package dev.mvc.category;

import java.util.List;

public interface CategoryDAOInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="CategoryVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(CategoryVO categoryVO);
  
  /**
   * ��ü ���
   * <select id="list" resultType="CategoryVO">
   * @return ȸ�� ���
   */
  public List<CategoryVO> list();
  
  /**
  * �Ѱ��� ���ڵ� ��ȸ
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public CategoryVO read(int categoryno);
  
  /**
   * Category�� �����մϴ�.
   * <update id="update" parameterType="categoryVO"> 
   * @param categoryVO
   * @return ������ ���ڵ� ����
   */
  public int update(CategoryVO categoryVO);
 
  /**
   * ���ڵ� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param categoryno ������ ȸ�� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int categoryno); 
  
}