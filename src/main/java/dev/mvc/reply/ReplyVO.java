package dev.mvc.reply;

public class ReplyVO {
/*
create table reply(
 rno          NUMBER(7)       not null,                   -- 글 번호
 cm_no        NUMBER(7)       not null,                   -- 글 번호
 rnick        varchar2(30)    not null,                   -- 닉네임
 rcontent     varchar2(4000)  not null,                   -- 글 내용
 likeup       NUMBER(7)       default 0,                  -- 추천
 likedown     NUMBER(7)       default 0,                  -- 비추천
 grpno        NUMBER(7)       NOT NULL,
 indent       NUMBER(2)       DEFAULT 0,
 ansnum       NUMBER(5)       DEFAULT 0,  
 rdate        DATE            not null,                   -- 등록날짜
 PRIMARY KEY(rno), 
 FOREIGN KEY (cm_no) REFERENCES commu_free(cm_no)
)
 */
  
  private int rno;
  private int cm_no;
  private String rnick;
  private String rcontent;
  private int likeup;
  private int likedown;
  private int grpno;
  private int indent;
  private int ansnum;
  private String rdate;
  
  
  public int getRno() {
    return rno;
  }
  public void setRno(int rno) {
    this.rno = rno;
  }
  public int getCm_no() {
    return cm_no;
  }
  public void setCm_no(int cm_no) {
    this.cm_no = cm_no;
  }
  public String getRnick() {
    return rnick;
  }
  public void setRnick(String rnick) {
    this.rnick = rnick;
  }
  public String getRcontent() {
    return rcontent;
  }
  public void setRcontent(String rcontent) {
    this.rcontent = rcontent;
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
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}
