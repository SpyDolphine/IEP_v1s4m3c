package dev.mvc.TQNA;

import java.util.HashMap;
import java.util.List;

public interface TqnaDAOInter {
  
  public List<TqnaVO> list();
  /** 
   * 등록 <insert id="create" parameterType="TqnaVO">
   * 
   * @param tqnaVO
   * @return
   */
  public int create(TqnaVO tqnaVO);
  /**
   * 한건의 레코드 조회 <select id="read" resultType="TqnaVO" parameterType="int">
   * 
   * @param qa_no
   *          글 번호
   * @return
   */
  public TqnaVO read(int qa_no);

  /**
   * 수정처리 <update id="update" parameterType="TqnaVO">
   * 
   * @param vo
   * @return
   */
  public int update(TqnaVO vo);

  /**
   * 삭제 처리 <delete id="delete" parameterType="int">
   * 
   * @param qa_no
   * @return
   */
  public int delete(int qa_no);

 
}
