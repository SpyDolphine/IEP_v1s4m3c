package dev.mvc.ITOS;

import org.springframework.web.multipart.MultipartFile;

public class ItosVO {
  /* ----------------------------------------------선언부 시작--------------------------------------------- */
//
//      io_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- 글 번호
//      io_id       VARCHAR2(100)   NOT NULL, --이메일
//      io_pwd      VARCHAR2(20)  NOT NULL, --비밀번호 
//      io_nick     VARCHAR2(40) NOT NULL, -- 닉네임 
//      io_title    VARCHAR2(120)  NOT NULL, -- 제목
//      io_content  VARCHAR2(4000) NOT NULL, -- 내용
//      io_good  NUMBER(7)  DEFAULT 0 NOT NULL,--추천수
//      io_file1  VARCHAR2(100)        NULL ,--Thumb 파일
//      io_file2  VARCHAR2(500)        NULL ,--파일2
//      io_size2  NUMBER(9)        DEFAULT 0       NULL ,--파일2크기
//      io_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--조회수
//      io_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--댓글수
//      io_date     DATE          NOT NULL,        -- 등록시간   
//      io_cost     VARCHAR2(200) NOT NULL,-- 금액
//      io_indent  NUMBER(2)        DEFAULT 0       NOT NULL,--답변차수
//      io_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--답변순서

  /** 글번호  */
  private int io_no;
  /** 이메일(id)  */
  private String io_id;
  /** 비밀번호  */
  private String io_pwd;
  /** 닉네임(별명)  */
  private String io_nick;
  /** 타이틀(제목)  */
  private String io_title;
  /** 내용  */
  private String io_content;
  /** 추천수  */
  private int io_good;
  /** Thumb 파일  */
  private String io_file1="";
  /** 파일2  */
  private String io_file2="";
  /** 파일2크기  */
  private long io_size2=0;
  /** 조회수  */
  private int io_cnt=0;
  /** 댓글수  */
  private int io_replycnt;
  /** 등록 시간  */
  private String io_date;
  /** 금액  */
  private String io_cost;
  /** 답변그룹?몰라 */
  private int io_grpno;
  /** 답변차수  */
  private int io_indent;
  /** 답변순서  */
  private int io_ansnum;
  
  /** Spring Framework에서 자동 주입되는 업로드 파일 객체,
  실제 컬럼은 존재하지 않음.
*/  
private MultipartFile file2MF;

/** size2의 컴마 저장 출력용 변수, 실제 컬럼은 존재하지 않음. */
private String size2Label; 
  /* ----------------------------------------------선언부 종료--------------------------------------------- */
  /* ----------------------------------------------게터 세터 시작--------------------------------------------- */
  public int getIo_no() {
    return io_no;
  }
  public void setIo_no(int io_no) {
    this.io_no = io_no;
  }
  public String getIo_id() {
    return io_id;
  }
  public void setIo_id(String io_id) {
    this.io_id = io_id;
  }
  public String getIo_pwd() {
    return io_pwd;
  }
  public void setIo_pwd(String io_pwd) {
    this.io_pwd = io_pwd;
  }
  public String getIo_nick() {
    return io_nick;
  }
  public void setIo_nick(String io_nick) {
    this.io_nick = io_nick;
  }
  public String getIo_title() {
    return io_title;
  }
  public void setIo_title(String io_title) {
    this.io_title = io_title;
  }
  public String getIo_content() {
    return io_content;
  }
  public void setIo_content(String io_content) {
    this.io_content = io_content;
  }
  public int getIo_good() {
    return io_good;
  }
  public void setIo_good(int io_good) {
    this.io_good = io_good;
  }
  public String getSize2Label() {
    return size2Label;
  }
  public void setSize2Label(String size2Label) {
    this.size2Label = size2Label;
  }
  public String getIo_file1() {
    if (io_file1 == null){
      io_file1 = "";
    }
    return io_file1;
  }
  public void setIo_file1(String io_file1) {
    this.io_file1 = io_file1;
  }
  public String getIo_file2() {
    if (io_file2 == null){
      io_file2 = "";
    }
    return io_file2;
  }
  public void setIo_file2(String io_file2) {
    this.io_file2 = io_file2;
  }
  public long getIo_size2() {
    return io_size2;
  }
  public void setIo_size2(long io_size2) {
    this.io_size2 = io_size2;
  }
  public MultipartFile getFile2MF() {
    return file2MF;
  }
  public void setFile2MF(MultipartFile file2mf) {
    file2MF = file2mf;
  }
  public int getIo_cnt() {
    return io_cnt;
  }
  public void setIo_cnt(int io_cnt) {
    this.io_cnt = io_cnt;
  }
  public int getIo_replycnt() {
    return io_replycnt;
  }
  public void setIo_replycnt(int io_replycnt) {
    this.io_replycnt = io_replycnt;
  }
  public String getIo_date() {
    return io_date;
  }
  public void setIo_date(String io_date) {
    this.io_date = io_date;
  }
  public String getIo_cost() {
    return io_cost;
  }
  public void setIo_cost(String io_cost) {
    this.io_cost = io_cost;
  }
  public int getIo_indent() {
    return io_indent;
  }
  public void setIo_indent(int io_indent) {
    this.io_indent = io_indent;
  }
  public int getIo_ansnum() {
    return io_ansnum;
  }
  public void setIo_ansnum(int io_ansnum) {
    this.io_ansnum = io_ansnum;
  }
  public int getIo_grpno() {
    return io_grpno;
  }
  public void setIo_grpno(int io_grpno) {
    this.io_grpno = io_grpno;
  }
 
  /* ----------------------------------------------게터세터 종료--------------------------------------------- */
}
