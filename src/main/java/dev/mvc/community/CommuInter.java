package dev.mvc.community;

import java.util.HashMap;
import java.util.List;

public interface CommuInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="CommuVO">
   * @param mfVO ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(CommuVO commuVO);

  /**
   * ����
   * <update id="update" parameterType="CommuVO">
   * @param mfVO
   * @return
   */
  public int update(CommuVO commuVO);
  
  /**
   * ����
   * <update id="update_cnt" parameterType="CommuVO">
   * @param mfVO
   * @return
   */
  public int update_cnt(int cm_no);  

  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param cm_no
   * @return
   */
  public int delete(HashMap hashmap);  
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="MfVO" parameterType="int">
   * @param cm_no �۹�ȣ
   * @return
   */
  public CommuVO read(int cm_no); 
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int countA(HashMap hashmap);  

  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int countB(HashMap hashmap); 
  
  /**
   * �˻��� ���ڵ� ��
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap �˻�����
   * @return
   */
  public int countC(HashMap hashmap);

  /**
   * �亯 ������ �����մϴ�
   * <update id='updateAnsnum' parameterType="CommuVO">
   * @param hashMap
   * @return 1:���� 0:����
   */
  public int updateAnsnum(CommuVO commuVO);
  
  /**
   * �亯 ���
   * <insert id="reply" parameterType="CommuVO">
   * @param blogVO
   * @return 1:���� 0:����
   */

  public int reply(CommuVO commuVO);
  
  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list1" resultType="CommuVO" parameterType="HashMap" >
   * @param Map �˻�/����¡
   * @return ��ü ��� �Ǵ� �˻� ���
   */
  public List<CommuVO> listA(HashMap<String, Object> Map);

  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list2" resultType="CommuVO" parameterType="HashMap" >
   * @param Map �˻�/����¡
   * @return ��ü ��� �Ǵ� �˻� ���
   */
  public List<CommuVO> listB(HashMap<String, Object> Map);
  
  /**
   * �亯 ����� �����ϴ� ���
   * <select id="list2" resultType="CommuVO" parameterType="HashMap" >
   * @param Map �˻�/����¡
   * @return ��ü ��� �Ǵ� �˻� ���
   */
  public List<CommuVO> listC(HashMap<String, Object> Map);
 
  /**
   * ���ñ۸� �ҷ����� ���
   * @param cm_no
   * @return
   */
  public List<CommuVO> listmenuA(int cm_no);  

  /**
   * ���ñ۸� �ҷ����� ���
   * @param cm_no
   * @return
   */
  public List<CommuVO> listmenuB(int cm_no); 
  
  /**
   * ���ñ۸� �ҷ����� ���
   * @param cm_no
   * @return
   */
  public List<CommuVO> listmenuC(int cm_no);
 
  /**
   * ���۸� �ҷ����� ���
   * @param cm_no
   * @return
   */
  public List<CommuVO> bonlistA();  

  /**
   * ���۸� �ҷ����� ���
   * @param cm_no
   * @return
   */
  public List<CommuVO> bonlistB();
  
  /**
   * ���۸� �ҷ����� ���
   * @param cm_no
   * @return
   */
  public List<CommuVO> bonlistC();
  
  /**
   * ���ñ��� �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="MfVO" parameterType="int">
   * @param cm_no �۹�ȣ
   * @return
   */
  public CommuVO bonread(int grpno); 
  
  /**
   * ����� �ִ밪 ��ȸ
   * @param cm_no
   * @return
   */
  public int maxlistA();    
  
  /**
   * ����� �ִ밪 ��ȸ
   * @param cm_no
   * @return
   */
  public int maxlistB();  
  
  /**
   * ����� �ִ밪 ��ȸ
   * @param cm_no
   * @return
   */
  public int maxlistC();

  /**
   * ����� �ּҰ� ��ȸ
   * @param cm_no
   * @return
   */
  public int minlistA();  
  
  /**
   * ����� �ּҰ� ��ȸ
   * @param cm_no
   * @return
   */
  public int minlistB();
  
  /**
   * ����� �ּҰ� ��ȸ
   * @param cm_no
   * @return
   */
  public int minlistC();
  
  /**
   * ���ƿ� ���
   * @param cm_no
   * @return
   */
  public int likeit(int cm_no);   
  
  /**
   * ���ƿ� ��ұ��
   * @param cm_no
   * @return
   */
  public int likedown(int cm_no);     
  
}
