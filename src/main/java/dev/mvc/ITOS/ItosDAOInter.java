package dev.mvc.ITOS;

import java.util.HashMap;
import java.util.List;

public interface ItosDAOInter {
  
  public List<ItosVO> list();
  /** 
   * ��� <insert id="create" parameterType="ItosVO">
   * 
   * @param itosVO
   * @return
   */
  public int create(ItosVO itosVO);
  /**
   * �Ѱ��� ���ڵ� ��ȸ <select id="read" resultType="ItosVO" parameterType="int">
   * 
   * @param io_no
   *          �� ��ȣ
   * @return
   */
  public ItosVO read(int io_no);

  /**
   * ����ó�� <update id="update" parameterType="ItosVO">
   * 
   * @param vo
   * @return
   */
  public int update(ItosVO vo);

  /**
   * ���� ó�� <delete id="delete" parameterType="int">
   * 
   * @param io_no
   * @return
   */
  public int delete(int io_no);

  /**
   * �˻��� ���ڵ� �� <select id="count" resultType="int" parameterType="HashMap" >
   * 
   * @param hashmap
   *          �˻� ����
   * @return
   */ 
  public int count(HashMap hashmap);

  /**
   * �亯 ������ �����մϴ�.
   * <update id='updateAnsnum' parameterType="ItosVO">
   * @param vo
   * @return 1: ����, 0: ����
   */
  public int updateAnsnum(ItosVO vo);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="ItosVO"> 
   * @param vo
   * @return 1: ����, 0: ����
   */
  public int reply(ItosVO vo);
  
  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list1" resultType="ItosVO" parameterType="HashMap" > 
   * @param map �˻�/����¡
   * @return ��ü��� �Ǵ� �˻� ���
   */
  public List<ItosVO> list1(HashMap map);
  

}
