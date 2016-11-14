package dev.mvc.dat;

import java.util.HashMap;
import java.util.List;

public interface DatDAOInter {
  
  /**
   * ���
   * <insert id="create" parameterType="datVO">
   * @param replyVO
   * @return
   */
  public int create(DatVO datVO);
  
  /**
   * ��� ���(���ø��)
   * @param gu_no
   * @return
   */
  public List<DatVO> datlist(int gu_no); 
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="ReplyVO" parameterType="int">
   * @param rno �۹�ȣ
   * @return
   */
  public DatVO read(int gu_no);
  
  /**
   * �Ѱ��� ��� ��ȸ
   * <select id="replyread" resultType="ReplyVO" parameterType="int">
   * @param rno �۹�ȣ
   * @return
   */
  public DatVO datread(int dno);
  
  /**
   * ����
   * <update id="update" parameterType="ReplyVO">
   * @param replyVO
   * @return
   */
  public int update(DatVO datVO);
 
  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param rno
   * @return
   */
  public int delete(int dno);  
  
  /**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="ReplyVO">
   * @param hashMap
   * @return 1:���� 0:����
   */
  public int updateAnsnum(DatVO datVO);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="ReplyVO">
   * @param replyVO
   * @return 1:���� 0:����
   */
  public int dat(DatVO datVO);
  
  /**
   * ��õ ���
   * @param rno
   * @return
   */
  public int likeup(int dno); 
  
  /**
   * ����õ ���
   * @param rno
   * @return
   */
  public int likedown(int dno);   
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="replycnt" parameterType="int">
   * @return
   */
  public int datcnt(int gu_no);
}