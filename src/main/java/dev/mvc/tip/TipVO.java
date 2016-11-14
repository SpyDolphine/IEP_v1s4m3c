package dev.mvc.tip;

public class TipVO {
/* 
CREATE TABLE tip (             -- 자소서 테이블
  tp_no      NUMBER(7)       NOT NULL,   -- 글 번호
  tp_title   VARCHAR2(4000)  NOT NULL,  -- 제목
  tp_content VARCHAR2(4000)  NOT NULL,   -- 내용
  tp_date    DATE            sysdate,   -- 등록 시간
  tp_ch      VARCHAR2(2)  NOT NULL,   -- 등록 시간
  PRIMARY KEY (tp_no)            -- 한번 등록된 값은 중복 안됨
);
 */
  /** 질답번호 */
  private int tp_no;
  /** 질문 */
  private String tp_title;
  /** 답변 */
  private String tp_content;
  /** 날짜 */
  private String tp_date;
  /** 판별 */  
  private String tp_ch;
  
  public int getTp_no() {
    return tp_no;
  }
  public void setTp_no(int tp_no) {
    this.tp_no = tp_no;
  }
  public String getTp_title() {
    return tp_title;
  }
  public void setTp_title(String tp_title) {
    this.tp_title = tp_title;
  }
  public String getTp_content() {
    return tp_content;
  }
  public void setTp_content(String tp_content) {
    this.tp_content = tp_content;
  }
  public String getTp_date() {
    return tp_date;
  }
  public void setTp_date(String tp_date) {
    this.tp_date = tp_date;
  }
  public String getTp_ch() {
    return tp_ch;
  }
  public void setTp_ch(String tp_ch) {
    this.tp_ch = tp_ch;
  }

  
}
