package dev.mvc.memberEx;

public class MemberExVO {
  private int me_no;
  private String me_id;
  private String me_pw;
  private String me_nick;
  private String me_name;
  private String me_grade;
  private String me_zipcode;
  private String me_addr1;
  private String me_addr2;
  private String me_tel;
  private String me_date;
  private String me_vis;
  
  /** 등록된 패스워드 */
  private String old_passwd;
  /** id 저장 여부 */
  private String id_save;
  /** passwd 저장 여부 */
  private String passwd_save;
  /** 이동할 주소 저장 */
  private String url_address;
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
  public String getMe_pw() {
    return me_pw;
  }
  public void setMe_pw(String me_pw) {
    this.me_pw = me_pw;
  }
  public String getMe_nick() {
    return me_nick;
  }
  public void setMe_nick(String me_nick) {
    this.me_nick = me_nick;
  }
  public String getMe_name() {
    return me_name;
  }
  public void setMe_name(String me_name) {
    this.me_name = me_name;
  }
  public String getMe_grade() {
    return me_grade;
  }
  public void setMe_grade(String me_grade) {
    this.me_grade = me_grade;
  }
  public String getMe_zipcode() {
    return me_zipcode;
  }
  public void setMe_zipcode(String me_zipcode) {
    this.me_zipcode = me_zipcode;
  }
  public String getMe_addr1() {
    return me_addr1;
  }
  public void setMe_addr1(String me_addr1) {
    this.me_addr1 = me_addr1;
  }
  public String getMe_addr2() {
    return me_addr2;
  }
  public void setMe_addr2(String me_addr2) {
    this.me_addr2 = me_addr2;
  }
  public String getMe_tel() {
    return me_tel;
  }
  public void setMe_tel(String me_tel) {
    this.me_tel = me_tel;
  }
  public String getMe_date() {
    return me_date;
  }
  public void setMe_date(String me_date) {
    this.me_date = me_date;
  }
  public String getOld_passwd() {
    return old_passwd;
  }
  public void setOld_passwd(String old_passwd) {
    this.old_passwd = old_passwd;
  }
  public String getId_save() {
    return id_save;
  }
  public void setId_save(String id_save) {
    this.id_save = id_save;
  }
  public String getPasswd_save() {
    return passwd_save;
  }
  public void setPasswd_save(String passwd_save) {
    this.passwd_save = passwd_save;
  }
  public String getUrl_address() {
    return url_address;
  }
  public void setUrl_address(String url_address) {
    this.url_address = url_address;
  }
  public String getMe_vis() {
    return me_vis;
  }
  public void setMe_vis(String me_vis) {
    this.me_vis = me_vis;
  }
  
}
