package dev.mvc.aboutme;

public class AboutmeVO {
/* 
CREATE TABLE about_me (             -- �ڼҼ� ���̺�
  am_no      NUMBER(7)       NOT NULL,   -- �� ��ȣ
  am_title   VARCHAR2(4000)  NOT NULL,  -- ����
  am_content VARCHAR2(4000)  NOT NULL,   -- ����
  am_date    DATE            sysdate,   -- ��� �ð�
  PRIMARY KEY (am_no)            -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);
 */
  /** �����ȣ */
  private int am_no;
  /** ���� */
  private String am_title;
  /** �亯 */
  private String am_content;
  /** ��¥ */
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
