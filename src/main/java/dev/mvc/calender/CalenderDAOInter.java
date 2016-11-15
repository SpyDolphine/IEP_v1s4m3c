package dev.mvc.calender;

public interface CalenderDAOInter {

  /**
   *  <insert id="create" parameterType="CalenderVO">
   *  일정 등록 부분
   */
  public int create(CalenderVO calenderVO);
}
