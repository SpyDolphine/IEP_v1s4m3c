package dev.mvc.calender;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.memberEx.MemberExDAOInter;
import dev.mvc.scrap.ScrapDAOInter;


@Controller
public class CalenderCont {
  @Autowired
  @Qualifier("dev.mvc.calender.CalenderDAO")
  private CalenderDAOInter calenderDAO;
  
  @Autowired
  @Qualifier("dev.mvc.scrap.ScrapDAO")
  private ScrapDAOInter scrapDAO;
  
  @Autowired
  @Qualifier("dev.mvc.memberEx.MemberExDAO")
  private MemberExDAOInter memberExDAO;
  
  @RequestMapping(value = "/calender/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calender/create"); // /webapp/blog/create.jsp
    return mav;
  }
  @RequestMapping(value = "/calender/create.do", method = RequestMethod.POST)
  public ModelAndView create(CalenderVO calenderVO, HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calender/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    Integer itg = (Integer) (session.getAttribute("me_no"));
    calenderVO.setMe_no(itg.intValue());

    if (calenderDAO.create(calenderVO) == 1) {
      // blogcategoryDAO.increaseCnt(blogVO.getBlogcategoryno());
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do>계속 등록</button>");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./index.do'\">홈페이지</button>");
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
}
