package dev.mvc.contest;

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

import dev.mvc.memberEx.MemberExDAOInter;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class ContestCont {

  @Autowired
  @Qualifier("dev.mvc.memberEx.MemberExDAO")
  private MemberExDAOInter memberExDAO;

  @Autowired
  @Qualifier("dev.mvc.contest.ContestDAO")
  private ContestDAOInter contestDAO;

  @RequestMapping(value = "/contest/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/create"); // /webapp/blog/create.jsp
    return mav;
  }

  @RequestMapping(value = "/contest/create.do", method = RequestMethod.POST)
  public ModelAndView create(ContestVO contestVO, HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/contest/storage");
    MultipartFile file2MF = contestVO.getFile2MF();
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);

      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) {
        file1 = Tool.preview(upDir, file2, 200, 350); // thumb 이미지 생성
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
    }
    contestVO.setCt_file1(file1); // Thumb 이미지
    contestVO.setCt_file2(file2); // 원본 이미지
    contestVO.setCt_size2(size2); // 원본 이미지
    // -------------------------------------------------------------------

    Integer itg = (Integer) (session.getAttribute("me_no"));
    contestVO.setMe_no(itg.intValue());

    if (contestDAO.create(contestVO) == 1) {
      // blogcategoryDAO.increaseCnt(blogVO.getBlogcategoryno());
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do>계속 등록</button>");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./index.do'\">홈페이지</button>");
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/contest/list.do", method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/list");

    int totalRecord = 0;
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

    List<ContestVO> list = contestDAO.list();
    Iterator<ContestVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      ContestVO vo = iter.next(); // 요소 추출
      vo.setCt_title(Tool.textLength(vo.getCt_title(), 10)); // 문자열 10자 분리
      // vo.setCt_rdate(vo.getCt_rdate().substring(0, 10)); // 년월일
      // vo.setFile1(Tool.textLength(vo.getFile1(), 10));
      vo.setCt_file2(Tool.textLength(vo.getCt_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * 글을 조회합니다
   * 
   * @param blogno
   * @return
   */
  @RequestMapping(value = "/contest/read.do", method = RequestMethod.GET)
  public ModelAndView read(int ct_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/read");
    ContestVO contestVO = contestDAO.read(ct_no);
    mav.addObject("contestVO", contestVO);

    return mav;
  }

  /**
   * 그리을 수정합니다. /** 수정폼
   * 
   * @param blogno
   * @return
   */
  @RequestMapping(value = "/contest/update.do", method = RequestMethod.GET)
  public ModelAndView update(int ct_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/update");

    ContestVO contestVO = contestDAO.read(ct_no);
    mav.addObject("contestVO", contestVO);
    return mav;

  }

  /**
   * 글과 파일을 수정 처리
   * 
   * @param con
   * @return
   */
  @RequestMapping(value = "/contest/update.do", method = RequestMethod.POST)
  public ModelAndView update(ContestVO contestVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // 파일 전송 관련
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/contest/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile file2MF = contestVO.getFile2MF();
    ContestVO oldVO = contestDAO.read(contestVO.getCt_no());

    size2 = file2MF.getSize();
    if (size2 > 0) { // 새로운 파일을 전송하는지 확인
      Tool.deleteFile(upDir, oldVO.getCt_file2()); // 기존 등록된 파일 삭제
      file2 = Upload.saveFileSpring(file2MF, upDir); // 새로운 파일 저장

      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) { // 이미지인지 검사
        Tool.deleteFile(upDir, oldVO.getCt_file1()); // 파일 삭제
        file1 = Tool.preview(upDir, file2, 200, 350); // thumb 이미지 생성
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
    } else {
      file1 = oldVO.getCt_file1(); // 파일 업로드를하지 않는 경우
      file2 = oldVO.getCt_file2();
      size2 = oldVO.getCt_size2();
    }
    contestVO.setCt_file1(file1);
    contestVO.setCt_file2(file2);
    contestVO.setCt_size2(size2);
    // -------------------------------------------------------------------
    System.out.println(contestDAO.update(contestVO));
    if (contestDAO.update(contestVO) == 1) {
      // 수정후 조회로 자동 이동
      System.out.println(contestDAO.update(contestVO) + "dfasdf");
      mav.setViewName("redirect:/contest/read.do?ct_no=" + contestVO.getCt_no()); // 확장자
                                                                                  // 명시
    } else {
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' oncl ick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }

  @RequestMapping(value = "/contest/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int ct_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/delete"); // /webapp/blog/delete.jsp
    mav.addObject("ct_no", ct_no);
   return mav;
  }

  /**
   * 삭제 처리
   * 
   * @param contentVO
   * @return
   */
  @RequestMapping(value = "/contest/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(ContestVO contestVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (contestDAO.delete(contestVO.getCt_no()) == 1) {
      msgs.add("글 삭제에 성공했습니다.");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
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
}
