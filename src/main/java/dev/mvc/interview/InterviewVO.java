package dev.mvc.interview;

public class InterviewVO {
/* 
  CREATE TABLE interview (                 -- ���� ���̺�
    iv_no      NUMBER(7)       NOT NULL,   -- �� ��ȣ
    iv_title   VARCHAR2(120)   NOT NULL,   -- ����
    iv_content VARCHAR2(4000)  NOT NULL,   -- ����
    iv_date    DATE            default sysdate,   -- ��� �ð�
    PRIMARY KEY (iv_no)            -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
  );
 */
  /** ��� ��ȣ */
  private int iv_no;
  /** ���� */
  private String iv_title;
  /** ���� */
  private String iv_content;
  /** ��¥ */
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
