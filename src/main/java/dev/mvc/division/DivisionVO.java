package dev.mvc.division;
 
// divisionno, categoryno, title, seqno, visible, ids, cnt
public class DivisionVO {
  /** 게시판 번호   */
  private int divisionno;
  /** 대분류 번호   */
  private int categoryno;
  /** 회원 번호   */
  private int me_no;
  /** 제목   */
  private String title;
  /** 출력순서   */
  private int seqno;
  /** 출력모드   */
  private String visible;
  /** 접근 계정   */
  private String ids;
  /** 관련 글수   */
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