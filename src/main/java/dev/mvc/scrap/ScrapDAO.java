package dev.mvc.scrap;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.scrap.ScrapDAO")
public class ScrapDAO implements ScrapDAOInter{

  @Autowired
  private SqlSessionTemplate mybatis;

  public ScrapDAO(){
    System.out.println("==> ScrapDAO ½ÃÀÛ");
  }
  public int create(ScrapVO scrapVO){
    return mybatis.insert("scrap.create", scrapVO);
  }
  public List<ScrapVO> list(int me_no){
    return mybatis.selectList("scrap.list", me_no);
  }
  public int delete(int sp_no){
    return mybatis.delete("scrap.delete", sp_no);
  }
}
