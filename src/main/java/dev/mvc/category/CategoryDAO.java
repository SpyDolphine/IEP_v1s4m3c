package dev.mvc.category;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.category.CategoryDAO")
public class CategoryDAO implements CategoryDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public CategoryDAO(){
    System.out.println("--> CategoryDAO created.");  
  }
  @Override
  public int create(CategoryVO categoryVO) {
    return mybatis.insert("category.create", categoryVO);
  }
  @Override
  public CategoryVO read(int categoryno) {
    return mybatis.selectOne("category.read", categoryno);
  }
  @Override
  public List<CategoryVO> list() {
    return mybatis.selectList("category.list");
  }
  @Override
  public int update(CategoryVO categoryVO) {
    return mybatis.update("category.update", categoryVO);
  }
  @Override
  public int delete(int categoryno) {
    return mybatis.delete("category.delete", categoryno);
  }

}
 