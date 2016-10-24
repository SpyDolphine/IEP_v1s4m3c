package dev.mvc.memberEx;


public interface MemberExDAOInter {

  /**
   *  ȸ������(���) DAO
   * @param vo
   * @return
   */
  public int create(MemberExVO vo);
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
  public MemberExVO memberInfo(MemberExVO memberExVO);
}
