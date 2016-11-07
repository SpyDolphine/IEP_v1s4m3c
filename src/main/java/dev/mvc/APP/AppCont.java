package dev.mvc.APP;

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
public class AppCont {
  @Autowired
  @Qualifier("dev.mvc.APP.AppDAO")
  private AppDAOInter AppDAO;

  public AppCont() {
    System.out.println("--> AppCont created.");
  }

  @RequestMapping(value = "/app/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/create"); // /webapp/app/create.jsp
    return mav;
  }

  @RequestMapping(value = "/app/create.do", method = RequestMethod.POST)
  public ModelAndView create(AppVO appVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/app/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (AppDAO.create(appVO) == 1) {
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
  @RequestMapping(value = "/app/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/list"); // list.jsp

    List<AppVO> list = AppDAO.list();
    Iterator<AppVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      AppVO appVO = iter.next(); // 요소 추출
      appVO.setAp_title(Tool.textLength(appVO.getAp_title(), 10));
      appVO.setAp_date(appVO.getAp_date().substring(0, 10));
      appVO.setAp_file1(Tool.textLength(appVO.getAp_file1(), 10));
      appVO.setAp_file2(Tool.textLength(appVO.getAp_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * 글을 조회합니다
   * 
   * @param ap_no
   * @return
   */
  @RequestMapping(value = "/app/read.do", method = RequestMethod.GET)
  public ModelAndView read(int ap_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/read");
    AppVO appVO = AppDAO.read(ap_no);
    appVO.getSize2Label();
    mav.addObject("appVO", appVO);
    // String content = boardVO.getContent();
    // content = Tool.convertChar(content); //특수문자처리
    // boardVO.setContent(content);
    return mav;
  }
  
  /**
   * 수정폼
   * @param ap_no
   * @return
   */
  @RequestMapping(value="/app/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int ap_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/update"); 
    mav.addObject("appVO", AppDAO.read(ap_no)); 
    
    return mav;
  }
   
  /**
   * 수정 처리
   * @param AppVO
   * @return
   */
  @RequestMapping(value="/app/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(AppVO appVO, HttpServletRequest request, 
      HttpSession session){
    ModelAndView mav = new ModelAndView();
    //게시판에 대한 정보 파악
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String ap_file1 = "";
    String ap_file2 = "";
 
    String upDir = Tool.getRealPath(request, "/app/storage");
    MultipartFile file2MF = appVO.getFile2MF();
    AppVO oldVO = AppDAO.read(appVO.getAp_no());
 
    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getAp_file2()); // 파일 삭제
      ap_file2 = Upload.saveFileSpring(file2MF, upDir);
      appVO.setAp_file2(ap_file2); // 전송된 파일명 저장
      appVO.setAp_size2(file2MF.getSize());
 
      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(ap_file2)) {
        Tool.deleteFile(upDir, oldVO.getAp_file1()); // 파일 삭제
        ap_file1 = Tool.preview(upDir, ap_file2, 120, 80);
      } else {
        ap_file1 = "";
      }
      // -------------------------------------------------------------------
 
    } else {
      ap_file1 = oldVO.getAp_file1();
      ap_file2 = oldVO.getAp_file2();
    }
    appVO.setAp_file1(ap_file1);
    appVO.setAp_file2(ap_file2);
    // -------------------------------------------------------------------
//    
//    appVO.setMe_no(1); // 회원 연동시 변경
//    //Integer itg = (Integer)(session.getAttribute("mno"));
//    //boardVO.setMno(itg.intValue());
//     
    if(AppDAO.update(appVO) == 1){
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/app/read.do?ap_no=" + appVO.getAp_no()); // 확장자 명시
    }else{
      msgs.add("게시물 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?ap_no="+appVO.getAp_no()+"'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  /**
   * 삭제폼
   * @param ap_no
   * @return
   */
  @RequestMapping(value = "/app/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int ap_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/delete"); // /webapp/board/delete.jsp
    mav.addObject("ap_no", ap_no);
    
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param AppVO
   * @return
   */
  @RequestMapping(value = "/app/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(AppVO appVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    System.out.println(appVO.getAp_no());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (AppDAO.delete(appVO.getAp_no()) == 1) {
      mav.setViewName("redirect:/app/list.do?ap_no=" + appVO.getAp_no());//확장자 명시
 
    } else {
      msgs.add("게시물 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?ap_no="+appVO.getAp_no()+"'\">목록</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}