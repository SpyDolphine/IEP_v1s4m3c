package dev.mvc.scrap;

import java.util.List;

import dev.mvc.contest.ContestVO;

public interface ScrapDAOInter {

  /**
   * ���
   * @param scrapVO
   * @return
   */
  public int create(ScrapVO scrapVO); 
  /**����Ʈ    */
  public List<ScrapVO> list(int me_no); 
  /**
   * <delete id="delete"  parameterType="int">
   */
  public int delete(int sp_no);
}
