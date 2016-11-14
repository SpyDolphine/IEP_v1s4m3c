package dev.mvc.dat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.dat.DatDAO")
public class DatDAO implements DatDAOInter {

  @Autowired 
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public DatDAO() {
    System.out.println("--> DatDAO created.");
  }

  @Override
  public int create(DatVO datVO) {
    return mybatis.insert("dat.create",datVO);
  }

  @Override
  public List<DatVO> datlist(int gu_no) {
    return mybatis.selectList("dat.datlist", gu_no);
  }

  @Override
  public DatVO read(int gu_no) {
    return mybatis.selectOne("dat.read", gu_no);
  }

  @Override
  public int update(DatVO datVO) {
    return mybatis.update("dat.update", datVO);
  }

  @Override
  public int delete(int dno) {
    return mybatis.delete("dat.delete", dno);
  }

  @Override
  public int updateAnsnum(DatVO datVO) {
    return mybatis.update("dat.updateAnsnum", datVO);
  }

  @Override
  public int dat(DatVO datVO) {
    return mybatis.insert("dat.dat", datVO);
  }

  @Override
  public int likeup(int dno) {
    return mybatis.update("dat.likeup", dno);
  }

  @Override
  public int likedown(int dno) {
    return mybatis.update("dat.likedown", dno);
  }

  @Override
  public int datcnt(int gu_no) {
    return mybatis.selectOne("dat.datcnt", gu_no);
  } 

  @Override
  public DatVO datread(int dno) {
    return mybatis.selectOne("dat.datread", dno);
  }
}
