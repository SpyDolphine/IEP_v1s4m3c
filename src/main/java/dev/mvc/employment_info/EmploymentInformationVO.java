package dev.mvc.employment_info;

import org.springframework.web.multipart.MultipartFile;

/*

CREATE TABLE employment_info(
    -- boardno                        NUMBER(7)        NOT NULL      PRIMARY KEY,      -- 게시판 번호
    -- boardno                           NUMBER(7)        NOT NULL,                       -- 게시판 번호
    -- divisionno                        NUMBER(7)        NOT NULL,                       -- 카테고리번호
    -- ei_no                          NUMBER(7)        NOT NULL       PRIMARY KEY,     -- 기업정보 번호
    -- ei_no                             NUMBER(7)        NOT NULL,                       -- 기업정보 번호
    -- em_no                          NUMBER(7)        NOT NULL       PRIMARY KEY,     -- 채용정보 번호
    em_no                             NUMBER(7)        NOT NULL,                       -- 채용정보 번호   
    em_title                          VARCHAR2(120)    NOT NULL,                       -- 채용 제목
    em_content                        VARCHAR2(4000)   NOT NULL,                       -- 채용 내용                 
    -- em_mainbusiness                   VARCHAR2(1000)   NOT NULL,                       -- 주요 업무
    em_cof                            VARCHAR2(1000)   NOT NULL,                       -- 자격 요건 (핵샘 직무 영량)
    em_pi                             VARCHAR2(1000)   NOT NULL,                       -- 자격 요건 (우대사항)
    em_rp                             VARCHAR2(1000)   NOT NULL,                       -- 채용절차
    em_howtoapply                     VARCHAR2(1000)   NOT NULL,                       -- 채용절차 (지원방법)
    em_occupations                    VARCHAR2(30)     NOT NULL,                       -- 상세정보(직종)
    em_et                             VARCHAR2(30)     NOT NULL,                       -- 상세정보(고용형태)
    em_lastschool                     VARCHAR2(30)     NOT NULL,                       -- 상세정보(최종학력)
    em_salary                         VARCHAR2(30)     NOT NULL,                       -- 상세정보(급여)
    em_rank                           VARCHAR2(30)     NOT NULL,                       -- 상세정보(직급)
    em_position                       VARCHAR2(30)     NOT NULL,                       -- 상세정보(직책)
    em_url                            VARCHAR2(500)        NULL,                       -- 기타 (홈페이지 채용 URL)
    em_workplace                      VARCHAR2(1000)   NOT NULL,                       -- 기타 (근무지)
    em_startdate                      VARCHAR2(15)         NULL,                       -- 채용 접수 시작일
    -- em_deadline                       VARCHAR2(1000)   NOT NULL,                    -- 채용 접수 마감일                   
    em_enddate                        VARCHAR2(15)         NULL,                       -- 채용 접수 마감일
    em_statedate                      VARCHAR2(15)         NULL,                       -- 채용 서류 발표일
    em_interviewdate                  VARCHAR2(15)         NULL,                       -- 채용 면접 일자
    em_supportformfile1               VARCHAR2(100)        NULL,                       -- 지원양식 파일명 1
    em_supportformsize1               NUMBER(8)        DEFAULT 0     NULL,             -- 지원양식 크기 1
    em_cnt                            NUMBER(7)        DEFAULT 0     NOT NULL,         -- 조회수
    em_date                           DATE             NOT NULL,                       -- 등록날짜
    me_no                             NUMBER(7)        NOT NULL,                       -- 회원 번호
    ei_no                             NUMBER(7)        NOT NULL,                       -- 기업정보 번호
    PRIMARY KEY (em_no)                                                                -- 채용정보 번호 PRIMARY KEY
--   FOREIGN KEY (boardno)    REFERENCES board (boardno),                              -- 보드번호, 기본게시판 참조
    -- FOREIGN KEY (divisionno) REFERENCES division (divisionno),                         -- 카테고리번호
    -- FOREIGN KEY (ei_no)      REFERENCES enterprise_info (ei_no),                       -- 기업정보 FOREIGN KEY
    -- FOREIGN KEY (me_no)      REFERENCES IEP_MEMBER (me_no)                             -- 회원정보 FOREIGN KEY
);

*/

public class EmploymentInformationVO {
  
  /* 채용정보 번호 */
  private int em_no;
  /* 채용 제목 */
  private String em_title;
  /* 채용 내용 */
  private String em_content;
  /* 자격 요건 (핵샘 직무 영량) */
  private String em_cof;
  /* 자격 요건 (우대사항) */
  private String em_pi;
  /* 채용절차 */
  private String em_rp;
  /* 채용절차 (지원방법) */
  private String em_howtoapply;
  /* 상세정보(직종) */
  private String em_occupations;
  /* 상세정보(고용형태) */
  private String em_et;
  /* 상세정보(최종학력) */
  private String em_lastschool;
  /* 상세정보(급여) */
  private String em_salary;
  /* 상세정보(직급) */
  private String em_rank;
  /* 상세정보(직책) */
  private String em_position;
  /* 기타 (홈페이지 채용 URL) */
  private String em_url;
  /* 기타 (근무지) */
  private String em_workplace;
  /* 채용 접수 시작일 */
  private String em_startdate;
  /* 채용 접수 마감일 */
  private String em_enddate;
  /* 채용 서류 발표일 */
  private String em_statedate;
  /* 채용 면접 일자 */
  private String em_interviewdate;
  /* 지원양식 파일명 1 */
  private String em_supportformfile1;
  /* 지원양식 크기 1 */
  private Long em_supportformsize1;
  /* 조회수 */
  private int em_cnt;
  /* 등록날짜 */
  private String em_date;
  
  /* 기업정보 번호 */
  private int ei_no;
  /* 회원정보 번호 */
  private int me_no;
  
  /** Spring Framework에서 자동 주입되는 업로드 파일 객체,
  실제 컬럼은 존재하지 않음.
  */  
  // private MultipartFile file2MF;
  private MultipartFile em_supportformfile1MF;
  
  /** size2의 컴마 저장 출력용 변수, 실제 컬럼은 존재하지 않음. */
  private String size2Label;
  
   
  public String getEm_title() {
    return em_title;
  }
  public void setEm_title(String em_title) {
    this.em_title = em_title;
  }
  public String getEm_content() {
    return em_content;
  }
  public void setEm_content(String em_content) {
    this.em_content = em_content;
  }
  public int getEm_no() {
    return em_no;
  }
  public void setEm_no(int em_no) {
    this.em_no = em_no;
  }
  public String getEm_cof() {
    return em_cof;
  }
  public void setEm_cof(String em_cof) {
    this.em_cof = em_cof;
  }
  public String getEm_pi() {
    return em_pi;
  }
  public void setEm_pi(String em_pi) {
    this.em_pi = em_pi;
  }
  public String getEm_rp() {
    return em_rp;
  }
  public void setEm_rp(String em_rp) {
    this.em_rp = em_rp;
  }
  public String getEm_howtoapply() {
    return em_howtoapply;
  }
  public void setEm_howtoapply(String em_howtoapply) {
    this.em_howtoapply = em_howtoapply;
  }
  public String getEm_occupations() {
    return em_occupations;
  }
  public void setEm_occupations(String em_occupations) {
    this.em_occupations = em_occupations;
  }
  public String getEm_et() {
    return em_et;
  }
  public void setEm_et(String em_et) {
    this.em_et = em_et;
  }
  public String getEm_lastschool() {
    return em_lastschool;
  }
  public void setEm_lastschool(String em_lastschool) {
    this.em_lastschool = em_lastschool;
  }
  public String getEm_salary() {
    return em_salary;
  }
  public void setEm_salary(String em_salary) {
    this.em_salary = em_salary;
  }
  public String getEm_rank() {
    return em_rank;
  }
  public void setEm_rank(String em_rank) {
    this.em_rank = em_rank;
  }
  public String getEm_position() {
    return em_position;
  }
  public void setEm_position(String em_position) {
    this.em_position = em_position;
  }
  public String getEm_url() {
    return em_url;
  }
  public void setEm_url(String em_url) {
    this.em_url = em_url;
  }
  public String getEm_workplace() {
    return em_workplace;
  }
  public void setEm_workplace(String em_workplace) {
    this.em_workplace = em_workplace;
  }
  public String getEm_startdate() {
    return em_startdate;
  }
  public void setEm_startdate(String em_startdate) {
    this.em_startdate = em_startdate;
  }
  public String getEm_enddate() {
    return em_enddate;
  }
  public void setEm_enddate(String em_enddate) {
    this.em_enddate = em_enddate;
  }
  public String getEm_statedate() {
    return em_statedate;
  }
  public void setEm_statedate(String em_statedate) {
    this.em_statedate = em_statedate;
  }
  public String getEm_interviewdate() {
    return em_interviewdate;
  }
  public void setEm_interviewdate(String em_interviewdate) {
    this.em_interviewdate = em_interviewdate;
  }
  public String getEm_supportformfile1() {
    return em_supportformfile1;
  }
  public void setEm_supportformfile1(String em_supportformfile1) {
    this.em_supportformfile1 = em_supportformfile1;
  }
  public Long getEm_supportformsize1() {
    return em_supportformsize1;
  }
  public void setEm_supportformsize1(Long em_supportformsize1) {
    this.em_supportformsize1 = em_supportformsize1;
  }
  public MultipartFile getEm_supportformfile1MF() {
    return em_supportformfile1MF;
  }
  public void setEm_supportformfile1MF(MultipartFile em_supportformfile1MF) {
    this.em_supportformfile1MF = em_supportformfile1MF;
  }
  public String getSize2Label() {
    return size2Label;
  }
  public void setSize2Label(String size2Label) {
    this.size2Label = size2Label;
  }
  public int getEm_cnt() {
    return em_cnt;
  }
  public void setEm_cnt(int em_cnt) {
    this.em_cnt = em_cnt;
  }
  public String getEm_date() {
    return em_date;
  }
  public void setEm_date(String em_date) {
    this.em_date = em_date;
  }
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
  
}
