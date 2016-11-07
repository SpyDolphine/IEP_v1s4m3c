package dev.mvc.ITOS;

import org.springframework.web.multipart.MultipartFile;

public class ItosVO {
  /* ----------------------------------------------����� ����--------------------------------------------- */
//
//      io_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- �� ��ȣ
//      io_id       VARCHAR2(100)   NOT NULL, --�̸���
//      io_pwd      VARCHAR2(20)  NOT NULL, --��й�ȣ 
//      io_nick     VARCHAR2(40) NOT NULL, -- �г��� 
//      io_title    VARCHAR2(120)  NOT NULL, -- ����
//      io_content  VARCHAR2(4000) NOT NULL, -- ����
//      io_good  NUMBER(7)  DEFAULT 0 NOT NULL,--��õ��
//      io_file1  VARCHAR2(100)        NULL ,--Thumb ����
//      io_file2  VARCHAR2(500)        NULL ,--����2
//      io_size2  NUMBER(9)        DEFAULT 0       NULL ,--����2ũ��
//      io_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--��ȸ��
//      io_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--��ۼ�
//      io_date     DATE          NOT NULL,        -- ��Ͻð�   
//      io_cost     VARCHAR2(200) NOT NULL,-- �ݾ�
//      io_indent  NUMBER(2)        DEFAULT 0       NOT NULL,--�亯����
//      io_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--�亯����

  /** �۹�ȣ  */
  private int io_no;
  /** �̸���(id)  */
  private String io_id;
  /** ��й�ȣ  */
  private String io_pwd;
  /** �г���(����)  */
  private String io_nick;
  /** Ÿ��Ʋ(����)  */
  private String io_title;
  /** ����  */
  private String io_content;
  /** ��õ��  */
  private int io_good;
  /** Thumb ����  */
  private String io_file1="";
  /** ����2  */
  private String io_file2="";
  /** ����2ũ��  */
  private long io_size2=0;
  /** ��ȸ��  */
  private int io_cnt=0;
  /** ��ۼ�  */
  private int io_replycnt;
  /** ��� �ð�  */
  private String io_date;
  /** �ݾ�  */
  private String io_cost;
  /** �亯�׷�?���� */
  private int io_grpno;
  /** �亯����  */
  private int io_indent;
  /** �亯����  */
  private int io_ansnum;
  
  /** Spring Framework���� �ڵ� ���ԵǴ� ���ε� ���� ��ü,
  ���� �÷��� �������� ����.
*/  
private MultipartFile file2MF;

/** size2�� �ĸ� ���� ��¿� ����, ���� �÷��� �������� ����. */
private String size2Label; 
  /* ----------------------------------------------����� ����--------------------------------------------- */
  /* ----------------------------------------------���� ���� ����--------------------------------------------- */
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
 
  /* ----------------------------------------------���ͼ��� ����--------------------------------------------- */
}
