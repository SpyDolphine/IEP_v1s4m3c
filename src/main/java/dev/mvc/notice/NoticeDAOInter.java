package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

public interface NoticeDAOInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="MemberVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(NoticeVO vo);
  
  /**
   * ��ü ���
   * <select id="list" resultType="NoticeVO" resultType="HashMap">
   * @return ȸ�� ���
   */
  public List<NoticeVO> list(HashMap Map);
  
  /**
   * Code�� �����մϴ�.
   * <update id="update" parameterType="CodeVO"> 
   * @param codeVO
   * @return ������ ���ڵ� ����
   */
  public int update(NoticeVO codeVO);
 
  /**
   * ���ڵ� 1�� ����
   * <select id="read" resultType="NoticeVO" parameterType="int">
   * @param mno ������ ȸ�� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public NoticeVO read(int nt_no); 
  
  /**
   * ���ڵ� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param mno ������ ȸ�� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(HashMap hashMap); 
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int count(HashMap hashMap);
}