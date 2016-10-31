package dev.mvc.fnq;

public class FnqVO {
/* 
CREATE TABLE fnq (                         -- 자주묻는 질문
  fq_no           NUMBER(7)      NOT NULL, -- 글 번호
  me_no           NUMBER(7)      ,         -- 회원번호
  fq_question     VARCHAR2(4000) NOT NULL, -- 질문
  fq_answer       VARCHAR2(4000) NOT NULL, -- 답변
  fq_date         DATE        default sysdate  NOT NULL, -- 등록시간    
  fq_CH           CHAR      NOT NULL,            -- 홈페이지질문인지 회사질문이지 분별
  --FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no), -- 카테고리번호
  PRIMARY KEY (fq_no)       -- 한번 등록된 값은 중복 안됨
);
 */
  /** 질답번호 */
  private int fq_no;
  /** 회원번호 */
  private int me_no;
  /** 질문 */
  private String fq_question;
  /** 답변 */
  private String fq_answer;
  /** 날짜 */
  private String fq_date;
  /** 홈페이지용인지 회사용인지 판별문자 */
  private Character fq_CH;
  public int getFq_no() {
    return fq_no;
  }
  public void setFq_no(int fq_no) {
    this.fq_no = fq_no;
  }
  public int getMe_no() {
    return me_no;
  }
  public void setMe_no(int me_no) {
    this.me_no = me_no;
  }
  public String getFq_question() {
    return fq_question;
  }
  public void setFq_question(String fq_question) {
    this.fq_question = fq_question;
  }
  public String getFq_answer() {
    return fq_answer;
  }
  public void setFq_answer(String fq_answer) {
    this.fq_answer = fq_answer;
  }
  public String getFq_date() {
    return fq_date;
  }
  public void setFq_date(String fq_date) {
    this.fq_date = fq_date;
  }
  public Character getFq_CH() {
    return fq_CH;
  }
  public void setFq_CH(Character fq_CH) {
    this.fq_CH = fq_CH;
  }
}
