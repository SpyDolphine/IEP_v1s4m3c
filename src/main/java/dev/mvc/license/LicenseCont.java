package dev.mvc.license;

import java.util.ArrayList;
import java.util.HashMap;
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

import dev.mvc.STUDY.PagingStudy;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class LicenseCont {
  @Autowired
  @Qualifier("dev.mvc.license.LicenseDAO")
  private LicenseDAOInter LicenseDAO;

  public LicenseCont() {
    System.out.println("--> LicenseCont created.");
  }

  @RequestMapping(value = "/license/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/create"); // /webapp/license/create.jsp
    return mav;
  }

  @RequestMapping(value = "/license/create.do", method = RequestMethod.POST)
  public ModelAndView create(LicenseVO licenseVO, HttpServletRequest request, HttpSession session) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/license/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String lc_file1 = "";
    String lc_file2 = "";
    String upDir = Tool.getRealPath(request, "/license/storage");
    MultipartFile file2MF = licenseVO.getFile2MF();

    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      lc_file1 = Upload.saveFileSpring(file2MF, upDir);
      licenseVO.setLc_file2(lc_file2); // 전송된 파일명 저장
      licenseVO.setLc_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(lc_file2)) {
        lc_file1 = Tool.preview(upDir, lc_file2, 120, 80);
      } else {
        lc_file1 = "";
      }
      // -------------------------------------------------------------------
    }
    licenseVO.setLc_file1(lc_file1); // Thumb 이미지
    licenseVO.setLc_file2(lc_file2); // 원본 이미지
    // -------------------------------------------------------------------
    
    
    if (LicenseDAO.create(licenseVO) == 1) {
      msgs.add("자격증 정보가(이) 등록되었습니다.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("자격증 정보가(이) 등록에 실패했습니다.");
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
   * @return
   */
  @RequestMapping(value = "/license/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/list"); // /webapp/license/list.jsp
    mav.addObject("list", LicenseDAO.list());

    return mav;
  }
  

  /**
   * 글을 조회합니다
   * 
   * @param lc_no
   * @return
   */
  @RequestMapping(value = "/license/read.do", method = RequestMethod.GET)
  public ModelAndView read(int lc_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/read");
    LicenseVO licenseVO = LicenseDAO.read(lc_no);
    
    licenseVO.setLc_content(web.tool.Tool.convertChar(licenseVO.getLc_content()));
    licenseVO.getSize2Label();
    mav.addObject("licenseVO", licenseVO);
    // String content = licenseVO.getContent();
    // content = Tool.convertChar(content); //특수문자처리
    // licenseVO.setContent(content);
    return mav;
  }

  /**
   * 수정폼
   * @param lc_no
   * @return
   */
  @RequestMapping(value="/license/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int lc_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/update"); 
    LicenseVO licenseVO = LicenseDAO.read(lc_no);
    mav.addObject("licenseVO", LicenseDAO.read(lc_no)); 
    return mav;
  }
   
  /**
   * 수정 처리
   * @param LicenseVO
   * @return
   */
  @RequestMapping(value="/license/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(LicenseVO licenseVO, HttpServletRequest request, 
      HttpSession session){
    ModelAndView mav = new ModelAndView();
    //게시판에 대한 정보 파악
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String lc_file1 = "";
    String lc_file2 = "";
 
    String upDir = Tool.getRealPath(request, "/license/storage");
    MultipartFile file2MF = licenseVO.getFile2MF();
    LicenseVO oldVO = LicenseDAO.read(licenseVO.getLc_no());
 
    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getLc_file2()); // 파일 삭제
      lc_file2 = Upload.saveFileSpring(file2MF, upDir);
      licenseVO.setLc_file2(lc_file2); // 전송된 파일명 저장
      licenseVO.setLc_size2(file2MF.getSize());
 
      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(lc_file2)) {
        Tool.deleteFile(upDir, oldVO.getLc_file1()); // 파일 삭제
        lc_file1 = Tool.preview(upDir, lc_file2, 120, 80);
      } else {
        lc_file1 = "";
      }
      // -------------------------------------------------------------------
 
    } else {
      lc_file1 = oldVO.getLc_file1();
      lc_file2 = oldVO.getLc_file2();
    }
    licenseVO.setLc_file1(lc_file1);
    licenseVO.setLc_file2(lc_file2);
    // -------------------------------------------------------------------
//    
//    licenseVO.setMe_no(1); // 회원 연동시 변경
//    //Integer itg = (Integer)(session.getAttribute("mno"));
//    //boardVO.setMno(itg.intValue());
//     
    if(LicenseDAO.update(licenseVO) == 1){
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/license/read.do?lc_no=" + licenseVO.getLc_no()); // 확장자 명시
    }else{
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?lc_no="+licenseVO.getLc_no()+"'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  /**
   * 삭제폼
   * @param lc_no
   * @return
   */
  @RequestMapping(value = "/license/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int lc_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/delete"); // /webapp/license/delete.jsp
    mav.addObject("lc_no", lc_no);
    
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param LicenseVO
   * @return
   */
  @RequestMapping(value = "/license/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(LicenseVO licenseVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    System.out.println(licenseVO.getLc_no());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (LicenseDAO.delete(licenseVO.getLc_no()) == 1) {
      mav.setViewName("redirect:/license/list.do?lc_no=" + licenseVO.getLc_no());//확장자 명시
 
    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?lc_no="+licenseVO.getLc_no()+"'\">목록</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
}