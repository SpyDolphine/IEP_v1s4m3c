package dev.mvc.WEB;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.WEB.WebDAO")
public class WebDAO implements WebDAOInter {
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼

  public WebDAO() {
    System.out.println("--> WebDAO created.");
  }

  @Override
  public int create(WebVO webVO) {
    return mybatis.insert("web.create", webVO);
  }

  @Override
  public List<WebVO> list() {
    return mybatis.selectList("web.list");
  }

  @Override 
  public WebVO read(int wb_no) {
    return mybatis.selectOne("web.read", wb_no);
  }

  @Override
  public int update(WebVO vo) {
    return mybatis.update("web.update", vo);
  }

  @Override
  public int delete(int wb_no) {
    return mybatis.delete("web.delete", wb_no);
  }
}
