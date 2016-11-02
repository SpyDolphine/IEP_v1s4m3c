package dev.mvc.seico;

import java.util.HashMap;
import java.util.List;

import dev.mvc.seico.SeicoVO;

public interface SeicoDAOInter {
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="SeicoVO2">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(SeicoVO seicoVO);
  
  /**
   * 전체 목록
   * <select id="list" resultType="SeicoVO2">
   * @return 목록
   */
  public List<SeicoVO> list(); 
  
  /**
   * 한건의 레코드 조회
   * <select id="read" resultType="SeicoVO2" parameterType="int">
   * @param sc_no 글번호
   * @return
   */
  public SeicoVO read(int sc_no);  
  
  /**
   * 수정
   * <update id="update" parameterType="SeicoVO2">
   * @param SeicoVO
   * @return
   */
  public int update(SeicoVO seicoVO);

  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param sc_no
   * @return
   */
  public int delete(int sc_no);  
  
  /**
   * 조회수 증가
   * <update id='cntup' parameterType="int">
   * @param SeicoVO
   * @return
   */
  public int cntup(int sc_no);
  
  /**
   * 
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap
   * @return
   */
  public int count(HashMap hashMap);

  
  public List<SeicoVO> list(HashMap<String, Object> Map);

}