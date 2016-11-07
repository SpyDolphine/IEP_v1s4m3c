package dev.mvc.WEB;

import java.util.List;

public interface WebDAOInter {

    public List<WebVO> list(); 
    /** 
     * 등록 <insert id="create" parameterType="WebVO">
     * 
     * @param WebVO 
     * @return
     */ 
    public int create(WebVO WebVO);
    /**
     * 한건의 레코드 조회 <select id="read" resultType="WebVO" parameterType="int">
     * 
     * @param wb_no
     *          글 번호
     * @return
     */
    public WebVO read(int wb_no);

    /**
     * 수정처리 <update id="update" parameterType="WebVO">
     * 
     * @param vo
     * @return
     */
    public int update(WebVO vo);

    /**
     * 삭제 처리 <delete id="delete" parameterType="int">
     * 
     * @param wb_no
     * @return
     */ 
    public int delete(int wb_no);

  }
