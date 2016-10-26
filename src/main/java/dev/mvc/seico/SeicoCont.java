package dev.mvc.seico;
 
import java.util.*;

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
public class SeicoCont {
  @Autowired
  @Qualifier("dev.mvc.seico.SeicoDAO")
  private SeicoDAOInter seicoDAO;

  public SeicoCont(){
    System.out.println("--> SeicoCont created.");
  }
  @RequestMapping(value = "/seico/create.do", method = RequestMethod.GET)
  public ModelAndView create(/*int seico*/) {
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/create"); // /webapp/board/create.jsp
 
   /* SeicoVO seicoVO = seicoDAO.read(sc_no);
    mav.addObject("seicoVO", seicoVO);*/
    
    return mav;
  } 
 
  @RequestMapping(value = "/seico/create.do", method = RequestMethod.POST)
  public ModelAndView create(SeicoVO seicoVO, 
                                                    HttpServletRequest request, 
                                                    HttpSession session) {
    // System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/seico/storage");
    MultipartFile file2MF = seicoVO.getFile2MF();
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      seicoVO.setFile2(file2); // 전송된 파일명 저장
      seicoVO.setSize2(file2MF.getSize());
      seicoVO.setSize2Label(file2);
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
    seicoVO.setFile1(file1);
    seicoVO.setFile2(file2);
    // -------------------------------------------------------------------
    
   // seicoVO.setMe_no(1); // 회원 연동시 변경
    //Integer itg = (Integer)(session.getAttribute("mno"));
    //boardVO.setMno(itg.intValue());
      
    if (seicoDAO.create(seicoVO) == 1) {
      //divisionDAO.increaseCnt(boardVO.getDivisionno());
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do?divisionno="
              +/* seicoVO.getDivisionno()*/  "'\">계속 등록</button>");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    links.add("<button type='button' onclick=\"location.href='./list4.do"
            + /*seicoVO.getDivisionno()*/ "'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value = "/seico/list.do", method = RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/list4"); 
    
    List<SeicoVO> list = seicoDAO.list();
    Iterator<SeicoVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      SeicoVO seicoVO = iter.next();  // 요소 추출
      seicoVO.setSc_title(Tool.textLength(seicoVO.getSc_title(),10));
      seicoVO.setSc_date(seicoVO.getSc_date().substring(0, 10)); 
//      seicoVO.setFile1(Tool.textLength(seicoVO.getFile1(),10));
//      seicoVO.setFile2(Tool.textLength(seicoVO.getFile2(),10));
    }
    mav.addObject("list", list);
    
    return mav;
  }
  
  /**
   * 글을 조회합니다
   * @param sc_no
   * @return
   */
  @RequestMapping(value = "/seico/read.do", 
                             method = RequestMethod.GET)
  public ModelAndView read(int sc_no/*, SearchDTO searchDTO*/) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/read");
    SeicoVO seicoVO = seicoDAO.read(sc_no);
    seicoDAO.cntup(sc_no);
    //String content = boardVO.getContent();
    //content = Tool.convertChar(content); //특수문자처리
    //boardVO.setContent(content);    
    mav.addObject("seicoVO", seicoVO); 
    seicoVO.getSize2Label();
    //게시판에 대한 정보 파악
   /* DivisionVO divisionVO = divisionDAO.read(boardVO.getDivisionno());
    mav.addObject("divisionVO", divisionVO);*/
    
    return mav;
  }
  /*
  *//**
   * 수정폼
   * @param sc_no
   * @return
   */
  @RequestMapping(value="/seico/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int sc_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/update"); 
    mav.addObject("seicoVO", seicoDAO.read(sc_no)); 
    
    return mav;
  }

   
  /**
   * 수정 처리
   * @param seicoVO
   * @return
   */
  @RequestMapping(value="/seico/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(SeicoVO seicoVO, HttpServletRequest request, 
      HttpSession session){
    ModelAndView mav = new ModelAndView();
    //게시판에 대한 정보 파악
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
 
    String upDir = Tool.getRealPath(request, "/seico/storage");
    MultipartFile file2MF = seicoVO.getFile2MF();
    SeicoVO oldVO = seicoDAO.read(seicoVO.getSc_no());
 
    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getFile2()); // 파일 삭제
      file2 = Upload.saveFileSpring(file2MF, upDir);
      seicoVO.setFile2(file2); // 전송된 파일명 저장
      seicoVO.setSize2(file2MF.getSize());
 
      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) {
        Tool.deleteFile(upDir, oldVO.getFile1()); // 파일 삭제
        file1 = Tool.preview(upDir, file2, 120, 80);
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
 
    } else {
      file1 = oldVO.getFile1();
      file2 = oldVO.getFile2();
    }
    seicoVO.setFile1(file1);
    seicoVO.setFile2(file2);
    // -------------------------------------------------------------------
    
   // boardVO.setMe_no(1); // 회원 연동시 변경
    //Integer itg = (Integer)(session.getAttribute("mno"));
    //boardVO.setMno(itg.intValue());
     
    if(seicoDAO.update(seicoVO) == 1){
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/seico/read.do?sc_no=" + seicoVO.getSc_no()/* + "&divisionno=" + seicoVO.getDivisionno()*/); // 확장자 명시
    }else{
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list4.do'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  /**
   * 삭제폼
   * @param sc_no
   * @return
   */
  @RequestMapping(value = "/seico/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int sc_no/* int divisionno,SearchDTO searchDTO*/) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/delete"); // /webapp/board/delete.jsp
    System.out.println(sc_no);
    mav.addObject("sc_no", sc_no);
    //mav.addObject("divisionno", divisionno);
    
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param seicoVO
   * @return
   */
  @RequestMapping(value = "/seico/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete2(int sc_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (seicoDAO.delete(sc_no) == 1) {
      
      mav.setViewName("redirect:/seico/list4.do");//확장자 명시
    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  /**
   * divisionno 별로 게시판 목록을 검색+페이징+답변을
   * 적용하여 출력합니다.
   * 
   * @param divisionno
   *          전체 목록에서 가져올 게시판 번호
   * @param searchDTO 검색 정보         
   * @return 추출된 게시판 목록
   */
  @RequestMapping(value = "/seico/list4.do", 
                             method = RequestMethod.GET)
  public ModelAndView list4( /*int sc_no,*/
                                        SearchDTO searchDTO,
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/list4");
    int totalRecord = 0;
    System.out.println("컨트롤러:"+searchDTO.getCol());
    System.out.println("컨트롤러:"+searchDTO.getWord());
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    /*hashMap.put("divisionno", divisionno);*/
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    System.out.println(hashMap.get("col"));
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
 
    int  totalRecord1 = 0; 
    
    List<SeicoVO> list = seicoDAO.list4(hashMap); // 검색
    Iterator<SeicoVO> iter = list.iterator();
    
    while (iter.hasNext() == true) { // 다음 요소 검사
      SeicoVO vo = iter.next(); // 요소 추출
      vo.setSc_title(Tool.textLength(vo.getSc_title(), 10));
      vo.setSc_date(vo.getSc_date().substring(0, 10));
      // vo.setFile1(Tool.textLength(10, vo.getFile1()));
      // vo.setFile2(Tool.textLength(10, vo.getFile2()));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
 
    totalRecord1 = seicoDAO.count(hashMap);
        mav.addObject("totalRecord", seicoDAO.count(hashMap));
    
    /*SeicoVO seicoVO = seicoDAO.read(sc_no);
    mav.addObject("seicoVO", seicoVO);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = seicoDAO.count(hashMap);
    mav.addObject("totalRecord", seicoDAO.count(hashMap)); */// 검색된 레코드 갯수
 
    String paging = new Paging2().paging5( 
                                           totalRecord1, 
                                           searchDTO.getNowPage(), 
                                           recordPerPage, 
                                           searchDTO.getCol(), 
                                           searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
  }
  /**
   * 
   * @param divisionno
   * @return
   *//*
  @RequestMapping(value = "/board/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(SeicoVO boardVO) {
     //System.out.println("--> reply() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/reply"); // /webapp/board/create.jsp
    mav.addObject("boardVO", boardVO);
    
    DivisionVO divisionVO = divisionDAO.read(boardVO.getDivisionno());
    mav.addObject("divisionVO", divisionVO);
    
    return mav;
  } 
  *//**
   * 답변 처리입니다
   * @param boardVO
   * @param request
   * @return
   *//*
  @RequestMapping(value = "/board/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(SeicoVO boardVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/board/storage");
    MultipartFile file2MF = boardVO.getFile2MF();
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      boardVO.setFile2(file2); // 전송된 파일명 저장
      boardVO.setSize2(file2MF.getSize());
 
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
    boardVO.setFile1(file1);
    boardVO.setFile2(file2);
    // -------------------------------------------------------------------
    
    boardVO.setMe_no(1); // 회원 연동시 변경
    // ---------- 답변 관련 코드 시작 ---------- 
    SeicoVO parentVO = boardDAO.read(boardVO.getBoardno()); // 부모글 정보 추출
    boardVO.setGrpno(parentVO.getGrpno()); // 그룹 번호
    boardVO.setAnsnum(parentVO.getAnsnum()); // 답변 순서
    
    boardDAO.updateAnsnum(boardVO); // 현재 등록된 답변 뒤로 +1 처리함.
    System.out.println(boardDAO.updateAnsnum(boardVO)); //test
    
    boardVO.setIndent(parentVO.getIndent()+1); // 답변 차수 증가
    boardVO.setAnsnum(parentVO.getAnsnum()+1); // 부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ---------- 
    
    if (boardDAO.reply(boardVO) == 1) {
      divisionDAO.increaseCnt(boardVO.getDivisionno());
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do?divisionno="
              + boardVO.getDivisionno() + "'\">계속 등록</button>");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    links.add("<button type='button' onclick=\"location.href='./list.do?divisionno="
            + boardVO.getDivisionno() + "'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }*/
  
  
}