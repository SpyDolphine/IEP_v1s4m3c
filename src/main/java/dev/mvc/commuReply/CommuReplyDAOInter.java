package dev.mvc.commuReply;

import java.util.HashMap;
import java.util.List;

public interface CommuReplyDAOInter {
  
  /**
   * ���
   * <insert id="create" parameterType="CommuReplyVO">
   * @param commuReplyVO
   * @return
   */
  public int create(CommuReplyVO commuReplyVO);
  
  /**
   * ��� ���(���ø��)
   * @param cm_no
   * @return
   */
  public List<CommuReplyVO> replylist(int cm_no); 
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="CommuReplyVO" parameterType="int">
   * @param rno �۹�ȣ
   * @return
   */
  public CommuReplyVO read(int cm_no);
  
  /**
   * �Ѱ��� ��� ��ȸ
   * <select id="replyread" resultType="CommuReplyVO" parameterType="int">
   * @param rno �۹�ȣ
   * @return
   */
  public CommuReplyVO replyread(int rno);
  
  /**
   * ����
   * <update id="update" parameterType="CommuReplyVO">
   * @param commuReplyVO
   * @return
   */
  public int update(CommuReplyVO commuReplyVO);
 
  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param rno
   * @return
   */
  public int delete(int rno);  
  
  /**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="CommuReplyVO">
   * @param hashMap
   * @return 1:���� 0:����
   */
  public int updateAnsnum(CommuReplyVO commuReplyVO);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="CommuReplyVO">
   * @param replyVO
   * @return 1:���� 0:����
   */
  public int reply(CommuReplyVO commuReplyVO);
  
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
   * <select id="replycnt" resultType="CommuReplyVO" parameterType="int">
   * @return cm_no
   */
  public int replycnt(int cm_no);
}