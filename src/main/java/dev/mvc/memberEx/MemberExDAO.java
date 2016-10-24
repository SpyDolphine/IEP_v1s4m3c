package dev.mvc.memberEx;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.memberEx.MemberExDAO")
public class MemberExDAO implements MemberExDAOInter {
  @Autowired
  private SqlSessionTemplate mybatis;

  public MemberExDAO() {
    System.out.println("--> MemberExDAO create.");
  }

  @Override
  public int create(MemberExVO vo) {
    return mybatis.insert("memberex.create", vo);
  }

  @Override
  public int checkId(String me_id) {
    return mybatis.selectOne("memberex.checkId", me_id);
  }

  @Override
  public int checkNick(String me_nick) {
    return mybatis.selectOne("memberex.checkNick", me_nick);
  }

  @Override
  public int login(MemberExVO memberExVO) {
    return mybatis.selectOne("memberex.login", memberExVO);
  }

  @Override
  public MemberExVO read(int me_no) {
    return mybatis.selectOne("memberex.read", me_no);
  }

  @Override
  public int update(MemberExVO memberExVO) {
    return mybatis.update("memberex.update", memberExVO);
  }

  @Override
  public MemberExVO memberInfo(MemberExVO memberExVO) {
    return mybatis.selectOne("memberex.memberInfo", memberExVO);
  }
}
