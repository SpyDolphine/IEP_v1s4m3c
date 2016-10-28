package dev.mvc.mfree;

import java.util.HashMap;
import java.util.List;

public interface MfInter {
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="MfVO">
   * @param mfVO 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(MfVO mfVO);

  /**
   * 수정
   * <update id="update" parameterType="MfVO">
   * @param mfVO
   * @return
   */
  public int update(MfVO mfVO);

  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param cm_no
   * @return
   */
  public int delete(int cm_no);  
  
  /**
   * 한건의 레코드 조회
   * <select id="read" resultType="MfVO" parameterType="int">
   * @param cm_no 글번호
   * @return
   */
  public MfVO read(int cm_no); 
  
  /**
   * 검색된 레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색조건
   * @return
   */
  public int count(HashMap hashmap);  

  /**
   * 답변 순서를 변경합니다
   * <update id='updateAnsnum' parameterType="MfVO">
   * @param hashMap
   * @return 1:성공 0:실패
   */
  public int updateAnsnum(MfVO mgVO);
  
  /**
   * 답변 등록
   * <insert id="reply" parameterType="MfVO">
   * @param blogVO
   * @return 1:성공 0:실패
   */

  public int reply(MfVO mfVO);
  
  /**
   * 답변 기능을 지원하는 목록
   * <select id="list" resultType="MfVO" parameterType="HashMap" >
   * @param Map 검색/페이징
   * @return 전체 목록 또는 검색 목록
   */
  public List<MfVO> list(HashMap<String, Object> Map);  
}
