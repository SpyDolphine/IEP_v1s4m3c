package dev.mvc.WEB;

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

import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class WebCont {
  @Autowired
  @Qualifier("dev.mvc.WEB.WebDAO")
  private WebDAOInter WebDAO;

  public WebCont() {
    System.out.println("--> WebCont created.");
  }

  @RequestMapping(value = "/web/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/web/create"); // /webapp/web/create.jsp
    return mav;
  }

  @RequestMapping(value = "/web/create.do", method = RequestMethod.POST)
  public ModelAndView create(WebVO webVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/web/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (WebDAO.create(webVO) == 1) {
      msgs.add("게시물이(가) 등록되었습니다.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("게시물 등록에 실패했습니다.");
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
   * 전체 목록
   * 
   * @return
   */
  @RequestMapping(value = "/web/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/web/list"); // list.jsp

    List<WebVO> list = WebDAO.list();
    Iterator<WebVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      WebVO webVO = iter.next(); // 요소 추출
      webVO.setWb_title(Tool.textLength(webVO.getWb_title(), 10));
      webVO.setWb_date(webVO.getWb_date().substring(0, 10));
      webVO.setWb_file1(Tool.textLength(webVO.getWb_file1(), 10));
      webVO.setWb_file2(Tool.textLength(webVO.getWb_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * 글을 조회합니다
   * 
   * @param wb_no
   * @return
   */
  @RequestMapping(value = "/web/read.do", method = RequestMethod.GET)
  public ModelAndView read(int wb_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/web/read");
    WebVO webVO = WebDAO.read(wb_no);
    webVO.getSize2Label();
    mav.addObject("webVO", webVO);
    // String content = boardVO.getContent();
    // content = Tool.convertChar(content); //특수문자처리
    // boardVO.setContent(content);
    return mav;
  }
  
  /**
   * 수정폼
   * @param wb_no
   * @return
   */
  @RequestMapping(value="/web/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int wb_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/web/update"); 
    mav.addObject("webVO", WebDAO.read(wb_no)); 
    
    return mav;
  }
   
  /**
   * 수정 처리
   * @param WebVO
   * @return
   */
  @RequestMapping(value="/web/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(WebVO webVO, HttpServletRequest request, 
      HttpSession session){
    ModelAndView mav = new ModelAndView();
    //게시판에 대한 정보 파악
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String wb_file1 = "";
    String wb_file2 = "";
 
    String upDir = Tool.getRealPath(request, "/web/storage");
    MultipartFile file2MF = webVO.getFile2MF();
    WebVO oldVO = WebDAO.read(webVO.getWb_no());
 
    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getWb_file2()); // 파일 삭제
      wb_file2 = Upload.saveFileSpring(file2MF, upDir);
      webVO.setWb_file2(wb_file2); // 전송된 파일명 저장
      webVO.setWb_size2(file2MF.getSize());
 
      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(wb_file2)) {
        Tool.deleteFile(upDir, oldVO.getWb_file1()); // 파일 삭제
        wb_file1 = Tool.preview(upDir, wb_file2, 120, 80);
      } else {
        wb_file1 = "";
      }
      // -------------------------------------------------------------------
 
    } else {
      wb_file1 = oldVO.getWb_file1();
      wb_file2 = oldVO.getWb_file2();
    }
    webVO.setWb_file1(wb_file1);
    webVO.setWb_file2(wb_file2);
    // -------------------------------------------------------------------
//    
//    appVO.setMe_no(1); // 회원 연동시 변경
//    //Integer itg = (Integer)(session.getAttribute("mno"));
//    //boardVO.setMno(itg.intValue());
//     
    if(WebDAO.update(webVO) == 1){
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/web/read.do?wb_no=" + webVO.getWb_no()); // 확장자 명시
    }else{
      msgs.add("게시물 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?wb_no="+webVO.getWb_no()+"'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  /**
   * 삭제폼
   * @param wb_no
   * @return
   */
  @RequestMapping(value = "/web/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int wb_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/web/delete"); // /webapp/web/delete.jsp
    mav.addObject("wb_no", wb_no);
    
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param WebVO
   * @return
   */
  @RequestMapping(value = "/web/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(WebVO webVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    System.out.println(webVO.getWb_no());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (WebDAO.delete(webVO.getWb_no()) == 1) {
      mav.setViewName("redirect:/web/list.do?wb_no=" + webVO.getWb_no());//확장자 명시
 
    } else {
      msgs.add("게시물 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?wb_no="+webVO.getWb_no()+"'\">목록</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}