package dev.mvc.scrap;

public class ScrapVO {

//  CREATE TABLE scrap(
//      sp_no                             NUMBER(7)    NOT NULL    PRIMARY KEY,
//      me_no                             NUMBER(7)     NULL ,
//      me_id                             VARCHAR2(100)    NOT NULL,
//      me_nick                             VARCHAR2(100)    NOT NULL,
//      ct_startdate   varchar2(50)              null,
//      ct_enddate   varchar2(50)              null,
//      ct_statedate        varchar2(50)      null,  
//      sp_title                          VARCHAR2(120)    NOT NULL,
//      sp_content                        VARCHAR2(100)    NOT NULL,
//      sp_date                           DATE     NOT NULL,
//      ct_no                             NUMBER(7)    NULL ,
//      FOREIGN KEY (me_no) REFERENCES iep_member (me_no),
//      FOREIGN KEY (ct_no) REFERENCES iep_contest (ct_no)
//  );
  /**��ũ�� ��ȣ */
  private int sp_no;
  /**��ũ���� ȸ�� ��ȣ */
  private int me_no;
  /**��ũ���� ȸ�� ���̵� */
  private String me_id;
  /**��ũ���� ȸ�� �г���*/
  private String me_nick;
  /**��ũ�� ���� */
  private String sp_title;
  /**��ũ�� ���� */
  private String sp_content;
  /**��ũ�� ��� ��ȣ */
  private String sp_date;
  /**��ũ�� �� ������ ��ȣ */
  private int ct_no;
  
  public int getSp_no() {
    return sp_no;
  }
  public void setSp_no(int sp_no) {
    this.sp_no = sp_no;
  }
  public int getMe_no() {
    return me_no;
  }
  public void setMe_no(int me_no) {
    this.me_no = me_no;
  }
  public String getMe_id() {
    return me_id;
  }
  public void setMe_id(String me_id) {
    this.me_id = me_id;
  }
  public String getMe_nick() {
    return me_nick;
  }
  public void setMe_nick(String me_nick) {
    this.me_nick = me_nick;
  }
  public String getSp_title() {
    return sp_title;
  }
  public void setSp_title(String sp_title) {
    this.sp_title = sp_title;
  }
  public String getSp_content() {
    return sp_content;
  }
  public void setSp_content(String sp_content) {
    this.sp_content = sp_content;
  }
  public String getSp_date() {
    return sp_date;
  }
  public void setSp_date(String sp_date) {
    this.sp_date = sp_date;
  }
  public int getCt_no() {
    return ct_no;
  }
  public void setCt_no(int ct_no) {
    this.ct_no = ct_no;
  }  
}
