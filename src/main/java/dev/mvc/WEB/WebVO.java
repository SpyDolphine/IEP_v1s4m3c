package dev.mvc.WEB;

import org.springframework.web.multipart.MultipartFile;

public class WebVO {

  /** 글번호 */
  private int wb_no;
  /** 이메일(id) */
  private String wb_id;
  /** 비밀번호 */
  private String wb_pwd;
  /** 닉네임(별명) */
  private String wb_nick;
  /** 타이틀(제목) */ 
  private String wb_title;
  /** 내용 */
  private String wb_content;
  /** 추천수 */
  private int wb_good;
  /** Thumb 파일 */
  private String wb_file1 = "";
  /** 파일2 */
  private String wb_file2 = "";
  /** 파일2크기 */
  private long wb_size2 = 0;
  /** 조회수 */
  private int wb_cnt = 0;
  /** 댓글수 */
  private int wb_replycnt;
  /** 등록 시간 */
  private String wb_date;
  /** 답변번호 */
  private int wb_grpno;
  /** 답변차수 */
  private int wb_indent;
  /** 답변순서 */
  private int wb_ansnum;

  /**
   * Spring Framework에서 자동 주입되는 업로드 파일 객체, 실제 컬럼은 존재하지 않음.
   */
  private MultipartFile file2MF;

  /** size2의 컴마 저장 출력용 변수, 실제 컬럼은 존재하지 않음. */
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
