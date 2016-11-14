package dev.mvc.dat;

public class DatVO {
/*
CREATE TABLE dat(
    dno                               NUMBER(7)      NOT NULL PRIMARY KEY,    -- 댓글 번호
    gu_no                             NUMBER(7)      NOT NULL,                -- 맛집 글 번호
    d_name                            VARCHAR2(100)  NOT NULL,                -- 닉네임
    d_cont                            VARCHAR2(4000) NOT NULL,                -- 내용
    d_date                            DATE           NOT NULL,                -- 날짜
    likeup                            NUMBER(7)       default 0,                  -- 추천
    likedown                          NUMBER(7)       default 0,                  -- 비추천
    grpno                             NUMBER(7)       NOT NULL,
    indent                            NUMBER(2)       DEFAULT 0,
    ansnum                            NUMBER(5)       DEFAULT 0,  
   FOREIGN KEY (gu_no) REFERENCES gurume(gu_no)
 );
 */
  
  private int dno;
  private int gu_no;
  private String d_name;
  private String d_cont;
  private String d_date;
  private int likeup;
  private int likedown;
  private int grpno;
  private int indent;
  private int ansnum;
  
  
  public int getDno() {
    return dno;
  }
  public void setDno(int dno) {
    this.dno = dno;
  }
  public int getGu_no() {
    return gu_no;
  }
  public void setGu_no(int gu_no) {
    this.gu_no = gu_no;
  }
  public String getD_name() {
    return d_name;
  }
  public void setD_name(String d_name) {
    this.d_name = d_name;
  }
  public String getD_cont() {
    return d_cont;
  }
  public void setD_cont(String d_cont) {
    this.d_cont = d_cont;
  }
  public String getD_date() {
    return d_date;
  }
  public void setD_date(String d_date) {
    this.d_date = d_date;
  }
  public int getLikeup() {
    return likeup;
  }
  public void setLikeup(int likeup) {
    this.likeup = likeup;
  }
  public int getLikedown() {
    return likedown;
  }
  public void setLikedown(int likedown) {
    this.likedown = likedown;
  }
  public int getGrpno() {
    return grpno;
  }
  public void setGrpno(int grpno) {
    this.grpno = grpno;
  }
  public int getIndent() {
    return indent;
  }
  public void setIndent(int indent) {
    this.indent = indent;
  }
  public int getAnsnum() {
    return ansnum;
  }
  public void setAnsnum(int ansnum) {
    this.ansnum = ansnum;
  }
  
  
  
  
  
}
