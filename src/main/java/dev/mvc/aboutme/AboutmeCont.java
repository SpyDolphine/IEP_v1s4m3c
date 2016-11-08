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
  msgs.add("항목등록에 실패했습니다.");
  msgs.add("죄송하지만 다시한번 시도해주세요.");
  links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
  links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
  }
  
  mav.addObject("msgs", msgs);
  mav.addObject("links", links);
  
  return mav;
  }
  
  /**
   * 회사목록을 출력합니다.
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
 
    List<AboutmeVO> list = aboutmeDAO.list(hashMap); // 검색
    Iterator<AboutmeVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      AboutmeVO vo = iter.next(); // 요소 추출
      vo.setAm_title(Tool.textLength(vo.getAm_title(), 10));
      vo.setAm_date(vo.getAm_date().substring(0, 10));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = aboutmeDAO.count(hashMap);
    mav.addObject("totalRecord", totalRecord); // 검색된 레코드 갯수
 
    String paging = new Paging().paging5(totalRecord, 
                                                          searchDTO.getNowPage(), 
                                                          recordPerPage, 
                                                          searchDTO.getCol(), 
                                                          searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
  }
  
  /**
   * 수정합니다
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
   * 수정합니다
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
   * 레코드 1건을 삭제합니다.
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