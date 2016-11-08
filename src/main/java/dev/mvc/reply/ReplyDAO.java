package dev.mvc.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.reply.ReplyDAO")
public class ReplyDAO implements ReplyDAOInter {

  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public ReplyDAO() {
    System.out.println("--> ReplyDAO created.");
  }

  @Override
  public int create(ReplyVO replyVO) {
    return mybatis.insert("reply.create", replyVO);
  }

  @Override
  public List<ReplyVO> replylist(int cm_no) {
    return mybatis.selectList("reply.replylist", cm_no);
  }

  @Override
  public ReplyVO read(int cm_no) {
    return mybatis.selectOne("reply.read", cm_no);
  }

  @Override
  public int update(ReplyVO replyVO) {
    return mybatis.update("reply.update", replyVO);
  }

  @Override
  public int delete(int rno) {
    return mybatis.delete("reply.delete", rno);
  }

  @Override
  public int updateAnsnum(ReplyVO replyVO) {
    return mybatis.update("reply.updateAnsnum", replyVO);
  }

  @Override
  public int reply(ReplyVO replyVO) {
    return mybatis.insert("reply.reply", replyVO);
  }

  @Override
  public int likeup(int rno) {
    return mybatis.update("reply.likeup", rno);
  }

  @Override
  public int likedown(int rno) {
    return mybatis.update("reply.likedown", rno);
  }

  @Override
  public int replycnt(int cm_no) {
    return mybatis.selectOne("reply.replycnt", cm_no);
  }

  @Override
  public ReplyVO replyread(int rno) {
    return mybatis.selectOne("reply.replyread", rno);
  }
}
