package dev.mvc.seico;
 
import org.springframework.web.multipart.MultipartFile;
 
public class SeicoVO {
  private int sc_no;
  private String sc_area;
  private String sc_jobs;
  private String sc_title;
  private String sc_name;
  private String sc_cont;
  private String sc_like;
  private String sc_date;
  private String file1;
  private String file2;
  private int sc_cnt;
  private long size2;

  
  
  /** Framework에서 자동 주입되는 업로드 파일 객체, 실제 컬럼은 존재하지 않음. */  
  private MultipartFile file2MF;
  
  /** size2의 컴마 저장 출력용 변수 */
  private String size2Label;

 

  
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

  public String getSc_like() {
    return sc_like;
  }

  public void setSc_like(String sc_like) {
    this.sc_like = sc_like;
  }

  public String getSc_date() {
    return sc_date;
  }

  public void setSc_date(String sc_date) {
    this.sc_date = sc_date;
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