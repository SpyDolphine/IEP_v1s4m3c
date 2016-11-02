package dev.mvc.cfree;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.cfree.CmDAO")
public class CmDAO implements CmInter{

  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public CmDAO() {
    System.out.println("--> CmDAO created.");
  }
  
  @Override
  public int create(CmVO cmVO) {
    return mybatis.insert("cfree.create", cmVO);
  }
 
  @Override
  public int update(CmVO cmVO) { 
    return mybatis.update("cfree.update", cmVO);
  }

  @Override
  public int delete(int cm_no) {
    return mybatis.delete("cfree.delete", cm_no);
  }

  @Override
  public CmVO read(int cm_no) {
    return mybatis.selectOne("cfree.read", cm_no);
  }

  @Override
  public List<CmVO> list(HashMap Map) {
    return mybatis.selectList("cfree.list", Map);
  }  

  @Override
  public int count(HashMap hashmap) {
    return mybatis.selectOne("cfree.count", hashmap);
  }

  @Override
  public int likeup(int cm_no) {
    return mybatis.update("cfree.likeup", cm_no);
  }

  @Override
  public int likedown(int cm_no) {
    return mybatis.update("cfree.likedown", cm_no);
  }

  @Override
  public int heart(CmVO cmVO) {
    return mybatis.update("cfree.heart", cmVO);
  }
}