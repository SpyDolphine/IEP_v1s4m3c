package dev.mvc.serveyboard;
 
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.servey.ServeyDAOInter;
import dev.mvc.servey.ServeyVO;

@Controller
public class ServeyboardCont {
  @Autowired
  @Qualifier("dev.mvc.serveyboard.ServeyboardDAO")
  private ServeyboardDAOInter serveyboardDAO;

  @Autowired
  @Qualifier("dev.mvc.servey.ServeyDAO")
  private ServeyDAOInter serveyDAO;

  
  public ServeyboardCont(){
    System.out.println("--> ServeyboardCont created.");
  }
  
  @RequestMapping(value = "/serveyboard/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/serveyboard/create"); // /webapp/servey/create.jsp
  
  return mav;
  }
  
  @RequestMapping(value = "/serveyboard/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(ServeyboardVO serveyboardVO) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/message"); // /webapp/message.jsp
  
  ArrayList<String> msgs = new ArrayList<String>();
  ArrayList<String> links = new ArrayList<String>();
  
  if (serveyboardDAO.create(serveyboardVO) == 1) { 
    mav.setViewName("redirect:/serveyboard/read.do?sb_no="+serveyboardDAO.max());
  } else {
  msgs.add("��Ͽ� �����߽��ϴ�.");
  msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
  links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
  links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
  }
  
  mav.addObject("msgs", msgs);
  mav.addObject("links", links);
  
  return mav;
  }
  
  /**
   * ��ü ����� ����մϴ�.
   * @return
   */
  @RequestMapping(value = "/serveyboard/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/serveyboard/list");
    mav.addObject("list", serveyboardDAO.list());

    return mav;
  }
  
  @RequestMapping(value = "/serveyboard/update.do", 
      method = RequestMethod.GET)
  public ModelAndView update(int sb_no) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/serveyboard/update"); 
  ServeyboardVO serveyboardVO = serveyboardDAO.read(sb_no);
  mav.addObject("serveyboardVO", serveyboardVO); 
   
  return mav;
  }
  
  
  @RequestMapping(value = "/serveyboard/read.do", 
      method = RequestMethod.GET)
  public ModelAndView read(int sb_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/serveyboard/read"); 
    ServeyboardVO serveyboardVO = serveyboardDAO.read(sb_no);
    mav.addObject("serveyboardVO", serveyboardVO); 
    
    List<ServeyVO> serveyVO = serveyDAO.list(sb_no);
    mav.addObject("serveyVO", serveyVO); 
    
    return mav;
  }
  
  /**
   * �׸� �����մϴ�
   * @param serveyVO
   * @return
   */
  @RequestMapping(value = "/serveyboard/update.do", method = RequestMethod.POST)
  public ModelAndView update(ServeyboardVO serveyboardVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (serveyboardDAO.update(serveyboardVO) == 1) {
      mav.setViewName("redirect:/serveyboard/list.do");
    } else {
      msgs.add("�׸� ���濡 �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
  /**
   * ���ڵ� 1���� �����մϴ�.
   * @param serveyno
   * @return
   */
  @RequestMapping(value = "/serveyboard/delete.do", method = RequestMethod.GET)
  public ModelAndView delete2(int sb_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("sb_no", sb_no);
    return mav;
  }  
  
  /**
   * ���ڵ� 1���� �����մϴ�.
   * @param sb_no
   * @return
   */
  @RequestMapping(value = "/serveyboard/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int sb_no) {
    ModelAndView mav = new ModelAndView();
 
      if (serveyboardDAO.delete(sb_no) == 1) {
        mav.setViewName("redirect:/serveyboard/list.do");
      } else {
 
      }
    return mav;
  }
  
}