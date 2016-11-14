package dev.mvc.STUDY;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.tool.SearchDTO;
import web.tool.Tool;

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
    public ModelAndView create(StudyVO studyVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/STUDY/message.jsp
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

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
    public ModelAndView list(SearchDTO searchDTO,String gate) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/STUDY/list1"); // /webapp/STUDY/list.jsp
      int totalRecord = 0;
   
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
       
      List<StudyVO> list = StudyDAO.list(hashMap); // ����¡�� �̿��� ����Ʈ
      Iterator<StudyVO> iter = list.iterator();
      while (iter.hasNext() == true) { // ���� ��� �˻�
        StudyVO vo = iter.next(); // ��� ����
        vo.setTitle(Tool.textLength(vo.getTitle(), 10));
        vo.setSy_date(vo.getSy_date().substring(0, 10));
        // vo.setFile1(Tool.textLength(10, vo.getFile1()));
        // vo.setFile2(Tool.textLength(10, vo.getFile2()));
        vo.setSize2Label(Tool.unit(vo.getSize2()));
      }
      mav.addObject("list", list);
      mav.addObject("gate", gate);
      
      totalRecord = StudyDAO.count(gate);
      mav.addObject("totalRecord",totalRecord); // �˻��� ���ڵ� ����
      
      String paging = new Paging().paging5(totalRecord, searchDTO.getNowPage(), recordPerPage,gate);
      mav.addObject("paging", paging);
      return mav;
    }
    
    /**
     * �����մϴ�
     * @param fnqVO
     * @return
     */
    @RequestMapping(value = "/STUDY/update.do", method = RequestMethod.POST)
    public ModelAndView update(StudyVO studyVO) {
      ModelAndView mav = new ModelAndView();
   
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
      mav.addObject("studyVO", StudyDAO.read(sy_no) );
      return mav;
    }
}
