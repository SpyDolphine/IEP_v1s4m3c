package dev.mvc.notice;

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
   * <select id="list" resultType="NoticeVO">
   * @return ȸ�� ���
   */
  public List<NoticeVO> list();
  
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
  public int delete(int nt_no); 
}