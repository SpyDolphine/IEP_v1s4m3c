package dev.mvc.serveyboard;
 
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.serveyboard.ServeyboardDAO")
public class ServeyboardDAO implements ServeyboardDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public ServeyboardDAO(){
    System.out.println("--> ServeyboardDAO created.");  
  }
  
  @Override
  public int create(ServeyboardVO serveyboardVO) {
    return mybatis.insert("serveyboard.create", serveyboardVO);
  }

  @Override
  public List<ServeyboardVO> list(HashMap Map) {
    return mybatis.selectList("serveyboard.list", Map);
  }

  @Override
  public ServeyboardVO read(int sb_no) {
    return mybatis.selectOne("serveyboard.read", sb_no);
  }
  
  @Override
  public int update(ServeyboardVO serveyboardVO) {
    return mybatis.update("serveyboard.update", serveyboardVO);
  }

  @Override
  public int delete(HashMap hashMap) {
    return mybatis.delete("serveyboard.delete", hashMap);
  }

  @Override
  public int max() {
    return mybatis.selectOne("serveyboard.max");
  }

  @Override
  public int count(HashMap hashmap) {
    return mybatis.selectOne("serveyboard.count", hashmap);
  }
  
}
 