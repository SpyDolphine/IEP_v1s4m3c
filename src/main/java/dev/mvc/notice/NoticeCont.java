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
   * 게시판 목록을 검색+페이징하여 출력합니다.
   * 
   * @param 
   * @param searchDTO 검색 정보         
   * @return 추출된 게시판 목록
   */
  @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/list");
 
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
 
    List<NoticeVO> list = noticeDAO.list(hashMap); // 검색
    Iterator<NoticeVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      NoticeVO vo = iter.next(); // 요소 추출
      vo.setNt_title(Tool.textLength(vo.getNt_title(), 10));
      vo.setNt_date(vo.getNt_date().substring(0, 10));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = noticeDAO.count(hashMap);
    mav.addObject("totalRecord", noticeDAO.count(hashMap)); // 검색된 레코드 갯수
 
    String paging = new Paging().paging5(totalRecord, 
                                                          searchDTO.getNowPage(), 
                                                          recordPerPage, 
                                                          searchDTO.getCol(), 
                                                          searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
  }  
  
  /**
   * 내용을 출력합니다.
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
   * 내용을 출력합니다.
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
      msgs.add("수정에 실패했습니다.");
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