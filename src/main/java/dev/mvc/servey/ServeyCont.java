package dev.mvc.servey;
 
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServeyCont {
  @Autowired
  @Qualifier("dev.mvc.servey.ServeyDAO")
  private ServeyDAOInter serveyDAO;

  
  public ServeyCont(){
    System.out.println("--> ServeyCont created.");
  }
  
  @RequestMapping(value = "/servey/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/servey/create"); // /webapp/servey/create.jsp
  return mav;
  }
  
  @RequestMapping(value = "/servey/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(ServeyVO serveyVO) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/message"); // /webapp/message.jsp
  
  ArrayList<String> msgs = new ArrayList<String>();
  ArrayList<String> links = new ArrayList<String>();
  if (serveyDAO.create(serveyVO) == 1) { 
    mav.setViewName("redirect:/serveyboard/update.do?sb_no="+serveyVO.getSb_no());
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
   * 전체 목록을 출력합니다.
   * @return
   */
  @RequestMapping(value = "/servey/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list(int sb_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/servey/list"); // /webapp/servey/list.jsp
    mav.addObject("list", serveyDAO.list(sb_no));

    return mav;
  }

  /**
   * 항목 수정합니다
   * @param serveyno
   * @return
   */
  @RequestMapping(value = "/servey/update.do", 
      method = RequestMethod.GET)
  public ModelAndView update(int serveyno) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/servey/update"); // /webapp/servey/create.jsp
  ServeyVO serveyVO = serveyDAO.read(serveyno);
  mav.addObject("serveyVO", serveyVO); 
   
  return mav;
  }
  
  /**
   * 항목 수정합니다
   * @param serveyVO
   * @return
   */
  @RequestMapping(value = "/servey/update.do", method = RequestMethod.POST)
  public ModelAndView update(ServeyVO serveyVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (serveyDAO.update(serveyVO) == 1) {
      mav.setViewName("redirect:/servey/list.do");
    } else {
      msgs.add("항목 변경에 실패했습니다.");
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
   * 레코드 1건을 삭제합니다.
   * @param serveyno
   * @return
   */
  @RequestMapping(value = "/servey/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int serveyno) {
    ModelAndView mav = new ModelAndView();
 
    ServeyVO serveyVO = serveyDAO.read(serveyno);
      if (serveyDAO.delete(serveyno) == 1) {
        mav.setViewName("redirect:/servey/list.do?sb_no="+serveyVO.getSb_no());
      } else {
      }
    return mav;
  }
  
  /**
   * 투표합니다.
   * @param serveyno
   * @return
   */
  @RequestMapping(value = "/servey/vote.do", method = RequestMethod.POST)
  public ModelAndView vote(int serveyno) {
    ModelAndView mav = new ModelAndView();
    
    ServeyVO serveyVO = serveyDAO.read(serveyno);
    
    if (serveyDAO.vote(serveyno) == 1) {
      // SUM SQL
      int sum = serveyDAO.sum(serveyVO.getSb_no());
      // 목록을 추출 SQL
       List<ServeyVO> list = serveyDAO.list(serveyVO.getSb_no());
      // percent logic
      for (int i = 0; i < list.size(); i++) {
        ServeyVO vo = list.get(i);
        int percent = (int)((vo.getCnt() / (sum * 1.00))*100);
        vo.setAver(percent);
      }
      
      mav.addObject("sb_no", serveyVO.getSb_no());
      mav.addObject("list", list);
      mav.setViewName("/servey/result");
      
    } else {
      
    }
    return mav;
  }
  
  /**
   * 결과 출력
   * @param sb_no
   * @return
   */
  @RequestMapping(value = "/servey/result.do", 
      method = RequestMethod.GET)
  public ModelAndView result(int sb_no) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/servey/result"); // /webapp/servey/create.jsp
  ServeyVO serveyVO = serveyDAO.result(sb_no);
  mav.addObject("serveyVO", serveyVO); 
   
  return mav;
  }
   
}