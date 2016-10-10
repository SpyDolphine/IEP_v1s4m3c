package dev.mvc.notice;

public class NoticeVO {
  /*
  CREATE TABLE notice ( -- 공지사항 테이블
    nt_no       NUMBER(7)     NOT NULL, -- 글 번호
    nt_id       VARCHAR2(100)   NOT NULL, --이메일 
    nt_nick     VARCHAR2(40) NOT NULL, -- 닉네임
    nt_title    VARCHAR2(200)  NOT NULL, -- 제목
    nt_content  VARCHAR2(4000) NOT NULL, -- 내용
    nt_date       DATE        NOT NULL, -- 등록시간    
    PRIMARY KEY (nt_no)       -- 한번 등록된 값은 중복 안됨
  );
  */
  private int nt_no;
  private String nt_id;
  private String nt_nick;
  private String nt_title;
  private String nt_content;
  private int nt_date;
  public int getNt_no() {
    return nt_no;
  }
  public void setNt_no(int nt_no) {
    this.nt_no = nt_no;
  }
  public String getNt_id() {
    return nt_id;
  }
  public void setNt_id(String nt_id) {
    this.nt_id = nt_id;
  }
  public String getNt_nick() {
    return nt_nick;
  }
  public void setNt_nick(String nt_nick) {
    this.nt_nick = nt_nick;
  }
  public String getNt_title() {
    return nt_title;
  }
  public void setNt_title(String nt_title) {
    this.nt_title = nt_title;
  }
  public String getNt_content() {
    return nt_content;
  }
  public void setNt_content(String nt_content) {
    this.nt_content = nt_content;
  }
  public int getNt_date() {
    return nt_date;
  }
  public void setNt_date(int nt_date) {
    this.nt_date = nt_date;
  }
  
  
}
