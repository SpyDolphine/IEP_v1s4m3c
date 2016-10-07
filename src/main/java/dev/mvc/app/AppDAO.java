package dev.mvc.app;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


  
@Repository("dev.mvc.app.AppDAO")
public class AppDAO implements AppDAOInter{
  @Autowired 
  private SqlSessionTemplate mybatis;//MyBATIS 3 ¿¬°á °´Ã¼

  public AppDAO(){
    System.out.println("--> AppDAO created.");
  }
  @Override
  public int create(AppVO vo) {
 //<insert id="create" parameterType="AppVO">
    return mybatis.insert("app.create",vo);
  }
   
  @Override
  public List<AppVO> list() { 
    return mybatis.selectList("app.list");
  }
  
  @Override
  public int update(AppVO vo) {
    return mybatis.update("app.update", vo);
  }
  
  @Override  
  public int delete(int ap_no) {
    return mybatis.delete("app.delete", ap_no);
  }

}