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
   * 수정
   * <update id="update_cnt" parameterType="MfVO">
   * @param mfVO
   * @return
   */
  public int update_cnt(int cm_no);  

  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param cm_no
   * @return
   */
  public int delete(HashMap hashmap);  
  
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
  public int updateAnsnum(MfVO mfVO);
  
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
 
  /**
   * 관련글만 불러오는 목록
   * @param cm_no
   * @return
   */
  public List<MfVO> listmenu(int cm_no);  
  
  /**
   * 본글만 불러오는 목록
   * @param cm_no
   * @return
   */
  public List<MfVO> bonlist();  
  
  /**
   * 관련글의 한건의 레코드 조회
   * <select id="read" resultType="MfVO" parameterType="int">
   * @param cm_no 글번호
   * @return
   */
  public MfVO bonread(int grpno); 
  
  /**
   * 목록의 최대값 조회
   * @param cm_no
   * @return
   */
  public int maxlist();    

  /**
   * 목록의 최소값 조회
   * @param cm_no
   * @return
   */
  public int minlist();  
  
  /**
   * 좋아요 기능
   * @param cm_no
   * @return
   */
  public int likeit(int cm_no);   
  
  /**
   * 좋아요 취소기능
   * @param cm_no
   * @return
   */
  public int likedown(int cm_no);     
}
