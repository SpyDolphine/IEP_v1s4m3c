package dev.mvc.calender;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.calender.CalenderDAO")
public class CalenderDAO implements CalenderDAOInter {

  @Autowired
  private SqlSessionTemplate mybatis;
  
  public CalenderDAO() {
    System.out.println("--> CalenderDAO create.");
  }
  public int create(CalenderVO calenderVO){
    return mybatis.insert("calender.create", calenderVO);
  }
  public List<CalenderVO> callist(int me_no){
    return mybatis.selectList("calender.callist", me_no);
  }
//  public List<CalenderVO> calendermode(String str){
//    return mybatis.selectList("calender.calendermode", str);
//  }
}
