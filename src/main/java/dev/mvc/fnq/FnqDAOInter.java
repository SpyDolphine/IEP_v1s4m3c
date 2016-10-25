package dev.mvc.fnq;

import java.util.List;

import dev.mvc.servey.ServeyVO;

public interface FnqDAOInter {
  /**
   * �׸� ���
   * <insert id="create" parameterType="FnqVO">
   * @param �������� �׸� ����� ��ü
   * @return ���
   */
  public int create(FnqVO fnqVO);
  
  /**
   * Ȩ������ ���� ���
   * <select id="list" resultType="FnqVO">
   * @return ����Ʈ
   */
  public List<FnqVO> listh();
  
  /**
   * ȸ�� ���� ���
   * <select id="list" resultType="FnqVO">
   * @return ����Ʈ
   */
  public List<FnqVO> listc();
  
  /**
   * �׸� �����մϴ�.
   * <update id="update" parameterType="FnqVO">
   * @param fnqVO
   * @return ���
   */
  public int update(FnqVO fnqVO);
 
  /**
   * �׸� 1�� ����
   * <delete id="delete" parameterType="int">
   * @param fq_no ������ �׸� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int fq_no);
  /**
  * �Ѱ��� ���ڵ� ��ȸ
  * <select id="read" resultType="CategoryVO" parameterType="int"> 
  * @param blogno
  * @return
  */
  public FnqVO read(int fq_no); 
  
}