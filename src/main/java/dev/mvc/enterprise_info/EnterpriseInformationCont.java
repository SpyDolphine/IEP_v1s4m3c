package dev.mvc.enterprise_info;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import web.tool.Paging;

@Controller
public class EnterpriseInformationCont {
  
  @Autowired
  @Qualifier("dev.mvc.enterprise_info.EnterpriseInformationDAO")
  private EnterpriseInformationDAOInter enterpriseInformationDAO;
  
  public EnterpriseInformationCont(){
    System.out.println("--> EnterpriseInformationCont created.");
  }
  
  @RequestMapping(value = "/enterprise_information/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/enterprise_information/create"); // /webapp/enterprise_information/create.jsp
//    mav.setViewName("/enterprise_information/test/create"); // /webapp/enterprise_information/test/create.jsp
    
    return mav;
  }
 
  @RequestMapping(value = "/enterprise_information/create.do", method = RequestMethod.POST)
  public ModelAndView create(EnterpriseInformationVO vo,
                             HttpServletRequest request) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    // mav.setViewName("/enterprise_information/message"); // /webapp/enterprise_information/message.jsp
    mav.setViewName("/message"); // /webapp/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String ei_logofile1 = "";
    String ei_logofile2 = "";
    long ei_logosize2 = 0;
    
    // MultipartFile 적용 방식
    String upDir = Tool.getRealPath(request, "/enterprise_information/storage");
    MultipartFile ei_logofile2MF = vo.getEi_logofile2MF();
    System.out.println("ei_logofile2MF : " + ei_logofile2MF); 
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    
    ei_logosize2 = ei_logofile2MF.getSize();
    if (ei_logosize2 > 0) {
      //ei_logofile2 = Upload.saveFileSpring(ei_logofile2MF, upDir);
      ei_logofile2 = Upload.saveFileSpring(ei_logofile2MF, upDir);
      System.out.println("upDir : " + upDir);
      System.out.println("ei_logofile2 : " + ei_logofile2);
      vo.setEi_logofile2(ei_logofile2); // 전송된 파일명 저장
      vo.setEi_logosize2(ei_logosize2);
    
 
      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
       
      if (Tool.isImage(ei_logofile2)) {
        ei_logofile1 = Tool.preview(upDir, ei_logofile2, 120, 80);
      } else {
        ei_logofile1 = "";
      }
      
      // -------------------------------------------------------------------
    }
    
    vo.setEi_logofile1(ei_logofile1); // Thumb 이미지
    vo.setEi_logofile2(ei_logofile2); // 원본 이미지
    vo.setEi_logosize2(ei_logosize2);
    // -------------------------------------------------------------------
    
    if (enterpriseInformationDAO.create(vo) == 1) {
      //msgs.add("기업정보 테스트 가입이 처리?습니다.");
      msgs.add("기업정보 가입에 처리 완료했습니다.");
      msgs.add("가입해주셔서 감사합니다.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">로그인</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("기업정보 테스트 가입에 실패했습니다.");
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
   * 내용 목록을 출력합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/enterprise_information/read.do", method = RequestMethod.GET)
  public ModelAndView read(int ei_no, 
                           SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/enterprise_information/read");
    mav.addObject("vo", enterpriseInformationDAO.read(ei_no));
    mav.addObject("searchDTO", searchDTO);
 
    return mav;
  }
  
  /**
   * 수정 목록을 출력합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/enterprise_information/update.do", 
                  method = RequestMethod.GET)
  public ModelAndView updateread(int ei_no, 
                                 SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/enterprise_information/update");
    EnterpriseInformationVO vo = enterpriseInformationDAO.read(ei_no);
    // mav.addObject("vo", enterpriseInformationDAO.read(ei_no));
    mav.addObject("vo", vo);   
    
    // 게시판에 대한 정보 파악
    // BlogcategoryVO blogcategoryVO = blogcategoryDAO.read(blogVO.getBlogcategoryno());
    // mav.addObject("blogcategoryVO", blogcategoryVO);
    
    mav.addObject("searchDTO", searchDTO);
    
    return mav;
  }
  
  /**
   * 내용 수정을 출력합니다.
   * 글과 파일을 수정 처리
   * param ei_no
   * @return
   */
  @RequestMapping(value = "/enterprise_information/update.do", 
                  method = RequestMethod.POST)
  public ModelAndView update(EnterpriseInformationVO vo,
                             HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();  
    //mav.setViewName("/enterprise_information/message"); // /webapp/enterprise_information/message.jsp
    mav.setViewName("/message"); // /webapp/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    // -------------------------------------------------------------------
    // 파일 전송 관련
    // -------------------------------------------------------------------
    String ei_logofile1 = "";
    String ei_logofile2 = "";
    long ei_logosize2 = 0;
    
    // MultipartFile 적용 방식
    String upDir = Tool.getRealPath(request, "/enterprise_information/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile ei_logofile2MF = vo.getEi_logofile2MF();
    System.out.println("ei_logofile2MF : " + ei_logofile2MF);
    EnterpriseInformationVO oldVO = enterpriseInformationDAO.read(vo.getEi_no());
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    
    ei_logosize2 = ei_logofile2MF.getSize();
    
    if (ei_logosize2 > 0) { // 새로운 파일을 전송하는지 확인
      
      Tool.deleteFile(upDir, oldVO.getEi_logofile2()); // 기존 등록된 파일 삭제
      ei_logofile2 = Upload.saveFileSpring(ei_logofile2MF, upDir); // 새로운 파일 저장
 
      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
       
      if (Tool.isImage(ei_logofile2)) { // 이미지인지 검사
        Tool.deleteFile(upDir, oldVO.getEi_logofile1()); // 파일 삭제
        ei_logofile1 = Tool.preview(upDir, ei_logofile2, 120, 80); // thumb 이미지 생성
      } else {
        ei_logofile1 = "";
      }
      
      // -------------------------------------------------------------------
      
    } else {
      ei_logofile1 = oldVO.getEi_logofile1(); // 파일 업로드를하지 않는 경우
      ei_logofile2 = oldVO.getEi_logofile2();
      ei_logosize2 = oldVO.getEi_logosize2();
    }
    
    vo.setEi_logofile1(ei_logofile1); // Thumb 이미지
    vo.setEi_logofile2(ei_logofile2); // 원본 이미지
    vo.setEi_logosize2(ei_logosize2);
    // -------------------------------------------------------------------
    
    if (enterpriseInformationDAO.update(vo) == 1) {
      // 수정후 조회로 자동 이동
      msgs.add("기업정보가 수정되었습니다.");
      mav.setViewName("redirect:/enterprise_information/read.do?ei_no=" + vo.getEi_no()); // 확장자 명시
      links.add("<button type='button' onclick=\"location.href='./read.do?ei_no="+vo.getEi_no()+"'\">변경된 기업정보 확인</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      
    } else {
      msgs.add("기업정보 변경에 실패했습니다.");
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
   * 패스워드 삭제 폼 출력
   * @param ei_no 삭제할 글 번호
   * @return
   */
  @RequestMapping(value = "/enterprise_information/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int ei_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/enterprise_information/delete"); // /webapp/enterprise_information/delete.jsp
    mav.addObject("ei_no", ei_no);
    
    return mav;
    
  }
  
  /**
   * 삭제 처리
   * @param enterpriseinformationVO
   * @return
   */
  @RequestMapping(value = "/enterprise_information/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(EnterpriseInformationVO vo) {
    ModelAndView mav = new ModelAndView();
    // mav.setViewName("/enterprise_information/message");
    mav.setViewName("/message"); // /webapp/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (enterpriseInformationDAO.delete(vo.getEi_no()) == 1) {
      msgs.add("기업정보를 삭제했습니다.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("기업정보 삭제에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  @RequestMapping(value = "/enterprise_information/list.do", method = RequestMethod.GET)
  public ModelAndView list4(SearchDTO searchDTO,
                            HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/enterprise_information/list4");
    int totalRecord = 0;
 
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    // hashMap.put("blogcategoryno", blogcategoryno);
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
 
    List<EnterpriseInformationVO> list = enterpriseInformationDAO.list4(hashMap); // 검색
    Iterator<EnterpriseInformationVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      EnterpriseInformationVO vo = iter.next(); // 요소 추출
      // vo.setTitle(Tool.textLength(vo.getTitle(), 10));
      // vo.setMe_name(vo.getMe_name());
      // vo.setMe_id(vo.getMe_id());
      vo.setEi_date(vo.getEi_date().substring(0, 10));
      vo.setEi_logofile1(Tool.textLength(vo.getEi_logofile1(), 10));
      vo.setSize2Label(Tool.unit(vo.getEi_logosize2()));
    }
    mav.addObject("list", list);
 
    // DivisionVO blogcategoryVO = divisionDAO.read(divisionno);
    // mav.addObject("blogcategoryVO", blogcategoryVO);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = enterpriseInformationDAO.count(hashMap);
    mav.addObject("totalRecord", enterpriseInformationDAO.count(hashMap)); // 검색된 레코드 갯수
 
    String paging = new Paging().paging5(totalRecord, 
                                        searchDTO.getNowPage(), 
                                        recordPerPage, 
                                        searchDTO.getCol(), 
                                        searchDTO.getWord());
    
    mav.addObject("paging", paging);
    
    return mav;
  }
  
  @RequestMapping(value = "/enterprise_information/list_total.do", method = RequestMethod.GET)
  public ModelAndView list_total(SearchDTO searchDTO,
                            HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/enterprise_information/list_total");
    int totalRecord = 0;
 
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    // hashMap.put("blogcategoryno", blogcategoryno);
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
 
    List<EnterpriseInformationVO> list = enterpriseInformationDAO.list4(hashMap); // 검색
    Iterator<EnterpriseInformationVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      EnterpriseInformationVO vo = iter.next(); // 요소 추출
      vo.setEi_date(vo.getEi_date().substring(0, 10));
      vo.setEi_logofile1(Tool.textLength(vo.getEi_logofile1(), 10));
      vo.setSize2Label(Tool.unit(vo.getEi_logosize2()));
    }
    mav.addObject("list", list);
 
    mav.addObject("root", request.getContextPath());
    
    totalRecord = enterpriseInformationDAO.count(hashMap);
    mav.addObject("totalRecord", enterpriseInformationDAO.count(hashMap)); // 검색된 레코드 갯수
 
    String paging = new Paging().paging5(totalRecord, 
                                        searchDTO.getNowPage(), 
                                        recordPerPage, 
                                        searchDTO.getCol(), 
                                        searchDTO.getWord());
 
    mav.addObject("paging", paging);
    
    return mav;
  }
  
  @RequestMapping(value = "/enterprise_information/list_grid3.do", method = RequestMethod.GET)
  public ModelAndView list_grid(SearchDTO searchDTO,
                            HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/enterprise_information/list_grid3");
    int totalRecord = 0;
 
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    // hashMap.put("blogcategoryno", blogcategoryno);
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
 
    List<EnterpriseInformationVO> list = enterpriseInformationDAO.list4(hashMap); // 검색
    Iterator<EnterpriseInformationVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      EnterpriseInformationVO vo = iter.next(); // 요소 추출
      vo.setEi_date(vo.getEi_date().substring(0, 10));
      vo.setEi_logofile1(Tool.textLength(vo.getEi_logofile1(), 10));
      vo.setSize2Label(Tool.unit(vo.getEi_logosize2()));
    }
    mav.addObject("list", list);
 
    mav.addObject("root", request.getContextPath());
    
    totalRecord = enterpriseInformationDAO.count(hashMap);
    mav.addObject("totalRecord", enterpriseInformationDAO.count(hashMap)); // 검색된 레코드 갯수
 
    String paging = new Paging().paging5(totalRecord, 
                                        searchDTO.getNowPage(), 
                                        recordPerPage, 
                                        searchDTO.getCol(), 
                                        searchDTO.getWord());
   
    
    mav.addObject("paging", paging);
    
    return mav;
  }
  
  
  
}
