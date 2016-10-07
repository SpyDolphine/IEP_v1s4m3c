package dev.mvc.app;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.app.AppVO;

 
@Controller
public class AppCont {
  @Autowired
  @Qualifier("dev.mvc.app.AppDAO")
  private AppDAOInter appDAO;
  
  public AppCont(){
    System.out.println("--> AppCont created.");
  }
  @RequestMapping(value = "/app/create.do",
      method = RequestMethod.GET)
public ModelAndView create() {
System.out.println("--> create() GET called.");
ModelAndView mav = new ModelAndView();
mav.setViewName("/app/list"); // /webapp/app/create.jsp

return mav;
}
  @RequestMapping(value = "/app/create.do",
      method = RequestMethod.POST)
public ModelAndView create(AppVO appVO) {
System.out.println("--> create() POST called.");
ModelAndView mav = new ModelAndView();
mav.setViewName("/app/message");

ArrayList<String> msgs = new ArrayList<String>();
ArrayList<String> links = new ArrayList<String>();
 
if (appDAO.create(appVO) == 1) {
msgs.add("처리 완료했습니다.");

links.add("<button type='button' onclick=\"location.href='./login.do'\">로그인</button>");
links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
} else {
msgs.add("실패했습니다.");

links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
}

links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

mav.addObject("msgs", msgs);
mav.addObject("links", links);
 
return mav;
}
  
  /**
   * 전체 목록을 출력합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/app/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/list");// /webapp/app/list.jsp
    mav.addObject("list", appDAO.list()); 
 
    return mav; 
  }
  
  @RequestMapping(value = "/app/update.do", method = RequestMethod.POST)
  public ModelAndView update(AppVO appVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (appDAO.update(appVO) == 1) { 
      mav.setViewName("redirect:/app/list.do");
    } else {
      msgs.add("Code 정보 변경에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
  
  /**
   * 전체 목록을 출력합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/app/index_list.do", method = RequestMethod.GET)
  public ModelAndView top_list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/index_list"); // /app/index_list.jsp
    mav.addObject("list", appDAO.list());
 
    return mav;
  }
  
  /**
   * 레코드 1건을 삭제합니다.
   * @param ap_no
   * @return
   */
  @RequestMapping(value = "/app/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(AppVO appVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (appDAO.delete(appVO.getAp_no() ) == 1) {
      mav.setViewName("redirect:/app/list.do");
    } else {
      msgs.add("삭제에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
 
    } 
 
    return mav;
  }
 
}