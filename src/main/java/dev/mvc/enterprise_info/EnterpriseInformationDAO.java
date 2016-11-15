package dev.mvc.enterprise_info;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.enterprise_info.EnterpriseInformationDAO")
public class EnterpriseInformationDAO implements EnterpriseInformationDAOInter {
  
  @Autowired  
  private SqlSessionTemplate mybatis; // MyBATIS 3 ���� ��ü
  
  public EnterpriseInformationDAO(){
   System.out.println("--> EnterpriseInformationDAO created.");
  }
  
  /**
   * ���ڵ带 ����մϴ�.
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  @Override
  public int create(EnterpriseInformationVO eiVO) {
   // TODO Auto-generated method stub
    // <insert id="create" parameterType="EnterpriseInformationVO">
    return mybatis.insert("enterprise_information.create", eiVO);
    //return 0;
  }

  /**
   * ���ڵ带 ����մϴ�.
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  @Override
  public List<EnterpriseInformationVO> list() {
    return mybatis.selectList("enterprise_information.list");
  }

  @Override
  public EnterpriseInformationVO read(int ei_no) {
    // TODO Auto-generated method stub
    //return null;
    return mybatis.selectOne("enterprise_information.read", ei_no);
  }
  
  @Override
  public EnterpriseInformationVO update(int ei_no) {
    // TODO Auto-generated method stub
    // return null;
    return mybatis.selectOne("enterprise_information.updateread", ei_no);
  }

  @Override
  public int update(EnterpriseInformationVO eiVO) {
    // TODO Auto-generated method stub
    // return 0;
    return mybatis.update("enterprise_information.update", eiVO);
  }

  @Override
  public int delete(int ei_no) {
    // TODO Auto-generated method stub
    // return 0;
    return mybatis.delete("enterprise_information.delete", ei_no);
  }
  
  @Override
  public int count(HashMap hashMap) {
    // TODO Auto-generated method stub
    // return 0;
    return mybatis.selectOne("enterprise_information.count", hashMap);
  }

  @Override
  public List<EnterpriseInformationVO> list4(HashMap<String, Object> hashMap) {
    // TODO Auto-generated method stub
    // return null;
    return mybatis.selectList("enterprise_information.list4", hashMap);
  }
  
}
