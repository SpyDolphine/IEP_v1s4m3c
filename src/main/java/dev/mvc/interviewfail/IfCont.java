package dev.mvc.interviewfail;
 
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.tool.Tool;
import web.tool.Upload;
 
@Controller
public class IfCont {
  @Autowired
  @Qualifier("dev.mvc.interviewfail.IfDAO")
  private IfInter ifDAO;
  
  public IfCont(){
    System.out.println("--> IfCont created.");
  }
  
  @RequestMapping(value = "/interviewfail/createboot.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/createboot"); // member에 create.do가 들어올 경우 이동 -> /webapp/community/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/interviewfail/createboot.do", method = RequestMethod.POST)
  public ModelAndView create(IfVO ifVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/message"); // /webapp/member/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (ifDAO.create(ifVO) == 1) {
      msgs.add("새글 등록이 처리 되었습니다.");
      msgs.add("감사합니다.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">로그인</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("새글 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  /**
   * 전체 목록을 출력합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/interviewfail/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/list");      // list_total.jsp
    
    List<IfVO> list = ifDAO.list();
    Iterator<IfVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      IfVO ifVO = iter.next();  // 요소 추출
      ifVO.setIf_no(ifVO.getIf_no());
    }
    mav.addObject("list", list);
    
    return mav;
  }
  
  /**
   * 글을 조회합니다
   * @param if_no
   * @return
   */
  @RequestMapping(value = "/interviewfail/read.do", method = RequestMethod.GET)
  public ModelAndView read(int if_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/read");
    IfVO ifVO = ifDAO.read(if_no); 
    
    // 특수문자처리
    String if_content = ifVO.getIf_content();
    if_content = Tool.convertChar(if_content);  
    ifVO.setIf_content(if_content);
    
    mav.addObject("ifVO", ifVO); 
 
    return mav;
  }  
  
  /**
   * 수정폼
   * @param blogno
   * @return
   */
  @RequestMapping(value="/interviewfail/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int if_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/update"); 
    mav.addObject("ifVO", ifDAO.read(if_no)); 
 
    return mav;
 
  }
   
  /**
   * 수정 처리
   * @param blogVO
   * @return
   */
  @RequestMapping(value="/interviewfail/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(IfVO ifVO, 
                                     HttpServletRequest request, 
                                     HttpSession session){
    ModelAndView mav = new ModelAndView();
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(ifDAO.update(ifVO) == 1){
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/interviewfail/read.do?if_no=" + ifVO.getIf_no()); // 확장자 명시
    }else{
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?if_no="+ifVO.getIf_no()+"'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }  
  
  /**
   * 삭제폼
   * @param if_no
   * @return
   */
  @RequestMapping(value = "/interviewfail/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int if_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/delete"); // /webapp/blog/delete.jsp
    mav.addObject("if_no", if_no);
    
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param ifVO
   * @return
   */
  @RequestMapping(value = "/interviewfail/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(IfVO ifVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/interviewfail/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (ifDAO.delete(ifVO.getIf_no()) == 1) {
      //ifDAO.decreaseCnt(ifVO.getIf_no());
      mav.setViewName("redirect:/interviewfail/list.do?if_no=" + ifVO.getIf_no());//확장자 명시
 
    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?if_no="+ifVO.getIf_no()+"'\">목록</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}