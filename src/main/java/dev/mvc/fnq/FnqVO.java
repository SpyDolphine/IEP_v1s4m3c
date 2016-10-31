package dev.mvc.fnq;

public class FnqVO {
/* 
CREATE TABLE fnq (                         -- ���ֹ��� ����
  fq_no           NUMBER(7)      NOT NULL, -- �� ��ȣ
  me_no           NUMBER(7)      ,         -- ȸ����ȣ
  fq_question     VARCHAR2(4000) NOT NULL, -- ����
  fq_answer       VARCHAR2(4000) NOT NULL, -- �亯
  fq_date         DATE        default sysdate  NOT NULL, -- ��Ͻð�    
  fq_CH           CHAR      NOT NULL,            -- Ȩ�������������� ȸ���������� �к�
  --FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no), -- ī�װ���ȣ
  PRIMARY KEY (fq_no)       -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);
 */
  /** �����ȣ */
  private int fq_no;
  /** ȸ����ȣ */
  private int me_no;
  /** ���� */
  private String fq_question;
  /** �亯 */
  private String fq_answer;
  /** ��¥ */
  private String fq_date;
  /** Ȩ������������ ȸ������� �Ǻ����� */
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
