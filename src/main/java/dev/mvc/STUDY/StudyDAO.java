package dev.mvc.STUDY;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



  @Repository("dev.mvc.STUDY.StudyDAO")
  public class StudyDAO implements StudyDAOInter{
    
    @Autowired
    private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼
   
    public StudyDAO(){
      System.out.println("--> StudyDAO created.");  
    }
    @Override
    public int create(StudyVO vo) {
      return mybatis.insert("study.create", vo);
    }
    @Override 
    public StudyVO read(int sy_no) {
      return mybatis.selectOne("study.read", sy_no);
    }

    @Override
    public int update(StudyVO vo) {
      return mybatis.update("study.update", vo);
    }

    @Override
    public int delete(int sy_no) {
      return mybatis.delete("study.delete",sy_no);
    }

    @Override
    public List<StudyVO> list(HashMap hashMap) {
      return mybatis.selectList("study.list",hashMap);
    }
    @Override
    public int count(String gate) {
      return mybatis.selectOne("study.count", gate);
    }  
  }