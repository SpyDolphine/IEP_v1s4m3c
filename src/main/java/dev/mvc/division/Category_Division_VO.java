package dev.mvc.division;
 
// SELECT c.categoryno, c.sort, c.seqno, 
// t.divisionno, t.title, t.seqno, t.visible, t.ids, t.cnt
public class Category_Division_VO {
  private int categoryno; 
  private String sort;
  
  private int divisionno;
  private String title;
  private int seqno;
  private String visible;
  private String ids;
  private int cnt;
  
  public int getCategoryno() {
    return categoryno;
  }
  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }
  public String getSort() {
    return sort;
  }
  public void setSort(String sort) {
    this.sort = sort;
  }
  public int getDivisionno() {
    return divisionno;
  }
  public void setDivisionno(int divisionno) {
    this.divisionno = divisionno;
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