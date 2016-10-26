package dev.mvc.aboutme;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.aboutme.AboutmeDAO")
public class AboutmeDAO implements AboutmeDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public AboutmeDAO(){
    System.out.println("--> AboutmeDAO created.");  
  }
  
  @Override
  public int create(AboutmeVO aboutmeVO) {
    return mybatis.insert("aboutme.create", aboutmeVO);
  }

  @Override
  public List<AboutmeVO> list() {
    return mybatis.selectList("aboutme.list");
  }

  @Override
  public int update(AboutmeVO aboutmeVO) {
    return mybatis.update("aboutme.update", aboutmeVO);
  }

  @Override
  public int delete(int am_no) {
    return mybatis.delete("aboutme.delete", am_no);
  }

  @Override
  public AboutmeVO read(int am_no) {
    return mybatis.selectOne("aboutme.read", am_no);
  }

}
 