package dev.mvc.memberEx;

import java.util.List;

public interface MemberExDAOInter {

  /**
   *  ȸ������(���) DAO
   * @param vo
   * @return
   */
  public int create(MemberExVO vo);
  public int create_com(MemberExVO vo);
  /**
   * ȸ�� �̸��� �ߺ� Ȯ�� 
   */
  public int checkId(String me_id);
  /**
   * ȸ�� �г��� �ߺ� Ȯ��
   * <!-- �г��� �ߺ� üũ -->
    <select id='checkNick' resultType='int' parameterType='String'>
   */
  public int checkNick(String me_nick);
  /**
   * ȸ�� �α��� Ȯ�� 
   */
  public int login(MemberExVO memberExVO);
  /**
   * ȸ������ Ȯ��
   * <select id="read" resultType="MemberExVO" parameterType="int">
   */
  public MemberExVO read(int me_no);  
  /**
   * ȸ������ ����
   * <update id="update" parameterType="MemberExVO">
   */
  public int update(MemberExVO memberExVO);
  /**
   * 
   * @param me_no
   * @return
   */
  public MemberExVO memberInfo(String me_id);
  /**
   * ȸ���� Ż�� �Ұ�� vis***�� 2�� ��ȯ
   * @param memberExVO
   * @return
   */
  public int memberout(MemberExVO memberExVO);
  /**
   * ȸ���� Ż�� ���(����) �Ұ�� vis***�� 1�� ��ȯ
   * @param memberExVO
   * @return
   */
  public int memberin(MemberExVO memberExVO);
  /**
   * ȸ���� �˻����� �ʴ� ���
   */
 public List<MemberExVO> memberlist();
 /**
  * �н����� �˻� 
  * <select id="passwdCheck" resultType="int" parameterType="Map">
  * @param memberVO mno, passwd�� ����
  * @return ��ġ�ϴ� ���ڵ� ����
  */
 public int passwdCheck(int me_no, String me_pw);
 
 /**
  * �н����� ���� ó��
  * <update id="update_passwd" parameterType="Map">
  * @param memberVO mno, passwd�� ����
  * @return ����� ���ڵ��� ����
  */
 public int update_passwd(int me_no, String me_pw);
}
