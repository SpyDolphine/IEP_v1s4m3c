package dev.mvc.reply;

import java.util.HashMap;
import java.util.List;

import dev.mvc.interviewfail.IfVO;

public interface ReplyDAOInter {
  
  /**
   * 등록
   * <insert id="create" parameterType="ReplyVO">
   * @param replyVO
   * @return
   */
  public int create(ReplyVO replyVO);
  
  /**
   * 댓글 목록(선택목록)
   * @param cm_no
   * @return
   */
  public List<ReplyVO> replylist(int cm_no); 
  
  /**
   * 한건의 레코드 조회
   * <select id="read" resultType="ReplyVO" parameterType="int">
   * @param rno 글번호
   * @return
   */
  public ReplyVO read(int cm_no);
  
  /**
   * 한건의 댓글 조회
   * <select id="replyread" resultType="ReplyVO" parameterType="int">
   * @param rno 글번호
   * @return
   */
  public ReplyVO replyread(int rno);
  
  /**
   * 수정
   * <update id="update" parameterType="ReplyVO">
   * @param replyVO
   * @return
   */
  public int update(ReplyVO replyVO);
 
  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param rno
   * @return
   */
  public int delete(int rno);  
  
  /**
   * 답변 순서를 변경합니다
   * <update id='updateAnsnum' parameterType="ReplyVO">
   * @param hashMap
   * @return 1:성공 0:실패
   */
  public int updateAnsnum(ReplyVO replyVO);
  
  /**
   * 답변 등록
   * <insert id="reply" parameterType="ReplyVO">
   * @param replyVO
   * @return 1:성공 0:실패
   */
  public int reply(ReplyVO replyVO);
  
  /**
   * 추천 기능
   * @param rno
   * @return
   */
  public int likeup(int rno); 
  
  /**
   * 비추천 기능
   * @param rno
   * @return
   */
  public int likedown(int rno);   
  
  /**
   * 검색된 레코드 수
   * <select id="replycnt" parameterType="int">
   * @return
   */
  public int replycnt(int cm_no);
  
  /**
   * 많이본 글 목록
   * <select id="list" resultType="IfVO">
   * @return 목록
   */
  public List<ReplyVO> populreply();     
}