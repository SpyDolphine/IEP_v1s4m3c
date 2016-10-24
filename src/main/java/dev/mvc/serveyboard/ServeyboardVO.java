package dev.mvc.serveyboard;

public class ServeyboardVO {
  /* 
  CREATE TABLE serveyboard( -- �Խ���
    sb_no        NUMBER(7)        NOT NULL, -- �Խ��� ��ȣ
    title        VARCHAR2(200)    NOT NULL,                    -- �Խ��� �̸�
    content      VARCHAR2(4000)   NOT NULL,                    -- �Խ��� ����
    rdate        DATE             NOT NULL,                    -- �����
    PRIMARY KEY(sb_no)
  );
   */

  private int sb_no;
  private String title;
  private String content;
  private String rdate;
  
  public int getSb_no() {
    return sb_no;
  }
  public void setSb_no(int sb_no) {
    this.sb_no = sb_no;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
}
