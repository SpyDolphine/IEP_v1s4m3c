package dev.mvc.STUDY;

import org.springframework.web.multipart.MultipartFile;

public class StudyVO {
  /*
   * CREATE TABLE STUDY  ( --It Table Web
      sy_no    NUMBER(7)                 NOT NULL PRIMARY KEY, -- �� ��ȣ
      title       VARCHAR2(120)          NOT NULL, -- ����
      content  VARCHAR2(4000)         NOT NULL, -- ����
      file1      VARCHAR2(100)                 NULL ,--Thumb ����
      file2       VARCHAR2(500)                NULL ,--����2
      size2      NUMBER(9)  DEFAULT 0      NULL ,--����2ũ��
      cnt        NUMBER(7)  DEFAULT 0 NOT NULL,--��ȸ��
      sy_date    DATE                        NOT NULL,-- �Խù� ��Ͻð�   
      gate       VARCHAR2(10)           NOT NULL-- APP(AC,AP,AJ),WEB(WJ,WC,WH)
    );
    */
  /**  �۹�ȣ */
  private int sy_no;
  /**  ������ */
  private String title;
  /**  �۳��� */
  private String content;
  /**  ����1 */
  private String file1 = "";
  /**  ����2 */
  private String file2 = "";
  /**  ������2 */
  private long size2 = 0;
  /**  ��ȸ�� */
  private int cnt = 0;
  /**  ������� */
  private String sy_date;
  /**  ī�װ� */
  private String gate;
  
  /** Spring Framework���� �ڵ� ���ԵǴ� ���ε� ���� ��ü, ���� �÷��� �������� ����. */
  private MultipartFile file2MF;
  /** size2�� �ĸ� ���� ��¿� ����, ���� �÷��� �������� ����. */
  private String size2Label;
  public int getSy_no() {
    return sy_no;
  }
  public void setSy_no(int sy_no) {
    this.sy_no = sy_no;
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
  public String getFile1() {
    if(file1 == null){
      file1 = "";
    }
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getFile2() {
    if(file2 == null){
      file2 = "";
    }
    return file2;
  }
  public void setFile2(String file2) {
    this.file2 = file2;
  }
  public long getSize2() {
    return size2;
  }
  public void setSize2(long size2) {
    this.size2 = size2;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getSy_date() {
    return sy_date;
  }
  public void setSy_date(String sy_date) {
    this.sy_date = sy_date;
  }
  public String getGate() {
    return gate;
  }
  public void setGate(String gate) {
    this.gate = gate;
  }
  public MultipartFile getFile2MF() {
    return file2MF;
  }
  public void setFile2MF(MultipartFile file2mf) {
    file2MF = file2mf;
  }
  public String getSize2Label() {
    return size2Label;
  }
  public void setSize2Label(String size2Label) {
    this.size2Label = size2Label;
  }  
}