package dev.mvc.category;

public class CategoryVO {
  /*
  CREATE TABLE code(
    categoryno NUMBER(7)  NOT NULL  PRIMARY KEY,
    sort      VARCHAR2(50)  NOT NULL,
    seqno   NUMBER(7)  DEFAULT 0 NOT NULL
  );
  */
  
  /** 코드 번호   */
  private int categoryno;
  /**분류   */
  private String sort;
  /** 출력 순서   */
  private int seqno;
  
  public CategoryVO() {
  }
  public CategoryVO(int categoryno, String sort, int seqno) {
    this.categoryno = categoryno;
    this.sort = sort;
    this.seqno = seqno;
  }
  
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
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  
  
}
