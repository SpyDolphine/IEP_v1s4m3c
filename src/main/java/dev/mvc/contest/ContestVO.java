package dev.mvc.contest;

import org.springframework.web.multipart.MultipartFile;

public class ContestVO {
/*** ������ ��ȣ */
  private int ct_no;
  /**
   * ȸ����ȣ
   */
  private int me_no;
  /**
   * ������ ����
   */
  private String ct_title;
  /**
   * ������ ����
   */
  private String ct_host;
  /**
   * ������ �ְ�
   */
  private String ct_supervision;
  /**
   * ������ ���� �ڰ�
   */
  private String ct_entry;
  /**
   * �������
   */
  private String ct_enter;
  /**
   * �û��ڰ�
   */
  private String ct_award;
  /**
   * ����������
   */
  private String ct_startdate;
  /**
   * ���� ������
   */
  private String ct_enddate;
  /**
   * ��ǥ����
   */
  private String ct_statedate;
  /**
   * ���� Ȩ������
   */
  private String ct_url;
  /**
   * ������ �󼼳���
   */
  private String ct_content;
  /**
   * ���� 
   */
  private String ct_file1;
  /***
   * ���� 2
   */
  private String ct_file2;
  /**
   * ���� ������~
   */
  private long ct_size2;
  /**
   * �������
   */
  private String ct_rdate;
  /** Spring Framework���� �ڵ� ���ԵǴ� ���ε� ���� ��ü,
  ���� �÷��� �������� ����.
*/  
private MultipartFile file2MF;

/** size2�� �ĸ� ���� ��¿� ����, ���� �÷��� �������� ����. */
private String size2Label; 
/**
 * ��ȸ��
 */
private int ct_cnt;

  public int getCt_no() {
    return ct_no;
  }
  public void setCt_no(int ct_no) {
    this.ct_no = ct_no;
  }
  public int getMe_no() {
    return me_no;
  }
  public void setMe_no(int me_no) {
    this.me_no = me_no;
  }
  public String getCt_title() {
    return ct_title;
  }
  public void setCt_title(String ct_title) {
    this.ct_title = ct_title;
  }
  public String getCt_host() {
    return ct_host;
  }
  public void setCt_host(String ct_host) {
    this.ct_host = ct_host;
  }
  public String getCt_supervision() {
    return ct_supervision;
  }
  public void setCt_supervision(String ct_supervision) {
    this.ct_supervision = ct_supervision;
  }
  public String getCt_entry() {
    return ct_entry;
  }
  public void setCt_entry(String ct_entry) {
    this.ct_entry = ct_entry;
  }
  public String getCt_enter() {
    return ct_enter;
  }
  public void setCt_enter(String ct_enter) {
    this.ct_enter = ct_enter;
  }
  public String getCt_award() {
    return ct_award;
  }
  public void setCt_award(String ct_award) {
    this.ct_award = ct_award;
  }
  public String getCt_startdate() {
    return ct_startdate;
  }
  public void setCt_startdate(String ct_startdate) {
    this.ct_startdate = ct_startdate;
  }
  public String getCt_enddate() {
    return ct_enddate;
  }
  public void setCt_enddate(String ct_enddate) {
    this.ct_enddate = ct_enddate;
  }
  public String getCt_statedate() {
    return ct_statedate;
  }
  public void setCt_statedate(String ct_statedate) {
    this.ct_statedate = ct_statedate;
  }
  public String getCt_url() {
    return ct_url;
  }
  public void setCt_url(String ct_url) {
    this.ct_url = ct_url;
  }
  public String getCt_content() {
    return ct_content;
  }
  public void setCt_content(String ct_content) {
    this.ct_content = ct_content;
  }
  public String getCt_file1() {
    if(ct_file1 == null){
      ct_file1 = "";
    }
    return ct_file1;
  }
  public void setCt_file1(String ct_file1) {
    this.ct_file1 = ct_file1;
  }
  public String getCt_file2() {
    if(ct_file2 == null){
      ct_file2 = "";
    }
    return ct_file2;
  }
  public void setCt_file2(String ct_file2) {
    this.ct_file2 = ct_file2;
  }
  public long getCt_size2() {
    return ct_size2;
  }
  public void setCt_size2(long ct_size2) {
    this.ct_size2 = ct_size2;
  }
  public String getCt_rdate() {
    return ct_rdate;
  }
  public void setCt_rdate(String ct_rdate) {
    this.ct_rdate = ct_rdate;
  }
  public int getCt_cnt() {
    return ct_cnt;
  }
  public void setCt_cnt(int ct_cnt) {
    this.ct_cnt = ct_cnt;
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
