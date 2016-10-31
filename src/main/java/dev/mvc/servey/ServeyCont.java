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
  msgs.add("�׸��Ͽ� �����߽��ϴ�.");
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
  @RequestMapping(value = "/servey/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list(int sb_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/servey/list"); // /webapp/servey/list.jsp
    mav.addObject("list", serveyDAO.list(sb_no));

    return mav;
  }

  /**
   * �׸� �����մϴ�
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
   * �׸� �����մϴ�
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
   * ��ǥ�մϴ�.
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
      // ����� ���� SQL
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
   * ��� ���
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