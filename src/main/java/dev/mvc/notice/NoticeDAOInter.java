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
   * <update id="update" parameterType="NoticeVO"> 
   * @param codeVO
   * @return ������ ���ڵ� ����
   */
  public int update(NoticeVO noticeVO);
 
  /**
   * ���ڵ� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param mno ������ ȸ�� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int nt_no);
  
  public NoticeVO read(int nt_no); 
}