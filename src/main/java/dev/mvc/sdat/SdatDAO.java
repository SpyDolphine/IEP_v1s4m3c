package dev.mvc.sdat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.sdat.SdatDAO")
public class SdatDAO implements SdatDAOInter {

  @Autowired 
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public SdatDAO() {
    System.out.println("--> SdatDAO created.");
  }

  @Override
  public int create(SdatVO sdatVO) {
    return mybatis.insert("sdat.create",sdatVO);
  }

  @Override
  public List<SdatVO> sdatlist(int sc_no) {
    return mybatis.selectList("sdat.sdatlist", sc_no);
  }

  @Override
  public SdatVO read(int sc_no) {
    return mybatis.selectOne("sdat.read", sc_no);
  }

  @Override
  public int update(SdatVO sdatVO) {
    return mybatis.update("sdat.update", sdatVO);
  }

  @Override
  public int delete(int sd_no) {
    return mybatis.delete("sdat.delete", sd_no);
  }

  @Override
  public int updateAnsnum(SdatVO sdatVO) {
    return mybatis.update("sdat.updateAnsnum", sdatVO);
  }

  @Override
  public int sdat(SdatVO sdatVO) {
    return mybatis.insert("sdat.sdat", sdatVO);
  }

  @Override
  public int likeup(int sd_no) {
    return mybatis.update("sdat.likeup", sd_no);
  }

  @Override
  public int likedown(int sd_no) {
    return mybatis.update("sdat.likedown", sd_no);
  }

  @Override
  public int sdatcnt(int sc_no) {
    return mybatis.selectOne("sdat.sdatcnt", sc_no);
  }

  @Override
  public SdatVO sdatread(int sd_no) {
    return mybatis.selectOne("sdat.sdatread", sd_no);
  }
}
