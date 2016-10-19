package dev.mvc.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.board.BoardDAO")
public class BoardDAO implements BoardDAOInter {
  @Autowired
  private SqlSessionTemplate mybatis; //MyBATIS 3 ¿¬°á °´Ã¼
  
  public BoardDAO(){
    System.out.println("--> BoardDAO creatd.");
  }

  @Override
  public int create(BoardVO boardVO) {
    return mybatis.insert("board.create", boardVO);
  }

  @Override
  public List<BoardVO> list() {
    return mybatis.selectList("board.list");
  }
  
  @Override
  public List<BoardVO> list_by_divisionno(int divisionno) {
    return mybatis.selectList("blog.list_by_divisionno", divisionno);
  }

  @Override
  public BoardVO read(int boardno) {
    return mybatis.selectOne("board.read", boardno);
  }

  @Override
  public int update(BoardVO boardVO) {
    return mybatis.update("board.update", boardVO);
  }
  
  @Override
  public int delete(int blogno) {
    return mybatis.delete("board.delete", blogno);
  }

  @Override
  public List<BoardVO> list2(HashMap hashMap) {
    return mybatis.selectList("board.list2", hashMap);
  }

  @Override
  public int count(HashMap hashMap) {
    return mybatis.selectOne("board.count", hashMap);
  }

  @Override
  public List<BoardVO> list3(HashMap hashMap) {
    return mybatis.selectList("board.list3", hashMap);
  }

  @Override
  public int updateAnsnum(BoardVO boardVO) {
    return mybatis.update("board.updateAnsnum", boardVO);
  }

  @Override
  public int reply(BoardVO boardVO) {
    return mybatis.insert("board.reply", boardVO);
  }

  @Override
  public List<BoardVO> list4(HashMap<String, Object> Map) {
    return mybatis.selectList("board.list4", Map);
  }
  
}