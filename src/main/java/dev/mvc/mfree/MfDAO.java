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
  public int delete(int cm_no) {
    return mybatis.delete("mfree.delete", cm_no);
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
  public int updateAnsnum(MfVO mgVO) {
    return mybatis.update("mfree.updateAnsnum", mgVO);
  }

  @Override
  public int reply(MfVO mfVO) {
    return mybatis.insert("mfree.reply", mfVO);
  }

  @Override
  public List<MfVO> list(HashMap<String, Object> Map) {
    return mybatis.selectList("mfree.list", Map);
  }
 
}