package dev.mvc.division;
 
// divisionno, categoryno, title, seqno, visible, ids, cnt
public class DivisionVO {
  /** �Խ��� ��ȣ   */
  private int divisionno;
  /** ��з� ��ȣ   */
  private int categoryno;
  /** ȸ�� ��ȣ   */
  private int me_no;
  /** ����   */
  private String title;
  /** ��¼���   */
  private int seqno;
  /** ��¸��   */
  private String visible;
  /** ���� ����   */
  private String ids;
  /** ���� �ۼ�   */
  private int cnt;
  
  public int getDivisionno() {
    return divisionno;
  }
  public void setDivisionno(int divisionno) {
    this.divisionno = divisionno;
  }
  public int getCategoryno() {
    return categoryno;
  }
  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }
  public int getMe_no() {
    return me_no;
  }
  public void setMe_no(int me_no) {
    this.me_no = me_no;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  public String getIds() {
    return ids;
  }
  public void setIds(String ids) {
    this.ids = ids;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
  
}