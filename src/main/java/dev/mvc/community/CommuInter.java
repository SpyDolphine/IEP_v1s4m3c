package dev.mvc.community;

import java.util.HashMap;
import java.util.List;

public interface CommuInter {
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="CommuVO">
   * @param mfVO 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(CommuVO commuVO);

  /**
   * 수정
   * <update id="update" parameterType="CommuVO">
   * @param mfVO
   * @return
   */
  public int update(CommuVO commuVO);
  
  /**
   * 수정
   * <update id="update_cnt" parameterType="CommuVO">
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
  public CommuVO read(int cm_no); 
  
  /**
   * 검색된 레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색조건
   * @return
   */
  public int countA(HashMap hashmap);  

  /**
   * 검색된 레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색조건
   * @return
   */
  public int countB(HashMap hashmap); 
  
  /**
   * 검색된 레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색조건
   * @return
   */
  public int countC(HashMap hashmap);

  /**
   * 답변 순서를 변경합니다
   * <update id='updateAnsnum' parameterType="CommuVO">
   * @param hashMap
   * @return 1:성공 0:실패
   */
  public int updateAnsnum(CommuVO commuVO);
  
  /**
   * 답변 등록
   * <insert id="reply" parameterType="CommuVO">
   * @param blogVO
   * @return 1:성공 0:실패
   */

  public int reply(CommuVO commuVO);
  
  /**
   * 답변 기능을 지원하는 목록
   * <select id="list1" resultType="CommuVO" parameterType="HashMap" >
   * @param Map 검색/페이징
   * @return 전체 목록 또는 검색 목록
   */
  public List<CommuVO> listA(HashMap<String, Object> Map);

  /**
   * 답변 기능을 지원하는 목록
   * <select id="list2" resultType="CommuVO" parameterType="HashMap" >
   * @param Map 검색/페이징
   * @return 전체 목록 또는 검색 목록
   */
  public List<CommuVO> listB(HashMap<String, Object> Map);
  
  /**
   * 답변 기능을 지원하는 목록
   * <select id="list2" resultType="CommuVO" parameterType="HashMap" >
   * @param Map 검색/페이징
   * @return 전체 목록 또는 검색 목록
   */
  public List<CommuVO> listC(HashMap<String, Object> Map);
 
  /**
   * 관련글만 불러오는 목록
   * @param cm_no
   * @return
   */
  public List<CommuVO> listmenuA(int cm_no);  

  /**
   * 관련글만 불러오는 목록
   * @param cm_no
   * @return
   */
  public List<CommuVO> listmenuB(int cm_no); 
  
  /**
   * 관련글만 불러오는 목록
   * @param cm_no
   * @return
   */
  public List<CommuVO> listmenuC(int cm_no);
 
  /**
   * 본글만 불러오는 목록
   * @param cm_no
   * @return
   */
  public List<CommuVO> bonlistA();  

  /**
   * 본글만 불러오는 목록
   * @param cm_no
   * @return
   */
  public List<CommuVO> bonlistB();
  
  /**
   * 본글만 불러오는 목록
   * @param cm_no
   * @return
   */
  public List<CommuVO> bonlistC();
  
  /**
   * 관련글의 한건의 레코드 조회
   * <select id="read" resultType="MfVO" parameterType="int">
   * @param cm_no 글번호
   * @return
   */
  public CommuVO bonread(int grpno); 
  
  /**
   * 목록의 최대값 조회
   * @param cm_no
   * @return
   */
  public int maxlistA();    
  
  /**
   * 목록의 최대값 조회
   * @param cm_no
   * @return
   */
  public int maxlistB();  
  
  /**
   * 목록의 최대값 조회
   * @param cm_no
   * @return
   */
  public int maxlistC();

  /**
   * 목록의 최소값 조회
   * @param cm_no
   * @return
   */
  public int minlistA();  
  
  /**
   * 목록의 최소값 조회
   * @param cm_no
   * @return
   */
  public int minlistB();
  
  /**
   * 목록의 최소값 조회
   * @param cm_no
   * @return
   */
  public int minlistC();
  
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
