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

 
}
