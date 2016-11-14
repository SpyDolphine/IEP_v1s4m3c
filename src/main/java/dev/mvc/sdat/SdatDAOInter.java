package dev.mvc.sdat;

import java.util.HashMap;
import java.util.List;

public interface SdatDAOInter {
  
  /**
   * 등록
   * <insert id="create" parameterType="sdatVO">
   * @param sdatVO
   * @return
   */
  public int create(SdatVO sdatVO);
  
  /**
   * 댓글 목록(선택목록)
   * @param sc_no
   * @return
   */
  public List<SdatVO> sdatlist(int sc_no); 
  
  /**
   * 한건의 레코드 조회
   * <select id="read" resultType="ReplyVO" parameterType="int">
   * @param rno 글번호
   * @return
   */
  public SdatVO read(int sc_no);
  
  /**
   * 한건의 댓글 조회
   * <select id="sdatread" resultType="SdatVO" parameterType="int">
   * @param rno 글번호
   * @return
   */
  public SdatVO sdatread(int sd_no);
  
  /**
   * 수정
   * <update id="update" parameterType="SdatVO">
   * @param sdatVO
   * @return
   */
  public int update(SdatVO sdatVO);
 
  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param sd_no
   * @return
   */
  public int delete(int sd_no);  
  
  /**
   * 답변 순서를 변경합니다
   * <update id='updateAnsnum' parameterType="ReplyVO">
   * @param hashMap
   * @return 1:성공 0:실패
   */
  public int updateAnsnum(SdatVO sdatVO);
  
  /**
   * 답변 등록
   * <insert id="sdat" parameterType="SdatVO">
   * @param sdatVO
   * @return 1:성공 0:실패
   */
  public int sdat(SdatVO sdatVO);
  
  /**
   * 추천 기능
   * @param sd_no
   * @return
   */
  public int likeup(int sd_no); 
  
  /**
   * 비추천 기능
   * @param sd_no
   * @return
   */
  public int likedown(int sd_no);   
  
  /**
   * 검색된 레코드 수
   * <select id="replycnt" parameterType="int">
   * @return
   */
  public int sdatcnt(int sc_no);
}