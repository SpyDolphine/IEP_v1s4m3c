package dev.mvc.board;

import java.util.HashMap;
import java.util.List;

public interface BoardDAOInter {
  
  // <insert id="create" parameterType="BoardVO">
  public int create(BoardVO boardVO);
  
  // <select id="list" resultType="BoardVO">
  public List<BoardVO> list(); 
  
  /**
   * blogcategoryno�� ���� ���
   * <select id="list_by_divisionno" resultType="BoardVO" parameterType="int">
   * @param blogcategoryno
   * @return
   */
  public List<BoardVO> list_by_divisionno(int divisionno);
  
  /**
  * �Ѱ��� ���ڵ� ��ȸ
  * <select id="read" resultType="BoardVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public BoardVO read(int boardno);
  
  /**
   * �Ѱ��� ���ڵ� ����
   * <update id="update" parameterType="BoardVO">
   * @param BoardVO
   * @return
   */
  public int update(BoardVO boardVO);
  
  /**
   * �Ѱ��� ���ڵ� ����
   * <delete id="delete" parameterType="int">
   * @param blogno
   * @return
   */
  public int delete(int boardno);
  
  /**
   * �˻����
   * <select id="list2" resultType="BoardVO" parameterType="HashMap" >
   * @param hashMap
   * @return
   */
  public List<BoardVO> list2(HashMap hashMap);
  
  /**
   * 
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap
   * @return
   */
  public int count(HashMap hashMap);
  
  /**
   * �˻����
   * <select id="list3" resultType="BoardVO" parameterType="HashMap" >
   * @param hashMap
   * @return
   */
  public List<BoardVO> list3(HashMap hashMap);
  
  /**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="BoardVO">
   * @param hashMap
   * @return 1:���� 0:����
   */
  public int updateAnsnum(BoardVO boardVO);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="BoardVO">
   * @param BoardVO
   * @return 1:���� 0:����
   */

  public int reply(BoardVO BoardVO);
  
  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list4" resultType="BoardVO" parameterType="HashMap" >
   * @param Map �˻�/����¡
   * @return ��ü ��� �Ǵ� �˻� ���
   */
  public List<BoardVO> list4(HashMap<String, Object> Map);
}