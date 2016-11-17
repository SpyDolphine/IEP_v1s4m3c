package dev.mvc.calender;

import java.util.List;

public interface CalenderDAOInter {

  /**
   *  <insert id="create" parameterType="CalenderVO">
   *  일정 등록 부분
   */
  public int create(CalenderVO calenderVO);
  /**
   *<select id="callist" resultType="CalenderVO">
   *일정 목록 리스트형
   */
  public List<CalenderVO> callist(int me_no);
}
