package dev.mvc.aboutme;

public class AboutmeVO {
/* 
CREATE TABLE about_me (             -- 자소서 테이블
  am_no      NUMBER(7)       NOT NULL,   -- 글 번호
  am_title   VARCHAR2(4000)  NOT NULL,  -- 제목
  am_content VARCHAR2(4000)  NOT NULL,   -- 내용
  am_date    DATE            sysdate,   -- 등록 시간
  PRIMARY KEY (am_no)            -- 한번 등록된 값은 중복 안됨
);
 */
  /** 질답번호 */
  private int am_no;
  /** 질문 */
  private String am_title;
  /** 답변 */
  private String am_content;
  /** 날짜 */
  private String am_date;
  
  public int getAm_no() {
    return am_no;
  }
  public void setAm_no(int am_no) {
    this.am_no = am_no;
  }
  public String getAm_title() {
    return am_title;
  }
  public void setAm_title(String am_title) {
    this.am_title = am_title;
  }
  public String getAm_content() {
    return am_content;
  }
  public void setAm_content(String am_content) {
    this.am_content = am_content;
  }
  public String getAm_date() {
    return am_date;
  }
  public void setAm_date(String am_date) {
    this.am_date = am_date;
  }
  
  
}
