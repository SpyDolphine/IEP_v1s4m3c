package dev.mvc.seico;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.tool.Paging;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;
 
@Controller
public class SeicoCont {
  @Autowired
  @Qualifier("dev.mvc.seico.SeicoDAO")
  private  SeicoDAOInter seicoDAO;
  
  public SeicoCont(){
    System.out.println("--> SeicoCont created.");
  }
  
  @RequestMapping(value = "/seico/createboot.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/createboot"); // member에 create.do가 들어올 경우 이동 -> /webapp/community/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/seico/createboot.do", method = RequestMethod.POST)
  public ModelAndView create(SeicoVO seicoVO,  
                             HttpServletRequest request, 
                             HttpSession session ) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/member/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
 // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/seico/storage");
    MultipartFile file2MF = seicoVO.getFile2MF();
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
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
    seicoVO.setSize2(size2);
    // -------------------------------------------------------------------
 
    if (seicoDAO.create(seicoVO) == 1) { 
      msgs.add("새글 등록이 처리 되었습니다.");
      msgs.add("감사합니다.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">로그인</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("새글 등록에 실패했습니다.");
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
   * 글을 조회합니다
   * @param sc_no
   * @return
   */
  @RequestMapping(value = "/seico/read.do", 
                            method = RequestMethod.GET)
  public ModelAndView read(int sc_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/read");
    SeicoVO seicoVO = seicoDAO.read(sc_no); 
    
    // 특수문자처리
    String sc_cont = seicoVO.getSc_cont();
    sc_cont = Tool.convertChar(sc_cont);  
    seicoVO.setSc_cont(sc_cont);
    
    mav.addObject("seicoVO", seicoVO); 
 
    return mav;
  }  
  
  /**
   * 수정폼
   * @param blogno
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
   * @param blogVO
   * @return
   */
  @RequestMapping(value="/seico/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(SeicoVO seicoVO, 
                                     HttpServletRequest request, 
                                     HttpSession session){
    ModelAndView mav = new ModelAndView();
   
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
    
    
    
    if(seicoDAO.update(seicoVO) == 1){
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/seico/read.do?sc_no=" + seicoVO.getSc_no()); // 확장자 명시
    }else{
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?sc_no="+seicoVO.getSc_no()+"'\">목록</button>");
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
  public ModelAndView delete(int sc_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/delete"); // /webapp/blog/delete.jsp
    mav.addObject("sc_no", sc_no);
    
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param seicoVO
   * @return
   */
  @RequestMapping(value = "/seico/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(SeicoVO seicoVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (seicoDAO.delete(seicoVO.getSc_no()) == 1) {
      //seicoDAO.decreaseCnt(ifVO.getsc_no());
      mav.setViewName("redirect:/seico/list.do?sc_no=" + seicoVO.getSc_no());//확장자 명시
 
    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?sc_no="+seicoVO.getSc_no()+"'\">목록</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  @RequestMapping(value = "/seico/list.do", 
      method = RequestMethod.GET)
  public ModelAndView list(
                                    SearchDTO searchDTO,
                                    HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/list");
    
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    /*hashMap.put("divisionno", divisionno);*/
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
    
    int  totalRecord = 0;
    List<SeicoVO> list = seicoDAO.list(hashMap); // 검색
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
 /*   mav.addObject("root", request.getContextPath());*/
    
    /*GurumeVO gurumeVO = gurumeDAO.read(gu_no);
    mav.addObject("gurumeVO", gurumeVO);*/
    
    totalRecord = seicoDAO.count(hashMap);
    mav.addObject("totalRecord", seicoDAO.count(hashMap)); // 검색된 레코드 갯수
    
    String paging = new Paging().paging726( 
                        totalRecord, 
                        searchDTO.getNowPage(), 
                        recordPerPage, 
                        searchDTO.getCol(), 
                        searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
    }
  /**
   * 추천 처리
   */
  @ResponseBody
  @RequestMapping(value = "/seico/likeup.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeup(int sc_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("sc_no", seicoDAO.read(sc_no));
    
    int cnt = seicoDAO.likeup(sc_no); //필수템!@@!!!! 
    int likeup = seicoDAO.read(sc_no).getSc_likeup();
  
    JSONObject obj = new JSONObject();
    obj.put("sc_likeup", likeup);
    obj.put("sc_no", sc_no);
    
    return obj.toJSONString();
  }
  
  /**
   * 비추천 처리
   */
  @ResponseBody
  @RequestMapping(value = "/seico/likedown.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likedown(int sc_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("sc_no", seicoDAO.read(sc_no));
    
    int cnt = seicoDAO.likedown(sc_no);
    int likedown = seicoDAO.read(sc_no).getSc_likedown();

    JSONObject obj = new JSONObject();
    obj.put("likedown", likedown);
    obj.put("sc_no", sc_no);
    
    return obj.toJSONString();
  }
}