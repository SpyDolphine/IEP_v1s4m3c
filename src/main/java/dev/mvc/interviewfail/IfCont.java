package dev.mvc.interviewfail;
 
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.tool.Tool;
import web.tool.Upload;
 
@Controller
public class IfCont {
  @Autowired
  @Qualifier("dev.mvc.interviewfail.IfDAO")
  private IfInter ifDAO;
  
  public IfCont(){
    System.out.println("--> IfCont created.");
  }
  
  @RequestMapping(value = "/interviewfail/createboot.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/createboot"); // member�� create.do�� ���� ��� �̵� -> /webapp/community/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/interviewfail/createboot.do", method = RequestMethod.POST)
  public ModelAndView create(IfVO ifVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/message"); // /webapp/member/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (ifDAO.create(ifVO) == 1) {
      msgs.add("���� ����� ó�� �Ǿ����ϴ�.");
      msgs.add("�����մϴ�.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">�α���</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("���� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
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
  @RequestMapping(value = "/interviewfail/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/list");      // list_total.jsp
    
    List<IfVO> list = ifDAO.list();
    Iterator<IfVO> iter = list.iterator();
    while(iter.hasNext() == true){  // ���� ��� �˻�
      IfVO ifVO = iter.next();  // ��� ����
      ifVO.setIf_no(ifVO.getIf_no());
    }
    mav.addObject("list", list);
    
    return mav;
  }
  
  /**
   * ���� ��ȸ�մϴ�
   * @param if_no
   * @return
   */
  @RequestMapping(value = "/interviewfail/read.do", method = RequestMethod.GET)
  public ModelAndView read(int if_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/read");
    IfVO ifVO = ifDAO.read(if_no); 
    
    // Ư������ó��
    String if_content = ifVO.getIf_content();
    if_content = Tool.convertChar(if_content);  
    ifVO.setIf_content(if_content);
    
    mav.addObject("ifVO", ifVO); 
 
    return mav;
  }  
  
  /**
   * ������
   * @param blogno
   * @return
   */
  @RequestMapping(value="/interviewfail/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int if_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/update"); 
    mav.addObject("ifVO", ifDAO.read(if_no)); 
 
    return mav;
 
  }
   
  /**
   * ���� ó��
   * @param blogVO
   * @return
   */
  @RequestMapping(value="/interviewfail/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(IfVO ifVO, 
                                     HttpServletRequest request, 
                                     HttpSession session){
    ModelAndView mav = new ModelAndView();
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(ifDAO.update(ifVO) == 1){
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/interviewfail/read.do?if_no=" + ifVO.getIf_no()); // Ȯ���� ���
    }else{
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?if_no="+ifVO.getIf_no()+"'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }  
  
  /**
   * ������
   * @param if_no
   * @return
   */
  @RequestMapping(value = "/interviewfail/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int if_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/delete"); // /webapp/blog/delete.jsp
    mav.addObject("if_no", if_no);
    
    return mav;
  }
  
  /**
   * ���� ó��
   * @param ifVO
   * @return
   */
  @RequestMapping(value = "/interviewfail/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(IfVO ifVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (ifDAO.delete(ifVO.getIf_no()) == 1) {
      //ifDAO.decreaseCnt(ifVO.getIf_no());
      mav.setViewName("redirect:/interviewfail/list.do?if_no=" + ifVO.getIf_no());//Ȯ���� ���
 
    } else {
      msgs.add("�� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?if_no="+ifVO.getIf_no()+"'\">���</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}