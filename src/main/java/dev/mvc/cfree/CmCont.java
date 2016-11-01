package dev.mvc.cfree;
 
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

import web.tool.*;

@Controller
public class CmCont {
  @Autowired
  @Qualifier("dev.mvc.cfree.CmDAO")
  private CmInter cmDAO;
  
  public CmCont(){
    System.out.println("--> CmCont created.");
  }
  
  /**
   * 등록 합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/cfree/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cfree/create"); // member에 create.do가 들어올 경우 이동 -> /webapp/cfree/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/cfree/create.do", method = RequestMethod.POST)
  public ModelAndView create(CmVO cmvo) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cfree/message"); // /webapp/cfree/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (cmDAO.create(cmvo) == 1) {
      mav.setViewName("redirect:/cfree/list.do");
    } else {
      msgs.add("새글 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    }
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
 
  /**
   * 수정 처리
   * @param cm_no
   * @return
   */
  @RequestMapping(value="/cfree/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int cm_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cfree/update"); 
    mav.addObject("cmVO", cmDAO.read(cm_no)); 
 
    return mav;
 
  }
  
  @RequestMapping(value = "/cfree/update.do", method = RequestMethod.POST)
  public ModelAndView update(CmVO cmVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cfree/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (cmDAO.update(cmVO) == 1) {
      mav.setViewName("redirect:/cfree/list.do");
    } else {
      msgs.add("수정에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
      links.add("<button type='button' onclick=\"location.href='./index.jsp'\">홈페이지</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/cfree/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int cm_no) {
    ModelAndView mav = new ModelAndView();

    CmVO cmVO = cmDAO.read(cm_no);
    if (cmDAO.delete(cm_no) == 1) {
      mav.setViewName("redirect:/cfree/list.do");
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
  @RequestMapping(value = "/cfree/list.do", method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cfree/list");
 
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
 
    List<CmVO> list = cmDAO.list(hashMap); // 검색
    Iterator<CmVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      CmVO vo = iter.next(); // 요소 추출
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 10));
      vo.setCm_rdate(vo.getCm_rdate().substring(0, 10));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = cmDAO.count(hashMap);
    mav.addObject("totalRecord", cmDAO.count(hashMap)); // 검색된 레코드 갯수
    
    String paging = new Paging().paging5(totalRecord, 
                                                          searchDTO.getNowPage(), 
                                                          recordPerPage, 
                                                          searchDTO.getCol(), 
                                                          searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
  }  
  
  /**
   * 추천 처리
   */
  @RequestMapping(value = "/cfree/likeup.do", method = RequestMethod.GET)
  public ModelAndView likeup(int cm_no) {
    ModelAndView mav = new ModelAndView();

    
    if (cmDAO.likeup(cm_no) == 1) {
      mav.setViewName("redirect:/cfree/list.do");
    } else {
      
    }
  return mav;
}
  
  /**
   * 비추천 처리
   */
  @RequestMapping(value = "/cfree/likedown.do", method = RequestMethod.GET)
  public ModelAndView likedown(CmVO cmVO) {
    ModelAndView mav = new ModelAndView();

    if (cmDAO.likedown(cmVO) == 1) {
      mav.setViewName("redirect:/cfree/list.do");
    } else {
      
    }
  return mav;
}
}