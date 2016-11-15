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
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/STUDY/storage");
    MultipartFile file2MF = studyVO.getFile2MF();

    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      studyVO.setFile2(file2); // ���۵� ���ϸ� ����
      studyVO.setSize2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) {
        file1 = Tool.preview(upDir, file2, 120, 80);
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
    }
    studyVO.setFile1(file1); // Thumb �̹���
    studyVO.setFile2(file2); // ���� �̹���
    // -------------------------------------------------------------------
    
    //APP(AC,AP,AJ),WEB(WJ,WC,WH)
    if (StudyDAO.create(studyVO) == 1) {
        mav.setViewName("redirect:/STUDY/list.do?gate="+studyVO.getGate());
    } else {
      msgs.add("�Խù���(��) ��Ͽ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./index.jsp'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?gate="+studyVO.getGate()+">���</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
    }
    
    /**
     * ��ü ����� ����մϴ�.
     * @return
     */
    @RequestMapping(value = "/STUDY/list.do", 
                               method = RequestMethod.GET)
    public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request, String gate) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/STUDY/list1"); // /webapp/STUDY/list.jsp

   
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      
      int recordPerPage = 10; // �������� ����� ���ڵ� ����
      // ���������� ����� ���� ���ڵ� ��ȣ ���, nowPage�� 1���� ����
      int beginOfPage = (searchDTO.getNowPage() - 1) * 10;
      // 1 page: 0
      // 2 page: 10
      // 3 page: 20
      int startNum = beginOfPage + 1; // ���� rownum, 1
      int endNum = beginOfPage + recordPerPage; // ���� rownum, 10
      hashMap.put("startNum", startNum);
      hashMap.put("endNum", endNum);
      hashMap.put("gate", gate);
      
      int totalRecord = 0;
       
      List<StudyVO> list = StudyDAO.list(hashMap); // ����¡�� �̿��� ����Ʈ
      Iterator<StudyVO> iter = list.iterator();
      while (iter.hasNext() == true) { // ���� ��� �˻�
        StudyVO vo = iter.next(); // ��� ����
        vo.setTitle(Tool.textLength(vo.getTitle(), 25));
        vo.setSy_date(vo.getSy_date().substring(0, 10));
        vo.setFile1(Tool.textLength(vo.getFile1(), 10));
        vo.setFile2(Tool.textLength(vo.getFile2(), 10));
      }
      
      mav.addObject("list", list);
      mav.addObject("root", request.getContextPath());
      mav.addObject("gate", gate);
      totalRecord = StudyDAO.count(gate);
      mav.addObject("totalRecord",totalRecord); // �˻��� ���ڵ� ����
      
      if(gate.equals("AJ")){
        mav.addObject("ti", "JAVA");
      }
      if(gate.equals("AC")){
        mav.addObject("ti", "C���");
      }
      if(gate.equals("AP")){
        mav.addObject("ti", "���̽�");
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
     * �����մϴ�
     * @param fnqVO
     * @return
     */
    @RequestMapping(value = "/STUDY/update.do", method = RequestMethod.POST)
    public ModelAndView update(StudyVO studyVO, HttpServletRequest request, HttpSession session) {
      ModelAndView mav = new ModelAndView();
   
      ArrayList<String> msgs = new ArrayList<String>();
      ArrayList<String> links = new ArrayList<String>();
      // -------------------------------------------------------------------
      // ���� ����
      // -------------------------------------------------------------------
      String file1 = "";
      String file2 = "";

      String upDir = Tool.getRealPath(request, "/STUDY/storage");
      MultipartFile file2MF = studyVO.getFile2MF();
      StudyVO oldVO = StudyDAO.read(studyVO.getSy_no());

      if (file2MF.getSize() > 0) {
        Tool.deleteFile(upDir, oldVO.getFile2()); // ���� ����
        file2 = Upload.saveFileSpring(file2MF, upDir);
        studyVO.setFile2(file2); // ���۵� ���ϸ� ����
        studyVO.setSize2(file2MF.getSize());

        // -------------------------------------------------------------------
        // Thumb ���� ����
        // -------------------------------------------------------------------
        if (Tool.isImage(file2)) {
          Tool.deleteFile(upDir, oldVO.getFile1()); // ���� ����
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
     * �����մϴ�
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
     * ���ڵ� 1���� �����մϴ�.
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
     * ���ڵ� 1���� �����մϴ�.
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
     * �о�ɴϴ�
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
