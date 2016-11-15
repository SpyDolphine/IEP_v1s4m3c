package dev.mvc.contest;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.contest.ContestDAO")
public class ContestDAO implements ContestDAOInter {
  
  @Autowired
  private SqlSessionTemplate mybatis;

  public ContestDAO() {
    System.out.println("--> ContestDAO create.");
  }
  @Override
  public int create(ContestVO contestVO){
    return mybatis.insert("contest.create", contestVO);
  }
  @Override
  public List<ContestVO> list(HashMap<String, Object> hashmap){
    return mybatis.selectList("contest.list", hashmap);
  }
  @Override
  public ContestVO read(int ct_no){
    return mybatis.selectOne("contest.read", ct_no);
  }
  @Override
  public int update(ContestVO contestVO){
    return mybatis.update("contest.update", contestVO);
  }
  @Override
  public int delete(int ct_no){
    return mybatis.delete("contest.delete", ct_no);
  }
  @Override
  public int count(HashMap hashmap) {
    return mybatis.selectOne("contest.count", hashmap);
  }
}
