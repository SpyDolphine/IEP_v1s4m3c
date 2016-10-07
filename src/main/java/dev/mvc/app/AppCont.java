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
msgs.add("ó�� �Ϸ��߽��ϴ�.");

links.add("<button type='button' onclick=\"location.href='./login.do'\">�α���</button>");
links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
} else {
msgs.add("�����߽��ϴ�.");

links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
}

links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

mav.addObject("msgs", msgs);
mav.addObject("links", links);
 
return mav;
}
  
  /**
   * ��ü ����� ����մϴ�.
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
      msgs.add("Code ���� ���濡 �����߽��ϴ�.");
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
   * ��ü ����� ����մϴ�.
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
   * ���ڵ� 1���� �����մϴ�.
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
      msgs.add("������ �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
 
    } 
 
    return mav;
  }
 
}