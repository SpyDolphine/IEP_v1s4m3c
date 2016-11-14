package dev.mvc.STUDY;

import java.util.HashMap;
import java.util.List;

import dev.mvc.STUDY.StudyVO;


public interface StudyDAOInter {

    /**
     * ���ڵ带 ����մϴ�.
     * <insert id="create" parameterType="Study">
     * @param vo ����� ������ ��ü
     * @return ��ϵ� ���ڵ� ��
     */
    public int create(StudyVO vo);
    
    /**
     * ���͵� �Խù� ���
     * <select id="list1" resultType="hashMap">
     * @return ����Ʈ
     */
    public List<StudyVO> list(HashMap hashMap); 
    
    /**
     * �˻��� ���ڵ� ��
     * <select id="count" resultType="int" parameterType="HashMap" > 
     * @param hashmap �˻� ����
     * @return
     */
    public int count(String gate);
    
    /**
     * �Ѱ��� ���ڵ� ��ȸ <select id="read" resultType="StudyVO" parameterType="int">
     * 
     * @param sy_no
     *          �� ��ȣ
     * @return
     */
    public StudyVO read(int sy_no);

    /**
     * ����ó�� <update id="update" parameterType="StudyVO">
     * 
     * @param vo
     * @return
     */
    public int update(StudyVO vo);

    /**
     * ���� ó�� <delete id="delete" parameterType="int">
     * 
     * @param sy_no
     * @return
     */ 
    public int delete(int sy_no);
    
    
    
  }
  

