package dev.mvc.ifree;
 
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
public class IfreeCont {
  @Autowired
  @Qualifier("dev.mvc.ifree.IfreeDAO")
  private IfreeInter ifreeDAO;
  
  public IfreeCont(){
    System.out.println("--> IfreeCont created.");
  }
  
  /**
   * 등록 합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/ifree/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ifree/create"); // member에 create.do가 들어올 경우 이동 -> /webapp/ifree/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/ifree/create.do", method = RequestMethod.POST)
  public ModelAndView create(IfreeVO ifreeVO,  
                                    HttpServletRequest request, 
                                    HttpSession session) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/ifree/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

 // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/ifree/storage");
    MultipartFile file2MF = ifreeVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      ifreeVO.setFile2(file2); // 전송된 파일명 저장
      ifreeVO.setSize2(size2);
 
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
    ifreeVO.setFile1(file1); // Thumb 이미지
    ifreeVO.setFile2(file2); // 원본 이미지
    ifreeVO.setSize2(size2);
    // -------------------------------------------------------------------
    
    
    if (ifreeDAO.create(ifreeVO) == 1) {
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
  @RequestMapping(value="/ifree/update.do", 
                             method=RequestMethod.GET)
  public ModelAndView update(int cm_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ifree/update");
    IfreeVO ifreeVO = ifreeDAO.read(cm_no);
    mav.addObject("ifreeVO", ifreeVO);
    
    return mav;
 
  }
   
  /**
   * 글과 파일을 수정 처리
   * @param ifreeVO
   * @return
   */
  @RequestMapping(value = "/ifree/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(IfreeVO ifreeVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // 파일 전송 관련
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
 
    String upDir = Tool.getRealPath(request, "/ifree/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile file2MF = ifreeVO.getFile2MF();
    IfreeVO oldVO = ifreeDAO.read(ifreeVO.getCm_no());
    
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
    ifreeVO.setFile1(file1); 
    ifreeVO.setFile2(file2);
    ifreeVO.setSize2(size2);
    // -------------------------------------------------------------------
 
    if (ifreeDAO.update(ifreeVO) == 1) {
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/ifree/read.do?cm_no=" + ifreeVO.getCm_no());
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
  @RequestMapping(value = "/ifree/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int cm_no) {
    ModelAndView mav = new ModelAndView();

    IfreeVO ifreeVO = ifreeDAO.read(cm_no);
    if (ifreeDAO.delete(cm_no) == 1) {
      mav.setViewName("redirect:/ifree/list.do");
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
  @RequestMapping(value = "/ifree/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ifree/list");
 
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
    
    List<IfreeVO> list = ifreeDAO.list(hashMap); // 검색
    Iterator<IfreeVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      IfreeVO vo = iter.next(); // 요소 추출
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = ifreeDAO.count(hashMap);
    mav.addObject("totalRecord", ifreeDAO.count(hashMap)); // 검색된 레코드 갯수
 
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
  @RequestMapping(value = "/ifree/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ifree/reply"); 

    IfreeVO ifreeVO = ifreeDAO.read(cm_no);
    mav.addObject("mfVO", ifreeVO);
    
    return mav;
  }
  
  /**
   * 답변 처리입니다
   * @param ifreeVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/ifree/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(IfreeVO ifreeVO, HttpServletRequest request) {
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
    String upDir = Tool.getRealPath(request, "/ifree/storage");
    MultipartFile file2MF = ifreeVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      ifreeVO.setFile2(file2); // 전송된 파일명 저장
      ifreeVO.setSize2(size2);
 
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
    ifreeVO.setFile1(file1); // Thumb 이미지
    ifreeVO.setFile2(file2); // 원본 이미지
    ifreeVO.setSize2(size2);
    // -------------------------------------------------------------------
    // ---------- 답변 관련 코드 시작 ---------- 
    
    IfreeVO parentVO = ifreeDAO.read(ifreeVO.getCm_no()); // 부모글 정보 추출
    System.out.println("parentVO.getCm_no : " + parentVO.getCm_no());
    ifreeVO.setGrpno(parentVO.getGrpno()); // 그룹 번호
    ifreeVO.setAnsnum(parentVO.getAnsnum()); // 답변 순서
    System.out.println("parentVO.getGrpno : " + parentVO.getGrpno());
    
    ifreeDAO.updateAnsnum(ifreeVO); // 현재 등록된 답변 뒤로 +1 처리함.
    
    ifreeVO.setIndent(parentVO.getIndent()+1); // 답변 차수 증가
    ifreeVO.setAnsnum(parentVO.getAnsnum()+1); //부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ---------- 
    
    if (ifreeDAO.reply(ifreeVO) == 1) {
      msgs.add("글을 등록했습니다.");
      links
          .add("<button type='button' onclick=\"location.href='./reply.do?cm_no="
              + ifreeVO.getCm_no() + "'\">계속 등록</button>");
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
  @RequestMapping(value = "/ifree/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ifree/read");
    IfreeVO ifreeVO = ifreeDAO.read(cm_no); 
    List<IfreeVO> bonlist = ifreeDAO.bonlist();
    IfreeVO daum = new IfreeVO();
    IfreeVO ejun = new IfreeVO();
    for (int i = 0; i < bonlist.size(); i++) {
      IfreeVO vo1 = new IfreeVO();
      IfreeVO vo2 = bonlist.get(i);
      IfreeVO vo3 = new IfreeVO();
      
      int minlist = ifreeDAO.minlist();
      int maxlist = ifreeDAO.maxlist();
      
      
      if(cm_no == maxlist){
        if(vo2.getCm_no() == cm_no){
          if(bonlist.get(i-1) != null){
            vo1 = bonlist.get(i-1);
            ejun = ifreeDAO.bonread(vo1.getGrpno()); 
          }
        }
        break;
      }
      
      if(cm_no == minlist){
        if(vo2.getCm_no() == cm_no){
          if(bonlist.get(i+1) != null){
            vo3 = bonlist.get(i+1);
            daum = ifreeDAO.bonread(vo3.getGrpno()); 
          }
        }
        break;
      }
      
      if(vo2.getCm_no() == cm_no){
        if(bonlist.get(i-1) != null){
          vo1 = bonlist.get(i-1);
          ejun = ifreeDAO.bonread(vo1.getGrpno()); 
        }
        if(bonlist.get(i+1) != null){
          vo3 = bonlist.get(i+1);
          daum = ifreeDAO.bonread(vo3.getGrpno()); 
        }
      }
    }
    
    ifreeDAO.update_cnt(cm_no);
    List<IfreeVO> list = ifreeDAO.listmenu(ifreeVO.getGrpno());
    
    // 특수문자처리
    String cm_content = ifreeVO.getCm_content();
    cm_content = Tool.convertChar(cm_content);  
    ifreeVO.setCm_content(cm_content);
    mav.addObject("ifreeVO", ifreeVO); 
    mav.addObject("list", list); 
    mav.addObject("daum", daum); 
    mav.addObject("ejun", ejun); 
    mav.addObject("minlist", ifreeDAO.minlist()); 
    mav.addObject("maxlist", ifreeDAO.maxlist()); 
    
    return mav;
  }

}