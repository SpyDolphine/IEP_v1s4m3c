package dev.mvc.enterprise_info;

import org.springframework.web.multipart.MultipartFile;

public class EnterpriseInformationVO {
 
/* 
 
CREATE TABLE enterprise_info(
    ei_no                             NUMBER(7)            NOT NULL,                        -- 기업정보 번호
    ei_corporationname                VARCHAR2(50)         NOT NULL,                        -- 회사 이름
    ei_slotname                       VARCHAR2(50)         NOT NULL,                        -- 대표자 이름
    ei_crn                            VARCHAR2(50)         NOT NULL,                        -- 사업자등록 번호
    ei_employees                      NUMBER(17)           DEFAULT 0     NULL,              -- 사원수
    ei_established                    VARCHAR2(15)         NOT NULL,                        -- 설립일
    ei_business                       VARCHAR2(50)         NOT NULL,                        -- 직무별 (직종)
    ei_url                            VARCHAR2(500)            NULL,                        -- 회사 URL
    ei_ci                             VARCHAR2(1000)       NOT NULL,                        -- 기업 소개 (Company Introduction)
    ei_majorbusiness                  VARCHAR2(1000)       NOT NULL,                        -- 주요 업무
    ei_logofile1                      VARCHAR2(100)            NULL ,                       -- 로고파일명 1
    ei_logofile2                      VARCHAR2(100)            NULL,                        -- 로고파일명 2
    ei_logosize2                      NUMBER(8)            DEFAULT 0     NULL,              -- 로고크기 2
    ei_map                            VARCHAR2(1024)           NULL,                        -- 회사지도
    ei_tpic                           VARCHAR2(30)         NOT NULL,                        -- 채용담당자
    ei_date                           DATE                 NOT NULL,                        -- 등록날짜
    me_no                             NUMBER(7)            NOT NULL,                        -- 회원 번호
    PRIMARY KEY (ei_no)                                                                     -- 기업정보 번호 PRIMARY KEY
    -- FOREIGN KEY (me_no)      REFERENCES IEP_MEMBER (me_no)                               -- 회원번호 FOREIGN KEY
);

*/
  
  /** 기업정보 번호 */
  private int ei_no;                  // 기업정보 번호
  /** 회원정보 번호 */
  private int me_no;                  // 회원정보 번호
  /** 회사이름 */
  private String ei_corporationname;  // 회사 이름
  /** 대표자 이름 */
  private String ei_slotname;         // 대표자 이름
  /** 사업자등록 번호 */
  private String ei_crn;              // 사업자등록 번호
  /** 사원수 */
  private Long ei_employees;          // 사원수
  /** 설립일 */
  private String ei_established;      // 설립일
  /** 연혁 날짜 */
  private String ei_historydate;      // 연혁 날짜
  /** 연혁 제목 */
  private String ei_historytitle;     // 연혁 제목
  /** 업종 */
  private String ei_business;         // 업종 
  /** 회사주소 */
  private String ei_url;              // 회사 URL 
  /** 기업 소개 (Company Introduction) */
  private String ei_ci; // 기업 소개 (Company Introduction)
  /** 주요 업무 */
  private String ei_majorbusiness; 
  /** 로고파일명 1 */
  // private String ei_logofile1;     // 로고파일명 1
  /** 로고파일명 1 */
  /** Preview 소형 이미지 200 X 150, 자동 생성됨 */
  private String ei_logofile1 = "";   // 로고파일명 1
  /** 업로드 파일 */
  private String ei_logofile2 = "";   // 업로드 파일
  /** 로고크기 1 */
  private long ei_logosize2;          // 로고크기 1
  /** 회사지도 */
  private String ei_map;              // 회사지도
  /** 채용담당자 */
  private String ei_tpic;             // 채용담당자
  /** 등록날짜 */
  private String ei_date;             // 등록날짜 
  
  
  /** Spring Framework에서 자동 주입되는 업로드 파일 객체,
  실제 컬럼은 존재하지 않음.
  */  
  // private MultipartFile file2MF;
  private MultipartFile ei_logofile2MF;
  
  /** size2의 컴마 저장 출력용 변수, 실제 컬럼은 존재하지 않음. */
  private String size2Label; 
  
  
  public int getEi_no() {
    return ei_no;
  }
  public void setEi_no(int ei_no) {
    this.ei_no = ei_no;
  }
  public int getMe_no() {
    return me_no;
  }
  public void setMe_no(int me_no) {
    this.me_no = me_no;
  }
  public String getEi_corporationname() {
    return ei_corporationname;
  }
  public void setEi_corporationname(String ei_corporationname) {
    this.ei_corporationname = ei_corporationname;
  }
  public String getEi_slotname() {
    return ei_slotname;
  }
  public void setEi_slotname(String ei_slotname) {
    this.ei_slotname = ei_slotname;
  }
  public String getEi_crn() {
    return ei_crn;
  }
  public void setEi_crn(String ei_crn) {
    this.ei_crn = ei_crn;
  }
  public Long getEi_employees() {
    return ei_employees;
  }
  public void setEi_employees(Long ei_employees) {
    this.ei_employees = ei_employees;
  }
  public String getEi_established() {
    return ei_established;
  }
  public void setEi_established(String ei_established) {
    this.ei_established = ei_established;
  }
  public String getEi_historydate() {
    return ei_historydate;
  }
  public void setEi_historydate(String ei_historydate) {
    this.ei_historydate = ei_historydate;
  }
  public String getEi_historytitle() {
    return ei_historytitle;
  }
  public void setEi_historytitle(String ei_historytitle) {
    this.ei_historytitle = ei_historytitle;
  }
  public String getEi_business() {
    return ei_business;
  }
  public void setEi_business(String ei_business) {
    this.ei_business = ei_business;
  }
  public String getEi_url() {
    // return ei_url;
    return (ei_url != null)?ei_url:"";
  }
  public void setEi_url(String ei_url) {
    this.ei_url = ei_url;
  }
  public String getEi_ci() {
    if (ei_ci == null){
      ei_ci = "";
    }
    return ei_ci;
  }
  public void setEi_ci(String ei_ci) {
    this.ei_ci = ei_ci;
  }
  public String getEi_majorbusiness() {
    if (ei_majorbusiness == null){
      ei_majorbusiness = "";
    }
    return ei_majorbusiness;
  }
  public void setEi_majorbusiness(String ei_majorbusiness) {
    this.ei_majorbusiness = ei_majorbusiness;
  }
  public String getEi_logofile1() {
    // return ei_logofile1;
/*
    if (ei_logofile1 == null){
      ei_logofile1 = "";
    }
*/
    return (ei_logofile1 != null)?ei_logofile1:"";
  }
  public void setEi_logofile1(String ei_logofile1) {
    this.ei_logofile1 = ei_logofile1;
  }
  public String getEi_logofile2() {
    if (ei_logofile2 == null){
      ei_logofile2 = "";
    }
    return ei_logofile2;
    // return ei_logofile2 != null)?ei_logofile2:"";
  }
  public void setEi_logofile2(String ei_logofile2) {
    this.ei_logofile2 = ei_logofile2;
  }
  public MultipartFile getEi_logofile2MF() {
    return ei_logofile2MF;
  }
  public void setEi_logofile2MF(MultipartFile ei_logofile2MF) {
    this.ei_logofile2MF = ei_logofile2MF;
  }
  public String getSize2Label() {
    return size2Label;
  }
  public void setSize2Label(String size2Label) {
    this.size2Label = size2Label;
  }
  public long getEi_logosize2() {
    return ei_logosize2;
  }
  public void setEi_logosize2(long ei_logosize2) {
    this.ei_logosize2 = ei_logosize2;
  }
  public String getEi_map() {
    // return ei_map;
    return (ei_map != null)?ei_map:"";
  }
  public void setEi_map(String ei_map) {
    this.ei_map = ei_map;
  }
  public String getEi_tpic() {
    return ei_tpic;
  }
  public void setEi_tpic(String ei_tpic) {
    this.ei_tpic = ei_tpic;
  }
  public String getEi_date() {
    return ei_date;
  }
  public void setEi_date(String ei_date) {
    this.ei_date = ei_date;
  }
    
}
