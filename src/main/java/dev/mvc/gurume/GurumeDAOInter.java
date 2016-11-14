package dev.mvc.gurume;

import java.util.*;

import dev.mvc.gurume.GurumeVO;

public interface GurumeDAOInter {

  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="GurumeVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(GurumeVO gurumeVO);
  

  /**
   * ��ü ���
   * <select id="list" resultType="GurumeVO">
   * @return ȸ�� ���
   */
  public List<GurumeVO> list();
  
  /**
   *  �����մϴ�.
   * <update id="update" parameterType="GurumeVO"> 
   * @param gurumeVO
   * @return ������ ���ڵ� ����
   */
  
  public GurumeVO read(int gu_no);
  
  public int update(GurumeVO gurumeVO);
  
  /**
   * ���ڵ� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param mno ������ ȸ�� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int gu_no);


  public int cntup(int gu_no); 
  
  public List<GurumeVO> list4(HashMap Map);
  
  public int count(HashMap hashMap);
  /**
   * �Ѱ��� ���ڵ��� �켱 ������ �����Դϴ�.
   * <update id="up" parameterType="CodeVO">
   * @param GurumeVO
   * @return ����� ���ڵ� ����
   *//*
  public int up(GurumeVO vo);
 
  *//**
   * �Ѱ��� ���ڵ��� �켱 ������ ����ϴ�.
   * <update id="down" parameterType="CodeVO">
   * @param GurumeVO
   * @return ����� ���ڵ� ����
   *//*
  public int down(GurumeVO vo);
 */
}