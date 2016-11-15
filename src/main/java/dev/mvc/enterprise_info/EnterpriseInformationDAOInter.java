package dev.mvc.enterprise_info;

import java.util.HashMap;
import java.util.List;

public interface EnterpriseInformationDAOInter {
  
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="EnterpriseInformationVO">
   * @param eiVO 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(EnterpriseInformationVO eiVO);
  
  /**
   * 기업 정보 전체 목록
   * <select id="list" resultType="EnterpriseInformationVO">
   * @return 기업 정보 목록
   */
  public List<EnterpriseInformationVO> list();
  
  /**
   * 기업정보 내용
   * <select id="read" resultType="EnterpriseInformationVO" parameterType="int">
   */
  public EnterpriseInformationVO read(int ei_no); 
  
  /**
   * 기업정보 수정 내용
   * <select id="update" resultType="EnterpriseInformationVO" parameterType="int">
   */
  public EnterpriseInformationVO update(int ei_no); 
  
  /**
   * 기업정보 수정
   * <update id="update" parameterType="EnterpriseInformationVO">
   */
  public int update(EnterpriseInformationVO eiVO);
  
  /**
   * 레코드 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param ei_no 삭제할 기업정보 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int ei_no);

  /**
   * 검색된 레코드 수
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap 검색 조건
   * @return
   */
  // <select id="count" resultType="int" parameterType="HashMap" >
  public int count(HashMap hashMap);
  
  /**
   * 답변 기능을 지원하는 목록
   * <select id="list5" resultType="BlogVO" parameterType="HashMap" >
   * <select id="list4" resultType="BlogVO" parameterType="HashMap" >
   * @param map 검색/페이징
   * @return 전체목록 또는 검색 목록
   */
//  public List<BlogVO> list4(HashMap hashMap);
  public List<EnterpriseInformationVO> list4(HashMap<String, Object> hashMap);
  
  
  

}
