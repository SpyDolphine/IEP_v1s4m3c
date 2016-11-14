package dev.mvc.reply;

import java.util.HashMap;
import java.util.List;

import dev.mvc.interviewfail.IfVO;

public interface ReplyDAOInter {
  
  /**
   * ���
   * <insert id="create" parameterType="ReplyVO">
   * @param replyVO
   * @return
   */
  public int create(ReplyVO replyVO);
  
  /**
   * ��� ���(���ø��)
   * @param cm_no
   * @return
   */
  public List<ReplyVO> replylist(int cm_no); 
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="ReplyVO" parameterType="int">
   * @param rno �۹�ȣ
   * @return
   */
  public ReplyVO read(int cm_no);
  
  /**
   * �Ѱ��� ��� ��ȸ
   * <select id="replyread" resultType="ReplyVO" parameterType="int">
   * @param rno �۹�ȣ
   * @return
   */
  public ReplyVO replyread(int rno);
  
  /**
   * ����
   * <update id="update" parameterType="ReplyVO">
   * @param replyVO
   * @return
   */
  public int update(ReplyVO replyVO);
 
  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param rno
   * @return
   */
  public int delete(int rno);  
  
  /**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="ReplyVO">
   * @param hashMap
   * @return 1:���� 0:����
   */
  public int updateAnsnum(ReplyVO replyVO);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="ReplyVO">
   * @param replyVO
   * @return 1:���� 0:����
   */
  public int reply(ReplyVO replyVO);
  
  /**
   * ��õ ���
   * @param rno
   * @return
   */
  public int likeup(int rno); 
  
  /**
   * ����õ ���
   * @param rno
   * @return
   */
  public int likedown(int rno);   
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="replycnt" parameterType="int">
   * @return
   */
  public int replycnt(int cm_no);
  
  /**
   * ���̺� �� ���
   * <select id="list" resultType="IfVO">
   * @return ���
   */
  public List<ReplyVO> populreply();     
}