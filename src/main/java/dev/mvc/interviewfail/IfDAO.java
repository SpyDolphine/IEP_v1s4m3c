package dev.mvc.interviewfail;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.interviewfail.IfDAO")
public class IfDAO implements IfInter{

  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public IfDAO() {
    System.out.println("--> IfDAO created.");
  }
  
  @Override
  public int create(IfVO ifvo) {
    return mybatis.insert("interviewfail.createboot", ifvo);
  }

  @Override
  public List<IfVO> list() {
    return mybatis.selectList("interviewfail.list");
  }
  
  @Override
  public IfVO read(int if_no) {
    return mybatis.selectOne("interviewfail.read", if_no);
  }

  @Override
  public int delete(int if_no) {
    return mybatis.delete("interviewfail.delete", if_no);
  }

  @Override
  public int update(IfVO ifVO) {
    return mybatis.update("interviewfail.update", ifVO);
  }

  @Override
  public int update_cnt(int if_no) {
    return mybatis.update("interviewfail.update_cnt", if_no);
  }

  @Override
  public List<IfVO> manylist() {
    return mybatis.selectList("interviewfail.manylist");
  }  
 
}