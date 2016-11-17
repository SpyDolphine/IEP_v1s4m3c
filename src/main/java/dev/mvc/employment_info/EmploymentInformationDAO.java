package dev.mvc.employment_info;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.enterprise_info.EnterpriseInformationVO;

@Repository("dev.mvc.employment_info.EmploymentInformationDAO")
public class EmploymentInformationDAO implements EmploymentInformationDAOInter {
  
  @Autowired  
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼

  @Override
  public int create(EmploymentInformationVO emVO) {
    // TODO Auto-generated method stub
    // return 0;
    return mybatis.insert("employment_information.create", emVO);
  }
  
  @Override
  public int count(HashMap hashMap) {
    // TODO Auto-generated method stub
    // return 0;
    return mybatis.selectOne("employment_information.count", hashMap);
  }

  @Override
  public List<EmploymentInformationVO> list4(HashMap<String, Object> hashMap) {
    // TODO Auto-generated method stub
    //return null;
    return mybatis.selectList("employment_information.list4", hashMap);
  }

  @Override
  public EmploymentInformationVO read(int em_no) {
    // TODO Auto-generated method stub
    // return null
    return mybatis.selectOne("employment_information.read", em_no);
    
  }

  @Override
  public int update(EmploymentInformationVO emVO) {
    // TODO Auto-generated method stub
    // return 0;
    return mybatis.update("employment_information.update", emVO);
        
  }

  @Override
  public int delete(int em_no) {
    // TODO Auto-generated method stub
    // return 0;
    return mybatis.delete("employment_information.delete ", em_no);
  }
  
}
