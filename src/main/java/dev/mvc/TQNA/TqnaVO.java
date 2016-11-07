package dev.mvc.TQNA;

import org.springframework.web.multipart.MultipartFile;

public class TqnaVO {

  /** 글번호 */
  private int qa_no;
  /** 이메일(id) */
  private String qa_id;
  /** 비밀번호 */
  private String qa_pwd;
  /** 닉네임(별명) */
  private String qa_nick;
  /** 타이틀(제목) */ 
  private String qa_title;
  /** 내용 */
  private String qa_content;
  /** 추천수 */
  private int qa_good;
  /** Thumb 파일 */
  private String qa_file1 = "";
  /** 파일2 */
  private String qa_file2 = "";
  /** 파일2크기 */
  private long qa_size2 = 0;
  /** 조회수 */
  private int qa_cnt = 0;
  /** 댓글수 */
  private int qa_replycnt;
  /** 등록 시간 */
  private String qa_date;
  /** 답변번호 */
  private int qa_grpno;
  /** 답변차수 */
  private int qa_indent;
  /** 답변순서 */
  private int qa_ansnum;

  /**
   * Spring Framework에서 자동 주입되는 업로드 파일 객체, 실제 컬럼은 존재하지 않음.
   */
  private MultipartFile file2MF;

  /** size2의 컴마 저장 출력용 변수, 실제 컬럼은 존재하지 않음. */
  private String size2Label;

  public int getQa_no() {
    return qa_no;
  }

  public void setQa_no(int qa_no) {
    this.qa_no = qa_no;
  }

  public String getQa_id() { 
    return qa_id;
  }

  public void setQa_id(String qa_id) {
    this.qa_id = qa_id;
  }

  public String getQa_pwd() {
    return qa_pwd;
  }

  public void setQa_pwd(String qa_pwd) {
    this.qa_pwd = qa_pwd;
  }

  public String getQa_nick() {
    return qa_nick;
  }

  public void setQa_nick(String qa_nick) {
    this.qa_nick = qa_nick;
  }

  public String getQa_title() {
    return qa_title;
  }

  public void setQa_title(String qa_title) {
    this.qa_title = qa_title;
  }

  public String getQa_content() {
    return qa_content;
  }

  public void setQa_content(String qa_content) {
    this.qa_content = qa_content;
  }

  public int getQa_good() {
    return qa_good;
  }

  public void setQa_good(int qa_good) {
    this.qa_good = qa_good;
  }

  public String getQa_file1() {
    if(qa_file1 == null){
      qa_file1 = "";
    }
    return qa_file1;
  }

  public void setQa_file1(String qa_file1) {
    this.qa_file1 = qa_file1;
  }

  public String getQa_file2() {
    if(qa_file2 == null){
      qa_file2 = "";
    }
    return qa_file2;
  }

  public void setQa_file2(String qa_file2) {
    this.qa_file2 = qa_file2;
  }

  public long getQa_size2() {
    return qa_size2;
  }

  public void setQa_size2(long qa_size2) {
    this.qa_size2 = qa_size2;
  }

  public int getQa_cnt() {
    return qa_cnt;
  }

  public void setQa_cnt(int qa_cnt) {
    this.qa_cnt = qa_cnt;
  }

  public int getQa_replycnt() {
    return qa_replycnt;
  }

  public void setQa_replycnt(int qa_replycnt) {
    this.qa_replycnt = qa_replycnt;
  }

  public String getQa_date() {
    return qa_date;
  }

  public void setQa_date(String qa_date) {
    this.qa_date = qa_date;
  }

  public int getQa_grpno() {
    return qa_grpno;
  }

  public void setQa_grpno(int qa_grpno) {
    this.qa_grpno = qa_grpno;
  }

  public int getQa_indent() {
    return qa_indent;
  }

  public void setQa_indent(int qa_indent) {
    this.qa_indent = qa_indent;
  }

  public int getQa_ansnum() {
    return qa_ansnum;
  }

  public void setQa_ansnum(int qa_ansnum) {
    this.qa_ansnum = qa_ansnum;
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