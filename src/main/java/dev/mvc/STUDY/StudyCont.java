package dev.mvc.STUDY;

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

import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

  @Controller
  public class StudyCont {
    @Autowired
    @Qualifier("dev.mvc.STUDY.StudyDAO")
    private StudyDAOInter StudyDAO;

    public StudyCont(){
      System.out.println("--> StudyCont created.");
    }
    @RequestMapping(value = "/STUDY/create.do", 
        method = RequestMethod.GET)
    public ModelAndView create(String gate) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/STUDY/create"); // /webapp/STUDY/create.jsp
    mav.addObject("gate", gate);
    return mav;
    }
    
    @RequestMapping(value = "/STUDY/create.do", 
        method = RequestMethod.POST)
    public ModelAndView create(StudyVO studyVO, HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/STUDY/message.jsp
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/STUDY/storage");
    MultipartFile file2MF = studyVO.getFile2MF();

    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      studyVO.setFile2(file2); // 전송된 파일명 저장
      studyVO.setSize2(file2MF.getSize());

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
    studyVO.setFile1(file1); // Thumb 이미지
    studyVO.setFile2(file2); // 원본 이미지
    // -------------------------------------------------------------------
    
    //APP(AC,AP,AJ),WEB(WJ,WC,WH)
    if (StudyDAO.create(studyVO) == 1) {
        mav.setViewName("redirect:/STUDY/list.do?gate="+studyVO.getGate());
    } else {
      msgs.add("게시물이(가) 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./index.jsp'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?gate="+studyVO.getGate()+">목록</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
    }
    
    /**
     * 전체 목록을 출력합니다.
     * @return
     */
    @RequestMapping(value = "/STUDY/list.do", 
                               method = RequestMethod.GET)
    public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request, String gate) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/STUDY/list1"); // /webapp/STUDY/list.jsp

   
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      
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
      hashMap.put("gate", gate);
      
      int totalRecord = 0;
       
      List<StudyVO> list = StudyDAO.list(hashMap); // 페이징을 이용한 리스트
      Iterator<StudyVO> iter = list.iterator();
      while (iter.hasNext() == true) { // 다음 요소 검사
        StudyVO vo = iter.next(); // 요소 추출
        vo.setTitle(Tool.textLength(vo.getTitle(), 25));
        vo.setSy_date(vo.getSy_date().substring(0, 10));
        vo.setFile1(Tool.textLength(vo.getFile1(), 10));
        vo.setFile2(Tool.textLength(vo.getFile2(), 10));
      }
      
      mav.addObject("list", list);
      mav.addObject("root", request.getContextPath());
      mav.addObject("gate", gate);
      totalRecord = StudyDAO.count(gate);
      mav.addObject("totalRecord",totalRecord); // 검색된 레코드 갯수
      
      if(gate.equals("AJ")){
        mav.addObject("ti", "JAVA");
      }
      if(gate.equals("AC")){
        mav.addObject("ti", "C언어");
      }
      if(gate.equals("AP")){
        mav.addObject("ti", "파이썬");
      }
      if(gate.equals("WH")){
        mav.addObject("ti", "HTML");
      }
      if(gate.equals("WC")){
        mav.addObject("ti", "CSS");
      }
      if(gate.equals("WJ")){
        mav.addObject("ti", "JSP");
      }
      String paging = new PagingStudy().paging10(totalRecord, searchDTO.getNowPage(), recordPerPage, gate);
      mav.addObject("paging", paging);
      return mav;
    }
    
    /**
     * 수정합니다
     * @param fnqVO
     * @return
     */
    @RequestMapping(value = "/STUDY/update.do", method = RequestMethod.POST)
    public ModelAndView update(StudyVO studyVO, HttpServletRequest request, HttpSession session) {
      ModelAndView mav = new ModelAndView();
   
      ArrayList<String> msgs = new ArrayList<String>();
      ArrayList<String> links = new ArrayList<String>();
      // -------------------------------------------------------------------
      // 파일 전송
      // -------------------------------------------------------------------
      String file1 = "";
      String file2 = "";

      String upDir = Tool.getRealPath(request, "/STUDY/storage");
      MultipartFile file2MF = studyVO.getFile2MF();
      StudyVO oldVO = StudyDAO.read(studyVO.getSy_no());

      if (file2MF.getSize() > 0) {
        Tool.deleteFile(upDir, oldVO.getFile2()); // 파일 삭제
        file2 = Upload.saveFileSpring(file2MF, upDir);
        studyVO.setFile2(file2); // 전송된 파일명 저장
        studyVO.setSize2(file2MF.getSize());

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
      studyVO.setFile1(file1);
      studyVO.setFile2(file2);
      // -------------------------------------------------------------------
      
      if (StudyDAO.update(studyVO) == 1) {
          mav.setViewName("redirect:/STUDY/list.do?gate="+studyVO.getGate());
      } else {  
        
      }
      return mav;
    }
    
    /**
     * 수정합니다
     * @param fnqVO
     * @return
     */
    @RequestMapping(value = "/STUDY/update.do", method = RequestMethod.GET)
    public ModelAndView update(int sy_no) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/STUDY/update");
      StudyVO studyVO = StudyDAO.read(sy_no);
      mav.addObject("studyVO", StudyDAO.read(sy_no) );
      return mav;
    }

    /**
     * 레코드 1건을 삭제합니다.
     * @param sy_no
     * @return
     */ 
    @RequestMapping(value = "/STUDY/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(int sy_no) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/STUDY/delete");
      mav.addObject("studyVO", StudyDAO.read(sy_no) );
      return mav;
    }
    
    /**
     * 레코드 1건을 삭제합니다.
     * @param sy_no
     * @return
     */ 
    @RequestMapping(value = "/STUDY/delete.do", method = RequestMethod.POST)
    public ModelAndView delete1(int sy_no) {
      ModelAndView mav = new ModelAndView();
 
      StudyVO studyVO = StudyDAO.read(sy_no);
      if(StudyDAO.delete(sy_no)==1){
        mav.setViewName("redirect:/STUDY/list.do?gate="+studyVO.getGate());
      }
      return mav;
    }
    
    /**
     * 읽어옵니다
     * @param studyVO
     * @return
     */
    @RequestMapping(value = "/STUDY/read.do", method = RequestMethod.GET)
    public ModelAndView read(int sy_no) {
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/STUDY/read");
      StudyVO studyVO = StudyDAO.read(sy_no);
      
      studyVO.setContent(web.tool.Tool.convertChar(studyVO.getContent()));
      mav.addObject("studyVO", studyVO);
      return mav;
    }
}
