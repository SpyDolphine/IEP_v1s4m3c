package dev.mvc.mfree;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.mfree.MfDAO")
public class MfDAO implements MfInter{

  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public MfDAO() {
    System.out.println("--> MfDAO created.");
  }
  
  @Override
  public int create(MfVO mfVO) {
    return mybatis.insert("mfree.create", mfVO);
  }
 
  @Override
  public int update(MfVO mfVO) { 
    return mybatis.update("mfree.update", mfVO);
  }

  @Override
  public int delete(HashMap hashmap) {
    return mybatis.delete("mfree.delete", hashmap);
  }

  @Override
  public MfVO read(int cm_no) {
    return mybatis.selectOne("mfree.read", cm_no);
  }

  @Override
  public int count(HashMap hashmap) {
    return mybatis.selectOne("mfree.count", hashmap);
  }

  @Override
  public int updateAnsnum(MfVO mfVO) {
    return mybatis.update("mfree.updateAnsnum", mfVO);
  }

  @Override
  public int reply(MfVO mfVO) {
    return mybatis.insert("mfree.reply", mfVO);
  }

  @Override
  public List<MfVO> list(HashMap<String, Object> Map) {
    return mybatis.selectList("mfree.list", Map);
  }

  @Override
  public int update_cnt(int cm_no) {
    return mybatis.update("mfree.update_cnt", cm_no);
  }

  @Override
  public List<MfVO> listmenu(int cm_no) {
    return mybatis.selectList("mfree.listmenu", cm_no);
  }

  @Override
  public List<MfVO> bonlist() {
    return mybatis.selectList("mfree.bonlist");
  }

  @Override
  public MfVO bonread(int grpno) {
    return mybatis.selectOne("mfree.bonread", grpno);
  }

  @Override
  public int maxlist() {
    return mybatis.selectOne("mfree.maxlist");
  }

  @Override
  public int minlist() {
    return mybatis.selectOne("mfree.minlist");
  }

  @Override
  public int likeit(int cm_no) {
    return mybatis.update("mfree.likeit", cm_no);
  }

  @Override
  public int likedown(int cm_no) {
    return mybatis.update("mfree.likedown", cm_no);
  }
 
}