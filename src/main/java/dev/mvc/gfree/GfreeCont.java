package dev.mvc.gfree;
 
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

import web.tool.*;

@Controller
public class GfreeCont {
  @Autowired
  @Qualifier("dev.mvc.gfree.GfreeDAO")
  private GfreeInter gfreeDAO;
  
  public GfreeCont(){
    System.out.println("--> GfreeCont created.");
  }
  
  /**
   * 등록 합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/gfree/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gfree/create"); // member에 create.do가 들어올 경우 이동 -> /webapp/gfree/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/gfree/create.do", method = RequestMethod.POST)
  public ModelAndView create(GfreeVO gfreeVO,  
                                    HttpServletRequest request, 
                                    HttpSession session) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/gfree/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

 // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/gfree/storage");
    MultipartFile file2MF = gfreeVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      gfreeVO.setFile2(file2); // 전송된 파일명 저장
      gfreeVO.setSize2(size2);
 
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
    gfreeVO.setFile1(file1); // Thumb 이미지
    gfreeVO.setFile2(file2); // 원본 이미지
    gfreeVO.setSize2(size2);
    // -------------------------------------------------------------------
    
    
    if (gfreeDAO.create(gfreeVO) == 1) {
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">확인</button>");
      links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
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
  @RequestMapping(value="/gfree/update.do", 
                             method=RequestMethod.GET)
  public ModelAndView update(int cm_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gfree/update");
    GfreeVO gfreeVO = gfreeDAO.read(cm_no);
    mav.addObject("gfreeVO", gfreeVO);
    
    return mav;
 
  }
   
  /**
   * 글과 파일을 수정 처리
   * @param gfreeVO
   * @return
   */
  @RequestMapping(value = "/gfree/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(GfreeVO gfreeVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // 파일 전송 관련
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
 
    String upDir = Tool.getRealPath(request, "/gfree/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile file2MF = gfreeVO.getFile2MF();
    GfreeVO oldVO = gfreeDAO.read(gfreeVO.getCm_no());
    
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
    gfreeVO.setFile1(file1); 
    gfreeVO.setFile2(file2);
    gfreeVO.setSize2(size2);
    // -------------------------------------------------------------------
 
    if (gfreeDAO.update(gfreeVO) == 1) {
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/gfree/read.do?cm_no=" + gfreeVO.getCm_no());
    } else {
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
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
  @RequestMapping(value = "/gfree/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int cm_no) {
    ModelAndView mav = new ModelAndView();

    GfreeVO gfreeVO = gfreeDAO.read(cm_no);
    if (gfreeDAO.delete(cm_no) == 1) {
      mav.setViewName("redirect:/gfree/list.do");
    } else {
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
  @RequestMapping(value = "/gfree/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gfree/list");
 
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
    
    List<GfreeVO> list = gfreeDAO.list(hashMap); // 검색
    Iterator<GfreeVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      GfreeVO vo = iter.next(); // 요소 추출
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = gfreeDAO.count(hashMap);
    mav.addObject("totalRecord", gfreeDAO.count(hashMap)); // 검색된 레코드 갯수
 
    String paging = new Paging().paging5(  totalRecord, 
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
  @RequestMapping(value = "/gfree/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gfree/reply"); 

    GfreeVO gfreeVO = gfreeDAO.read(cm_no);
    mav.addObject("mfVO", gfreeVO);
    
    return mav;
  }
  
  /**
   * 답변 처리입니다
   * @param gfreeVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/gfree/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(GfreeVO gfreeVO, HttpServletRequest request) {
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
    String upDir = Tool.getRealPath(request, "/gfree/storage");
    MultipartFile file2MF = gfreeVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      gfreeVO.setFile2(file2); // 전송된 파일명 저장
      gfreeVO.setSize2(size2);
 
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
    gfreeVO.setFile1(file1); // Thumb 이미지
    gfreeVO.setFile2(file2); // 원본 이미지
    gfreeVO.setSize2(size2);
    // -------------------------------------------------------------------
    // ---------- 답변 관련 코드 시작 ---------- 
    
    GfreeVO parentVO = gfreeDAO.read(gfreeVO.getCm_no()); // 부모글 정보 추출
    System.out.println("parentVO.getCm_no : " + parentVO.getCm_no());
    gfreeVO.setGrpno(parentVO.getGrpno()); // 그룹 번호
    gfreeVO.setAnsnum(parentVO.getAnsnum()); // 답변 순서
    System.out.println("parentVO.getGrpno : " + parentVO.getGrpno());
    
    gfreeDAO.updateAnsnum(gfreeVO); // 현재 등록된 답변 뒤로 +1 처리함.
    
    gfreeVO.setIndent(parentVO.getIndent()+1); // 답변 차수 증가
    gfreeVO.setAnsnum(parentVO.getAnsnum()+1); //부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ---------- 
    
    if (gfreeDAO.reply(gfreeVO) == 1) {
      msgs.add("글을 등록했습니다.");
      links
          .add("<button type='button' onclick=\"location.href='./reply.do?cm_no="
              + gfreeVO.getCm_no() + "'\">계속 등록</button>");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links
          .add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
 
    links
        .add("<button type='button' onclick=\"location.href='./index.jsp'\">홈페이지</button>");
    links
        .add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  } 

  /**
   * 글을 조회합니다
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/gfree/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gfree/read");
    GfreeVO gfreeVO = gfreeDAO.read(cm_no); 
    List<GfreeVO> bonlist = gfreeDAO.bonlist();
    GfreeVO daum = new GfreeVO();
    GfreeVO ejun = new GfreeVO();
    for (int i = 0; i < bonlist.size(); i++) {
      GfreeVO vo1 = new GfreeVO();
      GfreeVO vo2 = bonlist.get(i);
      GfreeVO vo3 = new GfreeVO();
      
      int minlist = gfreeDAO.minlist();
      int maxlist = gfreeDAO.maxlist();
        
        if(cm_no == minlist){
            if(bonlist.get(i+1) != null){
              vo3 = bonlist.get(i+1);
              daum = gfreeDAO.bonread(vo3.getGrpno()); 
            }
          break;
        }
      
      if(vo2.getCm_no() == cm_no){
        if(cm_no == maxlist){
          if(bonlist.get(i-1) != null){
            vo1 = bonlist.get(i-1);
            ejun = gfreeDAO.bonread(vo1.getGrpno()); 
          }
          break;
        }
        if(bonlist.get(i-1) != null){
          vo1 = bonlist.get(i-1);
          ejun = gfreeDAO.bonread(vo1.getGrpno()); 
        }
        if(bonlist.get(i+1) != null){
          vo3 = bonlist.get(i+1);
          daum = gfreeDAO.bonread(vo3.getGrpno()); 
        }
      }
    }
    
    gfreeDAO.update_cnt(cm_no);
    List<GfreeVO> list = gfreeDAO.listmenu(gfreeVO.getGrpno());
    
    // 특수문자처리
    String cm_content = gfreeVO.getCm_content();
    cm_content = Tool.convertChar(cm_content);  
    gfreeVO.setCm_content(cm_content);
    mav.addObject("gfreeVO", gfreeVO); 
    mav.addObject("list", list); 
    mav.addObject("daum", daum); 
    mav.addObject("ejun", ejun); 
    mav.addObject("minlist", gfreeDAO.minlist()); 
    mav.addObject("maxlist", gfreeDAO.maxlist()); 
    
    return mav;
  }

}