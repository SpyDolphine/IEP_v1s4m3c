package dev.mvc.category;

import java.util.List;

public interface CategoryDAOInter {
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="CategoryVO">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(CategoryVO categoryVO);
  
  /**
   * 전체 목록
   * <select id="list" resultType="CategoryVO">
   * @return 회원 목록
   */
  public List<CategoryVO> list();
  
  /**
  * 한건의 레코드 조회
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public CategoryVO read(int categoryno);
  
  /**
   * Category를 수정합니다.
   * <update id="update" parameterType="categoryVO"> 
   * @param categoryVO
   * @return 수정된 레코드 갯수
   */
  public int update(CategoryVO categoryVO);
 
  /**
   * 레코드 1건 삭제
   * <delete id="delete" parameterType="int">
   * @param categoryno 삭제할 회원 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int categoryno); 
  
}