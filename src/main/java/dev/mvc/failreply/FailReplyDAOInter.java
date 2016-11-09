package dev.mvc.failreply;

import java.util.HashMap;
import java.util.List;

public interface FailReplyDAOInter {
  
  /**
   * 등록
   * <insert id="create" parameterType="FailReplyVO">
   * @param failreplyVO
   * @return
   */
  public int create(FailReplyVO failreplyVO);
  
  /**
   * 댓글 목록(선택목록)
   * @param if_no
   * @return
   */
  public List<FailReplyVO> replylist(int if_no); 
  
  /**
   * 한건의 레코드 조회
   * <select id="read" resultType="FailReplyVO" parameterType="int">
   * @param rno 글번호
   * @return
   */
  public FailReplyVO read(int if_no);
  
  /**
   * 한건의 댓글 조회
   * <select id="replyread" resultType="FailReplyVO" parameterType="int">
   * @param rno 글번호
   * @return
   */
  public FailReplyVO replyread(int rno);
  
  /**
   * 수정
   * <update id="update" parameterType="FailReplyVO">
   * @param failreplyVO
   * @return
   */
  public int update(FailReplyVO failreplyVO);
 
  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param rno
   * @return
   */
  public int delete(int rno);  
  
  /**
   * 답변 순서를 변경합니다
   * <update id='updateAnsnum' parameterType="FailReplyVO">
   * @param hashMap
   * @return 1:성공 0:실패
   */
  public int updateAnsnum(FailReplyVO failreplyVO);
  
  /**
   * 답변 등록
   * <insert id="reply" parameterType="FailReplyVO">
   * @param replyVO
   * @return 1:성공 0:실패
   */
  public int reply(FailReplyVO failreplyVO);
  
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
   * <select id="replycnt" resultType="FailReplyVO" parameterType="int">
   * @return if_no
   */
  public int replycnt(int if_no);
}