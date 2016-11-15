package dev.mvc.enterprise_info;

import org.springframework.web.multipart.MultipartFile;

public class EnterpriseInformationVO {
 
/* 
 
CREATE TABLE enterprise_info(
    ei_no                             NUMBER(7)            NOT NULL,                        -- ������� ��ȣ
    ei_corporationname                VARCHAR2(50)         NOT NULL,                        -- ȸ�� �̸�
    ei_slotname                       VARCHAR2(50)         NOT NULL,                        -- ��ǥ�� �̸�
    ei_crn                            VARCHAR2(50)         NOT NULL,                        -- ����ڵ�� ��ȣ
    ei_employees                      NUMBER(17)           DEFAULT 0     NULL,              -- �����
    ei_established                    VARCHAR2(15)         NOT NULL,                        -- ������
    ei_business                       VARCHAR2(50)         NOT NULL,                        -- ������ (����)
    ei_url                            VARCHAR2(500)            NULL,                        -- ȸ�� URL
    ei_ci                             VARCHAR2(1000)       NOT NULL,                        -- ��� �Ұ� (Company Introduction)
    ei_majorbusiness                  VARCHAR2(1000)       NOT NULL,                        -- �ֿ� ����
    ei_logofile1                      VARCHAR2(100)            NULL ,                       -- �ΰ����ϸ� 1
    ei_logofile2                      VARCHAR2(100)            NULL,                        -- �ΰ����ϸ� 2
    ei_logosize2                      NUMBER(8)            DEFAULT 0     NULL,              -- �ΰ�ũ�� 2
    ei_map                            VARCHAR2(1024)           NULL,                        -- ȸ������
    ei_tpic                           VARCHAR2(30)         NOT NULL,                        -- ä������
    ei_date                           DATE                 NOT NULL,                        -- ��ϳ�¥
    me_no                             NUMBER(7)            NOT NULL,                        -- ȸ�� ��ȣ
    PRIMARY KEY (ei_no)                                                                     -- ������� ��ȣ PRIMARY KEY
    -- FOREIGN KEY (me_no)      REFERENCES IEP_MEMBER (me_no)                               -- ȸ����ȣ FOREIGN KEY
);

*/
  
  /** ������� ��ȣ */
  private int ei_no;                  // ������� ��ȣ
  /** ȸ������ ��ȣ */
  private int me_no;                  // ȸ������ ��ȣ
  /** ȸ���̸� */
  private String ei_corporationname;  // ȸ�� �̸�
  /** ��ǥ�� �̸� */
  private String ei_slotname;         // ��ǥ�� �̸�
  /** ����ڵ�� ��ȣ */
  private String ei_crn;              // ����ڵ�� ��ȣ
  /** ����� */
  private Long ei_employees;          // �����
  /** ������ */
  private String ei_established;      // ������
  /** ���� ��¥ */
  private String ei_historydate;      // ���� ��¥
  /** ���� ���� */
  private String ei_historytitle;     // ���� ����
  /** ���� */
  private String ei_business;         // ���� 
  /** ȸ���ּ� */
  private String ei_url;              // ȸ�� URL 
  /** ��� �Ұ� (Company Introduction) */
  private String ei_ci; // ��� �Ұ� (Company Introduction)
  /** �ֿ� ���� */
  private String ei_majorbusiness; 
  /** �ΰ����ϸ� 1 */
  // private String ei_logofile1;     // �ΰ����ϸ� 1
  /** �ΰ����ϸ� 1 */
  /** Preview ���� �̹��� 200 X 150, �ڵ� ������ */
  private String ei_logofile1 = "";   // �ΰ����ϸ� 1
  /** ���ε� ���� */
  private String ei_logofile2 = "";   // ���ε� ����
  /** �ΰ�ũ�� 1 */
  private long ei_logosize2;          // �ΰ�ũ�� 1
  /** ȸ������ */
  private String ei_map;              // ȸ������
  /** ä������ */
  private String ei_tpic;             // ä������
  /** ��ϳ�¥ */
  private String ei_date;             // ��ϳ�¥ 
  
  
  /** Spring Framework���� �ڵ� ���ԵǴ� ���ε� ���� ��ü,
  ���� �÷��� �������� ����.
  */  
  // private MultipartFile file2MF;
  private MultipartFile ei_logofile2MF;
  
  /** size2�� �ĸ� ���� ��¿� ����, ���� �÷��� �������� ����. */
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
