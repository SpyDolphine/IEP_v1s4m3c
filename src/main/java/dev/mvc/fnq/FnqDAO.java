package dev.mvc.fnq;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.fnq.FnqDAO")
public class FnqDAO implements FnqDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public FnqDAO(){
    System.out.println("--> FnqDAO created.");  
  }
  
  @Override
  public int create(FnqVO fnqVO) {
    return mybatis.insert("fnq.create", fnqVO);
  }

  @Override
  public List<FnqVO> listh() {
    return mybatis.selectList("fnq.listh");
  }
  
  @Override
  public List<FnqVO> listc() {
    return mybatis.selectList("fnq.listc");
  }

  @Override
  public int update(FnqVO fnqVO) {
    return mybatis.update("fnq.update", fnqVO);
  }

  @Override
  public int delete(int fq_no) {
    return mybatis.delete("fnq.delete", fq_no);
  }

  @Override
  public FnqVO read(int fq_no) {
    return mybatis.selectOne("fnq.read", fq_no);
  }

}
 