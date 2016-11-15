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

}