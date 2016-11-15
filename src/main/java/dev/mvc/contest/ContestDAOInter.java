package dev.mvc.contest;

import java.util.HashMap;
import java.util.List;

public interface ContestDAOInter {
/**
 * 공모전 등록 부분
 * <insert id="create" parameterType="ContestVO">
 */
   public int create(ContestVO contestVO);
   /**
    * 게시판 글 전체 목록입니다.
    * <select id="list" resultType="ContestVO">
    * @return
    */
   public List<ContestVO> list(HashMap<String, Object> hashmap);
  /**
   *  <select id="read" resultType="ContestVO" parameterType="int">
   *  게시판 글 조회
   */
   public ContestVO read(int ct_no);
   /**
    *   <update id="update" parameterType="ContestVO">
    *   게시판 글 수정(어드민만)
    */
   public int update(ContestVO contestVO);
   /**
    * <!-- 공모전 삭제 관련 -->
  <delete id="delete"  parameterType="int">
    */
   public int delete(int ct_no);
   /**
    * 
    * @param hashmap
    * @return
    */
   public int count(HashMap hashmap);
}
