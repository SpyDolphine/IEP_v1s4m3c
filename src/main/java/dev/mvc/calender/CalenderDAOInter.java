package dev.mvc.calender;

import java.util.List;

public interface CalenderDAOInter {

  /**
   *  <insert id="create" parameterType="CalenderVO">
   *  ���� ��� �κ�
   */
  public int create(CalenderVO calenderVO);
  /**
   *<select id="callist" resultType="CalenderVO">
   *���� ��� ����Ʈ��
   */
  public List<CalenderVO> callist(int me_no);
}
