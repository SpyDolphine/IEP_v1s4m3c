package dev.mvc.gurume;
 
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
public class GurumeCont {
  @Autowired
  @Qualifier("dev.mvc.gurume.GurumeDAO")
  private GurumeDAOInter gurumeDAO;
  
  public GurumeCont(){
    System.out.println("--> GurumeCont created.");
  }
  @RequestMapping(value = "/gurume/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gurume/create"); // 
 
    return mav;
  }
 
  @RequestMapping(value = "/gurume/create.do", method = RequestMethod.POST)
  public ModelAndView create(GurumeVO gurumeVO, 
                                               HttpServletRequest request, 
                                               HttpSession session) {
    // System.out.println("--> crte() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); //상으니 메시지 사용시 기존 메시지파일 삭제하고 콘트 /gurume 부분 삭제 후 /message 파일사용
    System.out.println("created");
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/gurume/storage");
    MultipartFile file2MF = gurumeVO.getFile2MF();
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      gurumeVO.setFile2(file2); // 전송된 파일명 저장
      gurumeVO.setSize2(file2MF.getSize());
      gurumeVO.setSize2Label(file2);
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
    gurumeVO.setFile1(file1);
    gurumeVO.setFile2(file2);
    // -------------------------------------------------------------------
    
    //gurumeVO.setGu_no(1); // 회원 연동시 변경
    //Integer itg = (Integer)(session.getAttribute("mno"));
    //boardVO.setMno(itg.intValue());
     
    if (gurumeDAO.create(gurumeVO) == 1) {
      /*divisionDAO.increaseCnt(gurumeVO.getDivisionno());*/
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do?divisionno="
              + /*gurumeVO.getDivisionno() +*/ "'\">계속 등록</button>");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    links.add("<button type='button' onclick=\"location.href='./list4.do"
            + /*gurumeVO.getDivisionno() +*/ "'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  /**
   * 전체 목록을 출력합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/gurume/list.do", method = RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gurume/list4"); // list_total.jsp
    
    List<GurumeVO> list = gurumeDAO.list();
    Iterator<GurumeVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      GurumeVO gurumeVO = iter.next();  // 요소 추출
      /*gurumeVO.setGu_no(gurumeVO.getGu_no());*/
      gurumeVO.setGu_title(Tool.textLength(gurumeVO.getGu_title(),10));
      gurumeVO.setGu_date(gurumeVO.getGu_date().substring(0, 10)); 
     /* gurumeVO.setFile1(Tool.textLength(gurumeVO.getFile1(),10));
      gurumeVO.setFile2(Tool.textLength(gurumeVO.getFile2(),10));
    */
    }
    mav.addObject("list", list);
    
    return mav;
  }
  
  /**
   * 글을 조회합니다
   * @param gu_no
   * @return
   */
  @RequestMapping(value = "/gurume/read.do", 
                             method = RequestMethod.GET)
  public ModelAndView read(int gu_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gurume/read");
    GurumeVO gurumeVO = gurumeDAO.read(gu_no);
    /*mav.addObject("gurumeVO", gurumeVO); */
    gurumeDAO.cntup(gu_no);
    
    mav.addObject("gurumeVO", gurumeVO); 
    gurumeVO.getSize2Label();
    
    return mav;
  }
  
  /**
   * 수정폼
   * @param gu_no
   * @return
   */
  @RequestMapping(value="/gurume/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int gu_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gurume/update"); 
    mav.addObject("gurumeVO", gurumeDAO.read(gu_no)); 
    
    return mav;
  }
   
  /**
   * 수정 처리
   * @param gurumeVO
   * @return
   */
  @RequestMapping(value="/gurume/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(GurumeVO gurumeVO, HttpServletRequest request, 
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
    long size2=0;
    
    String upDir = Tool.getRealPath(request, "/gurume/storage");
    MultipartFile file2MF = gurumeVO.getFile2MF();
    GurumeVO oldVO = gurumeDAO.read(gurumeVO.getGu_no());
    size2=file2MF.getSize();
    if (size2 > 0) {
      Tool.deleteFile(upDir, oldVO.getFile2()); // 파일 삭제
      file2 = Upload.saveFileSpring(file2MF, upDir);
      gurumeVO.setFile2(file2); // 전송된 파일명 저장
      gurumeVO.setSize2(file2MF.getSize());
 
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
      size2 = oldVO.getSize2();
    }
    gurumeVO.setFile1(file1);
    gurumeVO.setFile2(file2);
    gurumeVO.setSize2(size2);
    // -------------------------------------------------------------------
    
    //boardVO.setMe_no(1); // 회원 연동시 변경
    //Integer itg = (Integer)(session.getAttribute("mno"));
    //boardVO.setMno(itg.intValue());
     
    if(gurumeDAO.update(gurumeVO) == 1){
       // mav.setViewName("redirect:/gurume/list.do");
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/gurume/read.do?gu_no=" + gurumeVO.getGu_no()/* + "&divisionno=" + gurumeVO.getDivisionno()*/); // 확장자 명시
    }else{
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?divisionno="+/*gurumeVO.getDivisionno()+*/"'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  /**
   * 삭제폼
   * @param gu_no
   * @return
   */
  @RequestMapping(value = "/gurume/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int gu_no/*, int divisionno,SearchDTO searchDTO*/) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gurume/delete"); // /webapp/board/delete.jsp
    System.out.println(gu_no);
    mav.addObject("gu_no", gu_no);
    /*mav.addObject("divisionno", divisionno);*/
    
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param gurumeVO
   * @return
   */
  @RequestMapping(value = "/gurume/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete2(int gu_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    /*System.out.println(gurumeVO.getDivisionno());*/
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (gurumeDAO.delete(gu_no) == 1) {
      /*divisionDAO.decreaseCnt(boardVO.getDivisionno());*/
      mav.setViewName("redirect:/gurume/list4.do" /*+ gurumeVO.getDivisionno()*/);//확장자 명시
 
    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do"/*+boardVO.getDivisionno()*/+"'\">목록</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  
  
  @RequestMapping(value = "/gurume/list4.do", 
      method = RequestMethod.GET)
  public ModelAndView list4(
                                    SearchDTO searchDTO,
                                    HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gurume/list4");
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
    List<GurumeVO> list = gurumeDAO.list4(hashMap); // 검색
    Iterator<GurumeVO> iter = list.iterator();
    
    while (iter.hasNext() == true) { // 다음 요소 검사
      GurumeVO vo = iter.next(); // 요소 추출
    vo.setGu_title(Tool.textLength(vo.getGu_title(), 10));
    vo.setGu_date(vo.getGu_date().substring(0, 10));
    // vo.setFile1(Tool.textLength(10, vo.getFile1()));
    // vo.setFile2(Tool.textLength(10, vo.getFile2()));
    vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    /*GurumeVO gurumeVO = gurumeDAO.read(gu_no);
    mav.addObject("gurumeVO", gurumeVO);*/
    
    totalRecord = gurumeDAO.count(hashMap);
    mav.addObject("totalRecord", gurumeDAO.count(hashMap)); // 검색된 레코드 갯수
    
    String paging = new Paging5().paging5(
                        totalRecord, 
                        searchDTO.getNowPage(), 
                        recordPerPage, 
                        searchDTO.getCol(), 
                        searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
    }
  
}
