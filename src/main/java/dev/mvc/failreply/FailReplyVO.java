package dev.mvc.failreply;

public class FailReplyVO {
/*
create table reply(
 rno          NUMBER(7)       not null,                   -- �� ��ȣ
 if_no        NUMBER(7)       not null,                   -- �� ��ȣ
 rnick        varchar2(30)    not null,                   -- �г���
 rcontent     varchar2(4000)  not null,                   -- �� ����
 likeup       NUMBER(7)       default 0,                  -- ��õ
 likedown     NUMBER(7)       default 0,                  -- ����õ
 grpno        NUMBER(7)       NOT NULL,
 indent       NUMBER(2)       DEFAULT 0,
 ansnum       NUMBER(5)       DEFAULT 0,  
 rdate        DATE            not null,                   -- ��ϳ�¥
 PRIMARY KEY(rno), 
 FOREIGN KEY (cm_no) REFERENCES commu_free(cm_no)
)
 */
  
  private int rno;
  private int if_no;
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
  public int getIf_no() {
    return if_no;
  }
  public void setIf_no(int if_no) {
    this.if_no = if_no;
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
