package dev.mvc.division;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository("dev.mvc.division.DivisionDAO")
public class DivisionDAO implements DivisionDAOInter {
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼

  public DivisionDAO(){
    System.out.println("--> DivisionDAO created.");  
  }
  
  @Override
  public int create(DivisionVO divisionVO) {
    return mybatis.insert("division.create", divisionVO);
  }

  @Override
  public List<Category_Division_VO> category_division_list() {
    return mybatis.selectList("division.category_division_list");
  }

  @Override
  public int countByCategory(int categoryno) {
    return mybatis.selectOne("division.countByCategory",categoryno);
  }

  @Override
  public List list() {
    return mybatis.selectList("division.list");
  }
 
  @Override
  public DivisionVO read(int categoryno) {
    return mybatis.selectOne("division.read", categoryno);
  }
 
  @Override
  public int update(DivisionVO divisionVO) {
    return mybatis.update("division.update", divisionVO);
  }

  @Override
  public int delete(int categoryno) {
    return mybatis.delete("division.delete", categoryno);
  }

  @Override
  public int up(DivisionVO divisionVO) {
    return mybatis.update("division.up", divisionVO);
  }

  @Override
  public int down(DivisionVO divisionVO) {
    return mybatis.update("division.down", divisionVO);
  }
  
  @Override
  public int increaseCnt(int categoryno) {
    return mybatis.update("division.increaseCnt",categoryno);
  }
 
  @Override
  public int decreaseCnt(int categoryno) {
    return mybatis.update("division.decreaseCnt",categoryno);
  }
  
  
}