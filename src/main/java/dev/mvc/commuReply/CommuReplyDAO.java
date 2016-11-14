package dev.mvc.commuReply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.commuReply.CommuReplyDAO")
public class CommuReplyDAO implements CommuReplyDAOInter {

  @Autowired
  private SqlSessionTemplate mybatis; // MyBATIS3 ¿¬°á °´Ã¼
  
  public CommuReplyDAO() {
    System.out.println("--> CommuReplyDAO created.");
  }

  @Override
  public int create(CommuReplyVO commuReplyVO) {
    return mybatis.insert("commuReply.create", commuReplyVO);
  }

  @Override
  public List<CommuReplyVO> replylist(int cm_no) {
    return mybatis.selectList("commuReply.replylist", cm_no);
  }

  @Override
  public CommuReplyVO read(int cm_no) {
    return mybatis.selectOne("commuReply.read", cm_no);
  }

  @Override
  public int update(CommuReplyVO commuReplyVO) {
    return mybatis.update("commuReply.update", commuReplyVO);
  }

  @Override
  public int delete(int rno) {
    return mybatis.delete("commuReply.delete", rno);
  }

  @Override
  public int updateAnsnum(CommuReplyVO commuReplyVO) {
    return mybatis.update("commuReply.updateAnsnum", commuReplyVO);
  }

  @Override
  public int reply(CommuReplyVO commuReplyVO) {
    return mybatis.insert("commuReply.reply", commuReplyVO);
  }

  @Override
  public int likeup(int rno) {
    return mybatis.update("commuReply.likeup", rno);
  }

  @Override
  public int likedown(int rno) {
    return mybatis.update("commuReply.likedown", rno);
  }

  @Override
  public int replycnt(int cm_no) {
    return mybatis.selectOne("commuReply.replycnt", cm_no);
  }

  @Override
  public CommuReplyVO replyread(int rno) {
    return mybatis.selectOne("commuReply.replyread", rno);
  }
}
