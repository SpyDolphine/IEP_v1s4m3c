package dev.mvc.interview;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InterviewCont {
  @Autowired
  @Qualifier("dev.mvc.interview.InterviewDAO")
  private InterviewDAOInter interviewDAO;

  
  public InterviewCont(){
    System.out.println("--> InterviewCont created.");
  }
  
  @RequestMapping(value = "/interview/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  
  mav.setViewName("/interview/create"); // /webapp/interview/create.jsp
  
  return mav;
  }
  
  @RequestMapping(value = "/interview/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(InterviewVO interviewVO) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/message"); // /webapp/message.jsp
  
  ArrayList<String> msgs = new ArrayList<String>();
  ArrayList<String> links = new ArrayList<String>();
  
  if (interviewDAO.create(interviewVO) == 1) { 
    mav.setViewName("redirect:/interview/list.do");
  } else {
    msgs.add("등록에 실패했습니다.");
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
  @RequestMapping(value = "/interview/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView listc() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interview/list"); // /webapp/interview/list.jsp
    mav.addObject("list", interviewDAO.list());
    return mav;
  }
  
  @RequestMapping(value = "/interview/update.do", method = RequestMethod.GET)
  public ModelAndView update(int iv_no) {
  ModelAndView mav = new ModelAndView();
  
  mav.setViewName("/interview/update"); // /webapp/interview/update.jsp
  
  InterviewVO interviewVO = interviewDAO.read(iv_no);
  mav.addObject("interviewVO", interviewVO); 
  
  return mav;
  }
  /**
   * 수정합니다
   * @param interviewVO
   * @return
   */
  @RequestMapping(value = "/interview/update.do", method = RequestMethod.POST)
  public ModelAndView update(InterviewVO interviewVO) {
    ModelAndView mav = new ModelAndView();
 
    if (interviewDAO.update(interviewVO) == 1) {
        mav.setViewName("redirect:/interview/list.do");
    } else {
 
    }
    return mav;
  }
  
  /**
   * 레코드 1건을 삭제합니다.
   * @param iv_no
   * @return
   */
  @RequestMapping(value = "/interview/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int iv_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interview/delete");
    mav.addObject("iv_no", iv_no); 
    return mav;
  }
  
  @RequestMapping(value = "/interview/delete.do", method = RequestMethod.POST)
  public ModelAndView delete2(int iv_no) {
    ModelAndView mav = new ModelAndView();
    if (interviewDAO.delete(iv_no) == 1) {
        mav.setViewName("redirect:/interview/list.do");
    } else {
      
    }
    return mav;
  }
}