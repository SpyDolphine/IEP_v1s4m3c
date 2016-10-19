package dev.mvc.division;

import java.util.List;

public interface DivisionDAOInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="DivisionVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(DivisionVO divisionVO);
  
  /**
   * Category, Division ���̺��� ���캰�� �з��Ͽ� �����ɴϴ�.
   * <select id="category_division_list" resultType="Category_Division_VO"> 
   * @return
   */
  public List<Category_Division_VO> category_division_list();
  
  /**
  Ư�� ��з��� ���ڵ� ������ ����
  <select id="countByCategory" resultType="int" parameterType="int">
   * @param codeno ��з� �ڵ�
   * @return
   */
  public int countByCategory(int categoryno);
  
  /**
   ��� ����
   <select id="list" resultType="Category_Division_VO">
   * @return
   */
  public List list();
  
  /**
   * ��ȸ
   * <select id="read" resultType="DivisionVO" parameterType="int"> 
   * @param divisionno
   * @return
   */
  public DivisionVO read(int divisionno);
  
  /**
   * ���� ó��
   * <update id="update" parameterType="DivisionVO">
   * @param vo
   * @return
   */
  public int update(DivisionVO divisionVO);
  
  /**
   * ���ڵ� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param divisionno ������ ȸ�� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int divisionno); 
  
  /**
   * �Ѱ��� ���ڵ��� �켱 ������ �����Դϴ�.
   * <update id="up" parameterType="DivisionVO">
   * @param DivisionVO
   * @return ����� ���ڵ� ����
   */
  public int up(DivisionVO divisionVO);
 
  /**
   * �Ѱ��� ���ڵ��� �켱 ������ ����ϴ�.
   * <update id="down" parameterType="DivisionVO">
   * @param DivisionVO
   * @return ����� ���ڵ� ����
   */
  public int down(DivisionVO divisionVO);
  
  /**
   * ��ϵ� �ۼ��� ����
   * <update id="increaseCnt" parameterType="int">
   * @param divisionno
   * @return
   */
  public int increaseCnt(int divisionno);
  
  /**
   * ��ϵ� �ۼ��� ����
   * <update id="decreaseCnt" parameterType="int">
   * @param divisionno
   * @return
   */
  public int decreaseCnt(int divisionno);
  
  
}