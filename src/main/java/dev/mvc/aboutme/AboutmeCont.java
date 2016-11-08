package dev.mvc.aboutme;
 
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
import web.tool.Paging;
import web.tool.SearchDTO;
import web.tool.Tool;

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
   * ȸ������ ����մϴ�.
   * @return
   */
  @RequestMapping(value = "/aboutme/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/aboutme/list");
 
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
 
    List<AboutmeVO> list = aboutmeDAO.list(hashMap); // �˻�
    Iterator<AboutmeVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      AboutmeVO vo = iter.next(); // ��� ����
      vo.setAm_title(Tool.textLength(vo.getAm_title(), 10));
      vo.setAm_date(vo.getAm_date().substring(0, 10));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = aboutmeDAO.count(hashMap);
    mav.addObject("totalRecord", totalRecord); // �˻��� ���ڵ� ����
 
    String paging = new Paging().paging5(totalRecord, 
                                                          searchDTO.getNowPage(), 
                                                          recordPerPage, 
                                                          searchDTO.getCol(), 
                                                          searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
  }
  
  /**
   * �����մϴ�
   * @param aboutmeVO
   * @return
   */
  @RequestMapping(value = "/aboutme/update.do", method = RequestMethod.GET)
  public ModelAndView update(int am_no) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("aboutmeVO", aboutmeDAO.read(am_no));
    return mav;
  }  
  /**
   * �����մϴ�
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
   * ���ڵ� 1���� �����մϴ�.
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