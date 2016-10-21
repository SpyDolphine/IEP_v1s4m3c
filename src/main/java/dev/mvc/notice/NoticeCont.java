package dev.mvc.notice;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.board.BoardVO;

@Controller
public class NoticeCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeDAO")
  private NoticeDAOInter noticeDAO;
  
  public NoticeCont(){
    System.out.println("--> NoticeCont created.");
  }
  
  @RequestMapping(value = "/notice/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
  System.out.println("--> create() GET called.");
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/notice/create"); // /webapp/member/create.jsp
  
  return mav;
  }
  @RequestMapping(value = "/notice/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(NoticeVO noticeVO) {
  System.out.println("--> create() POST called.");
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/message"); // /webapp/message.jsp
  
  ArrayList<String> msgs = new ArrayList<String>();
  ArrayList<String> links = new ArrayList<String>();
  
  if (noticeDAO.create(noticeVO) == 1) {
  msgs.add("����� �Ϸ��߽��ϴ�.");
  links.add("<button type='button' onclick=\"location.href='./login.do'\">�α���</button>");
  links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
  } else {
  msgs.add("��Ͽ� �����߽��ϴ�.");
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
   * @return
   */
  @RequestMapping(value = "/notice/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/list"); // /webapp/notice/list.jsp
    mav.addObject("list", noticeDAO.list());
    return mav;
  }
  
  /**
   * ������ ����մϴ�.
   * @return
   */
  @RequestMapping(value = "/notice/read.do", 
      method = RequestMethod.GET)
  public ModelAndView read(int nt_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/read"); // /webapp/notice/read.jsp
    mav.addObject("noticeVO", noticeDAO.read(nt_no));
    return mav;
  }
  
  /**
   * ������ ����մϴ�.
   * @return
   */
  @RequestMapping(value = "/notice/update.do", 
      method = RequestMethod.GET)
  public ModelAndView update(int nt_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/update"); // /webapp/notice/read.jsp
    mav.addObject("noticeVO", noticeDAO.read(nt_no));
    return mav;
  }
  
  @RequestMapping(value = "/notice/update.do", method = RequestMethod.POST)
  public ModelAndView update(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (noticeDAO.update(noticeVO) == 1) {
      mav.setViewName("redirect:/notice/list.do");
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
  /**
   * ���ڵ� 1���� �����մϴ�.
   * @param noticeno
   * @return
   */
  @RequestMapping(value = "/notice/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (noticeDAO.delete(noticeVO.getNt_no() ) == 1) {
      mav.setViewName("redirect:/notice/list.do");
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