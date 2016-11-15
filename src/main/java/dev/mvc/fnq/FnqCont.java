package dev.mvc.fnq;
 
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.tool.Paging;
import web.tool.SearchDTO;
import web.tool.Tool;

@Controller
public class FnqCont {
  @Autowired
  @Qualifier("dev.mvc.fnq.FnqDAO")
  private FnqDAOInter fnqDAO; 
 
  
  public FnqCont(){
    System.out.println("--> FnqCont created.");
  }
  
  @RequestMapping(value = "/fnq/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/fnq/create"); // /webapp/fnq/create.jsp
  return mav;
  }
  
  @RequestMapping(value = "/fnq/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(FnqVO fnqVO) {
  ModelAndView mav = new ModelAndView();
  
  if (fnqDAO.create(fnqVO) == 1) {
    if(fnqVO.getFq_CH().equals("H")){
      mav.setViewName("redirect:/fnq/listh.do");
    }
    if(fnqVO.getFq_CH().equals("C")){
      mav.setViewName("redirect:/fnq/listc.do");
    }
  } else {
    
  }
  return mav;
  }
  
  /**
   * ȸ������ ����մϴ�.
   * @return
   */
  @RequestMapping(value = "/fnq/listc.do", 
                             method = RequestMethod.GET)
  public ModelAndView listc(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/fnq/listc"); // /webapp/fnq/list.jsp
    
 // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    int recordPerPage = 10; // �������� ����� ���ڵ� ����
    // ���������� ����� ���� ���ڵ� ��ȣ ���. nowPage�� 1���� ����
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10;  
    // 1 page: 0
    // 2 page: 10
    // 3 page: 20
    int startNum = beginOfPage + 1; // 1 : ���� rownum
    int endNum = beginOfPage + recordPerPage; // 10  :  ���� rownum
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    int totalRecord = 0;
     
    List<FnqVO> list = fnqDAO.listc(hashMap); // �˻�
    Iterator<FnqVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      FnqVO vo = iter.next(); // ��� ����
      //vo.setFq_question(Tool.textLength(vo.getFq_question(), 10));
      vo.setFq_date(vo.getFq_date().substring(0, 10));
      vo.setFq_answer(web.tool.Tool.convertChar(vo.getFq_answer()));
    } 
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = fnqDAO.countC(hashMap);
    mav.addObject("totalRecord", totalRecord); // �˻��� ���ڵ� ����
 
    String paging = new PagingF().pagingC(totalRecord, 
                                                          searchDTO.getNowPage(), 
                                                          recordPerPage, 
                                                          searchDTO.getCol(), 
                                                          searchDTO.getWord());
    mav.addObject("paging", paging);
    mav.addObject("ch", "ȸ��");
    return mav;
  }
  
  /**
   * ȸ������ ����մϴ�.
   * @return
   */
  @RequestMapping(value = "/fnq/listh.do", 
      method = RequestMethod.GET)
  public ModelAndView listh(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/fnq/listh"); // /webapp/fnq/list.jsp
    
 // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    int recordPerPage = 10; // �������� ����� ���ڵ� ����
    // ���������� ����� ���� ���ڵ� ��ȣ ���. nowPage�� 1���� ����
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10;  
    // 1 page: 0
    // 2 page: 10
    // 3 page: 20
    int startNum = beginOfPage + 1; // 1 : ���� rownum
    int endNum = beginOfPage + recordPerPage; // 10  :  ���� rownum
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    int totalRecord = 0;
     
    List<FnqVO> list = fnqDAO.listh(hashMap); // �˻�
    Iterator<FnqVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      FnqVO vo = iter.next(); // ��� ����
      //vo.setFq_question(Tool.textLength(vo.getFq_question(), 10));
      vo.setFq_date(vo.getFq_date().substring(0, 10));
      vo.setFq_answer(web.tool.Tool.convertChar(vo.getFq_answer()));
    } 
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = fnqDAO.countH(hashMap);
    mav.addObject("totalRecord", totalRecord); // �˻��� ���ڵ� ����
 
    String paging = new PagingF().pagingH(totalRecord, 
                                                          searchDTO.getNowPage(), 
                                                          recordPerPage, 
                                                          searchDTO.getCol(), 
                                                          searchDTO.getWord());
    mav.addObject("paging", paging);
    mav.addObject("ch", "Ȩ������");
    return mav;
  }
  
  @RequestMapping(value = "/fnq/update.do", method = RequestMethod.GET)
  public ModelAndView update(int fq_no) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/fnq/update"); // /webapp/fnq/create.jsp
  FnqVO fnqVO = fnqDAO.read(fq_no);
  mav.addObject("fnqVO", fnqVO); 
  return mav;
  }
  
  /**
   * �����մϴ�
   * @param fnqVO
   * @return
   */
  @RequestMapping(value = "/fnq/update.do", method = RequestMethod.POST)
  public ModelAndView update(FnqVO fnqVO) {
    ModelAndView mav = new ModelAndView();
 
    if (fnqDAO.update(fnqVO) == 1) {
      if(fnqVO.getFq_CH().equals("H")){
        mav.setViewName("redirect:/fnq/listh.do");
      }
      
      if(fnqVO.getFq_CH().equals("C")){
        mav.setViewName("redirect:/fnq/listc.do");
      }
    } else {
 
    }
    
    return mav;
  }
  /**
   * ���ڵ� 1���� �����մϴ�.
   * @param fq_no
   * @return
   */ 
  @RequestMapping(value = "/fnq/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(@RequestParam List<String> arr) {
    ModelAndView mav = new ModelAndView();
    FnqVO fnqVO = fnqDAO.read(Integer.parseInt(arr.get(0)));
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    if(fnqVO.getFq_CH().equals("H")){
      hashMap.put("arr", arr);
      fnqDAO.delete(hashMap);
      mav.setViewName("redirect:/fnq/listh.do");
    }
    if(fnqVO.getFq_CH().equals("C")){
      hashMap.put("arr", arr);
      fnqDAO.delete(hashMap);
      mav.setViewName("redirect:/fnq/listc.do");
    }
    return mav;
  }
  

}