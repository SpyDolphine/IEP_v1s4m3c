package dev.mvc.servey;

public class ServeyVO {
/* 
CREATE TABLE servey( -- 설문조사
  serveyno    NUMBER(7)     NOT NULL,    --설문조사 번호
  sb_no       NUMBER(7)     NOT NULL,    --게시판 번호
  item        VARCHAR2(200) NOT NULL,    --설문조사 항목
  cnt         NUMBER(7)     DEFAULT 0,   --설문조사 카운트
  aver        NUMBER(3)     DEFAULT 0,   --평균수치
  FOREIGN KEY (sb_no) REFERENCES serveyboard (sb_no), -- 보드 넘버
  PRIMARY KEY(serveyno)
);
 */
  /** 설문조사 */
  private int serveyno;
  /** 게시판 번호 */
  private int sb_no;
  /** 설문조사 항목 */
  private String item;
  /** 설문조사 카운트 */
  private int cnt;
  /** 백분율 */
  private int aver;
  
  public int getServeyno() {
    return serveyno;
  }
  public void setServeyno(int serveyno) {
    this.serveyno = serveyno;
  }
  public int getSb_no() {
    return sb_no;
  }
  public void setSb_no(int sb_no) {
    this.sb_no = sb_no;
  }
  public String getItem() {
    return item;
  }
  public void setItem(String item) {
    this.item = item;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getAver() {
    return aver;
  }
  public void setAver(int aver) {
    this.aver = aver;
  }
  
  
}
