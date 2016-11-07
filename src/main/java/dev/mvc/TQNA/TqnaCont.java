package dev.mvc.TQNA;

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

import dev.mvc.TQNA.TqnaDAOInter;
import dev.mvc.TQNA.TqnaVO;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class TqnaCont {
  @Autowired
  @Qualifier("dev.mvc.TQNA.TqnaDAO")
  private TqnaDAOInter TqnaDAO;

  public TqnaCont() {
    System.out.println("--> TqnaCont created.");
  }

  @RequestMapping(value = "/tqna/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/create"); // /webapp/tqna/create.jsp
    return mav;
  }

  @RequestMapping(value = "/tqna/create.do", method = RequestMethod.POST)
  public ModelAndView create(TqnaVO tqnaVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/tqna/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (TqnaDAO.create(tqnaVO) == 1) {
      msgs.add("질문이(가) 등록되었습니다.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("질문 등록에 실패했습니다.");
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
  @RequestMapping(value = "/tqna/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/list"); // list.jsp

    List<TqnaVO> list = TqnaDAO.list();
    Iterator<TqnaVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      TqnaVO tqnaVO = iter.next(); // 요소 추출
      tqnaVO.setQa_title(Tool.textLength(tqnaVO.getQa_title(), 10));
      tqnaVO.setQa_date(tqnaVO.getQa_date().substring(0, 10));
      tqnaVO.setQa_file1(Tool.textLength(tqnaVO.getQa_file1(), 10));
      tqnaVO.setQa_file2(Tool.textLength(tqnaVO.getQa_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * 
   * 글을 조회합니다
   * 
   * @param qa_no
   * @return
   */
  @RequestMapping(value = "/tqna/read.do", method = RequestMethod.GET)
  public ModelAndView read(int qa_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/read");
    TqnaVO tqnaVO = TqnaDAO.read(qa_no);
    tqnaVO.getSize2Label();
    mav.addObject("tqnaVO", tqnaVO);
    // String content = boardVO.getContent();
    // content = Tool.convertChar(content); //특수문자처리
    // boardVO.setContent(content);
    return mav;
  }

  /**
   * 수정폼
   * 
   * @param qa_no
   * @return
   */
  @RequestMapping(value = "/tqna/update.do", method = RequestMethod.GET)
  public ModelAndView update(int qa_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/update");
    mav.addObject("tqnaVO", TqnaDAO.read(qa_no));

    return mav;
  }

  /**
   * 수정 처리
   * 
   * @param TqnaVO
   * @return
   */
  @RequestMapping(value = "/tqna/update.do", method = RequestMethod.POST)
  public ModelAndView update(TqnaVO tqnaVO, HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    // 게시판에 대한 정보 파악

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String qa_file1 = "";
    String qa_file2 = "";

    String upDir = Tool.getRealPath(request, "/tqna/storage");
    MultipartFile file2MF = tqnaVO.getFile2MF();
    TqnaVO oldVO = TqnaDAO.read(tqnaVO.getQa_no());

    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getQa_file2()); // 파일 삭제
      qa_file2 = Upload.saveFileSpring(file2MF, upDir);
      tqnaVO.setQa_file2(qa_file2); // 전송된 파일명 저장
      tqnaVO.setQa_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(qa_file2)) {
        Tool.deleteFile(upDir, oldVO.getQa_file1()); // 파일 삭제
        qa_file1 = Tool.preview(upDir, qa_file2, 120, 80);
      } else {
        qa_file1 = "";
      }
      // -------------------------------------------------------------------

    } else {
      qa_file1 = oldVO.getQa_file1();
      qa_file2 = oldVO.getQa_file2();
    }
    tqnaVO.setQa_file1(qa_file1);
    tqnaVO.setQa_file2(qa_file2);
    // -------------------------------------------------------------------
    //
    // itosVO.setMe_no(1); // 회원 연동시 변경
    // //Integer itg = (Integer)(session.getAttribute("mno"));
    // //boardVO.setMno(itg.intValue());
    //
    if (TqnaDAO.update(tqnaVO) == 1) {
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/tqna/read.do?qa_no=" + tqnaVO.getQa_no()); // 확장자
                                                                            // 명시
    } else {
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add(
          "<button type='button' onclick=\"location.href='./list.do?qa_no=" + tqnaVO.getQa_no() + "'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }

  /**
   * 삭제폼
   * 
   * @param qa_no
   * @return
   */
  @RequestMapping(value = "/tqna/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int qa_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/delete"); // /webapp/tqna/delete.jsp
    mav.addObject("qa_no", qa_no);

    return mav;
  }

  /**
   * 삭제 처리
   * 
   * @param TqnaVO
   * @return
   */
  @RequestMapping(value = "/tqna/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(TqnaVO tqnaVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    System.out.println(tqnaVO.getQa_no());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (TqnaDAO.delete(tqnaVO.getQa_no()) == 1) {
      mav.setViewName("redirect:/tqna/list.do?qa_no=" + tqnaVO.getQa_no());// 확장자
                                                                           // 명시

    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add(
          "<button type='button' onclick=\"location.href='./list.do?qa_no=" + tqnaVO.getQa_no() + "'\">목록</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/tqna/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(TqnaVO tqnaVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/reply"); // /webapp/tqna/reply.jsp
    tqnaVO = TqnaDAO.read(tqnaVO.getQa_no());
    mav.addObject("tqnaVO", tqnaVO);

    return mav;
  }

  @RequestMapping(value = "/tqna/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(TqnaVO tqnaVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String qa_file1 = "";
    String qa_file2 = "";
    String upDir = Tool.getRealPath(request, "/tqna/storage");
    MultipartFile file2MF = tqnaVO.getFile2MF();

    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      qa_file2 = Upload.saveFileSpring(file2MF, upDir);
      tqnaVO.setQa_file2(qa_file2); // 전송된 파일명 저장
      tqnaVO.setQa_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(qa_file2)) {
        qa_file1 = Tool.preview(upDir, qa_file2, 120, 80);
      } else {
        qa_file1 = "";
      }
      // -------------------------------------------------------------------
    }
    tqnaVO.setQa_file1(qa_file1);
    tqnaVO.setQa_file2(qa_file2);
    // -------------------------------------------------------------------

    // -------------------------------------------------------------------
    // tqnaVO.setMno(4); // 회원 연동시 변경
    // -------------------------------------------------------------------

    // ---------- 답변 관련 코드 시작 ----------
    TqnaVO parentVO = TqnaDAO.read(tqnaVO.getQa_no()); // 부모글 정보 추출
    tqnaVO.setQa_grpno(parentVO.getQa_grpno()); // 그룹 번호
    tqnaVO.setQa_ansnum(parentVO.getQa_ansnum()); // 답변 순서

    TqnaDAO.updateAnsnum(tqnaVO); // 현재 등록된 답변 뒤로 +1 처리함.

    tqnaVO.setQa_indent(parentVO.getQa_indent() + 1); // 답변 차수 증가
    tqnaVO.setQa_ansnum(parentVO.getQa_ansnum() + 1); // 부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ----------

    if (TqnaDAO.reply(tqnaVO) == 1) {
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do?qa_no=" + tqnaVO.getQa_no()
          + "'\">계속 등록</button>");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    links.add(
        "<button type='button' onclick=\"location.href='./list.do?qa_no=" + tqnaVO.getQa_no() + "'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
//
//  /**
//   * blogcategoryno 별로 게시판 목록을 검색+페이징+답변을 적용하여 출력합니다.
//   * 
//   * @param blogcategoryno
//   *          전체 목록에서 가져올 게시판 번호
//   * @param searchDTO
//   *          검색 정보
//   * @return 추출된 게시판 목록
//   */
//  @RequestMapping(value = "/itos/list.do", method = RequestMethod.GET)
//  public ModelAndView list1(int io_rno, SearchDTO searchDTO, HttpServletRequest request) {
//    ModelAndView mav = new ModelAndView();
//    mav.setViewName("/itos/list1");
//    int totalRecord = 0;
//
//    // HashMap hashMap = new HashMap();
//    HashMap<String, Object> hashMap = new HashMap<String, Object>();
//    hashMap.put("io_rno", io_rno);
//    hashMap.put("col", searchDTO.getCol());
//    hashMap.put("word", searchDTO.getWord());
//
//    int recordPerPage = 10; // 페이지당 출력할 레코드 갯수
//    // 페이지에서 출력할 시작 레코드 번호 계산, nowPage는 1부터 시작
//    int beginOfPage = (searchDTO.getNowPage() - 1) * 10;
//    // 1 page: 0
//    // 2 page: 10
//    // 3 page: 20
//    int startNum = beginOfPage + 1; // 시작 rownum, 1
//    int endNum = beginOfPage + recordPerPage; // 종료 rownum, 10
//    hashMap.put("startNum", startNum);
//    hashMap.put("endNum", endNum);
//
//    List<ItosVO> list = ItosDAO.list1(hashMap); // 검색
//    Iterator<ItosVO> iter = list.iterator();
//    while (iter.hasNext() == true) { // 다음 요소 검사
//      ItosVO vo = iter.next(); // 요소 추출
//      vo.setIo_title(Tool.textLength(vo.getIo_title(), 10));
//      vo.setIo_date(vo.getIo_date().substring(0, 10));
//      // vo.setFile1(Tool.textLength(10, vo.getFile1()));
//      // vo.setFile2(Tool.textLength(10, vo.getFile2()));
//      vo.setSize2Label(Tool.unit(vo.getIo_size2()));
//    }
//    mav.addObject("list", list);
////
////    BlogcategoryVO blogcategoryVO = blogcategoryDAO.read(blogcategoryno);
////    mav.addObject("blogcategoryVO", blogcategoryVO);
////    mav.addObject("root", request.getContextPath());
//
//    totalRecord = ItosDAO.count(hashMap);
//    mav.addObject("totalRecord", ItosDAO.count(hashMap)); // 검색된 레코드 갯수
//
////    String paging = new Paging().paging5(blogcategoryno, totalRecord, searchDTO.getNowPage(), recordPerPage,
////        searchDTO.getCol(), searchDTO.getWord());
////    mav.addObject("paging", paging);
////    return mav;
//  }

}