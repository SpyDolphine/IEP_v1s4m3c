package dev.mvc.gurume;
 
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.gurume.GurumeVO;


@Repository("dev.mvc.gurume.GurumeDAO")
public class GurumeDAO implements GurumeDAOInter{
   
  @Autowired
  private SqlSessionTemplate mybatis; //MyBATIS ¿¬°á
  
  public GurumeDAO() {
    System.out.println("--> GurumeDAO created."); }


  @Override
    public int create(GurumeVO gurumeVO) {
    return mybatis.insert("gurume.create", gurumeVO);
  }
  
  @Override
  public List<GurumeVO> list() {
    return mybatis.selectList("gurume.list");
  }
  
  @Override
  public GurumeVO read(int gu_no) {
    return mybatis.selectOne("gurume.read", gu_no);
  }
  @Override
  public int update(GurumeVO gurumeVO) { 
    return mybatis.update("gurume.update",gurumeVO);
  }
  @Override
  public int delete(int gu_no){
    return mybatis.update("gurume.delete",gu_no);
  }


  @Override
  public int cntup(int gu_no) {
    return mybatis.update("gurume.cntup",gu_no);
  }


  @Override
  public List<GurumeVO> list4(HashMap Map) {
    return mybatis.selectList("gurume.list4", Map);
  }


  @Override
  public int count(HashMap hashMap) {
    return mybatis.selectOne("gurume.count", hashMap);
  }


/*  @Override
  public int up(GurumeVO vo) {
    return mybatis.update("code.up", vo);
  }
 
  @Override
  public int down(GurumeVO vo) {
    return mybatis.update("code.down", vo);
  }*/
  }



