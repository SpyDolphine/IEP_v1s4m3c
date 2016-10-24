package dev.mvc.memberEx;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
  public int create_com(MemberExVO vo) {
    return mybatis.insert("memberex.create_com", vo);
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
  public MemberExVO memberInfo(String  me_id) {
    return mybatis.selectOne("memberex.memberInfo", me_id);
  }
  @Override
  public int memberout(MemberExVO memberExVO){
    return mybatis.update("memberex.memberout", memberExVO);
  }
  @Override
  public int memberin(MemberExVO memberExVO){
    return mybatis.update("memberex.memberout", memberExVO);
  }
  @Override
  public List<MemberExVO> memberlist(){
    return mybatis.selectList("memberex.memberlist");
  }
  @Override
  public int passwdCheck(int me_no, String me_pw) {
    Map map = new HashMap();
    map.put("me_no", me_no);
    map.put("me_pw", me_pw);
    return mybatis.selectOne("memberex.passwdCheck", map);
  }
 
  @Override
  public int update_passwd(int me_no, String me_pw) {
    Map map = new HashMap();
    map.put("me_no", me_no);
    map.put("me_pw", me_pw);
    return mybatis.update("memberex.update_passwd", map);
  }
}
