package dev.mvc.scrap;

import java.util.List;

import dev.mvc.contest.ContestVO;

public interface ScrapDAOInter {

  /**
   * 등록
   * @param scrapVO
   * @return
   */
  public int create(ScrapVO scrapVO); 
  /**리스트    */
  public List<ScrapVO> list(int me_no); 
  /**
   * <delete id="delete"  parameterType="int">
   */
  public int delete(int sp_no);
}
