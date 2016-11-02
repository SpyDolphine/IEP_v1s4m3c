package dev.mvc.fnq;
 
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.fnq.FnqDAO")
public class FnqDAO implements FnqDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public FnqDAO(){
    System.out.println("--> FnqDAO created.");  
  }
  
  @Override
  public int create(FnqVO fnqVO) {
    return mybatis.insert("fnq.create", fnqVO);
  }

  @Override
  public List<FnqVO> listh(HashMap Map) {
    return mybatis.selectList("fnq.listh", Map);
  }
  
  @Override
  public List<FnqVO> listc(HashMap Map) {
    return mybatis.selectList("fnq.listc", Map);
  }

  @Override
  public int update(FnqVO fnqVO) {
    return mybatis.update("fnq.update", fnqVO);
  }

  @Override
  public int delete(HashMap hashMap) {
    return mybatis.delete("fnq.delete", hashMap);
  }

  @Override
  public FnqVO read(int fq_no) {
    return mybatis.selectOne("fnq.read", fq_no);
  }

  @Override
  public int countC(HashMap hashmap) {
    return mybatis.selectOne("fnq.countC", hashmap);
  }
  
  @Override
  public int countH(HashMap hashmap) {
    return mybatis.selectOne("fnq.countH", hashmap);
  }

}
 