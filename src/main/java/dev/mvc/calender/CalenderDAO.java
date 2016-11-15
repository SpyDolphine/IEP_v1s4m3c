package dev.mvc.calender;

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
    return mybatis.insert("calender.create");
  }
}
