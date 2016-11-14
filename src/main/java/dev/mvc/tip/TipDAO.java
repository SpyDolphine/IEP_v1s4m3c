package dev.mvc.tip;
 
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.tip.TipDAO")
public class TipDAO implements TipDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public TipDAO(){
    System.out.println("--> TipDAO created.");  
  }
  
  @Override
  public int create(TipVO tipVO) {
    return mybatis.insert("tip.create", tipVO);
  }

  @Override
  public List<TipVO> list(HashMap Map) {
    return mybatis.selectList("tip.list", Map);
  }

  @Override
  public int update(TipVO tipVO) {
    return mybatis.update("tip.update", tipVO);
  }

  @Override
  public int delete(int tp_ch) {
    return mybatis.delete("tip.delete", tp_ch);
  }

  @Override
  public TipVO read(int tp_ch) {
    return mybatis.selectOne("tip.read", tp_ch);
  }

  @Override
  public int count(HashMap hashmap) {
    return mybatis.selectOne("tip.count", hashmap);
  }
  
}
 