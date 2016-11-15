package dev.mvc.TQNA;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.TQNA.TqnaDAO")
public class TqnaDAO implements TqnaDAOInter {
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼

  public TqnaDAO() {
    System.out.println("--> TqnaDAO created.");
  }

  @Override
  public int create(TqnaVO tqnaVO) {
    return mybatis.insert("tqna.create", tqnaVO);
  }

  @Override
  public List<TqnaVO> list() {
    return mybatis.selectList("tqna.list");
  }

  @Override
  public TqnaVO read(int qa_no) {
    return mybatis.selectOne("tqna.read", qa_no);
  }

  @Override
  public int update(TqnaVO vo) {
    return mybatis.update("tqna.update", vo);
  }

  @Override
  public int delete(int qa_no) {
    return mybatis.delete("tqna.delete", qa_no);
  }

}