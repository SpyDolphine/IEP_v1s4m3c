package dev.mvc.mfree;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cfree.CmDAO;
import web.tool.*;

@Controller
public class MfCont {
  @Autowired
  @Qualifier("dev.mvc.mfree.MfDAO")
  private MfInter mfDAO;
  
  public MfCont(){
    System.out.println("--> MfCont created.");
  }
  
  /**
   * 등록 합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/mfree/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mfree/create"); // member에 create.do가 들어올 경우 이동 -> /webapp/mfree/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/mfree/create.do", method = RequestMethod.POST)
  public ModelAndView create(MfVO mfVO,  
                                    HttpServletRequest request, 
                                    HttpSession session) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/mfree/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

 // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/mfree/storage");
    MultipartFile file2MF = mfVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      mfVO.setFile2(file2); // 전송된 파일명 저장
      mfVO.setSize2(size2);
 
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
    mfVO.setFile1(file1); // Thumb 이미지
    mfVO.setFile2(file2); // 원본 이미지
    mfVO.setSize2(size2);
    // -------------------------------------------------------------------
    
    
    if (mfDAO.create(mfVO) == 1) {
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
  @RequestMapping(value="/mfree/update.do", 
                             method=RequestMethod.GET)
  public ModelAndView update(int cm_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mfree/update");
    MfVO mfVO = mfDAO.read(cm_no);
    mav.addObject("mfVO", mfVO);
    
    return mav;
 
  }
   
  /**
   * 글과 파일을 수정 처리
   * @param mfVO
   * @return
   */
  @RequestMapping(value = "/mfree/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(MfVO mfVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // 파일 전송 관련
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
 
    String upDir = Tool.getRealPath(request, "/mfree/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile file2MF = mfVO.getFile2MF();
    MfVO oldVO = mfDAO.read(mfVO.getCm_no());
    
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
    mfVO.setFile1(file1); 
    mfVO.setFile2(file2);
    mfVO.setSize2(size2);
    // -------------------------------------------------------------------
 
    if (mfDAO.update(mfVO) == 1) {
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/mfree/read.do?cm_no=" + mfVO.getCm_no());
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
  @RequestMapping(value = "/mfree/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(@RequestParam List<String> arr) { // 파라메터 값을 배열로 바로 받는다
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>(); // 해쉬맵으로 저장해서 보내줌
    hashMap.put("arr", arr); // 배열에 자동으로 담아서 넘겨주고
    mfDAO.delete(hashMap);  // 내가 원하는 함수에 담아서 실행하고
    mav.setViewName("redirect:/mfree/list.do"); // 실행한뒤 돌아가고싶은 주소로 GO
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
  @RequestMapping(value = "/mfree/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mfree/list");
 
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
    
    List<MfVO> list = mfDAO.list(hashMap); // 검색
    Iterator<MfVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      MfVO vo = iter.next(); // 요소 추출
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = mfDAO.count(hashMap);
    mav.addObject("totalRecord", mfDAO.count(hashMap)); // 검색된 레코드 갯수
 
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
  @RequestMapping(value = "/mfree/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mfree/reply"); 

    MfVO mfVO = mfDAO.read(cm_no);
    mav.addObject("mfVO", mfVO);
    
    return mav;
  }
  
  /**
   * 답변 처리입니다
   * @param mfVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/mfree/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(MfVO mfVO, HttpServletRequest request) {
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
    String upDir = Tool.getRealPath(request, "/mfree/storage");
    MultipartFile file2MF = mfVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      mfVO.setFile2(file2); // 전송된 파일명 저장
      mfVO.setSize2(size2);
 
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
    mfVO.setFile1(file1); // Thumb 이미지
    mfVO.setFile2(file2); // 원본 이미지
    mfVO.setSize2(size2);
    // -------------------------------------------------------------------
    // ---------- 답변 관련 코드 시작 ---------- 
    
    MfVO parentVO = mfDAO.read(mfVO.getCm_no()); // 부모글 정보 추출
    System.out.println("parentVO.getCm_no : " + parentVO.getCm_no());
    mfVO.setGrpno(parentVO.getGrpno()); // 그룹 번호
    mfVO.setAnsnum(parentVO.getAnsnum()); // 답변 순서
    System.out.println("parentVO.getGrpno : " + parentVO.getGrpno());
    
    mfDAO.updateAnsnum(mfVO); // 현재 등록된 답변 뒤로 +1 처리함.
    
    mfVO.setIndent(parentVO.getIndent()+1); // 답변 차수 증가
    mfVO.setAnsnum(parentVO.getAnsnum()+1); //부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ---------- 
    
    if (mfDAO.reply(mfVO) == 1) {
      msgs.add("글을 등록했습니다.");
      links
          .add("<button type='button' onclick=\"location.href='./reply.do?cm_no="
              + mfVO.getCm_no() + "'\">계속 등록</button>");
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
  @RequestMapping(value = "/mfree/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mfree/read");
    MfVO mfVO = mfDAO.read(cm_no); 
    List<MfVO> bonlist = mfDAO.bonlist();
    MfVO daum = new MfVO();
    MfVO ejun = new MfVO();
    for (int i = 0; i < bonlist.size(); i++) {
      MfVO vo1 = new MfVO();
      MfVO vo2 = bonlist.get(i);
      MfVO vo3 = new MfVO();
      
      int minlist = mfDAO.minlist();
      int maxlist = mfDAO.maxlist();
      
      
      if(cm_no == minlist){
        if(bonlist.get(i+1) != null){
          vo3 = bonlist.get(i+1);
          daum = mfDAO.bonread(vo3.getGrpno()); 
        }
      break;
    }
  
  if(vo2.getCm_no() == cm_no){
    if(cm_no == maxlist){
      if(bonlist.get(i-1) != null){
        vo1 = bonlist.get(i-1);
        ejun = mfDAO.bonread(vo1.getGrpno()); 
      }
      break;
    }
    if(bonlist.get(i-1) != null){
      vo1 = bonlist.get(i-1);
      ejun = mfDAO.bonread(vo1.getGrpno()); 
    }
    if(bonlist.get(i+1) != null){
      vo3 = bonlist.get(i+1);
      daum = mfDAO.bonread(vo3.getGrpno()); 
    }
  }
}
    
    mfDAO.update_cnt(cm_no);
    List<MfVO> list = mfDAO.listmenu(mfVO.getGrpno());
    
    // 특수문자처리
    String cm_content = mfVO.getCm_content();
    cm_content = Tool.convertChar(cm_content);  
    mfVO.setCm_content(cm_content);
    mav.addObject("mfVO", mfVO); 
    mav.addObject("list", list); 
    mav.addObject("daum", daum); 
    mav.addObject("ejun", ejun); 
    mav.addObject("minlist", mfDAO.minlist()); 
    mav.addObject("maxlist", mfDAO.maxlist()); 
    
    return mav;
  }
  
  
  /**
   * 좋아요 처리
   */
  @ResponseBody
  @RequestMapping(value = "/mfree/likeit.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeit(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("cm_no", mfDAO.read(cm_no));
    //mav.addObject("likedown", mfDAO.likedown(cm_no));
    
    mfDAO.likeit(cm_no); //필수템!@@!!!! 
    int cm_likeit= mfDAO.read(cm_no).getCm_likeit();
  
    JSONObject obj = new JSONObject();
    obj.put("cm_likeit", cm_likeit);
    obj.put("cm_no", cm_no);
    
/*    boolean a = true;
    if(a == true) {
                  System.out.println("a : " + a);
      obj.put("cm_likeit", cm_likeit);
      obj.put("cm_no", cm_no);
                  System.out.println("cm_likeit : " + cm_likeit);
      a = false;
                  System.out.println("a : " + a);
    } else {
      obj.put("likedown", mfDAO.likedown(cm_no));
      obj.put("cm_no", cm_no);
      System.out.println("likedown" + mfDAO.likedown(cm_no));
    }*/
    
    return obj.toJSONString();
  }
  
/* *//**
   * 좋아요 취소
   *//*
  @ResponseBody
  @RequestMapping(value = "/mfree/likedown.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likedown(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("cm_no", mfDAO.read(cm_no));
    
    mfDAO.likedown(cm_no); //필수템!@@!!!! 
  
    JSONObject obj = new JSONObject();
    obj.put("likedown", mfDAO.likedown(cm_no));
    
    return obj.toJSONString();
  }  */

}