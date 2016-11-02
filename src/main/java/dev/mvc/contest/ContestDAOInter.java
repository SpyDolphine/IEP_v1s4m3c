package dev.mvc.contest;

import java.util.List;

public interface ContestDAOInter {
/**
 * ������ ��� �κ�
 * <insert id="create" parameterType="ContestVO">
 */
   public int create(ContestVO contestVO);
   /**
    * �Խ��� �� ��ü ����Դϴ�.
    * <select id="list" resultType="ContestVO">
    * @return
    */
   public List<ContestVO> list(); 
  /**
   *  <select id="read" resultType="ContestVO" parameterType="int">
   *  �Խ��� �� ��ȸ
   */
   public ContestVO read(int ct_no);
   /**
    *   <update id="update" parameterType="ContestVO">
    *   �Խ��� �� ����(���θ�)
    */
   public int update(ContestVO contestVO);
   /**
    * <!-- ������ ���� ���� -->
  <delete id="delete"  parameterType="int">
    */
   public int delete(int ct_no);
}
