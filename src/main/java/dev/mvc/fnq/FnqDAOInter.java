package dev.mvc.fnq;

import java.util.HashMap;
import java.util.List;

import dev.mvc.servey.ServeyVO;

public interface FnqDAOInter {
  /**
   * 항목 등록
   * <insert id="create" parameterType="FnqVO">
   * @param 설문조사 항목 등록할 객체
   * @return 결과
   */
  public int create(FnqVO fnqVO);
  
  /**
   * 홈페이지 질문 목록
   * <select id="list" resultType="FnqVO">
   * @return 리스트
   */
  public List<FnqVO> listh(HashMap Map);
  
  /**
   * 회사 질문 목록
   * <select id="list" resultType="FnqVO">
   * @return 리스트
   */
  public List<FnqVO> listc(HashMap Map);
  
  /**
   * 항목 수정합니다.
   * <update id="update" parameterType="FnqVO">
   * @param fnqVO
   * @return 결과
   */
  public int update(FnqVO fnqVO);
 
  /**
   * 항목 1건 삭제
   * <delete id="delete" parameterType="HashMap">
   * @param fq_no 삭제할 항목 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(HashMap hashMap);
  /**
  * 한건의 레코드 조회
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public FnqVO read(int fq_no); 
  
  /**
   * 검색된 홈페이지레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색조건
   * @return
   */
  public int countH(HashMap hashmap); 
  
  /**
   * 검색된 회사레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색조건
   * @return
   */
  public int countC(HashMap hashmap); 
}