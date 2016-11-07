package dev.mvc.notice;

public class NoticeVO {
  /*
    CREATE TABLE notice ( -- 공지사항 테이블
      nt_no       NUMBER(7)      NOT NULL, -- 글 번호
      me_no       NUMBER(7)      not null,         -- 회원번호
      nt_title    VARCHAR2(120)  NOT NULL, -- 제목
      nt_content  VARCHAR2(4000) NOT NULL, -- 내용
      nt_date       DATE         NOT NULL, -- 등록시간    
      --FOREIGN KEY (me_id) REFERENCES IEP_MEMBER (me_id), -- 카테고리번호
      PRIMARY KEY (nt_no)       -- 한번 등록된 값은 중복 안됨
    );
  */
  private int nt_no;
  private int me_no;
  private String nt_title;
  private String nt_nt;
  private String nt_content;
  private String nt_date;
  
  public int getNt_no() {
    return nt_no;
  }
  public void setNt_no(int nt_no) {
    this.nt_no = nt_no;
  }
  public int getMe_no() {
    return me_no;
  }
  public void setMe_no(int me_no) {
    this.me_no = me_no;
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
  public String getNt_date() {
    return nt_date;
  }
  public void setNt_date(String nt_date) {
    this.nt_date = nt_date;
  }
  public String getNt_nt() {
    return nt_nt;
  }
  public void setNt_nt(String nt_nt) {
    this.nt_nt = nt_nt;
  }
  
}
