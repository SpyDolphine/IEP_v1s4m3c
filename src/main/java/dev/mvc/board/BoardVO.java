package dev.mvc.board;
 
import org.springframework.web.multipart.MultipartFile;
 
public class BoardVO {
/*
CREATE TABLE board( -- 게시판
  boardno      NUMBER(7)        NOT NULL, -- 게시판 번호
  divisionno   NUMBER(7)        NOT NULL ,                   -- 카테고리번호
  me_no        NUMBER(7)        NOT NULL ,                   -- 회원 번호
  title        VARCHAR2(200)    NOT NULL,                    -- 게시판 이름
  content      VARCHAR2(4000)   NOT NULL,                    -- 게시판 내용
  good         NUMBER(7)        DEFAULT 0       NOT NULL,    -- 추천수
  file1        VARCHAR2(100)    NULL ,                       -- Thumb 파일
  file2        VARCHAR2(50)     NULL ,                       -- 파일 2
  size2        NUMBER(9)        DEFAULT 0       NULL ,       -- 파일 2 크기
  map          VARCHAR2(500)    NULL ,                       -- 지도
  cnt          NUMBER(7)        DEFAULT 0               ,    -- 조회수
  replycnt     NUMBER(7)        DEFAULT 0               ,    -- 댓글수
  rdate        DATE             NOT NULL,                    -- 등록일
  grpno        NUMBER(7)        NOT NULL,                    -- 그룹 번호
  indent       NUMBER(2)        DEFAULT 0       NOT NULL,    -- 답변 차수
  ansnum       NUMBER(5)        DEFAULT 0       NOT NULL,    -- 답변 순서
  FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- 카테고리번호
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no),          --회원번호
  PRIMARY KEY(boardno)
);
*/
  /** 글 번호 */
  private int boardno;
  /** 게시판 그룹 번호 */
  private int divisionno;
  /** 회원 번호 */
  private int me_no;
  /** 제목 */
  private String title;
  /** 내용 */
  private String content;
  /** 추천 수 */
  private int good;
  /** Preview 소형 이미지 200 X 150, 자동 생성됨*/
  private String file1 = "";
  /** 업로드 파일 */
  private String file2 = "";
  /** 업로드된 파일 크기 */
  private long size2 = 0;
  /** 조회수 */
  private int cnt = 0;
  /** 답변 갯수 */
  private int replycnt;
  /** 등록일 */
  private String rdate;
  /** 그룹 번호 */ 
  private int grpno;
  /** 답변 차수 */
  private int indent;
  /** 답변 순서 */
  private int ansnum;
  
  /** Framework에서 자동 주입되는 업로드 파일 객체, 실제 컬럼은 존재하지 않음. */  
  private MultipartFile file2MF;
  
  /** size2의 컴마 저장 출력용 변수 */
  private String size2Label;

  public int getBoardno() {
    return boardno;
  }

  public void setBoardno(int boardno) {
    this.boardno = boardno;
  }

  public int getDivisionno() {
    return divisionno;
  }

  public void setDivisionno(int divisionno) {
    this.divisionno = divisionno;
  }

  public int getMe_no() {
    return me_no;
  }

  public void setMe_no(int me_no) {
    this.me_no = me_no;
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

  public int getGood() {
    return good;
  }

  public void setGood(int good) {
    this.good = good;
  }

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

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public int getReplycnt() {
    return replycnt;
  }

  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
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