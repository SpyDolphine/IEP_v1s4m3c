package dev.mvc.ITOS;

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

import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class ItosCont {
  @Autowired
  @Qualifier("dev.mvc.ITOS.ItosDAO")
  private ItosDAOInter ItosDAO;

  public ItosCont() {
    System.out.println("--> ItosCont created.");
  }

  @RequestMapping(value = "/itos/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/create"); // /webapp/itos/create.jsp
    return mav;
  }

  @RequestMapping(value = "/itos/create.do", method = RequestMethod.POST)
  public ModelAndView create(ItosVO itosVO, HttpServletRequest request, HttpSession session) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/itos/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String io_file1 = "";
    String io_file2 = "";
    String upDir = Tool.getRealPath(request, "/itos/storage");
    MultipartFile file2MF = itosVO.getFile2MF();

    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      io_file2 = Upload.saveFileSpring(file2MF, upDir);
      itosVO.setIo_file2(io_file2); // 전송된 파일명 저장
      itosVO.setIo_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(io_file2)) {
        io_file1 = Tool.preview(upDir, io_file2, 120, 80);
      } else {
        io_file1 = "";
      }
      // -------------------------------------------------------------------
    }
    itosVO.setIo_file1(io_file1); // Thumb 이미지
    itosVO.setIo_file2(io_file2); // 원본 이미지
    // -------------------------------------------------------------------

    // itosVO.setMno(3); // 회원 연동시 변경
    // Integer itg = (Integer)(session.getAttribute("mno"));
    // blogVO.setMno(itg.intValue());
    if (ItosDAO.create(itosVO) == 1) {
      msgs.add("중고 물건이(가) 등록되었습니다.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("물품 등록에 실패했습니다.");
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
  @RequestMapping(value = "/itos/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/list"); // list.jsp

    List<ItosVO> list = ItosDAO.list();
    Iterator<ItosVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      ItosVO itosVO = iter.next(); // 요소 추출
      itosVO.setIo_title(Tool.textLength(itosVO.getIo_title(), 10));
      itosVO.setIo_date(itosVO.getIo_date().substring(0, 10));
      itosVO.setIo_file1(Tool.textLength(itosVO.getIo_file1(), 10));
      itosVO.setIo_file2(Tool.textLength(itosVO.getIo_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * 글을 조회합니다
   * 
   * @param io_no
   * @return
   */
  @RequestMapping(value = "/itos/read.do", method = RequestMethod.GET)
  public ModelAndView read(int io_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/read");
    ItosVO itosVO = ItosDAO.read(io_no);
    itosVO.getSize2Label();
    mav.addObject("itosVO", itosVO);
    // String content = boardVO.getContent();
    // content = Tool.convertChar(content); //특수문자처리
    // boardVO.setContent(content);
    return mav;
  }

  /**
   * 수정폼
   * 
   * @param io_no
   * @return
   */
  @RequestMapping(value = "/itos/update.do", method = RequestMethod.GET)
  public ModelAndView update(int io_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/update");
    mav.addObject("itosVO", ItosDAO.read(io_no));

    return mav;
  }

  /**
   * 수정 처리
   * 
   * @param AppVO
   * @return
   */
  @RequestMapping(value = "/itos/update.do", method = RequestMethod.POST)
  public ModelAndView update(ItosVO itosVO, HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    // 게시판에 대한 정보 파악

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String io_file1 = "";
    String io_file2 = "";

    String upDir = Tool.getRealPath(request, "/itos/storage");
    MultipartFile file2MF = itosVO.getFile2MF();
    ItosVO oldVO = ItosDAO.read(itosVO.getIo_no());

    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getIo_file2()); // 파일 삭제
      io_file2 = Upload.saveFileSpring(file2MF, upDir);
      itosVO.setIo_file2(io_file2); // 전송된 파일명 저장
      itosVO.setIo_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(io_file2)) {
        Tool.deleteFile(upDir, oldVO.getIo_file1()); // 파일 삭제
        io_file1 = Tool.preview(upDir, io_file2, 120, 80);
      } else {
        io_file1 = "";
      }
      // -------------------------------------------------------------------

    } else {
      io_file1 = oldVO.getIo_file1();
      io_file2 = oldVO.getIo_file2();
    }
    itosVO.setIo_file1(io_file1);
    itosVO.setIo_file2(io_file2);
    // -------------------------------------------------------------------
    //
    // itosVO.setMe_no(1); // 회원 연동시 변경
    // //Integer itg = (Integer)(session.getAttribute("mno"));
    // //boardVO.setMno(itg.intValue());
    //
    if (ItosDAO.update(itosVO) == 1) {
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/itos/read.do?io_no=" + itosVO.getIo_no()); // 확장자
                                                                            // 명시
    } else {
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add(
          "<button type='button' onclick=\"location.href='./list.do?io_no=" + itosVO.getIo_no() + "'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }

  /**
   * 삭제폼
   * 
   * @param io_no
   * @return
   */
  @RequestMapping(value = "/itos/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int io_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/delete"); // /webapp/board/delete.jsp
    mav.addObject("io_no", io_no);

    return mav;
  }

  /**
   * 삭제 처리
   * 
   * @param AppVO
   * @return
   */
  @RequestMapping(value = "/itos/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(ItosVO itosVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    System.out.println(itosVO.getIo_no());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (ItosDAO.delete(itosVO.getIo_no()) == 1) {
      mav.setViewName("redirect:/itos/list.do?io_no=" + itosVO.getIo_no());// 확장자
                                                                           // 명시

    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add(
          "<button type='button' onclick=\"location.href='./list.do?io_no=" + itosVO.getIo_no() + "'\">목록</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/itos/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(ItosVO itosVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/reply"); // /webapp/itos/reply.jsp
    itosVO = ItosDAO.read(itosVO.getIo_no());
    mav.addObject("itosVO", itosVO);

    return mav;
  }

  @RequestMapping(value = "/itos/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(ItosVO itosVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String io_file1 = "";
    String io_file2 = "";
    String upDir = Tool.getRealPath(request, "/itos/storage");
    MultipartFile file2MF = itosVO.getFile2MF();

    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      io_file2 = Upload.saveFileSpring(file2MF, upDir);
      itosVO.setIo_file2(io_file2); // 전송된 파일명 저장
      itosVO.setIo_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(io_file2)) {
        io_file1 = Tool.preview(upDir, io_file2, 120, 80);
      } else {
        io_file1 = "";
      }
      // -------------------------------------------------------------------
    }
    itosVO.setIo_file1(io_file1);
    itosVO.setIo_file2(io_file2);
    // -------------------------------------------------------------------

    // -------------------------------------------------------------------
    // itosVO.setMno(4); // 회원 연동시 변경
    // -------------------------------------------------------------------

    // ---------- 답변 관련 코드 시작 ----------
    ItosVO parentVO = ItosDAO.read(itosVO.getIo_no()); // 부모글 정보 추출
    itosVO.setIo_grpno(parentVO.getIo_grpno()); // 그룹 번호
    itosVO.setIo_ansnum(parentVO.getIo_ansnum()); // 답변 순서

    ItosDAO.updateAnsnum(itosVO); // 현재 등록된 답변 뒤로 +1 처리함.

    itosVO.setIo_indent(parentVO.getIo_indent() + 1); // 답변 차수 증가
    itosVO.setIo_ansnum(parentVO.getIo_ansnum() + 1); // 부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ----------

    if (ItosDAO.reply(itosVO) == 1) {
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do?io_no=" + itosVO.getIo_no()
          + "'\">계속 등록</button>");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    links
        .add("<button type='button' onclick=\"location.href='./list.do?io_no=" + itosVO.getIo_no() + "'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  //
  // /**
  // * blogcategoryno 별로 게시판 목록을 검색+페이징+답변을 적용하여 출력합니다.
  // *
  // * @param blogcategoryno
  // * 전체 목록에서 가져올 게시판 번호
  // * @param searchDTO
  // * 검색 정보
  // * @return 추출된 게시판 목록
  // */
  // @RequestMapping(value = "/itos/list.do", method = RequestMethod.GET)
  // public ModelAndView list1(int io_rno, SearchDTO searchDTO,
  // HttpServletRequest request) {
  // ModelAndView mav = new ModelAndView();
  // mav.setViewName("/itos/list1");
  // int totalRecord = 0;
  //
  // // HashMap hashMap = new HashMap();
  // HashMap<String, Object> hashMap = new HashMap<String, Object>();
  // hashMap.put("io_rno", io_rno);
  // hashMap.put("col", searchDTO.getCol());
  // hashMap.put("word", searchDTO.getWord());
  //
  // int recordPerPage = 10; // 페이지당 출력할 레코드 갯수
  // // 페이지에서 출력할 시작 레코드 번호 계산, nowPage는 1부터 시작
  // int beginOfPage = (searchDTO.getNowPage() - 1) * 10;
  // // 1 page: 0
  // // 2 page: 10
  // // 3 page: 20
  // int startNum = beginOfPage + 1; // 시작 rownum, 1
  // int endNum = beginOfPage + recordPerPage; // 종료 rownum, 10
  // hashMap.put("startNum", startNum);
  // hashMap.put("endNum", endNum);
  //
  // List<ItosVO> list = ItosDAO.list1(hashMap); // 검색
  // Iterator<ItosVO> iter = list.iterator();
  // while (iter.hasNext() == true) { // 다음 요소 검사
  // ItosVO vo = iter.next(); // 요소 추출
  // vo.setIo_title(Tool.textLength(vo.getIo_title(), 10));
  // vo.setIo_date(vo.getIo_date().substring(0, 10));
  // // vo.setFile1(Tool.textLength(10, vo.getFile1()));
  // // vo.setFile2(Tool.textLength(10, vo.getFile2()));
  // vo.setSize2Label(Tool.unit(vo.getIo_size2()));
  // }
  // mav.addObject("list", list);
  ////
  //// BlogcategoryVO blogcategoryVO = blogcategoryDAO.read(blogcategoryno);
  //// mav.addObject("blogcategoryVO", blogcategoryVO);
  //// mav.addObject("root", request.getContextPath());
  //
  // totalRecord = ItosDAO.count(hashMap);
  // mav.addObject("totalRecord", ItosDAO.count(hashMap)); // 검색된 레코드 갯수
  //
  //// String paging = new Paging().paging5(blogcategoryno, totalRecord,
  // searchDTO.getNowPage(), recordPerPage,
  //// searchDTO.getCol(), searchDTO.getWord());
  //// mav.addObject("paging", paging);
  //// return mav;
  // }

}