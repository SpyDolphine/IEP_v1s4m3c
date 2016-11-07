package dev.mvc.WEB;

import org.springframework.web.multipart.MultipartFile;

public class WebVO {

  /** �۹�ȣ */
  private int wb_no;
  /** �̸���(id) */
  private String wb_id;
  /** ��й�ȣ */
  private String wb_pwd;
  /** �г���(����) */
  private String wb_nick;
  /** Ÿ��Ʋ(����) */ 
  private String wb_title;
  /** ���� */
  private String wb_content;
  /** ��õ�� */
  private int wb_good;
  /** Thumb ���� */
  private String wb_file1 = "";
  /** ����2 */
  private String wb_file2 = "";
  /** ����2ũ�� */
  private long wb_size2 = 0;
  /** ��ȸ�� */
  private int wb_cnt = 0;
  /** ��ۼ� */
  private int wb_replycnt;
  /** ��� �ð� */
  private String wb_date;
  /** �亯��ȣ */
  private int wb_grpno;
  /** �亯���� */
  private int wb_indent;
  /** �亯���� */
  private int wb_ansnum;

  /**
   * Spring Framework���� �ڵ� ���ԵǴ� ���ε� ���� ��ü, ���� �÷��� �������� ����.
   */
  private MultipartFile file2MF;

  /** size2�� �ĸ� ���� ��¿� ����, ���� �÷��� �������� ����. */
  private String size2Label;

  public int getWb_no() {
    return wb_no;
  }

  public void setWb_no(int wb_no) {
    this.wb_no = wb_no;
  }

  public String getWb_id() {
    return wb_id;
  }

  public void setWb_id(String wb_id) {
    this.wb_id = wb_id;
  }

  public String getWb_pwd() {
    return wb_pwd;
  }

  public void setWb_pwd(String wb_pwd) {
    this.wb_pwd = wb_pwd;
  }

  public String getWb_nick() {
    return wb_nick;
  }

  public void setWb_nick(String wb_nick) {
    this.wb_nick = wb_nick;
  }

  public String getWb_title() {
    return wb_title;
  }

  public void setWb_title(String wb_title) {
    this.wb_title = wb_title;
  }

  public String getWb_content() {
    return wb_content;
  }

  public void setWb_content(String wb_content) {
    this.wb_content = wb_content;
  }

  public int getWb_good() {
    return wb_good;
  }

  public void setWb_good(int wb_good) {
    this.wb_good = wb_good;
  }

  public String getWb_file1() {
    if (wb_file1 == null) {
      wb_file1 = "";
    }
    return wb_file1;
  }

  public void setWb_file1(String wb_file1) {
    this.wb_file1 = wb_file1;
  }

  public String getWb_file2() {
    if (wb_file2 == null) {
      wb_file2 = "";
    }
    return wb_file2;
  }

  public void setWb_file2(String wb_file2) {
    this.wb_file2 = wb_file2;
  }

  public long getWb_size2() {
    return wb_size2;
  }

  public void setWb_size2(long wb_size2) {
    this.wb_size2 = wb_size2;
  }

  public int getWb_cnt() {
    return wb_cnt;
  }

  public void setWb_cnt(int wb_cnt) {
    this.wb_cnt = wb_cnt;
  }

  public int getWb_replycnt() {
    return wb_replycnt;
  }

  public void setWb_replycnt(int wb_replycnt) {
    this.wb_replycnt = wb_replycnt;
  }

  public String getWb_date() {
    return wb_date;
  }

  public void setWb_date(String wb_date) {
    this.wb_date = wb_date;
  }

  public int getWb_indent() {
    return wb_indent;
  }

  public void setWb_indent(int wb_indent) {
    this.wb_indent = wb_indent;
  }

  public int getWb_ansnum() {
    return wb_ansnum;
  }

  public void setWb_ansnum(int wb_ansnum) {
    this.wb_ansnum = wb_ansnum;
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

  public int getWb_grpno() {
    return wb_grpno;
  }

  public void setWb_grpno(int wb_grpno) {
    this.wb_grpno = wb_grpno;
  }
  
}
