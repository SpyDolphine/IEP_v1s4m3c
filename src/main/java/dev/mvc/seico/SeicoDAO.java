package dev.mvc.seico;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.seico.SeicoDAO")
public class SeicoDAO implements SeicoDAOInter {
  @Autowired
  private SqlSessionTemplate mybatis; //MyBATIS 3 ¿¬°á °´Ã¼
  
  public SeicoDAO(){
    System.out.println("--> SeicoDAO creatd.");
  }

  @Override
  public int create(SeicoVO seicoVO) {
    return mybatis.insert("seico.create", seicoVO);
  }

  @Override
  public List<SeicoVO> list() {
    return mybatis.selectList("seico.list");
  }
  /*
  @Override
  public List<SeicoVO> list_by_divisionno(int divisionno) {
    return mybatis.selectList("blog.list_by_divisionno", divisionno);
  }*/

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
/*
  @Override
  public List<SeicoVO> list2(HashMap hashMap) {
    return mybatis.selectList("board.list2", hashMap);
  }*/

  @Override
  public int count(HashMap hashMap) {
    return mybatis.selectOne("seico.count", hashMap);
  }
/*
  @Override
  public List<SeicoVO> list3(HashMap hashMap) {
    return mybatis.selectList("board.list3", hashMap);
  }

  @Override
  public int updateAnsnum(SeicoVO boardVO) {
    return mybatis.update("board.updateAnsnum", boardVO);
  }

  @Override
  public int reply(SeicoVO boardVO) {
    return mybatis.insert("board.reply", boardVO);
  }*/

  @Override
  public List<SeicoVO> list4(HashMap/*<String, Object>*/ Map) {
    return mybatis.selectList("seico.list4", Map);
  }

  @Override
  public int cntup(int sc_no) {
    return mybatis.update("seico.cntup", sc_no);
  }
  
}