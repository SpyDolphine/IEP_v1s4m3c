package dev.mvc.TQNA;

import java.util.HashMap;
import java.util.List;

public interface TqnaDAOInter {
  
  public List<TqnaVO> list();
  /** 
   * ��� <insert id="create" parameterType="TqnaVO">
   * 
   * @param tqnaVO
   * @return
   */
  public int create(TqnaVO tqnaVO);
  /**
   * �Ѱ��� ���ڵ� ��ȸ <select id="read" resultType="TqnaVO" parameterType="int">
   * 
   * @param qa_no
   *          �� ��ȣ
   * @return
   */
  public TqnaVO read(int qa_no);

  /**
   * ����ó�� <update id="update" parameterType="TqnaVO">
   * 
   * @param vo
   * @return
   */
  public int update(TqnaVO vo);

  /**
   * ���� ó�� <delete id="delete" parameterType="int">
   * 
   * @param qa_no
   * @return
   */
  public int delete(int qa_no);

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
   * <update id='updateAnsnum' parameterType="TqnaVO">
   * @param vo
   * @return 1: ����, 0: ����
   */
  public int updateAnsnum(TqnaVO vo);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="TqnaVO"> 
   * @param vo
   * @return 1: ����, 0: ����
   */
  public int reply(TqnaVO vo);
  
  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list1" resultType="TqnaVO" parameterType="HashMap" > 
   * @param map �˻�/����¡
   * @return ��ü��� �Ǵ� �˻� ���
   */
  public List<TqnaVO> list1(HashMap<String, Object> map);
 
}
