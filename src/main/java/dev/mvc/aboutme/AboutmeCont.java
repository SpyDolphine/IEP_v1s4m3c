package dev.mvc.aboutme;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutmeCont {
  @Autowired
  @Qualifier("dev.mvc.aboutme.AboutmeDAO")
  private AboutmeDAOInter aboutmeDAO;

  
  public AboutmeCont(){
    System.out.println("--> AboutmeCont created.");
  }
  
  @RequestMapping(value = "/aboutme/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/aboutme/create"); // /webapp/aboutme/create.jsp
  return mav;
  }
  
  @RequestMapping(value = "/aboutme/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(AboutmeVO aboutmeVO) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/message"); // /webapp/message.jsp
  
  ArrayList<String> msgs = new ArrayList<String>();
  ArrayList<String> links = new ArrayList<String>();
  if (aboutmeDAO.create(aboutmeVO) == 1) { 
    mav.setViewName("redirect:/aboutme/list.do");
  } else {
  msgs.add("항목등록에 실패했습니다.");
  msgs.add("죄송하지만 다시한번 시도해주세요.");
  links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
  links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
  }
  
  mav.addObject("msgs", msgs);
  mav.addObject("links", links);
  
  return mav;
  }
  
  /**
   * 회사목록을 출력합니다.
   * @return
   */
  @RequestMapping(value = "/aboutme/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView listc() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/aboutme/list"); // /webapp/aboutme/list.jsp
    mav.addObject("list", aboutmeDAO.list());
    return mav;
  }
  
  @RequestMapping(value = "/aboutme/update.do", method = RequestMethod.GET)
  public ModelAndView update(int am_no) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/aboutme/update"); // /webapp/aboutme/update.jsp
  
  AboutmeVO aboutmeVO = aboutmeDAO.read(am_no);
  mav.addObject("aboutmeVO", aboutmeVO); 
  
  return mav;
  }
  
  /**
   * 수정합니다
   * @param aboutmeVO
   * @return
   */
  @RequestMapping(value = "/aboutme/update.do", method = RequestMethod.POST)
  public ModelAndView update(AboutmeVO aboutmeVO) {
    ModelAndView mav = new ModelAndView();
 
    if (aboutmeDAO.update(aboutmeVO) == 1) {
        mav.setViewName("redirect:/aboutme/list.do");
    } else {
 
    }
    
    return mav;
  }
  /**
   * 레코드 1건을 삭제합니다.
   * @param am_no
   * @return
   */
  @RequestMapping(value = "/aboutme/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int am_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/aboutme/delete");
    mav.addObject("am_no", am_no); 
    return mav;
  }
  
  @RequestMapping(value = "/aboutme/delete.do", method = RequestMethod.POST)
  public ModelAndView delete2(int am_no) {
    ModelAndView mav = new ModelAndView();
    if (aboutmeDAO.delete(am_no) == 1) {
        mav.setViewName("redirect:/aboutme/list.do");
    } else {
    }
    return mav;
  }
}