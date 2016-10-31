package dev.mvc.serveyboard;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.notice.NoticeVO;
import dev.mvc.servey.ServeyDAOInter;
import dev.mvc.servey.ServeyVO;
import web.tool.Paging;
import web.tool.SearchDTO;
import web.tool.Tool;

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
    mav.setViewName("redirect:/serveyboard/update.do?sb_no="+serveyboardDAO.max());
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
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/serveyboard/list");
    
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    int recordPerPage = 10; // �������� ����� ���ڵ� ����
    // ���������� ����� ���� ���ڵ� ��ȣ ���. nowPage�� 1���� ����
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10;  
    // 1 page: 0
    // 2 page: 10
    // 3 page: 20
    int startNum = beginOfPage + 1; // 1 : ���� rownum
    int endNum = beginOfPage + recordPerPage; // 10  :  ���� rownum
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    int totalRecord = 0;
   
    List<ServeyboardVO> list = serveyboardDAO.list(hashMap); // �˻�
    Iterator<ServeyboardVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      ServeyboardVO vo = iter.next(); // ��� ����
      vo.setTitle(Tool.textLength(vo.getTitle(), 10));
      vo.setRdate(vo.getRdate().substring(0, 10));
    } 
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = serveyboardDAO.count(hashMap);
    mav.addObject("totalRecord", serveyboardDAO.count(hashMap)); // �˻��� ���ڵ� ����
 
    String paging = new Paging().paging(totalRecord, 
                                                          searchDTO.getNowPage(), 
                                                          recordPerPage, 
                                                          searchDTO.getCol(), 
                                                          searchDTO.getWord());
    mav.addObject("paging", paging);
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