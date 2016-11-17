package dev.mvc.employment_info;

import org.springframework.web.multipart.MultipartFile;

/*

CREATE TABLE employment_info(
    -- boardno                        NUMBER(7)        NOT NULL      PRIMARY KEY,      -- �Խ��� ��ȣ
    -- boardno                           NUMBER(7)        NOT NULL,                       -- �Խ��� ��ȣ
    -- divisionno                        NUMBER(7)        NOT NULL,                       -- ī�װ���ȣ
    -- ei_no                          NUMBER(7)        NOT NULL       PRIMARY KEY,     -- ������� ��ȣ
    -- ei_no                             NUMBER(7)        NOT NULL,                       -- ������� ��ȣ
    -- em_no                          NUMBER(7)        NOT NULL       PRIMARY KEY,     -- ä������ ��ȣ
    em_no                             NUMBER(7)        NOT NULL,                       -- ä������ ��ȣ   
    em_title                          VARCHAR2(120)    NOT NULL,                       -- ä�� ����
    em_content                        VARCHAR2(4000)   NOT NULL,                       -- ä�� ����                 
    -- em_mainbusiness                   VARCHAR2(1000)   NOT NULL,                       -- �ֿ� ����
    em_cof                            VARCHAR2(1000)   NOT NULL,                       -- �ڰ� ��� (�ٻ� ���� ����)
    em_pi                             VARCHAR2(1000)   NOT NULL,                       -- �ڰ� ��� (������)
    em_rp                             VARCHAR2(1000)   NOT NULL,                       -- ä������
    em_howtoapply                     VARCHAR2(1000)   NOT NULL,                       -- ä������ (�������)
    em_occupations                    VARCHAR2(30)     NOT NULL,                       -- ������(����)
    em_et                             VARCHAR2(30)     NOT NULL,                       -- ������(�������)
    em_lastschool                     VARCHAR2(30)     NOT NULL,                       -- ������(�����з�)
    em_salary                         VARCHAR2(30)     NOT NULL,                       -- ������(�޿�)
    em_rank                           VARCHAR2(30)     NOT NULL,                       -- ������(����)
    em_position                       VARCHAR2(30)     NOT NULL,                       -- ������(��å)
    em_url                            VARCHAR2(500)        NULL,                       -- ��Ÿ (Ȩ������ ä�� URL)
    em_workplace                      VARCHAR2(1000)   NOT NULL,                       -- ��Ÿ (�ٹ���)
    em_startdate                      VARCHAR2(15)         NULL,                       -- ä�� ���� ������
    -- em_deadline                       VARCHAR2(1000)   NOT NULL,                    -- ä�� ���� ������                   
    em_enddate                        VARCHAR2(15)         NULL,                       -- ä�� ���� ������
    em_statedate                      VARCHAR2(15)         NULL,                       -- ä�� ���� ��ǥ��
    em_interviewdate                  VARCHAR2(15)         NULL,                       -- ä�� ���� ����
    em_supportformfile1               VARCHAR2(100)        NULL,                       -- ������� ���ϸ� 1
    em_supportformsize1               NUMBER(8)        DEFAULT 0     NULL,             -- ������� ũ�� 1
    em_cnt                            NUMBER(7)        DEFAULT 0     NOT NULL,         -- ��ȸ��
    em_date                           DATE             NOT NULL,                       -- ��ϳ�¥
    me_no                             NUMBER(7)        NOT NULL,                       -- ȸ�� ��ȣ
    ei_no                             NUMBER(7)        NOT NULL,                       -- ������� ��ȣ
    PRIMARY KEY (em_no)                                                                -- ä������ ��ȣ PRIMARY KEY
--   FOREIGN KEY (boardno)    REFERENCES board (boardno),                              -- �����ȣ, �⺻�Խ��� ����
    -- FOREIGN KEY (divisionno) REFERENCES division (divisionno),                         -- ī�װ���ȣ
    -- FOREIGN KEY (ei_no)      REFERENCES enterprise_info (ei_no),                       -- ������� FOREIGN KEY
    -- FOREIGN KEY (me_no)      REFERENCES IEP_MEMBER (me_no)                             -- ȸ������ FOREIGN KEY
);

*/

public class EmploymentInformationVO {
  
  /* ä������ ��ȣ */
  private int em_no;
  /* ä�� ���� */
  private String em_title;
  /* ä�� ���� */
  private String em_content;
  /* �ڰ� ��� (�ٻ� ���� ����) */
  private String em_cof;
  /* �ڰ� ��� (������) */
  private String em_pi;
  /* ä������ */
  private String em_rp;
  /* ä������ (�������) */
  private String em_howtoapply;
  /* ������(����) */
  private String em_occupations;
  /* ������(�������) */
  private String em_et;
  /* ������(�����з�) */
  private String em_lastschool;
  /* ������(�޿�) */
  private String em_salary;
  /* ������(����) */
  private String em_rank;
  /* ������(��å) */
  private String em_position;
  /* ��Ÿ (Ȩ������ ä�� URL) */
  private String em_url;
  /* ��Ÿ (�ٹ���) */
  private String em_workplace;
  /* ä�� ���� ������ */
  private String em_startdate;
  /* ä�� ���� ������ */
  private String em_enddate;
  /* ä�� ���� ��ǥ�� */
  private String em_statedate;
  /* ä�� ���� ���� */
  private String em_interviewdate;
  /* ������� ���ϸ� 1 */
  private String em_supportformfile1;
  /* ������� ũ�� 1 */
  private Long em_supportformsize1;
  /* ��ȸ�� */
  private int em_cnt;
  /* ��ϳ�¥ */
  private String em_date;
  
  /* ������� ��ȣ */
  private int ei_no;
  /* ȸ������ ��ȣ */
  private int me_no;
  
  /** Spring Framework���� �ڵ� ���ԵǴ� ���ε� ���� ��ü,
  ���� �÷��� �������� ����.
  */  
  // private MultipartFile file2MF;
  private MultipartFile em_supportformfile1MF;
  
  /** size2�� �ĸ� ���� ��¿� ����, ���� �÷��� �������� ����. */
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
