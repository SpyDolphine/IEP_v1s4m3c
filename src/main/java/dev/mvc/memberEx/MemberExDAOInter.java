package dev.mvc.memberEx;

import java.util.List;

public interface MemberExDAOInter {

  /**
   *  회원가입(등록) DAO
   * @param vo
   * @return
   */
  public int create(MemberExVO vo);
  public int create_com(MemberExVO vo);
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
  public MemberExVO memberInfo(String me_id);
  /**
   * 회원을 탈퇴 할경우 vis***가 2로 변환
   * @param memberExVO
   * @return
   */
  public int memberout(MemberExVO memberExVO);
  /**
   * 회원을 탈퇴 취소(복귀) 할경우 vis***가 1로 변환
   * @param memberExVO
   * @return
   */
  public int memberin(MemberExVO memberExVO);
  /**
   * 회원을 검색하지 않는 목록
   */
 public List<MemberExVO> memberlist();
 /**
  * 패스워드 검사 
  * <select id="passwdCheck" resultType="int" parameterType="Map">
  * @param memberVO mno, passwd의 전달
  * @return 일치하는 레코드 갯수
  */
 public int passwdCheck(int me_no, String me_pw);
 
 /**
  * 패스워드 변경 처리
  * <update id="update_passwd" parameterType="Map">
  * @param memberVO mno, passwd의 전달
  * @return 변경된 레코드의 갯수
  */
 public int update_passwd(int me_no, String me_pw);
}
