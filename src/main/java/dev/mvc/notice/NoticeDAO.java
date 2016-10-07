package dev.mvc.notice;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.notice.NoticeDAO")
public class NoticeDAO implements NoticeDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public NoticeDAO(){
    System.out.println("--> NoticeDAO created.");  
  }
  @Override
  public int create(NoticeVO vo) {
    return mybatis.insert("notice.create", vo);
  }
  @Override
  public List<NoticeVO> list() {
    return mybatis.selectList("notice.list");
  }
  @Override
  public int update(NoticeVO vo) {
    return mybatis.update("notice.update", vo);
  }
  @Override
  public int delete(int nt_no) {
    return mybatis.delete("notice.delete", nt_no);
  }
  @Override
  public NoticeVO read(int nt_no) {
    return mybatis.selectOne("read", nt_no);
  }
  
}
 