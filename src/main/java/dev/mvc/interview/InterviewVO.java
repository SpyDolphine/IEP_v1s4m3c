package dev.mvc.interview;

public class InterviewVO {
/* 
  CREATE TABLE interview (                 -- 면접 테이블
    iv_no      NUMBER(7)       NOT NULL,   -- 글 번호
    iv_title   VARCHAR2(120)   NOT NULL,   -- 제목
    iv_content VARCHAR2(4000)  NOT NULL,   -- 내용
    iv_date    DATE            default sysdate,   -- 등록 시간
    PRIMARY KEY (iv_no)            -- 한번 등록된 값은 중복 안됨
  );
 */
  /** 면담 번호 */
  private int iv_no;
  /** 제목 */
  private String iv_title;
  /** 내용 */
  private String iv_content;
  /** 날짜 */
  private String iv_date;
  
  public int getIv_no() {
    return iv_no;
  }
  public void setIv_no(int iv_no) {
    this.iv_no = iv_no;
  }
  public String getIv_title() {
    return iv_title;
  }
  public void setIv_title(String iv_title) {
    this.iv_title = iv_title;
  }
  public String getIv_content() {
    return iv_content;
  }
  public void setIv_content(String iv_content) {
    this.iv_content = iv_content;
  }
  public String getIv_date() {
    return iv_date;
  }
  public void setIv_date(String iv_date) {
    this.iv_date = iv_date;
  }
  
}
