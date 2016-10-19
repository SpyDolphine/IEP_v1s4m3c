package dev.mvc.board;
 
import org.springframework.web.multipart.MultipartFile;
 
public class BoardVO {
/*
CREATE TABLE board( -- �Խ���
  boardno      NUMBER(7)        NOT NULL, -- �Խ��� ��ȣ
  divisionno   NUMBER(7)        NOT NULL ,                   -- ī�װ���ȣ
  me_no        NUMBER(7)        NOT NULL ,                   -- ȸ�� ��ȣ
  title        VARCHAR2(200)    NOT NULL,                    -- �Խ��� �̸�
  content      VARCHAR2(4000)   NOT NULL,                    -- �Խ��� ����
  good         NUMBER(7)        DEFAULT 0       NOT NULL,    -- ��õ��
  file1        VARCHAR2(100)    NULL ,                       -- Thumb ����
  file2        VARCHAR2(50)     NULL ,                       -- ���� 2
  size2        NUMBER(9)        DEFAULT 0       NULL ,       -- ���� 2 ũ��
  map          VARCHAR2(500)    NULL ,                       -- ����
  cnt          NUMBER(7)        DEFAULT 0               ,    -- ��ȸ��
  replycnt     NUMBER(7)        DEFAULT 0               ,    -- ��ۼ�
  rdate        DATE             NOT NULL,                    -- �����
  grpno        NUMBER(7)        NOT NULL,                    -- �׷� ��ȣ
  indent       NUMBER(2)        DEFAULT 0       NOT NULL,    -- �亯 ����
  ansnum       NUMBER(5)        DEFAULT 0       NOT NULL,    -- �亯 ����
  FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- ī�װ���ȣ
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no),          --ȸ����ȣ
  PRIMARY KEY(boardno)
);
*/
  /** �� ��ȣ */
  private int boardno;
  /** �Խ��� �׷� ��ȣ */
  private int divisionno;
  /** ȸ�� ��ȣ */
  private int me_no;
  /** ���� */
  private String title;
  /** ���� */
  private String content;
  /** ��õ �� */
  private int good;
  /** Preview ���� �̹��� 200 X 150, �ڵ� ������*/
  private String file1 = "";
  /** ���ε� ���� */
  private String file2 = "";
  /** ���ε�� ���� ũ�� */
  private long size2 = 0;
  /** ��ȸ�� */
  private int cnt = 0;
  /** �亯 ���� */
  private int replycnt;
  /** ����� */
  private String rdate;
  /** �׷� ��ȣ */ 
  private int grpno;
  /** �亯 ���� */
  private int indent;
  /** �亯 ���� */
  private int ansnum;
  
  /** Framework���� �ڵ� ���ԵǴ� ���ε� ���� ��ü, ���� �÷��� �������� ����. */  
  private MultipartFile file2MF;
  
  /** size2�� �ĸ� ���� ��¿� ���� */
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