package dev.mvc.license;

import org.springframework.web.multipart.MultipartFile;

public class LicenseVO {

  /** �۹�ȣ */
  private int lc_no;
  /** �̸���(id) */
  private String lc_id;
  /** ��й�ȣ */
  private String lc_pwd;
  /** �г���(����) */
  private String lc_nick;
  /** Ÿ��Ʋ(����) */ 
  private String lc_title;
  /** ���� */
  private String lc_content;
  /** ��õ�� */
  private int lc_good;
  /** Thumb ���� */
  private String lc_file1 = "";
  /** ����2 */
  private String lc_file2 = "";
  /** ����2ũ�� */
  private long lc_size2 = 0;
  /** ��ȸ�� */
  private int lc_cnt = 0;
  /** ��ۼ� */
  private int lc_replycnt;
  /** ��� �ð� */
  private String lc_date;
  /** �亯��ȣ */
  private String lc_date1;
  /** �亯���� */
  private String lc_date2;
  /** �亯���� */
  private String lc_date3;
  /** �亯���� */
  private String lc_date4;
  
  /**
   * Spring Framework���� �ڵ� ���ԵǴ� ���ε� ���� ��ü, ���� �÷��� �������� ����.
   */
  private MultipartFile file2MF;

  /** size2�� �ĸ� ���� ��¿� ����, ���� �÷��� �������� ����. */
  private String size2Label;

  public int getLc_no() {
    return lc_no;
  }

  public void setLc_no(int lc_no) {
    this.lc_no = lc_no;
  }

  public String getLc_id() {
    return lc_id;
  }

  public void setLc_id(String lc_id) {
    this.lc_id = lc_id;
  }

  public String getLc_pwd() {
    return lc_pwd;
  }

  public void setLc_pwd(String lc_pwd) {
    this.lc_pwd = lc_pwd;
  }

  public String getLc_nick() {
    return lc_nick;
  }

  public void setLc_nick(String lc_nick) {
    this.lc_nick = lc_nick;
  }

  public String getLc_title() {
    return lc_title;
  }

  public void setLc_title(String lc_title) {
    this.lc_title = lc_title;
  }

  public String getLc_content() {
    return lc_content;
  }

  public void setLc_content(String lc_content) {
    this.lc_content = lc_content;
  }

  public int getLc_good() {
    return lc_good;
  }

  public void setLc_good(int lc_good) {
    this.lc_good = lc_good;
  }

  public String getLc_file1() {
    if(lc_file1 == null){
      lc_file1="";
    }
    return lc_file1;
  }

  public void setLc_file1(String lc_file1) {
    this.lc_file1 = lc_file1;
  }

  public String getLc_file2() {
    if(lc_file2==null){
      lc_file2 ="";
    }
    return lc_file2;
  }

  public void setLc_file2(String lc_file2) {
    this.lc_file2 = lc_file2;
  }

  public long getLc_size2() {
    return lc_size2;
  }

  public void setLc_size2(long lc_size2) {
    this.lc_size2 = lc_size2;
  }

  public int getLc_cnt() {
    return lc_cnt;
  }

  public void setLc_cnt(int lc_cnt) {
    this.lc_cnt = lc_cnt;
  }

  public int getLc_replycnt() {
    return lc_replycnt;
  }

  public void setLc_replycnt(int lc_replycnt) {
    this.lc_replycnt = lc_replycnt;
  }

  public String getLc_date() {
    return lc_date;
  }

  public void setLc_date(String lc_date) {
    this.lc_date = lc_date;
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

  public String getLc_date1() {
    return lc_date1;
  }

  public void setLc_date1(String lc_date1) {
    this.lc_date1 = lc_date1;
  }

  public String getLc_date2() {
    return lc_date2;
  }

  public void setLc_date2(String lc_date2) {
    this.lc_date2 = lc_date2;
  }

  public String getLc_date3() {
    return lc_date3;
  }

  public void setLc_date3(String lc_date3) {
    this.lc_date3 = lc_date3;
  }

  public String getLc_date4() {
    return lc_date4;
  }

  public void setLc_date4(String lc_date4) {
    this.lc_date4 = lc_date4;
  }


  
}
