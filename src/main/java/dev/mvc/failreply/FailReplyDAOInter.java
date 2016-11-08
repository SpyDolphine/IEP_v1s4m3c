package dev.mvc.failreply;

import java.util.HashMap;
import java.util.List;

public interface FailReplyDAOInter {
  
  /**
   * ���
   * <insert id="create" parameterType="FailReplyVO">
   * @param failreplyVO
   * @return
   */
  public int create(FailReplyVO failreplyVO);
  
  /**
   * ��� ���(���ø��)
   * @param if_no
   * @return
   */
  public List<FailReplyVO> replylist(int if_no); 
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="FailReplyVO" parameterType="int">
   * @param rno �۹�ȣ
   * @return
   */
  public FailReplyVO read(int if_no);
  
  /**
   * �Ѱ��� ��� ��ȸ
   * <select id="replyread" resultType="FailReplyVO" parameterType="int">
   * @param rno �۹�ȣ
   * @return
   */
  public FailReplyVO replyread(int rno);
  
  /**
   * ����
   * <update id="update" parameterType="FailReplyVO">
   * @param failreplyVO
   * @return
   */
  public int update(FailReplyVO failreplyVO);
 
  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param rno
   * @return
   */
  public int delete(int rno);  
  
  /**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="FailReplyVO">
   * @param hashMap
   * @return 1:���� 0:����
   */
  public int updateAnsnum(FailReplyVO failreplyVO);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="FailReplyVO">
   * @param replyVO
   * @return 1:���� 0:����
   */
  public int reply(FailReplyVO failreplyVO);
  
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
   * <select id="replycnt" resultType="FailReplyVO" parameterType="int">
   * @return if_no
   */
  public int replycnt(int if_no);
}