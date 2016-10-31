package dev.mvc.ifree;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.ifree.IfreeDAO")
public class IfreeDAO implements IfreeInter{

  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public IfreeDAO() {
    System.out.println("--> IfreeDAO created.");
  }
  
  @Override
  public int create(IfreeVO ifreeVO) {
    return mybatis.insert("ifree.create", ifreeVO);
  }
 
  @Override
  public int update(IfreeVO ifreeVO) { 
    return mybatis.update("ifree.update", ifreeVO);
  }

  @Override
  public int delete(int cm_no) {
    return mybatis.delete("ifree.delete", cm_no);
  }

  @Override
  public IfreeVO read(int cm_no) {
    return mybatis.selectOne("ifree.read", cm_no);
  }

  @Override
  public int count(HashMap hashmap) {
    return mybatis.selectOne("ifree.count", hashmap);
  }

  @Override
  public int updateAnsnum(IfreeVO ifreeVO) {
    return mybatis.update("ifree.updateAnsnum", ifreeVO);
  }

  @Override
  public int reply(IfreeVO ifreeVO) {
    return mybatis.insert("ifree.reply", ifreeVO);
  }

  @Override
  public List<IfreeVO> list(HashMap<String, Object> Map) {
    return mybatis.selectList("ifree.list", Map);
  }

  @Override
  public int update_cnt(int cm_no) {
    return mybatis.update("ifree.update_cnt", cm_no);
  }

  @Override
  public List<IfreeVO> listmenu(int cm_no) {
    return mybatis.selectList("ifree.listmenu", cm_no);
  }

  @Override
  public List<IfreeVO> bonlist() {
    return mybatis.selectList("ifree.bonlist");
  }

  @Override
  public IfreeVO bonread(int grpno) {
    return mybatis.selectOne("ifree.bonread", grpno);
  }

  @Override
  public int maxlist() {
    return mybatis.selectOne("ifree.maxlist");
  }

  @Override
  public int minlist() {
    return mybatis.selectOne("ifree.minlist");
  }
 
}