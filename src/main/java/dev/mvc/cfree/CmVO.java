package dev.mvc.cfree;

public class CmVO {
  /*
   create table commu_free (
       cm_no        NUMBER(7)        not null,    -- �� ��ȣ
       cm_nick      varchar2(30)     not null,    -- �г���
       cm_title     varchar2(120)    not null,    -- �Խñ� ����
       cm_content   varchar2(4000)   not null,    -- �� ����
       cm_likeit    NUMBER(7)        default 0,   -- ���ƿ���                        
       cm_rdate     DATE             not null,    -- ��ϳ�¥
       PRIMARY KEY(cm_no)
      );
   */
  
  /** �� ��ȣ */
  private int cm_no;
  /** �г��� */
  private String cm_nick;
  /** �Խñ� ���� */
  private String cm_title;
  /** �� ���� */
  private String cm_content;
  /** ���ƿ��� */
  private int cm_likeit;
  /** ��ϳ�¥ */
  private String cm_rdate;
  
  
  public int getCm_no() {
    return cm_no;
  }
  public void setCm_no(int cm_no) {
    this.cm_no = cm_no;
  }
  public String getCm_nick() {
    return cm_nick;
  }
  public void setCm_nick(String cm_nick) {
    this.cm_nick = cm_nick;
  }
  public String getCm_title() {
    return cm_title;
  }
  public void setCm_title(String cm_title) {
    this.cm_title = cm_title;
  }
  public String getCm_content() {
    return cm_content;
  }
  public void setCm_content(String cm_content) {
    this.cm_content = cm_content;
  }
  public int getCm_likeit() {
    return cm_likeit;
  }
  public void setCm_likeit(int cm_likeit) {
    this.cm_likeit = cm_likeit;
  }
  public String getCm_rdate() {
    return cm_rdate;
  }
  public void setCm_rdate(String cm_rdate) {
    this.cm_rdate = cm_rdate;
  }
  
  
}
