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
  msgs.add("등록에 실패했습니다.");
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
  @RequestMapping(value = "/serveyboard/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/serveyboard/list");
    
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    int recordPerPage = 10; // 페이지당 출력할 레코드 갯수
    // 페이지에서 출력할 시작 레코드 번호 계산. nowPage는 1부터 시작
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10;  
    // 1 page: 0
    // 2 page: 10
    // 3 page: 20
    int startNum = beginOfPage + 1; // 1 : 시작 rownum
    int endNum = beginOfPage + recordPerPage; // 10  :  종료 rownum
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    int totalRecord = 0;
   
    List<ServeyboardVO> list = serveyboardDAO.list(hashMap); // 검색
    Iterator<ServeyboardVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      ServeyboardVO vo = iter.next(); // 요소 추출
      vo.setTitle(Tool.textLength(vo.getTitle(), 10));
      vo.setRdate(vo.getRdate().substring(0, 10));
    } 
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = serveyboardDAO.count(hashMap);
    mav.addObject("totalRecord", serveyboardDAO.count(hashMap)); // 검색된 레코드 갯수
 
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
   * 항목 수정합니다
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
  @RequestMapping(value = "/serveyboard/delete.do", method = RequestMethod.GET)
  public ModelAndView delete2(int sb_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("sb_no", sb_no);
    return mav;
  }  
  
  /**
   * 레코드 1건을 삭제합니다.
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