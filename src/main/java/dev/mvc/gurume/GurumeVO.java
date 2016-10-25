package dev.mvc.gurume;

import org.springframework.web.multipart.MultipartFile;

public class GurumeVO {

  /*gu_no                             NUMBER(7)    NOT NULL    PRIMARY KEY,
  gu_name                           VARCHAR2(40)     NOT NULL,
  gu_title                          VARCHAR2(120)    NOT NULL,
  gu_cont                           VARCHAR2(4000)     NOT NULL,
  gu_cnt                            NUMBER(7)    DEFAULT 0     NULL ,
  gu_stars                          NUMBER(7)    DEFAULT 0     NULL ,
  gu_date                           DATE     NOT NULL,
  gu_file                           VARCHAR2(100)    NULL ,
  gu_size                           NUMBER(7)    DEFAULT 0     NULL */
  
 /* gu_no                             NUMBER(7)      NOT NULL    PRIMARY KEY, -- �� ��ȣ
  gu_area                           VARCHAR2(40)   NOT NULL,                -- ����
  gu_menu                           VARCHAR2(40)   NOT NULL,                -- �޴� ����
  gu_title                          VARCHAR2(200)  NOT NULL,                -- ������&����
  gu_name                           VARCHAR2(100)  NOT NULL,
 -- me_no                             NUMBER(7)      NOT NULL ,                   -- ȸ��
 --boardno                           NUMBER(7)        NOT NULL        PRIMARY KEY, -- �Խ��� ��ȣ
 --divisionno                        NUMBER(7)        NOT NULL ,                   -- ī�װ���ȣ
  gu_cont                           VARCHAR2(4000) NOT NULL,                -- ����
  gu_cnt                            NUMBER(7)      DEFAULT 0 NOT NULL,      -- ��ȸ��
  gu_stars                          NUMBER(7)      DEFAULT 0,               -- ����
  gu_date                           DATE           NOT NULL,                -- ��¥
  gu_file                           VARCHAR2(100)      NULL,                -- �����
  gu_file2                          VARCHAR2(100)      NULL,                -- ����
  gu_size2                          NUMBER(7)      DEFAULT 0,               -- ���� ������
  gu_map                            VARCHAR2(500)  NOT NULL                 -- ����
  */
 

  private int gu_no;
  private String gu_area;
  private String gu_menu;
  private String gu_title;
  private String gu_name;
  private String gu_cont;
  private int gu_cnt;
  private String gu_stars;
  private String gu_date;
  private String file1;
  private String file2;
  private long   size2;
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getFile2() {
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
  private String gu_map;
  
  
  
  /** Framework���� �ڵ� ���ԵǴ� ���ε� ���� ��ü, ���� �÷��� �������� ����. */  
  private MultipartFile file2MF;
  
  /** size2�� �ĸ� ���� ��¿� ���� */
  private String size2Label;
  
  
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
 
  public String getGu_area() {
    return gu_area;
  }
  public void setGu_area(String gu_area) {
    this.gu_area = gu_area;
  }
  public String getGu_menu() {
    return gu_menu;
  }
  public void setGu_menu(String gu_menu) {
    this.gu_menu = gu_menu;
  }
  public String getGu_title() {
    return gu_title;
  }
  public void setGu_title(String gu_title) {
    this.gu_title = gu_title;
  }
  public String getGu_name() {
    return gu_name;
  }
  public void setGu_name(String gu_name) {
    this.gu_name = gu_name;
  }
  public String getGu_cont() {
    return gu_cont;
  }
  public void setGu_cont(String gu_cont) {
    this.gu_cont = gu_cont;
  }
  public int getGu_cnt() {
    return gu_cnt;
  }
  public void setGu_cnt(int gu_cnt) {
    this.gu_cnt = gu_cnt;
  }
  public String getGu_stars() {
    return gu_stars;
  }
  public void setGu_stars(String gu_stars) {
    this.gu_stars = gu_stars;
  }
  public String getGu_date() {
    return gu_date;
  }
  public void setGu_date(String gu_date) {
    this.gu_date = gu_date;
  }
  
  public String getGu_map() {
    return gu_map;
  }
  public void setGu_map(String gu_map) {
    this.gu_map = gu_map;
  }
  public int getGu_no() {
    return gu_no;
  }
  public void setGu_no(int gu_no) {
    this.gu_no = gu_no;
  }

  }
  



