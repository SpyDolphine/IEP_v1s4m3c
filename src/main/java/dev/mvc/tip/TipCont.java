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
   * 목록을 출력합니다.
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
    hashMap.put("tp_ch", tp_ch);
    
    int totalRecord = 0;
     
    List<TipVO> list = tipDAO.list(hashMap); // 검색
    Iterator<TipVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      TipVO vo = iter.next(); // 요소 추출
      vo.setTp_title(Tool.textLength(vo.getTp_title(), 10));
      vo.setTp_date(vo.getTp_date().substring(0, 10));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = tipDAO.count(hashMap);
    mav.addObject("totalRecord", totalRecord); // 검색된 레코드 갯수
     
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
   * 수정합니다
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
   * 수정합니다
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