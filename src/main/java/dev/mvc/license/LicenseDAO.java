package dev.mvc.license;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.license.LicenseDAO")
public class LicenseDAO implements LicenseDAOInter {
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼

  public LicenseDAO() {
    System.out.println("--> LicenseDAO created.");
  }

  @Override
  public int create(LicenseVO licenseVO) {
    return mybatis.insert("license.create", licenseVO);
  }

  @Override
  public List<LicenseVO> list() {
    return mybatis.selectList("license.list");
  }

  @Override
  public LicenseVO read(int lc_no) {
    return mybatis.selectOne("license.read", lc_no);
  }

  @Override
  public int update(LicenseVO vo) {
    return mybatis.update("license.update", vo);
  }

  @Override
  public int delete(int lc_no) {
    return mybatis.delete("license.delete", lc_no);
  }
}
