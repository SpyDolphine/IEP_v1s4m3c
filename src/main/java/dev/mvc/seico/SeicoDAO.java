package dev.mvc.seico;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.seico.SeicoVO;

@Repository("dev.mvc.seico.SeicoDAO")
public class SeicoDAO implements SeicoDAOInter {

  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public SeicoDAO() {
    System.out.println("--> SeicoDAO created.");
  }

  @Override
  public int create(SeicoVO seicoVO) {
    return mybatis.insert("seico.createboot", seicoVO);
  }

 @Override
  public List<SeicoVO> list() {
    return mybatis.selectList("seico.list");
  }
 @Override
 public SeicoVO read(int sc_no) {
   return mybatis.selectOne("seico.read", sc_no);
 }

 
  @Override
  public int update(SeicoVO seicoVO) {
    return mybatis.update("seico.update", seicoVO);
  }
  
  @Override
  public int delete(int sc_no) {
    return mybatis.delete("seico.delete", sc_no);
  }

  @Override
  public int cntup(int sc_no) {
    return mybatis.update("seico.cntup", sc_no);
  }

  @Override
  public int count(HashMap hashMap) {
    return mybatis.selectOne("seico.count", hashMap);
  }

  @Override
  public List<SeicoVO> list(HashMap<String, Object> Map) {
    return mybatis.selectList("seico.list", Map);
    
    /* @Override
  public List<GurumeVO> list4(HashMap Map) {
    System.out.println("col: "+ Map.get("col"));
    System.out.println("word: "+ Map.get("word"));
    return mybatis.selectList("seico.list4", Map);
  }


  @Override
  public int count(HashMap hashMap) {
    System.out.println("startNum: "+ hashMap.get("startNum"));
    System.out.println("endNum: "+ hashMap.get("endNum"));
    return mybatis.selectOne("seico.count", hashMap);
  }*/
  }

}