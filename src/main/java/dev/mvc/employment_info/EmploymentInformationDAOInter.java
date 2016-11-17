package dev.mvc.employment_info;

import java.util.HashMap;
import java.util.List;

import dev.mvc.enterprise_info.EnterpriseInformationVO;

public interface EmploymentInformationDAOInter {

  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="EmploymentInformationVO">
   * @param emVO ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(EmploymentInformationVO emVO);
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻� ����
   * @return
   */
  // <select id="count" resultType="int" parameterType="HashMap" >
  public int count(HashMap hashMap);
  
  /**
   * �亯�� �����ϴ� ���
   * <select id="list5" resultType="EmploymentInformationVO" parameterType="HashMap" >
   * <select id="list4" resultType="EmploymentInformationVO" parameterType="HashMap" >
   * @param map �˻�/����¡
   * @return ��ü��� �Ǵ� �˻� ���
   */
//  public List<BlogVO> list4(HashMap hashMap);
  public List<EmploymentInformationVO> list4(HashMap<String, Object> hashMap);
  
  /**
   * ä������ ����
   * <select id="read" resultType="EmploymentInformationVO" parameterType="int">
   */
  // public EmploymentInformationVO read(int em_no); 
  public EmploymentInformationVO read(int em_no);
  
  /**
   * ä������ ����
   * <update id="update" parameterType="EmploymentInformationVO">
   */
  public int update(EmploymentInformationVO emVO);
  
  /**
   * ���ڵ� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param em_no ������ ������� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int em_no);
 
}
