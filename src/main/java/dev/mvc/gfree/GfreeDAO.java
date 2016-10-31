package dev.mvc.gfree;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.gfree.GfreeDAO")
public class GfreeDAO implements GfreeInter{

  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public GfreeDAO() {
    System.out.println("--> gfreeDAO created.");
  }
  
  @Override
  public int create(GfreeVO gfreeVO) {
    return mybatis.insert("gfree.create", gfreeVO);
  }
 
  @Override
  public int update(GfreeVO gfreeVO) { 
    return mybatis.update("gfree.update", gfreeVO);
  }

  @Override
  public int delete(int cm_no) {
    return mybatis.delete("gfree.delete", cm_no);
  }

  @Override
  public GfreeVO read(int cm_no) {
    return mybatis.selectOne("gfree.read", cm_no);
  }

  @Override
  public int count(HashMap hashmap) {
    return mybatis.selectOne("gfree.count", hashmap);
  }

  @Override
  public int updateAnsnum(GfreeVO gfreeVO) {
    return mybatis.update("gfree.updateAnsnum", gfreeVO);
  }

  @Override
  public int reply(GfreeVO gfreeVO) {
    return mybatis.insert("gfree.reply", gfreeVO);
  }

  @Override
  public List<GfreeVO> list(HashMap<String, Object> Map) {
    return mybatis.selectList("gfree.list", Map);
  }

  @Override
  public int update_cnt(int cm_no) {
    return mybatis.update("gfree.update_cnt", cm_no);
  }

  @Override
  public List<GfreeVO> listmenu(int cm_no) {
    return mybatis.selectList("gfree.listmenu", cm_no);
  }

  @Override
  public List<GfreeVO> bonlist() {
    return mybatis.selectList("gfree.bonlist");
  }

  @Override
  public GfreeVO bonread(int grpno) {
    return mybatis.selectOne("gfree.bonread", grpno);
  }

  @Override
  public int maxlist() {
    return mybatis.selectOne("gfree.maxlist");
  }

  @Override
  public int minlist() {
    return mybatis.selectOne("gfree.minlist");
  }
 
}