package dev.mvc.tip;
 
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

import web.tool.Paging;
import web.tool.SearchDTO;
import web.tool.Tool;

@Controller
public class TipCont {
  @Autowired
  @Qualifier("dev.mvc.tip.TipDAO")
  private TipDAOInter tipDAO;

  public TipCont(){
    System.out.println("--> TipCont created.");
  }
   
  @RequestMapping(value = "/tip/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/tip/create"); // /webapp/aboutme/create.jsp
  return mav;
  }
  
  @RequestMapping(value = "/tip/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(TipVO tipVO) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/message"); // /webapp/message.jsp
  
  ArrayList<String> msgs = new ArrayList<String>();
  ArrayList<String> links = new ArrayList<String>();
  if (tipDAO.create(tipVO) == 1) { 
    mav.setViewName("redirect:/tip/list.do?tp_ch="+tipVO.getTp_ch());
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
   * ����� ����մϴ�.
   * @return
   */
  @RequestMapping(value = "/tip/list.do", 
      method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request, String tp_ch) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tip/list");
    
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
    hashMap.put("tp_ch", tp_ch);
    
    int totalRecord = 0;
     
    List<TipVO> list = tipDAO.list(hashMap); // �˻�
    Iterator<TipVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      TipVO vo = iter.next(); // ��� ����
      vo.setTp_title(Tool.textLength(vo.getTp_title(), 10));
      vo.setTp_date(vo.getTp_date().substring(0, 10));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = tipDAO.count(hashMap);
    mav.addObject("totalRecord", totalRecord); // �˻��� ���ڵ� ����
     
    String paging = new Paging().paging4(totalRecord, 
                                       searchDTO.getNowPage(), 
                                       recordPerPage, 
                                       searchDTO.getCol(), 
                                       searchDTO.getWord(),
                                       tp_ch);
    mav.addObject("paging", paging);
    return mav;
  }
  /**
   * �����մϴ�
   * @param tipVO
   * @return
   */
  @RequestMapping(value = "/tip/update.do", method = RequestMethod.POST)
  public ModelAndView update(TipVO tipVO) {
    ModelAndView mav = new ModelAndView();
 
    if (tipDAO.update(tipVO) == 1) {
        mav.setViewName("redirect:/tip/list.do?tp_ch="+tipVO.getTp_ch());
    } else {
 
    }
    
    return mav;
  }
  
  /**
   * �����մϴ�
   * @param tipVO
   * @return
   */
  @RequestMapping(value = "/tip/update.do", method = RequestMethod.GET)
  public ModelAndView update(int tp_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tip/update");
    TipVO tipVO = tipDAO.read(tp_no);
    mav.addObject("tipVO", tipVO); 
    return mav;
  }
  
  @RequestMapping(value = "/tip/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int tp_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tip/delete");
    mav.addObject("tp_no", tp_no); 
    return mav;
  }
  
  @RequestMapping(value = "/tip/delete.do", method = RequestMethod.POST)
  public ModelAndView delete2(int tp_no) {
    ModelAndView mav = new ModelAndView();
    TipVO tipVO = tipDAO.read(tp_no);
    if (tipDAO.delete(tp_no) == 1) {
      mav.setViewName("redirect:/tip/list.do?tp_ch="+tipVO.getTp_ch());
    } else {
    }
    return mav;
  }
}