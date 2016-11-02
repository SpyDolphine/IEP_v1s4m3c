package dev.mvc.notice;
 
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.tool.Paging;
import web.tool.SearchDTO;
import web.tool.Tool;

@Controller
public class NoticeCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeDAO")
  private NoticeDAOInter noticeDAO;
  
  public NoticeCont(){
    //System.out.println("--> NoticeCont created.");
  }
  
  @RequestMapping(value = "/notice/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
  //System.out.println("--> create() GET called.");
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/notice/create"); // /webapp/member/create.jsp
  
  return mav;
  }
  @RequestMapping(value = "/notice/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(NoticeVO noticeVO) {
  //System.out.println("--> create() POST called.");
  ModelAndView mav = new ModelAndView();
  
  
  if (noticeDAO.create(noticeVO) == 1) {
    mav.setViewName("redirect:/notice/list.do");
  } else {
  }
  
  return mav;
  }
  
  /**
   * �Խ��� ����� �˻�+����¡�Ͽ� ����մϴ�.
   * 
   * @param 
   * @param searchDTO �˻� ����         
   * @return ����� �Խ��� ���
   */
  @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/list");
 
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
 
    List<NoticeVO> list = noticeDAO.list(hashMap); // �˻�
    Iterator<NoticeVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      NoticeVO vo = iter.next(); // ��� ����
      vo.setNt_title(Tool.textLength(vo.getNt_title(), 10));
      vo.setNt_date(vo.getNt_date().substring(0, 10));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = noticeDAO.count(hashMap);
    mav.addObject("totalRecord", noticeDAO.count(hashMap)); // �˻��� ���ڵ� ����
 
    String paging = new Paging().paging5(totalRecord, 
                                                          searchDTO.getNowPage(), 
                                                          recordPerPage, 
                                                          searchDTO.getCol(), 
                                                          searchDTO.getWord());
    mav.addObject("paging", paging);
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
  @RequestMapping(value = "/notice/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(@RequestParam List<String> arr) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("arr", arr);
    noticeDAO.delete(hashMap);
    mav.setViewName("redirect:/notice/list.do");
    return mav;
 
  }

}