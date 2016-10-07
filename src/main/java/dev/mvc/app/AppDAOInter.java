package dev.mvc.app;

import java.util.List;

import dev.mvc.app.AppVO; 

  
public interface AppDAOInter {
 
  /** 
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="AppVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(AppVO vo);
  
  
  /**
   * ȸ�� ��ü ���
   * <select id="list" resultType="AppVO">
   * @return ȸ�� ���
   */ 
  public List<AppVO> list();
  
  /**
   * App�� �����մϴ�.
   * <update id="update" parameterType="AppVO"> 
   * @param appVO
   * @return ������ ���ڵ� ����
   */
  public int update(AppVO vo);
  
  /**
   * ���ڵ� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param codeno ������ code ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int ap_no); 
}