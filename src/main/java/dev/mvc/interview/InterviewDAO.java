package dev.mvc.interview;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.interview.InterviewDAO")
public class InterviewDAO implements InterviewDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public InterviewDAO(){
    System.out.println("--> InterviewDAO created.");  
  }
  
  @Override
  public int create(InterviewVO interviewVO) {
    return mybatis.insert("interview.create", interviewVO);
  }

  @Override
  public List<InterviewVO> list() {
    return mybatis.selectList("interview.list");
  }

  @Override
  public int update(InterviewVO interviewVO) {
    return mybatis.update("interview.update", interviewVO);
  }

  @Override
  public int delete(int iv_no) {
    return mybatis.delete("interview.delete", iv_no);
  }

  @Override
  public InterviewVO read(int iv_no) {
    return mybatis.selectOne("interview.read", iv_no);
  }

}
 