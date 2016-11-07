package dev.mvc.APP;

import org.springframework.web.multipart.MultipartFile;

public class AppVO {

  /** 글번호 */
  private int ap_no;
  /** 이메일(id) */
  private String ap_id;
  /** 비밀번호 */
  private String ap_pwd;
  /** 닉네임(별명) */
  private String ap_nick;
  /** 타이틀(제목) */ 
  private String ap_title;
  /** 내용 */
  private String ap_content;
  /** 추천수 */
  private int ap_good;
  /** Thumb 파일 */
  private String ap_file1 = "";
  /** 파일2 */
  private String ap_file2 = "";
  /** 파일2크기 */
  private long ap_size2 = 0;
  /** 조회수 */
  private int ap_cnt = 0;
  /** 댓글수 */
  private int ap_replycnt;
  /** 등록 시간 */
  private String ap_date;
  /** 답변번호 */
  private int ap_grpno;
  /** 답변차수 */
  private int ap_indent;
  /** 답변순서 */
  private int ap_ansnum;

  /**
   * Spring Framework에서 자동 주입되는 업로드 파일 객체, 실제 컬럼은 존재하지 않음.
   */
  private MultipartFile file2MF;

  /** size2의 컴마 저장 출력용 변수, 실제 컬럼은 존재하지 않음. */
  private String size2Label;

  public int getAp_no() {
    return ap_no;
  }

  public void setAp_no(int ap_no) {
    this.ap_no = ap_no;
  }

  public String getAp_id() {
    return ap_id;
  }

  public void setAp_id(String ap_id) {
    this.ap_id = ap_id;
  }

  public String getAp_pwd() {
    return ap_pwd;
  }

  public void setAp_pwd(String ap_pwd) {
    this.ap_pwd = ap_pwd;
  }

  public String getAp_nick() {
    return ap_nick;
  }

  public void setAp_nick(String ap_nick) {
    this.ap_nick = ap_nick;
  }

  public String getAp_title() {
    return ap_title;
  }

  public void setAp_title(String ap_title) {
    this.ap_title = ap_title;
  }

  public String getAp_content() {
    return ap_content;
  }

  public void setAp_content(String ap_content) {
    this.ap_content = ap_content;
  }

  public int getAp_good() {
    return ap_good;
  }

  public void setAp_good(int ap_good) {
    this.ap_good = ap_good;
  }

  public String getAp_file1() {
    if (ap_file1 == null) {
      ap_file1 = "";
    }
    return ap_file1;
  }

  public void setAp_file1(String ap_file1) {
    this.ap_file1 = ap_file1;
  }

  public String getAp_file2() {
    if (ap_file2 == null) {
      ap_file2 = "";
    }
    return ap_file2;
  }

  public void setAp_file2(String ap_file2) {
    this.ap_file2 = ap_file2;
  }

  public long getAp_size2() {
    return ap_size2;
  }

  public void setAp_size2(long ap_size2) {
    this.ap_size2 = ap_size2;
  }

  public int getAp_cnt() {
    return ap_cnt;
  }

  public void setAp_cnt(int ap_cnt) {
    this.ap_cnt = ap_cnt;
  }

  public int getAp_replycnt() {
    return ap_replycnt;
  }

  public void setAp_replycnt(int ap_replycnt) {
    this.ap_replycnt = ap_replycnt;
  }

  public String getAp_date() {
    return ap_date;
  }

  public void setAp_date(String ap_date) {
    this.ap_date = ap_date;
  }

  public int getAp_indent() {
    return ap_indent;
  }

  public void setAp_indent(int ap_indent) {
    this.ap_indent = ap_indent;
  }

  public int getAp_ansnum() {
    return ap_ansnum;
  }

  public void setAp_ansnum(int ap_ansnum) {
    this.ap_ansnum = ap_ansnum;
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

  public int getAp_grpno() {
    return ap_grpno;
  }

  public void setAp_grpno(int ap_grpno) {
    this.ap_grpno = ap_grpno;
  }

}