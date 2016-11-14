package dev.mvc.STUDY;

import org.springframework.web.multipart.MultipartFile;

public class StudyVO {
  /*
   * CREATE TABLE STUDY  ( --It Table Web
      sy_no    NUMBER(7)                 NOT NULL PRIMARY KEY, -- 글 번호
      title       VARCHAR2(120)          NOT NULL, -- 제목
      content  VARCHAR2(4000)         NOT NULL, -- 내용
      file1      VARCHAR2(100)                 NULL ,--Thumb 파일
      file2       VARCHAR2(500)                NULL ,--파일2
      size2      NUMBER(9)  DEFAULT 0      NULL ,--파일2크기
      cnt        NUMBER(7)  DEFAULT 0 NOT NULL,--조회수
      sy_date    DATE                        NOT NULL,-- 게시물 등록시간   
      gate       VARCHAR2(10)           NOT NULL-- APP(AC,AP,AJ),WEB(WJ,WC,WH)
    );
    */
  /**  글번호 */
  private int sy_no;
  /**  글제목 */
  private String title;
  /**  글내용 */
  private String content;
  /**  파일1 */
  private String file1 = "";
  /**  파일2 */
  private String file2 = "";
  /**  사이즈2 */
  private long size2 = 0;
  /**  조회수 */
  private int cnt = 0;
  /**  등록일자 */
  private String sy_date;
  /**  카테고리 */
  private String gate;
  
  /** Spring Framework에서 자동 주입되는 업로드 파일 객체, 실제 컬럼은 존재하지 않음. */
  private MultipartFile file2MF;
  /** size2의 컴마 저장 출력용 변수, 실제 컬럼은 존재하지 않음. */
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