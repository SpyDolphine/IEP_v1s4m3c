package dev.mvc.servey;

public class ServeyVO {
/* 
CREATE TABLE servey( -- ��������
  serveyno    NUMBER(7)     NOT NULL,    --�������� ��ȣ
  sb_no       NUMBER(7)     NOT NULL,    --�Խ��� ��ȣ
  item        VARCHAR2(200) NOT NULL,    --�������� �׸�
  cnt         NUMBER(7)     DEFAULT 0,   --�������� ī��Ʈ
  aver        NUMBER(3)     DEFAULT 0,   --��ռ�ġ
  FOREIGN KEY (sb_no) REFERENCES serveyboard (sb_no), -- ���� �ѹ�
  PRIMARY KEY(serveyno)
);
 */
  /** �������� */
  private int serveyno;
  /** �Խ��� ��ȣ */
  private int sb_no;
  /** �������� �׸� */
  private String item;
  /** �������� ī��Ʈ */
  private int cnt;
  /** ����� */
  private int aver;
  
  public int getServeyno() {
    return serveyno;
  }
  public void setServeyno(int serveyno) {
    this.serveyno = serveyno;
  }
  public int getSb_no() {
    return sb_no;
  }
  public void setSb_no(int sb_no) {
    this.sb_no = sb_no;
  }
  public String getItem() {
    return item;
  }
  public void setItem(String item) {
    this.item = item;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getAver() {
    return aver;
  }
  public void setAver(int aver) {
    this.aver = aver;
  }
  
  
}
