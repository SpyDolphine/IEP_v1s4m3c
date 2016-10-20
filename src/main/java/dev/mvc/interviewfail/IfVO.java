package dev.mvc.interviewfail;

public class IfVO {
  /*
   create table interview_fail (
   if_no       NUMBER(7)      not null,                     -- 글번호
   if_title    VARCHAR2(200)  NOT NULL,                     -- 한줄평
   if_id       varchar2(100)  not null,                     -- 이메일
   if_nick     varchar2(30)   not null,                     -- 닉네임
   if_gender   varchar2(10)   not null,                     -- 성별(radio)
   if_company  varchar2(100)  not null,                     -- 취업지원계열
   if_position varchar2(300)  not null,                     -- 직급 및 직무
   if_region   varchar2(20)   not null,                     -- 근무지역
   if_content  varchar2(3000) not null,                     -- 취업과정(서류준비/포폴 및 면접과정)
   if_q        varchar2(3000) not null,                     -- 면접 질문
   if_a        varchar2(3000) not null,                     -- 면접 답변
   if_level    varchar2(30)   not null,                     -- 면접 난이도 (radio)
   if_exper    varchar2(20)   not null,                     -- 면접 경험 (radio)
   if_where    varchar2(100)  not null,                     -- 취업경로(radio)
   if_how      varchar2(200)  not null,                     -- 채용방식
   if_when     varchar2(50)   null,                         -- 발표시기
   if_likeit   number(7)      default 0,                    -- 좋아요(추천합니다)
   if_date     date           not null,                     -- 날짜
   PRIMARY KEY(if_no)
);
   */

  private int if_no;
  private String if_title;
  private String if_id;
  private String if_nick;
  private String if_gender;
  private String if_company;
  private String if_position;
  private String if_region;
  private String if_content;
  private String if_q;
  private String if_a;
  private String if_level;
  private String if_exper;
  private String if_where;
  private String if_how;
  private String if_when;
  private int if_likeit; 
  private String if_date;
  
  
  public int getIf_no() {
    return if_no;
  }
  public void setIf_no(int if_no) {
    this.if_no = if_no;
  }
  public String getIf_title() {
    return if_title;
  }
  public void setIf_title(String if_title) {
    this.if_title = if_title;
  }
  public String getIf_id() {
    return if_id;
  }
  public void setIf_id(String if_id) {
    this.if_id = if_id;
  }
  public String getIf_nick() {
    return if_nick;
  }
  public void setIf_nick(String if_nick) {
    this.if_nick = if_nick;
  }
  public String getIf_gender() {
    return if_gender;
  }
  public void setIf_gender(String if_gender) {
    this.if_gender = if_gender;
  }
  public String getIf_company() {
    return if_company;
  }
  public void setIf_company(String if_company) {
    this.if_company = if_company;
  }
  public String getIf_position() {
    return if_position;
  }
  public void setIf_position(String if_position) {
    this.if_position = if_position;
  }
  public String getIf_region() {
    return if_region;
  }
  public void setIf_region(String if_region) {
    this.if_region = if_region;
  }
  public String getIf_content() {
    return if_content;
  }
  public void setIf_content(String if_content) {
    this.if_content = if_content;
  }
  public String getIf_q() {
    return if_q;
  }
  public void setIf_q(String if_q) {
    this.if_q = if_q;
  }
  public String getIf_a() {
    return if_a;
  }
  public void setIf_a(String if_a) {
    this.if_a = if_a;
  }
  public String getIf_level() {
    return if_level;
  }
  public void setIf_level(String if_level) {
    this.if_level = if_level;
  }
  public String getIf_exper() {
    return if_exper;
  }
  public void setIf_exper(String if_exper) {
    this.if_exper = if_exper;
  }
  public String getIf_where() {
    return if_where;
  }
  public void setIf_where(String if_where) {
    this.if_where = if_where;
  }
  public String getIf_how() {
    return if_how;
  }
  public void setIf_how(String if_how) {
    this.if_how = if_how;
  }
  public String getIf_when() {
    return if_when;
  }
  public void setIf_when(String if_when) {
    this.if_when = if_when;
  }
  public int getIf_likeit() {
    return if_likeit;
  }
  public void setIf_likeit(int if_likeit) {
    this.if_likeit = if_likeit;
  }
  public String getIf_date() {
    return if_date;
  }
  public void setIf_date(String if_date) {
    this.if_date = if_date;
  }
}

