package dev.mvc.employment_info;

import java.util.HashMap;
import java.util.List;

import dev.mvc.enterprise_info.EnterpriseInformationVO;

public interface EmploymentInformationDAOInter {

  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="EmploymentInformationVO">
   * @param emVO 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(EmploymentInformationVO emVO);
  
  /**
   * 검색된 레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색 조건
   * @return
   */
  // <select id="count" resultType="int" parameterType="HashMap" >
  public int count(HashMap hashMap);
  
  /**
   * 답변을 지원하는 목록
   * <select id="list5" resultType="EmploymentInformationVO" parameterType="HashMap" >
   * <select id="list4" resultType="EmploymentInformationVO" parameterType="HashMap" >
   * @param map 검색/페이징
   * @return 전체목록 또는 검색 목록
   */
//  public List<BlogVO> list4(HashMap hashMap);
  public List<EmploymentInformationVO> list4(HashMap<String, Object> hashMap);
  
  /**
   * 채용정보 내용
   * <select id="read" resultType="EmploymentInformationVO" parameterType="int">
   */
  // public EmploymentInformationVO read(int em_no); 
  public EmploymentInformationVO read(int em_no);
  
  /**
   * 채용정보 수정
   * <update id="update" parameterType="EmploymentInformationVO">
   */
  public int update(EmploymentInformationVO emVO);
  
  /**
   * 레코드 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param em_no 삭제할 기업정보 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int em_no);
 
}
