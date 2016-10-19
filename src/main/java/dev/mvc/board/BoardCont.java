package dev.mvc.board;
 
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

import dev.mvc.division.DivisionDAO;
import dev.mvc.division.DivisionVO;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class BoardCont {
  @Autowired
  @Qualifier("dev.mvc.board.BoardDAO")
  private BoardDAOInter boardDAO;
  @Autowired
  @Qualifier("dev.mvc.division.DivisionDAO")
  private DivisionDAO divisionDAO;
  
  public BoardCont(){
    System.out.println("--> BoardCont created.");
  }

  @RequestMapping(value = "/board/create.do", method = RequestMethod.GET)
  public ModelAndView create(int divisionno) {
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/create"); // /webapp/board/create.jsp
 
    DivisionVO divisionVO = divisionDAO.read(divisionno);
    mav.addObject("divisionVO", divisionVO);
    
    return mav;
  } 

 
  @RequestMapping(value = "/board/create.do", method = RequestMethod.POST)
  public ModelAndView create(BoardVO boardVO, 
                                                    HttpServletRequest request, 
                                                    HttpSession session) {
    // System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/message");
 
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
      boardVO.setSize2Label(file2);
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
    //Integer itg = (Integer)(session.getAttribute("mno"));
    //boardVO.setMno(itg.intValue());
     
    if (boardDAO.create(boardVO) == 1) {
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
  }
  
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value = "/board/list_total.do", method = RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/list_total"); // list_total.jsp
    
    List<BoardVO> list = boardDAO.list();
    Iterator<BoardVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      BoardVO boardVO = iter.next();  // 요소 추출
      boardVO.setTitle(Tool.textLength(boardVO.getTitle(),10));
      boardVO.setRdate(boardVO.getRdate().substring(0, 10)); 
      boardVO.setFile1(Tool.textLength(boardVO.getFile1(),10));
      boardVO.setFile2(Tool.textLength(boardVO.getFile2(),10));
    }
    mav.addObject("list", list);
    
    return mav;
  }
  
  /**
   * 글을 조회합니다
   * @param boardno
   * @return
   */
  @RequestMapping(value = "/board/read.do", method = RequestMethod.GET)
  public ModelAndView read(int boardno, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/read");
    BoardVO boardVO = boardDAO.read(boardno);
    
    //String content = boardVO.getContent();
    //content = Tool.convertChar(content); //특수문자처리
    //boardVO.setContent(content);    
    mav.addObject("boardVO", boardVO); 
    boardVO.getSize2Label();
    //게시판에 대한 정보 파악
    DivisionVO divisionVO = divisionDAO.read(boardVO.getDivisionno());
    mav.addObject("divisionVO", divisionVO);
    
    return mav;
  }
  
  /**
   * 수정폼
   * @param blogno
   * @return
   */
  @RequestMapping(value="/board/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int boardno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/update"); 
    mav.addObject("boardVO", boardDAO.read(boardno)); 
    
    return mav;
  }
   
  /**
   * 수정 처리
   * @param boardVO
   * @return
   */
  @RequestMapping(value="/board/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(BoardVO boardVO, HttpServletRequest request, 
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
 
    String upDir = Tool.getRealPath(request, "/board/storage");
    MultipartFile file2MF = boardVO.getFile2MF();
    BoardVO oldVO = boardDAO.read(boardVO.getBoardno());
 
    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getFile2()); // 파일 삭제
      file2 = Upload.saveFileSpring(file2MF, upDir);
      boardVO.setFile2(file2); // 전송된 파일명 저장
      boardVO.setSize2(file2MF.getSize());
 
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
    boardVO.setFile1(file1);
    boardVO.setFile2(file2);
    // -------------------------------------------------------------------
    
    boardVO.setMe_no(1); // 회원 연동시 변경
    //Integer itg = (Integer)(session.getAttribute("mno"));
    //boardVO.setMno(itg.intValue());
     
    if(boardDAO.update(boardVO) == 1){
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/board/read.do?boardno=" + boardVO.getBoardno() + "&divisionno=" + boardVO.getDivisionno()); // 확장자 명시
    }else{
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?divisionno="+boardVO.getDivisionno()+"'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  /**
   * 삭제폼
   * @param boardno
   * @return
   */
  @RequestMapping(value = "/board/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int boardno, int divisionno,SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/delete"); // /webapp/board/delete.jsp
    mav.addObject("boardno", boardno);
    mav.addObject("divisionno", divisionno);
    
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param boardVO
   * @return
   */
  @RequestMapping(value = "/board/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(BoardVO boardVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/message");
    System.out.println(boardVO.getDivisionno());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (boardDAO.delete(boardVO.getBoardno()) == 1) {
      divisionDAO.decreaseCnt(boardVO.getDivisionno());
      mav.setViewName("redirect:/board/list.do?divisionno=" + boardVO.getDivisionno());//확장자 명시
 
    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?divisionno="+boardVO.getDivisionno()+"'\">목록</button>");
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
  @RequestMapping(value = "/board/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list4(int divisionno, 
                                        SearchDTO searchDTO,
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/list4");
    int totalRecord = 0;
 
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("divisionno", divisionno);
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
 
    List<BoardVO> list = boardDAO.list4(hashMap); // 검색
    Iterator<BoardVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      BoardVO vo = iter.next(); // 요소 추출
      vo.setTitle(Tool.textLength(vo.getTitle(), 10));
      vo.setRdate(vo.getRdate().substring(0, 10));
      // vo.setFile1(Tool.textLength(10, vo.getFile1()));
      // vo.setFile2(Tool.textLength(10, vo.getFile2()));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
 
    DivisionVO divisionVO = divisionDAO.read(divisionno);
    mav.addObject("divisionVO", divisionVO);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = boardDAO.count(hashMap);
    mav.addObject("totalRecord", boardDAO.count(hashMap)); // 검색된 레코드 갯수
 
    String paging = new Paging().paging5(
                                           divisionno,
                                           totalRecord, 
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
   */
  @RequestMapping(value = "/board/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(BoardVO boardVO) {
     //System.out.println("--> reply() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/reply"); // /webapp/board/create.jsp
    mav.addObject("boardVO", boardVO);
    
    DivisionVO divisionVO = divisionDAO.read(boardVO.getDivisionno());
    mav.addObject("divisionVO", divisionVO);
    
    return mav;
  } 
  /**
   * 답변 처리입니다
   * @param boardVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/board/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(BoardVO boardVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/message");
 
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
    BoardVO parentVO = boardDAO.read(boardVO.getBoardno()); // 부모글 정보 추출
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
  }
  
  
}