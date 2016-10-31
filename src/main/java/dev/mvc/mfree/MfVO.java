package dev.mvc.mfree;

import org.springframework.web.multipart.MultipartFile;

public class MfVO {
  /*
   create table commu_study (
     cm_no        NUMBER(7)        not null,                         -- 글 번호
     cm_nick      varchar2(30)     not null,                         -- 닉네임
     cm_title     varchar2(120)    not null,                         -- 게시글 제목
     cm_content   varchar2(4000)   not null,                         -- 글 내용
     file1     VARCHAR2(100)    NULL ,
     file2     VARCHAR2(50)     NULL ,
     size2     NUMBER(9)        DEFAULT 0 ,
     cm_likeit    NUMBER(7)        default 0,                        -- 좋아요기능
     cm_map       varchar2(1024)   null,                             -- 지도
     cm_url       varchar2(500)    null,                             -- 출처  
     cm_cnt       NUMBER(7)        default 0,                        -- 조회수
     cm_date      DATE             not null,                         -- 등록날짜
     replycnt     NUMBER(7)        DEFAULT 0       NOT NULL, 
     grpno        NUMBER(7)        NOT NULL,
     indent       NUMBER(2)        DEFAULT 0       NOT NULL,
     ansnum       NUMBER(5)        DEFAULT 0       NOT NULL, 
     PRIMARY KEY(cm_no)
    );
   */
  
  private int cm_no;
  private String cm_nick;
  private String cm_title;
  private String cm_content;
  private String file1;
  private String file2;
  private long size2 = 0;
  private int cm_likeit;
  private String cm_map;
  private String cm_url;
  private int cm_cnt = 0;
  private String cm_date;
  private int replycnt;
  private int grpno;
  private int indent;
  private int ansnum;
  private int rownum;
  /** Spring Framework에서 자동 주입되는 업로드 파일 객체 . 실제 컬럼은 존재하지 않는다. */  
  private MultipartFile file2MF;
  
  /** size2의 컴마 저장 출력용 변수 . 실제 컬럼은 존재하지 않는다. */
  private String size2Label; 
  
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
  public String getFile1() {
    if (file1 == null){
      file1 = "";
    }
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getFile2() {
    if (file2 == null){
      file2 = "";
    }
    return file2;
  }
  public void setFile2(String file2) {
    this.file2 = file2;
  }
  public MultipartFile getFile2MF() {
    return file2MF;
  }
  public void setFile2MF(MultipartFile file2mf) {
    file2MF = file2mf;
  }  
  public long getSize2() {
    return size2;
  }
  public void setSize2(long size2) {
    this.size2 = size2;
  }
  public String getSize2Label() {
    return size2Label;
  }
  public void setSize2Label(String size2Label) {
    this.size2Label = size2Label;
  }  
  public int getCm_likeit() {
    return cm_likeit;
  }
  public void setCm_likeit(int cm_likeit) {
    this.cm_likeit = cm_likeit;
  }
  public String getCm_map() {
    return cm_map;
  }
  public void setCm_map(String cm_map) {
    this.cm_map = cm_map;
  }
  public String getCm_url() {
    return cm_url;
  }
  public void setCm_url(String cm_url) {
    this.cm_url = cm_url;
  }
  public int getCm_cnt() {
    return cm_cnt;
  }
  public void setCm_cnt(int cm_cnt) {
    this.cm_cnt = cm_cnt;
  }
  public String getCm_date() {
    return cm_date;
  }
  public void setCm_date(String cm_date) {
    this.cm_date = cm_date;
  }
  public int getReplycnt() {
    return replycnt;
  }
  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
  }
  public int getGrpno() {
    return grpno;
  }
  public void setGrpno(int grpno) {
    this.grpno = grpno;
  }
  public int getIndent() {
    return indent;
  }
  public void setIndent(int indent) {
    this.indent = indent;
  }
  public int getAnsnum() {
    return ansnum;
  }
  public void setAnsnum(int ansnum) {
    this.ansnum = ansnum;
  }
  public int getRownum() {
    return rownum;
  }
  public void setRownum(int rownum) {
    this.rownum = rownum;
  }
}
