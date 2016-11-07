package dev.mvc.seico;
 
import org.springframework.web.multipart.MultipartFile;
 
public class SeicoVO {
  private int sc_no;
  private String sc_area;
  private String sc_jobs;
  private String sc_title;
  private String sc_gender;
  private String sc_position;
  private String sc_q;
  private String sc_tip;
  private String sc_stars;
  private String sc_where;
  private String sc_name;
  private String sc_ex;
  private String sc_cont;
  private int    sc_like;
  private int    sc_likeup;
  private int    sc_likedown;
  private String sc_date;
  private String file1;
  private String file2;
  private int sc_cnt;
  private long size2;
  
  public int getSc_likeup() {
    return sc_likeup;
  }

  public void setSc_likeup(int sc_likeup) {
    this.sc_likeup = sc_likeup;
  }

  public int getSc_likedown() {
    return sc_likedown;
  }

  public void setSc_likedown(int sc_likedown) {
    this.sc_likedown = sc_likedown;
  }
  /** Framework에서 자동 주입되는 업로드 파일 객체, 실제 컬럼은 존재하지 않음. */  
  private MultipartFile file2MF;
  
  /** size2의 컴마 저장 출력용 변수 */
  private String size2Label;
  
  public String getSc_ex() {
    return sc_ex;
  }

  public void setSc_ex(String sc_ex) {
    this.sc_ex = sc_ex;
  }
  
  public int getSc_cnt() {
    return sc_cnt;
  }

  public void setSc_cnt(int sc_cnt) {
    this.sc_cnt = sc_cnt;
  }
  public int getSc_no() {
    return sc_no;
  }

  public void setSc_no(int sc_no) {
    this.sc_no = sc_no;
  }

  public String getSc_area() {
    return sc_area;
  }

  public void setSc_area(String sc_area) {
    this.sc_area = sc_area;
  }

  public String getSc_jobs() {
    return sc_jobs;
  }

  public void setSc_jobs(String sc_jobs) {
    this.sc_jobs = sc_jobs;
  }

  public String getSc_title() {
    return sc_title;
  }

  public void setSc_title(String sc_title) {
    this.sc_title = sc_title;
  }

  public String getSc_name() {
    return sc_name;
  }

  public void setSc_name(String sc_name) {
    this.sc_name = sc_name;
  }

  public String getSc_cont() {
    return sc_cont;
  }

  public void setSc_cont(String sc_cont) {
    this.sc_cont = sc_cont;
  }

  public int getSc_like() {
    return sc_like;
  }

  public void setSc_like(int sc_like) {
    this.sc_like = sc_like;
  }

  public String getSc_date() {
    return sc_date;
  }

  public void setSc_date(String sc_date) {
    this.sc_date = sc_date;
  }

  public String getFile1() {
    if(file1 == null) {
      file1 = "";
    }
    return file1;
  }

  public String getSc_gender() {
    return sc_gender;
  }

  public void setSc_gender(String sc_gender) {
    this.sc_gender = sc_gender;
  }

  public String getSc_position() {
    return sc_position;
  }

  public void setSc_position(String sc_position) {
    this.sc_position = sc_position;
  }

  public String getSc_q() {
    return sc_q;
  }

  public void setSc_q(String sc_q) {
    this.sc_q = sc_q;
  }

  public String getSc_tip() {
    return sc_tip;
  }

  public void setSc_tip(String sc_tip) {
    this.sc_tip = sc_tip;
  }

  public String getSc_stars() {
    return sc_stars;
  }

  public void setSc_stars(String sc_stars) {
    this.sc_stars = sc_stars;
  }

  public String getSc_where() {
    return sc_where;
  }

  public void setSc_where(String sc_where) {
    this.sc_where = sc_where;
  }

  public void setFile1(String file1) {
    this.file1 = file1;
  }

  public String getFile2() {
    if(file2==null) {
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