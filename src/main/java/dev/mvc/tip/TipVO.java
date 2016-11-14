package dev.mvc.tip;

public class TipVO {
/* 
CREATE TABLE tip (             -- �ڼҼ� ���̺�
  tp_no      NUMBER(7)       NOT NULL,   -- �� ��ȣ
  tp_title   VARCHAR2(4000)  NOT NULL,  -- ����
  tp_content VARCHAR2(4000)  NOT NULL,   -- ����
  tp_date    DATE            sysdate,   -- ��� �ð�
  tp_ch      VARCHAR2(2)  NOT NULL,   -- ��� �ð�
  PRIMARY KEY (tp_no)            -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);
 */
  /** �����ȣ */
  private int tp_no;
  /** ���� */
  private String tp_title;
  /** �亯 */
  private String tp_content;
  /** ��¥ */
  private String tp_date;
  /** �Ǻ� */  
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
