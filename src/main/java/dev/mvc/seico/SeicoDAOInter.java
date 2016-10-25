package dev.mvc.seico;

import java.util.HashMap;
import java.util.List;

public interface SeicoDAOInter {
  
  // <insert id="create" parameterType="BoardVO">
  public int create(SeicoVO seicoVO);
  
  // <select id="list" resultType="BoardVO">
  public List<SeicoVO> list(); 
  
  /**
   * blogcategoryno에 의한 목록
   * <select id="list_by_divisionno" resultType="BoardVO" parameterType="int">
   * @param blogcategoryno
   * @return
   */
 /* public List<SeicoVO> list_by_divisionno(int divisionno);
  
  *//**
  * 한건의 레코드 조회
  * <select id="read" resultType="BoardVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public SeicoVO read(int sc_no);
  
  /**
   * 한건의 레코드 수정
   * <update id="update" parameterType="BoardVO">
   * @param SeicoVO
   * @return
   */
  public int update(SeicoVO seicoVO);
  
  /**
   * 한건의 레코드 수정
   * <update id='cntup' parameterType="int">
   * @param SeicoVO
   * @return
   */
  public int cntup(int sc_no);
  
  /**
   * 한건의 레코드 삭제
   * <delete id="delete" parameterType="int">
   * @param blogno
   * @return
   */
  public int delete(int sc_no);
  
  /**
   * 검색목록
   * <select id="list2" resultType="BoardVO" parameterType="HashMap" >
   * @param hashMap
   * @return
   *//*
  public List<SeicoVO> list2(HashMap hashMap);
  
  *//**
   * 
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap
   * @return
   */
  public int count(HashMap hashMap);
  
  /**
   * 검색목록
   * <select id="list3" resultType="BoardVO" parameterType="HashMap" >
   * @param hashMap
   * @return
   *//*
  public List<SeicoVO> list3(HashMap hashMap);
  
  *//**
   * 답변 순서를 변경합니다
   * <update id='updateAnsnum' parameterType="BoardVO">
   * @param hashMap
   * @return 1:성공 0:실패
   *//*
  public int updateAnsnum(SeicoVO boardVO);
  
  *//**
   * 답변 등록
   * <insert id="reply" parameterType="BoardVO">
   * @param BoardVO
   * @return 1:성공 0:실패
   *//*

  public int reply(SeicoVO BoardVO);
  
  *//**
   * 답변 기능을 지원하는 목록
   * <select id="list4" resultType="BoardVO" parameterType="HashMap" >
   * @param Map 검색/페이징
   * @return 전체 목록 또는 검색 목록
   */
  public List<SeicoVO> list4(HashMap/*<String, Object>*/ Map);
}
