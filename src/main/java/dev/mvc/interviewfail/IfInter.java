package dev.mvc.interviewfail;

import java.util.List;

public interface IfInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="IfVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(IfVO ifvo);
  
  /**
   * ��ü ���
   * <select id="list" resultType="IfVO">
   * @return ���
   */
  public List<IfVO> list(); 
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="IfVO" parameterType="int">
   * @param if_no �۹�ȣ
   * @return
   */
  public IfVO read(int if_no);  
  
  /**
   * ����
   * <update id="update" parameterType="IfVO">
   * @param ifVO
   * @return
   */
  public int update(IfVO ifVO);
  
  /**
   * �����ȸ��
   * @param if_no
   * @return
   */
  public int update_cnt(int if_no);    

  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param if_no
   * @return
   */
  public int delete(int if_no);  
  
  /**
   * ���̺� �� ���
   * <select id="list" resultType="IfVO">
   * @return ���
   */
  public List<IfVO> manylist();   
}