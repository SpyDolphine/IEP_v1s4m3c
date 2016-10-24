package dev.mvc.memberEx;


public interface MemberExDAOInter {

  /**
   *  회원가입(등록) DAO
   * @param vo
   * @return
   */
  public int create(MemberExVO vo);
  /**
   * 회원 이메일 중복 확인 
   */
  public int checkId(String me_id);
  /**
   * 회원 닉네임 중복 확인
   * <!-- 닉네임 중복 체크 -->
    <select id='checkNick' resultType='int' parameterType='String'>
   */
  public int checkNick(String me_nick);
  /**
   * 회원 로그인 확인 
   */
  public int login(MemberExVO memberExVO);
  /**
   * 회원정보 확인
   * <select id="read" resultType="MemberExVO" parameterType="int">
   */
  public MemberExVO read(int me_no);  
  /**
   * 회원정보 수정
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
