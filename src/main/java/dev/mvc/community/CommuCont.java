package dev.mvc.community;
 
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.community.PagingC;
import web.tool.*;

@Controller
public class CommuCont {
  @Autowired
  @Qualifier("dev.mvc.community.CommuDAO")
  private CommuInter commuDAO;
  
  public CommuCont(){
    //System.out.println("--> CommuCont created.");
  }
  
  /**
   * 등록 합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/community/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    //System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/create"); // member에 create.do가 들어올 경우 이동 -> /webapp/community/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/community/create.do", method = RequestMethod.POST)
  public ModelAndView create(CommuVO commuVO,  
                                    HttpServletRequest request, 
                                    HttpSession session) {
    //System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/community/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

 // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/community/storage");
    MultipartFile file2MF = commuVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      commuVO.setFile2(file2); // 전송된 파일명 저장
      commuVO.setSize2(size2);
 
      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) {
        file1 = Tool.preview(upDir, file2, 120, 80);
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
    }
    commuVO.setFile1(file1); // Thumb 이미지
    commuVO.setFile2(file2); // 원본 이미지
    commuVO.setSize2(size2);
    // -------------------------------------------------------------------
    
    
    if (commuDAO.create(commuVO) == 1) {
      if(commuVO.getCm_ch().equals("A")){
        msgs.add("글을 등록했습니다.");
        links.add("<button type='button' onclick=\"location.href='./listA.do'\">확인</button>");
        links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
      }
      if(commuVO.getCm_ch().equals("B")){
        msgs.add("글을 등록했습니다.");
        links.add("<button type='button' onclick=\"location.href='./listB.do'\">확인</button>");
        links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
      }
      if(commuVO.getCm_ch().equals("C")){
        msgs.add("글을 등록했습니다.");
        links.add("<button type='button' onclick=\"location.href='./listC.do'\">확인</button>");
        links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
      }      
    } else {
      msgs.add("새글 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./index.jsp'\">홈페이지</button>");
    }
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
 
  /**
   * 수정폼
   * @param cm_no
   * @return
   */
  @RequestMapping(value="/community/update.do", 
                             method=RequestMethod.GET)
  public ModelAndView update(int cm_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/update");
    CommuVO commuVO = commuDAO.read(cm_no);
    mav.addObject("commuVO", commuVO);
    
    return mav;
 
  }
   
  /**
   * 글과 파일을 수정 처리
   * @param commuVO
   * @return
   */
  @RequestMapping(value = "/community/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(CommuVO commuVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // 파일 전송 관련
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
 
    String upDir = Tool.getRealPath(request, "/community/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile file2MF = commuVO.getFile2MF();
    CommuVO oldVO = commuDAO.read(commuVO.getCm_no());
    
    size2 = file2MF.getSize();
    if (size2 > 0) { // 새로운 파일을 전송하는지 확인
      Tool.deleteFile(upDir, oldVO.getFile2()); // 기존 등록된 파일 삭제
      file2 = Upload.saveFileSpring(file2MF, upDir); // 새로운 파일 저장
      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) { // 이미지인지 검사
        Tool.deleteFile(upDir, oldVO.getFile1()); // 파일 삭제
        file1 = Tool.preview(upDir, file2, 120, 80); // thumb 이미지 생성
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
 
    } else {
      file1 = oldVO.getFile1(); // 파일 업로드를하지 않는 경우
      file2 = oldVO.getFile2();
      size2 = oldVO.getSize2();
    }
    commuVO.setFile1(file1); 
    commuVO.setFile2(file2);
    commuVO.setSize2(size2);
    // -------------------------------------------------------------------
 
    if (commuDAO.update(commuVO) == 1) {
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/community/read.do?cm_no=" + commuVO.getCm_no());
    } else {
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
        if(commuVO.getCm_ch().equals("A")){
          links.add("<button type='button' onclick=\"location.href='./listA.do'\">목록</button>");
        }
        if(commuVO.getCm_ch().equals("B")){
          links.add("<button type='button' onclick=\"location.href='./listB.do'\">목록</button>");
        }
        if(commuVO.getCm_ch().equals("C")){
          links.add("<button type='button' onclick=\"location.href='./listC.do'\">목록</button>");
        }        
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
  @RequestMapping(value = "/community/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(@RequestParam List<String> arr) { // 파라메터 값을 배열로 바로 받는다
    ModelAndView mav = new ModelAndView();
    CommuVO commuVO = commuDAO.read(Integer.parseInt(arr.get(0)));
    HashMap<String, Object> hashMap = new HashMap<String, Object>(); // 해쉬맵으로 저장해서 보내줌
    
    System.out.println("여기여기:" + commuVO.getCm_no() + commuVO.getCm_ch());
    
    if(commuVO.getCm_ch().equals("A")){
      hashMap.put("arr", arr);
      commuDAO.delete(hashMap);
      mav.setViewName("redirect:/community/listA.do");
    }
    
    if(commuVO.getCm_ch().equals("B")){
      hashMap.put("arr", arr);                        
      commuDAO.delete(hashMap);                       
      mav.setViewName("redirect:/community/listB.do");
    }
 
    if(commuVO.getCm_ch().equals("C")){
      hashMap.put("arr", arr);                        // 배열에 자동으로 담아서 넘겨주고
      commuDAO.delete(hashMap);                       // 내가 원하는 함수에 담아서 실행하고
      mav.setViewName("redirect:/community/listC.do");// 실행한뒤 돌아가고싶은 주소로 GO
    }    
    
    return mav;
  }
 
  /**
   * 게시판 목록을 검색+페이징+답변을
   * 적용하여 출력합니다.
   * 
   * @param cm_no
   *          전체 목록에서 가져올 게시판 번호
   * @param searchDTO 검색 정보         
   * @return 추출된 게시판 목록
   */
  @RequestMapping(value = "/community/listA.do", 
                             method = RequestMethod.GET)
  public ModelAndView listA(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/listA");
 
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    int recordPerPage = 10; // 페이지당 출력할 레코드 갯수
    // 페이지에서 출력할 시작 레코드 번호 계산, nowPage는 1부터 시작
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10; 
    // 1 page: 0
    // 2 page: 10
    // 3 page: 20
    int startNum = beginOfPage + 1; // 시작 rownum, 1
    int endNum = beginOfPage + recordPerPage; // 종료 rownum, 10
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    int totalRecord = 0;
    
    List<CommuVO> list = commuDAO.listA(hashMap); // 검색
    Iterator<CommuVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      CommuVO vo = iter.next(); // 요소 추출
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = commuDAO.countA(hashMap);
    mav.addObject("totalRecord", commuDAO.countA(hashMap)); // 검색된 레코드 갯수
 
    String paging = new PagingC().paging1(totalRecord, 
                                           searchDTO.getNowPage(), 
                                           recordPerPage, 
                                           searchDTO.getCol(), 
                                           searchDTO.getWord());
    mav.addObject("paging", paging);
    
    return mav;
  }  
  
  /**
   * 게시판 목록을 검색+페이징+답변을
   * 적용하여 출력합니다.
   * 
   * @param cm_no
   *          전체 목록에서 가져올 게시판 번호
   * @param searchDTO 검색 정보         
   * @return 추출된 게시판 목록
   */
  @RequestMapping(value = "/community/listB.do", 
                             method = RequestMethod.GET)
  public ModelAndView listB(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/listB");
 
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    int recordPerPage = 10; // 페이지당 출력할 레코드 갯수
    // 페이지에서 출력할 시작 레코드 번호 계산, nowPage는 1부터 시작
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10; 
    // 1 page: 0
    // 2 page: 10
    // 3 page: 20
    int startNum = beginOfPage + 1; // 시작 rownum, 1
    int endNum = beginOfPage + recordPerPage; // 종료 rownum, 10
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    int totalRecord = 0;
    
    List<CommuVO> list = commuDAO.listB(hashMap); // 검색
    Iterator<CommuVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      CommuVO vo = iter.next(); // 요소 추출
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = commuDAO.countB(hashMap);
    mav.addObject("totalRecord", commuDAO.countB(hashMap)); // 검색된 레코드 갯수
 
    String paging = new PagingC().paging2(  totalRecord, 
                                           searchDTO.getNowPage(), 
                                           recordPerPage, 
                                           searchDTO.getCol(), 
                                           searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
  }    
  
  /**
   * 게시판 목록을 검색+페이징+답변을
   * 적용하여 출력합니다.
   * 
   * @param cm_no
   *          전체 목록에서 가져올 게시판 번호
   * @param searchDTO 검색 정보         
   * @return 추출된 게시판 목록
   */
  @RequestMapping(value = "/community/listC.do", 
                             method = RequestMethod.GET)
  public ModelAndView listC(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/listC");
 
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    int recordPerPage = 10; // 페이지당 출력할 레코드 갯수
    // 페이지에서 출력할 시작 레코드 번호 계산, nowPage는 1부터 시작
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10; 
    // 1 page: 0
    // 2 page: 10
    // 3 page: 20
    int startNum = beginOfPage + 1; // 시작 rownum, 1
    int endNum = beginOfPage + recordPerPage; // 종료 rownum, 10
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    int totalRecord = 0;
    
    List<CommuVO> list = commuDAO.listC(hashMap); // 검색
    Iterator<CommuVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      CommuVO vo = iter.next(); // 요소 추출
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = commuDAO.countA(hashMap);
    mav.addObject("totalRecord", commuDAO.countA(hashMap)); // 검색된 레코드 갯수
 
    String paging = new PagingC().paging1(totalRecord, 
                                           searchDTO.getNowPage(), 
                                           recordPerPage, 
                                           searchDTO.getCol(), 
                                           searchDTO.getWord());
    mav.addObject("paging", paging);
    
    return mav;
  }    
  
  /**
   * 답변 기능
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/community/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/reply"); 

    CommuVO commuVO = commuDAO.read(cm_no);
    mav.addObject("commuVO", commuVO);
    
    return mav;
  }
  
  /**
   * 답변 처리입니다
   * @param commuVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/community/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(CommuVO commuVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/community/storage");
    MultipartFile file2MF = commuVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      commuVO.setFile2(file2); // 전송된 파일명 저장
      commuVO.setSize2(size2);
 
      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) {
        file1 = Tool.preview(upDir, file2, 120, 80);
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
    }
    commuVO.setFile1(file1); // Thumb 이미지
    commuVO.setFile2(file2); // 원본 이미지
    commuVO.setSize2(size2);
    // -------------------------------------------------------------------
    // ---------- 답변 관련 코드 시작 ---------- 
    
    CommuVO parentVO = commuDAO.read(commuVO.getCm_no()); // 부모글 정보 추출
    System.out.println("parentVO.getCm_no : " + parentVO.getCm_no());
    commuVO.setGrpno(parentVO.getGrpno()); // 그룹 번호
    commuVO.setAnsnum(parentVO.getAnsnum()); // 답변 순서
    System.out.println("parentVO.getGrpno : " + parentVO.getGrpno());
    
    commuDAO.updateAnsnum(commuVO); // 현재 등록된 답변 뒤로 +1 처리함.
    
    commuVO.setIndent(parentVO.getIndent()+1); // 답변 차수 증가
    commuVO.setAnsnum(parentVO.getAnsnum()+1); //부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ---------- 
    
    if (commuDAO.reply(commuVO) == 1) {
      msgs.add("글을 등록했습니다.");
      links
          .add("<button type='button' onclick=\"location.href='./reply.do?cm_no="
              + commuVO.getCm_no() + "'\">계속 등록</button>");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links
          .add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
 
    links
        .add("<button type='button' onclick=\"location.href='./index.jsp'\">홈페이지</button>");
    if(commuVO.getCm_ch().equals("A")){
      links.add("<button type='button' onclick=\"location.href='./listA.do'\">목록</button>");
    }
    if(commuVO.getCm_ch().equals("B")){
      links.add("<button type='button' onclick=\"location.href='./listB.do'\">목록</button>");
    }
    if(commuVO.getCm_ch().equals("C")){
      links.add("<button type='button' onclick=\"location.href='./listC.do'\">목록</button>");
    }   
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  } 

  /**
   * 글을 조회합니다 
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/community/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cm_no,            
                                    HttpServletRequest request,
                                    HttpServletResponse response, String result) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/read");
    CommuVO commuVO = commuDAO.read(cm_no); 
    
    // ------------------------------------------------------------------
    // 좋아요 저장 관련 쿠키 저장
    // ------------------------------------------------------------------
    Cookie[] cookies = request.getCookies(); 
    Cookie cookie = null; 
     
    String sw = null; 
     
    if (cookies != null){
      for (int i = 0; i < cookies.length; i++) { 
        cookie = cookies[i]; 
     
        if (cookie.getName().equals(Integer.toString(cm_no))){ 
          sw = cookie.getValue(); 
        } 
      }
    }
    
    if (sw != null){ // Cookie 변수가 있다면  
      System.out.println("재접속 >.<"); 
         
    }else{ 
      System.out.println("첫접속");
      
      Cookie wcookie = null; 
     
      wcookie = new Cookie(Integer.toString(cm_no), "1N");     // 한글 저장시 에러  
      wcookie.setMaxAge(60);                // 60초
      
      response.addCookie(wcookie);          // 쿠키를 Client에 저장합니다. 
    } 
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------ 
    
    // ------------------------------------------------------------------
    // 관련글 처리(이전/다음글)
    // ------------------------------------------------------------------    
    CommuVO daum = new CommuVO();
    CommuVO ejun = new CommuVO();
    
    commuDAO.update_cnt(cm_no);
    List<CommuVO> listA = commuDAO.listmenuA(commuVO.getGrpno());
    List<CommuVO> listB = commuDAO.listmenuB(commuVO.getGrpno());
    List<CommuVO> listC = commuDAO.listmenuC(commuVO.getGrpno());

    List<CommuVO> bonlistA = commuDAO.bonlistA();
    if(commuVO.getCm_ch().equals("A")){
      
      for (int i = 0; i < bonlistA.size(); i++) {
        CommuVO vo1 = new CommuVO();
        CommuVO vo2 = bonlistA.get(i);
        CommuVO vo3 = new CommuVO();
        
        int minlistA = commuDAO.minlistA();
        int maxlistA = commuDAO.maxlistA();
        
        if(bonlistA.size() == 1) {
          vo2 = bonlistA.get(0);
          commuDAO.bonread(vo2.getGrpno());
          
          break;
        }
        
        if(cm_no == minlistA){
          if(bonlistA.get(i+1) != null){
            vo3 = bonlistA.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          } 
          break;
        }
    
        if(vo2.getCm_no() == cm_no){
          if(cm_no == maxlistA){
            if(bonlistA.get(i-1) != null){
              vo1 = bonlistA.get(i-1);
              ejun = commuDAO.bonread(vo1.getGrpno()); 
            }
            break;
          }
          if(bonlistA.get(i-1) != null){
            vo1 = bonlistA.get(i-1);
            ejun = commuDAO.bonread(vo1.getGrpno()); 
          }
          if(bonlistA.get(i+1) != null){
            vo3 = bonlistA.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          }
        }
      }
    }
 // ------------------------------------------------------------------
    List<CommuVO> bonlistB = commuDAO.bonlistB();
    if(commuVO.getCm_ch().equals("B")){
      
      for (int i = 0; i < bonlistB.size(); i++) {
        CommuVO vo1 = new CommuVO();
        CommuVO vo2 = bonlistB.get(i);
        CommuVO vo3 = new CommuVO();
        
        int minlistB = commuDAO.minlistB();
        int maxlistB = commuDAO.maxlistB();
        
        if(bonlistA.size() == 1) {
          vo2 = bonlistA.get(0);
          commuDAO.bonread(vo2.getGrpno());
          
          break;
        }
        
        if(cm_no == minlistB){
          if(bonlistB.get(i+1) != null){
            vo3 = bonlistB.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          } 
          break;
        }
    
        if(vo2.getCm_no() == cm_no){
          if(cm_no == maxlistB){
            if(bonlistB.get(i-1) != null){
              vo1 = bonlistB.get(i-1);
              ejun = commuDAO.bonread(vo1.getGrpno()); 
            }
            break;
          }
          if(bonlistB.get(i-1) != null){
            vo1 = bonlistB.get(i-1);
            ejun = commuDAO.bonread(vo1.getGrpno()); 
          }
          if(bonlistB.get(i+1) != null){
            vo3 = bonlistB.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          }
        }
      }
    }
    // ------------------------------------------------------------------
    List<CommuVO> bonlistC = commuDAO.bonlistC();
    if(commuVO.getCm_ch().equals("C")){
      
      for (int i = 0; i < bonlistC.size(); i++) {
        CommuVO vo1 = new CommuVO();
        CommuVO vo2 = bonlistC.get(i);
        CommuVO vo3 = new CommuVO();
        
        int minlistC = commuDAO.minlistC();
        int maxlistC = commuDAO.maxlistC();
        
        if(bonlistC.size() == 1) {
          vo2 = bonlistC.get(0);
          commuDAO.bonread(vo2.getGrpno());
          
          break;
        }
        
        if(cm_no == minlistC){
          if(bonlistC.get(i+1) != null){
            vo3 = bonlistC.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          } 
          break;
        }
    
        if(vo2.getCm_no() == cm_no){
          if(cm_no == maxlistC){
            if(bonlistC.get(i-1) != null){
              vo1 = bonlistC.get(i-1);
              ejun = commuDAO.bonread(vo1.getGrpno()); 
            }
            break;
          }
          if(bonlistC.get(i-1) != null){
            vo1 = bonlistC.get(i-1);
            ejun = commuDAO.bonread(vo1.getGrpno()); 
          }
          if(bonlistC.get(i+1) != null){
            vo3 = bonlistC.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          }
        }
      }
    }    
    // ------------------------------------------------------------------
    // 특수문자처리
    String cm_content = commuVO.getCm_content();
    cm_content = Tool.convertChar(cm_content);  
    commuVO.setCm_content(cm_content);
    mav.addObject("commuVO", commuVO); 
    mav.addObject("listA", listA); 
    mav.addObject("listB", listB);
    mav.addObject("listC", listC);
    mav.addObject("daum", daum); 
    mav.addObject("ejun", ejun); 
    mav.addObject("minlistA", commuDAO.minlistA()); 
    mav.addObject("maxlistA", commuDAO.maxlistA()); 
    mav.addObject("maxlistC", commuDAO.maxlistA());
    mav.addObject("minlistB", commuDAO.minlistB()); 
    mav.addObject("maxlistB", commuDAO.maxlistB());
    mav.addObject("maxlistC", commuDAO.maxlistB());
    mav.addObject("chA", "정 모 방");
    mav.addObject("chB", "정보공유방");
    mav.addObject("chC", "상담/공감방");
    
    return mav;
  }
  
  
  /**
   * 좋아요 처리
   * @throws IOException 
   */
  @ResponseBody
  @RequestMapping(value = "/community/likeit.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeit(int cm_no,HttpSession session, 
                                 HttpServletRequest request,
                                 HttpServletResponse response, String result) throws IOException {
    ModelAndView mav = new ModelAndView();
      // ------------------------------------------------------------------
      // 좋아요 저장 관련 쿠키 저장
      // ------------------------------------------------------------------
        Cookie[] cookies = request.getCookies(); 
        Cookie cookie = null; 
         
        String sw = null; 
        String str = "";
        
        if (cookies != null){
          for (int i = 0; i < cookies.length; i++) { 
            //쿠키 변수를 각각 추출합니다. 
            cookie = cookies[i]; 
         
            if (cookie.getName().equals(Integer.toString(cm_no))){ 
              sw = cookie.getValue(); // 1N
              if (sw.substring(1, 2).equals("N")){
                str = cm_no + "Y";
              } else {
                str = cm_no + "N";
              }
              
            } 
          }
        }
        
        Cookie wcookie = null; 
        
        wcookie = new Cookie(Integer.toString(cm_no), str);     // 한글 저장시 에러
        // System.out.println(wcookie.getValue());
        wcookie.setMaxAge(60);                // 60초
        response.addCookie(wcookie);          // 쿠키를 Client에 저장합니다. 

        
        if (sw == null){ // Cookie 변수가 있다면  
          System.out.println("조아요를 취소할구야"); 
          
          mav.addObject("likedown", commuDAO.likedown(cm_no));
          
          JSONObject obj = new JSONObject();
          obj.put("cookie", wcookie);          
          
        }else{ 
          System.out.println("조아요할구야");
          
          commuDAO.likeit(cm_no); //필수템!@@!!!! 
          
          JSONObject obj = new JSONObject();
          obj.put("cookie", wcookie);
        } 
      // ------------------------------------------------------------------
      // ------------------------------------------------------------------    
    
    mav.addObject("cm_no", commuDAO.read(cm_no));
    
    int cm_likeit= commuDAO.read(cm_no).getCm_likeit();
  
    JSONObject obj = new JSONObject();
    obj.put("cm_likeit", cm_likeit);
    obj.put("cm_no", cm_no);
    
    return obj.toJSONString();
  }
  
  
}