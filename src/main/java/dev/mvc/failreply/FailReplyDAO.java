package dev.mvc.failreply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.failreply.FailReplyDAO")
public class FailReplyDAO implements FailReplyDAOInter {

  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public FailReplyDAO() {
    System.out.println("--> FailReplyDAO created.");
  }

  @Override
  public int create(FailReplyVO failreplyVO) {
    return mybatis.insert("failReply.create", failreplyVO);
  }

  @Override
  public List<FailReplyVO> replylist(int if_no) {
    return mybatis.selectList("failReply.replylist", if_no);
  }

  @Override
  public FailReplyVO read(int if_no) {
    return mybatis.selectOne("failReply.read", if_no);
  }

  @Override
  public int update(FailReplyVO failreplyVO) {
    return mybatis.update("failReply.update", failreplyVO);
  }

  @Override
  public int delete(int rno) {
    return mybatis.delete("failReply.delete", rno);
  }

  @Override
  public int updateAnsnum(FailReplyVO failreplyVO) {
    return mybatis.update("failReply.updateAnsnum", failreplyVO);
  }

  @Override
  public int reply(FailReplyVO failreplyVO) {
    return mybatis.insert("failReply.reply", failreplyVO);
  }

  @Override
  public int likeup(int rno) {
    return mybatis.update("failReply.likeup", rno);
  }

  @Override
  public int likedown(int rno) {
    return mybatis.update("failReply.likedown", rno);
  }

  @Override
  public int replycnt(int if_no) {
    return mybatis.selectOne("failReply.replycnt", if_no);
  }

  @Override
  public FailReplyVO replyread(int rno) {
    return mybatis.selectOne("failReply.replyread", rno);
  }
}
