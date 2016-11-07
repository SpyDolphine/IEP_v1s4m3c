package dev.mvc.ITOS;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.ITOS.ItosDAO")
public class ItosDAO implements ItosDAOInter {
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼

  public ItosDAO() {
    System.out.println("--> ItosDAO created.");
  }

  @Override
  public int create(ItosVO itosVO) {
    return mybatis.insert("itos.create", itosVO);
  }

  @Override
  public List<ItosVO> list() {
    return mybatis.selectList("itos.list");
  }

  @Override
  public ItosVO read(int io_no) {
    return mybatis.selectOne("itos.read", io_no);
  }

  @Override
  public int update(ItosVO vo) {
    return mybatis.update("itos.update", vo);
  }

  @Override
  public int delete(int io_no) {
    return mybatis.delete("itos.delete", io_no);
  }

  @Override
  public int count(HashMap hashmap) {
    return mybatis.selectOne("itos.count", hashmap);
  }

  @Override
  public int updateAnsnum(ItosVO vo) {
    return mybatis.update("itos.updateAnsnum", vo);
  }
 
  @Override
  public int reply(ItosVO vo) {
    return mybatis.insert("itos.reply", vo);
  }
 
  @Override
  public List<ItosVO> list1(HashMap<String, Object> map) {
    return mybatis.selectList("itos.list1", map);
  }
 
}