package dev.mvc.enterprise_info;

import java.util.HashMap;
import java.util.List;

public interface EnterpriseInformationDAOInter {
  
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="EnterpriseInformationVO">
   * @param eiVO ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(EnterpriseInformationVO eiVO);
  
  /**
   * ��� ���� ��ü ���
   * <select id="list" resultType="EnterpriseInformationVO">
   * @return ��� ���� ���
   */
  public List<EnterpriseInformationVO> list();
  
  /**
   * ������� ����
   * <select id="read" resultType="EnterpriseInformationVO" parameterType="int">
   */
  public EnterpriseInformationVO read(int ei_no); 
  
  /**
   * ������� ���� ����
   * <select id="update" resultType="EnterpriseInformationVO" parameterType="int">
   */
  public EnterpriseInformationVO update(int ei_no); 
  
  /**
   * ������� ����
   * <update id="update" parameterType="EnterpriseInformationVO">
   */
  public int update(EnterpriseInformationVO eiVO);
  
  /**
   * ���ڵ� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param ei_no ������ ������� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int ei_no);

  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻� ����
   * @return
   */
  // <select id="count" resultType="int" parameterType="HashMap" >
  public int count(HashMap hashMap);
  
  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list5" resultType="BlogVO" parameterType="HashMap" >
   * <select id="list4" resultType="BlogVO" parameterType="HashMap" >
   * @param map �˻�/����¡
   * @return ��ü��� �Ǵ� �˻� ���
   */
//  public List<BlogVO> list4(HashMap hashMap);
  public List<EnterpriseInformationVO> list4(HashMap<String, Object> hashMap);
  
  
  

}
