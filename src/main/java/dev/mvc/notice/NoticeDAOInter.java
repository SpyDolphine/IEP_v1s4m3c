package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

public interface NoticeDAOInter {
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="MemberVO">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(NoticeVO vo);
  
  /**
   * Code를 수정합니다.
   * <update id="update" parameterType="CodeVO"> 
   * @param codeVO
   * @return 수정된 레코드 갯수
   */
  public int update(NoticeVO codeVO);
 
  /**
   * 레코드 1건 삭제
   * <select id="read" resultType="NoticeVO" parameterType="int">
   * @param mno 삭제할 회원 번호
   * @return 삭제된 레코드 갯수
   */
  public NoticeVO read(int nt_no); 
  
  /**
   * 레코드 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param mno 삭제할 회원 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int nt_no);
  
  /**
   * 검색된 레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색조건
   * @return
   */
  public int count(HashMap hashmap);  
  
  /**
   * 답변 기능을 지원하는 목록
   * <select id="list" resultType="NoticeVO" parameterType="HashMap" >
   * @param Map 검색/페이징
   * @return 전체 목록 또는 검색 목록
   */
  public List<NoticeVO> list(HashMap Map);  
}