package dev.mvc.calender;

public class CalenderVO {
 /* cl_no                             NUMBER(7)    NOT NULL    PRIMARY KEY,   -- 일정 넘버
  me_no                             NUMBER(7)     NULL ,      -- 회원 번호
  me_id                             VARCHAR2(100)    NOT NULL,    -- 회원아이디
  title                          VARCHAR2(120)    NOT NULL,    -- 캘린더 제목
  content                        VARCHAR2(100)    NULL,   --  캘린더 내용
  startdate                          varchar2(30)   NULL,       -- 일정 시작일  
  enddate                          varchar2(30)   NULL,       -- 일정 마감일
  statedate                         varchar2(30)   NULL,        -- 일정 발표 일
  daydate                             varchar2(30)   NULL,        -- 일정 당일
  cl_date                           DATE     NOT NULL,            -- 일정 등록읽
  sp_no                             NUMBER(7)    NULL ,           -- 스크랩 번호*/
  
  private int cl_no;
  private int sp_no;
  private int me_no;
  private String me_id;
  private String title;
  private String content;
  private String startdate;
  private String enddate;
  private String statedate;
  private String daydate;
  private String cl_date;
  private String sp_content;
  
  
  public String getSp_content() {
    return sp_content;
  }
  public void setSp_content(String sp_content) {
    this.sp_content = sp_content;
  }
  public int getCl_no() {
    return cl_no;
  }
  public void setCl_no(int cl_no) {
    this.cl_no = cl_no;
  }
  public int getSp_no() {
    return sp_no;
  }
  public void setSp_no(int sp_no) {
    this.sp_no = sp_no;
  }
  public int getMe_no() {
    return me_no;
  }
  public void setMe_no(int me_no) {
    this.me_no = me_no;
  }
  public String getMe_id() {
    return me_id;
  }
  public void setMe_id(String me_id) {
    this.me_id = me_id;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getStartdate() {
    return startdate;
  }
  public void setStartdate(String startdate) {
    this.startdate = startdate;
  }
  public String getEnddate() {
    return enddate;
  }
  public void setEnddate(String enddate) {
    this.enddate = enddate;
  }
  public String getStatedate() {
    return statedate;
  }
  public void setStatedate(String statedate) {
    this.statedate = statedate;
  }
  public String getDaydate() {
    return daydate;
  }
  public void setDaydate(String daydate) {
    this.daydate = daydate;
  }
  public String getCl_date() {
    return cl_date;
  }
  public void setCl_date(String cl_date) {
    this.cl_date = cl_date;
  }  
}
