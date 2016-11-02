package dev.mvc.seico;

import java.util.HashMap;
import java.util.List;

import dev.mvc.seico.SeicoVO;

public interface SeicoDAOInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="SeicoVO2">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(SeicoVO seicoVO);
  
  /**
   * ��ü ���
   * <select id="list" resultType="SeicoVO2">
   * @return ���
   */
  public List<SeicoVO> list(); 
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * <select id="read" resultType="SeicoVO2" parameterType="int">
   * @param sc_no �۹�ȣ
   * @return
   */
  public SeicoVO read(int sc_no);  
  
  /**
   * ����
   * <update id="update" parameterType="SeicoVO2">
   * @param SeicoVO
   * @return
   */
  public int update(SeicoVO seicoVO);

  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param sc_no
   * @return
   */
  public int delete(int sc_no);  
  
  /**
   * ��ȸ�� ����
   * <update id='cntup' parameterType="int">
   * @param SeicoVO
   * @return
   */
  public int cntup(int sc_no);
  
  /**
   * 
   * <select id="count" resultType="int" parameterType="HashMap" >
   * @param hashMap
   * @return
   */
  public int count(HashMap hashMap);

  
  public List<SeicoVO> list(HashMap<String, Object> Map);

}