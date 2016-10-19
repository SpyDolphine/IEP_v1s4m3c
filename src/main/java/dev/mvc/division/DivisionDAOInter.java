package dev.mvc.division;

import java.util.List;

public interface DivisionDAOInter {
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="DivisionVO">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(DivisionVO divisionVO);
  
  /**
   * Category, Division 테이블을 구룹별로 분류하여 가져옵니다.
   * <select id="category_division_list" resultType="Category_Division_VO"> 
   * @return
   */
  public List<Category_Division_VO> category_division_list();
  
  /**
  특정 대분류의 레코드 갯수를 산출
  <select id="countByCategory" resultType="int" parameterType="int">
   * @param codeno 대분류 코드
   * @return
   */
  public int countByCategory(int categoryno);
  
  /**
   목록 리턴
   <select id="list" resultType="Category_Division_VO">
   * @return
   */
  public List list();
  
  /**
   * 조회
   * <select id="read" resultType="DivisionVO" parameterType="int"> 
   * @param divisionno
   * @return
   */
  public DivisionVO read(int divisionno);
  
  /**
   * 변경 처리
   * <update id="update" parameterType="DivisionVO">
   * @param vo
   * @return
   */
  public int update(DivisionVO divisionVO);
  
  /**
   * 레코드 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param divisionno 삭제할 회원 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int divisionno); 
  
  /**
   * 한건의 레코드의 우선 순위를 높임입니다.
   * <update id="up" parameterType="DivisionVO">
   * @param DivisionVO
   * @return 변경된 레코드 갯수
   */
  public int up(DivisionVO divisionVO);
 
  /**
   * 한건의 레코드의 우선 순위를 낮춥니다.
   * <update id="down" parameterType="DivisionVO">
   * @param DivisionVO
   * @return 변경된 레코드 갯수
   */
  public int down(DivisionVO divisionVO);
  
  /**
   * 등록된 글수의 증가
   * <update id="increaseCnt" parameterType="int">
   * @param divisionno
   * @return
   */
  public int increaseCnt(int divisionno);
  
  /**
   * 등록된 글수의 감소
   * <update id="decreaseCnt" parameterType="int">
   * @param divisionno
   * @return
   */
  public int decreaseCnt(int divisionno);
  
  
}