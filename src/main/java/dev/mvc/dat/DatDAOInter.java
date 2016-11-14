package dev.mvc.dat;

import java.util.HashMap;
import java.util.List;

public interface DatDAOInter {
  
  /**
   * 등록
   * <insert id="create" parameterType="datVO">
   * @param replyVO
   * @return
   */
  public int create(DatVO datVO);
  
  /**
   * 댓글 목록(선택목록)
   * @param gu_no
   * @return
   */
  public List<DatVO> datlist(int gu_no); 
  
  /**
   * 한건의 레코드 조회
   * <select id="read" resultType="ReplyVO" parameterType="int">
   * @param rno 글번호
   * @return
   */
  public DatVO read(int gu_no);
  
  /**
   * 한건의 댓글 조회
   * <select id="replyread" resultType="ReplyVO" parameterType="int">
   * @param rno 글번호
   * @return
   */
  public DatVO datread(int dno);
  
  /**
   * 수정
   * <update id="update" parameterType="ReplyVO">
   * @param replyVO
   * @return
   */
  public int update(DatVO datVO);
 
  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param rno
   * @return
   */
  public int delete(int dno);  
  
  /**
   * 답변 순서를 변경합니다
   * <update id='updateAnsnum' parameterType="ReplyVO">
   * @param hashMap
   * @return 1:성공 0:실패
   */
  public int updateAnsnum(DatVO datVO);
  
  /**
   * 답변 등록
   * <insert id="reply" parameterType="ReplyVO">
   * @param replyVO
   * @return 1:성공 0:실패
   */
  public int dat(DatVO datVO);
  
  /**
   * 추천 기능
   * @param rno
   * @return
   */
  public int likeup(int dno); 
  
  /**
   * 비추천 기능
   * @param rno
   * @return
   */
  public int likedown(int dno);   
  
  /**
   * 검색된 레코드 수
   * <select id="replycnt" parameterType="int">
   * @return
   */
  public int datcnt(int gu_no);
}