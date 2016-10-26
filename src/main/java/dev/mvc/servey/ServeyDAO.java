package dev.mvc.servey;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.servey.ServeyDAO")
public class ServeyDAO implements ServeyDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public ServeyDAO(){
    System.out.println("--> ServeyDAO created.");  
  }
  
  @Override
  public int create(ServeyVO serveyVO) {
    return mybatis.insert("servey.create", serveyVO);
  }

  @Override
  public List<ServeyVO> list(int sb_no) {
    return mybatis.selectList("servey.list", sb_no);
  }

  @Override
  public ServeyVO read(int serveyno) {
    return mybatis.selectOne("servey.read", serveyno);
  }
  
  @Override
  public int sum(int sb_no) {
    return mybatis.selectOne("servey.sum", sb_no);
  }

  @Override
  public int update(ServeyVO serveyVO) {
    return mybatis.update("servey.update", serveyVO);
  }

  @Override
  public int delete(int serveyno) {
    return mybatis.delete("servey.delete", serveyno);
  }

  @Override
  public int percent(int serveyno) {
    return mybatis.update("servey.percent", serveyno);
  }

  @Override
  public int vote(int serveyno) {
    return mybatis.update("servey.vote", serveyno);
  }

  @Override
  public ServeyVO result(int sb_no) {
    return mybatis.selectOne("servey.result", sb_no);
  }

}
 