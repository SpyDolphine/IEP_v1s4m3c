package dev.mvc.category;

public class CategoryVO {
  /*
  CREATE TABLE code(
    categoryno NUMBER(7)  NOT NULL  PRIMARY KEY,
    sort      VARCHAR2(50)  NOT NULL,
    seqno   NUMBER(7)  DEFAULT 0 NOT NULL
  );
  */
  
  /** �ڵ� ��ȣ   */
  private int categoryno;
  /**�з�   */
  private String sort;
  /** ��� ����   */
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
