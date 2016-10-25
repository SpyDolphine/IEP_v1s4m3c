package dev.mvc.seico;

import java.util.HashMap;
import java.util.List;

public interface SeicoDAOInter {
  
  // <insert id="create" parameterType="BoardVO">
  public int create(SeicoVO seicoVO);
  
  // <select id="list" resultType="BoardVO">
  public List<SeicoVO> list(); 
  
  /**
   * blogcategoryno�� ���� ���
   * <select id="list_by_divisionno" resultType="BoardVO" parameterType="int">
   * @param blogcategoryno
   * @return
   */
 /* public List<SeicoVO> list_by_divisionno(int divisionno);
  
  *//**
  * �Ѱ��� ���ڵ� ��ȸ
  * <select id="read" resultType="BoardVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public SeicoVO read(int sc_no);
  
  /**
   * �Ѱ��� ���ڵ� ����
   * <update id="update" parameterType="BoardVO">
   * @param SeicoVO
   * @return
   */
  public int update(SeicoVO seicoVO);
  
  /**
   * �Ѱ��� ���ڵ� ����
   * <update id='cntup' parameterType="int">
   * @param SeicoVO
   * @return
   */
  public int cntup(int sc_no);
  
  /**
   * �Ѱ��� ���ڵ� ����
   * <delete id="delete" parameterType="int">
   * @param blogno
   * @return
   */
  public int delete(int sc_no);
  
  /**
   * �˻����
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
   * �˻����
   * <select id="list3" resultType="BoardVO" parameterType="HashMap" >
   * @param hashMap
   * @return
   *//*
  public List<SeicoVO> list3(HashMap hashMap);
  
  *//**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="BoardVO">
   * @param hashMap
   * @return 1:���� 0:����
   *//*
  public int updateAnsnum(SeicoVO boardVO);
  
  *//**
   * �亯 ���
   * <insert id="reply" parameterType="BoardVO">
   * @param BoardVO
   * @return 1:���� 0:����
   *//*

  public int reply(SeicoVO BoardVO);
  
  *//**
   * �亯 ����� �����ϴ� ���
   * <select id="list4" resultType="BoardVO" parameterType="HashMap" >
   * @param Map �˻�/����¡
   * @return ��ü ��� �Ǵ� �˻� ���
   */
  public List<SeicoVO> list4(HashMap/*<String, Object>*/ Map);
}
