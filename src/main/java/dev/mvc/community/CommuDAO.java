package dev.mvc.community;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.community.CommuDAO")
public class CommuDAO implements CommuInter{

  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public CommuDAO() {
    System.out.println("--> CommuDAO created.");
  }
  
  @Override
  public int create(CommuVO commuVO) {
    return mybatis.insert("community.create", commuVO);
  }
 
  @Override
  public int update(CommuVO commuVO) { 
    return mybatis.update("community.update", commuVO);
  }

  @Override
  public int delete(HashMap hashmap) {
    return mybatis.delete("community.delete", hashmap);
  }

  @Override
  public CommuVO read(int cm_no) {
    return mybatis.selectOne("community.read", cm_no);
  }

  @Override
  public int countA(HashMap hashmap) {
    return mybatis.selectOne("community.countA", hashmap);
  }

  @Override
  public int countB(HashMap hashmap) {
    return mybatis.selectOne("community.countB", hashmap);
  }
  
  @Override
  public int countC(HashMap hashmap) {
    return mybatis.selectOne("community.countC", hashmap);
  }

  @Override
  public int updateAnsnum(CommuVO commuVO) {
    return mybatis.update("community.updateAnsnum", commuVO);
  }

  @Override
  public int reply(CommuVO commuVO) {
    return mybatis.insert("community.reply", commuVO);
  }

  @Override
  public List<CommuVO> listA(HashMap<String, Object> Map) {
    return mybatis.selectList("community.listA", Map);
  }
  
  @Override
  public List<CommuVO> listB(HashMap<String, Object> Map) {
    return mybatis.selectList("community.listB", Map);
  } 
  
  @Override
  public List<CommuVO> listC(HashMap<String, Object> Map) {
    return mybatis.selectList("community.listC", Map);
  } 

  @Override
  public int update_cnt(int cm_no) {
    return mybatis.update("community.update_cnt", cm_no);
  }

  @Override
  public List<CommuVO> listmenuA(int cm_no) {
    return mybatis.selectList("community.listmenuA", cm_no);
  }
  
  @Override
  public List<CommuVO> listmenuB(int cm_no) {
    return mybatis.selectList("community.listmenuB", cm_no);
  }  
  
  @Override
  public List<CommuVO> listmenuC(int cm_no) {
    return mybatis.selectList("community.listmenuC", cm_no);
  } 

  @Override
  public List<CommuVO> bonlistA() {
    return mybatis.selectList("community.bonlistA");
  }

  @Override
  public List<CommuVO> bonlistB() {
    return mybatis.selectList("community.bonlistB");
  }
  
  @Override
  public List<CommuVO> bonlistC() {
    return mybatis.selectList("community.bonlistC");
  }
  
  @Override
  public CommuVO bonread(int grpno) {
    return mybatis.selectOne("community.bonread", grpno);
  }

  @Override
  public int maxlistA() {
    return mybatis.selectOne("community.maxlistA");
  }
  
  @Override
  public int maxlistB() {
    return mybatis.selectOne("community.maxlistB");
  } 
  
  @Override
  public int maxlistC() {
    return mybatis.selectOne("community.maxlistC");
  }

  @Override
  public int minlistA() {
    return mybatis.selectOne("community.minlistA");
  }
  
  @Override
  public int minlistB() {
    return mybatis.selectOne("community.minlistB");
  }  
  
  @Override
  public int minlistC() {
    return mybatis.selectOne("community.minlistC");
  }

  @Override
  public int likeit(int cm_no) {
    return mybatis.update("community.likeit", cm_no);
  }

  @Override
  public int likedown(int cm_no) {
    return mybatis.update("community.likedown", cm_no);
  }

}