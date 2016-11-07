package dev.mvc.WEB;

import java.util.List;

public interface WebDAOInter {

    public List<WebVO> list(); 
    /** 
     * ��� <insert id="create" parameterType="WebVO">
     * 
     * @param WebVO 
     * @return
     */ 
    public int create(WebVO WebVO);
    /**
     * �Ѱ��� ���ڵ� ��ȸ <select id="read" resultType="WebVO" parameterType="int">
     * 
     * @param wb_no
     *          �� ��ȣ
     * @return
     */
    public WebVO read(int wb_no);

    /**
     * ����ó�� <update id="update" parameterType="WebVO">
     * 
     * @param vo
     * @return
     */
    public int update(WebVO vo);

    /**
     * ���� ó�� <delete id="delete" parameterType="int">
     * 
     * @param wb_no
     * @return
     */ 
    public int delete(int wb_no);

  }
