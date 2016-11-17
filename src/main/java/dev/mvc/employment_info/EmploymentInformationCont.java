package dev.mvc.employment_info;

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

import dev.mvc.enterprise_info.EnterpriseInformationDAOInter;
import dev.mvc.enterprise_info.EnterpriseInformationVO;
import web.tool.Paging;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class EmploymentInformationCont {
  
  @Autowired
  @Qualifier("dev.mvc.employment_info.EmploymentInformationDAO")
  private EmploymentInformationDAOInter employmentInformationDAO;
  
  @Autowired
  @Qualifier("dev.mvc.enterprise_info.EnterpriseInformationDAO")
  private EnterpriseInformationDAOInter enterpriseInformationDAO;
  
  public EmploymentInformationCont(){
    System.out.println("--> EmploymentInformationCont created.");
  }
  
  @RequestMapping(value = "/employment_information/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/employment_information/create"); // /webapp/employment_information/create.jsp
//    mav.setViewName("/employment_information/test/create"); // /webapp/employment_information/test/create.jsp
    
    return mav;
  }
 
  @RequestMapping(value = "/employment_information/create.do", method = RequestMethod.POST)
  public ModelAndView create(EmploymentInformationVO vo,
                             HttpServletRequest request, HttpSession session) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    // mav.setViewName("/employment_information/message"); // /webapp/employment_information/message.jsp
    mav.setViewName("/message"); // /webapp/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    
    String em_supportformfile1 = "";
    long em_supportformsize1 = 0;
    
    // MultipartFile ���� ���
    String upDir = Tool.getRealPath(request, "/employment_information/storage");
    MultipartFile em_supportformfile1MF = vo.getEm_supportformfile1MF();
    System.out.println("em_supportformfile1MF : " + em_supportformfile1MF); 
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    
    em_supportformsize1 = em_supportformfile1MF.getSize();
    if (em_supportformsize1 > 0) {
      em_supportformfile1 = Upload.saveFileSpring(em_supportformfile1MF, upDir);
      System.out.println("upDir : " + upDir);
      System.out.println("em_supportformfile1 : " + em_supportformfile1);
      vo.setEm_supportformfile1(em_supportformfile1); // ���۵� ���ϸ� ����
      vo.setEm_supportformsize1(em_supportformsize1);
    }
 
     // -------------------------------------------------------------------

    // -------------------------------------------------------------------
    
    // vo.setMe_no(1); // ȸ�� ������ ����
    
    vo.setEi_no(1); // ��� ������ ����
    
    
    if (employmentInformationDAO.create(vo) == 1) {
      msgs.add("ä������ ���Կ� ó�� �Ϸ��߽��ϴ�.");
      msgs.add("�������ּż� �����մϴ�.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">�α���</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("ä������ ���Կ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  @RequestMapping(value = "/employment_information/list.do", method = RequestMethod.GET)
  public ModelAndView list4(SearchDTO searchDTO,
                            HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/employment_information/list4");
    int totalRecord = 0;
 
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
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
 
    List<EmploymentInformationVO> list = employmentInformationDAO.list4(hashMap); // �˻�
    Iterator<EmploymentInformationVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      EmploymentInformationVO vo = iter.next(); // ��� ����
      vo.setEm_title(Tool.textLength(vo.getEm_title(), 10));
      vo.setEm_date(vo.getEm_date().substring(0, 10));
      vo.setEm_supportformfile1((Tool.textLength(vo.getEm_supportformfile1(), 10)));
      vo.setSize2Label(Tool.unit(vo.getEm_supportformsize1()));
    }
    mav.addObject("list", list);
 
    // DivisionVO blogcategoryVO = divisionDAO.read(divisionno);
    // mav.addObject("blogcategoryVO", blogcategoryVO);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = employmentInformationDAO.count(hashMap);
    mav.addObject("totalRecord", employmentInformationDAO.count(hashMap)); // �˻��� ���ڵ� ����
 
    String paging = new Paging().paging5(totalRecord, 
                                        searchDTO.getNowPage(), 
                                        recordPerPage, 
                                        searchDTO.getCol(), 
                                        searchDTO.getWord());
    
    mav.addObject("paging", paging);
    
    return mav;
  }
  
  /**
   * ���� ����� ����մϴ�.
   * 
   * @return
   */
  @RequestMapping(value = "/employment_information/read.do", method = RequestMethod.GET)
  public ModelAndView read(int em_no, 
                           int ei_no,
                           SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/employment_information/read");
    
    EnterpriseInformationVO eiVO = enterpriseInformationDAO.read(ei_no);  
    mav.addObject("eiVO", eiVO); 
      
    mav.addObject("vo", employmentInformationDAO.read(em_no));
    mav.addObject("searchDTO", searchDTO);
 
    return mav;
  }
  
  /**
   * ���� ����� ����մϴ�.
   * 
   * @return
   */
  @RequestMapping(value = "/employment_information/update.do", method = RequestMethod.GET)
  public ModelAndView update(int em_no,
                             int ei_no,
                           SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/employment_information/update");
    
    mav.addObject("vo", employmentInformationDAO.read(em_no));
    mav.addObject("searchDTO", searchDTO);
 
    return mav;
  }
  
  /**
   * ���� ������ ����մϴ�.
   * �۰� ������ ���� ó��
   * param ei_no
   * @return
   */
  @RequestMapping(value = "/employment_information/update.do", 
                  method = RequestMethod.POST)
  public ModelAndView update(EmploymentInformationVO vo,
                             HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();  
    mav.setViewName("/message"); // /webapp/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    // -------------------------------------------------------------------
    // ���� ���� ����
    // -------------------------------------------------------------------
    String em_supportformfile1 = "";
    // String em_supportformfile2 = "";
    long em_supportformsize1 = 0;
    
    // MultipartFile ���� ���
    String upDir = Tool.getRealPath(request, "/employment_information/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile em_supportformfile1MF = vo.getEm_supportformfile1MF();
    System.out.println("em_supportformfile1MF : " + em_supportformfile1MF);
    EmploymentInformationVO oldVO = employmentInformationDAO.read(vo.getEm_no());
    
    em_supportformsize1 = em_supportformfile1MF.getSize();
    
    if (em_supportformsize1 > 0) { // ���ο� ������ �����ϴ��� Ȯ��
      
      Tool.deleteFile(upDir, oldVO.getEm_supportformfile1()); // ���� ��ϵ� ���� ����
      em_supportformfile1 = Upload.saveFileSpring(em_supportformfile1MF, upDir); // ���ο� ���� ����
 
      // -------------------------------------------------------------------
       
      // -------------------------------------------------------------------
      
    } else {
      // ei_logofile1 = oldVO.getEi_logofile1(); // ���� ���ε带���� �ʴ� ���
      em_supportformfile1 = oldVO.getEm_supportformfile1();
      em_supportformsize1 = oldVO.getEm_supportformsize1();
    }
    
    vo.setEm_supportformfile1(em_supportformfile1); 
    vo.setEm_supportformsize1(em_supportformsize1);
    // -------------------------------------------------------------------
    
    if (employmentInformationDAO.update(vo) == 1) {
      // ������ ��ȸ�� �ڵ� �̵�
      msgs.add("ä�� ������ �����Ǿ����ϴ�.");
      mav.setViewName("redirect:/employment_information/list.do?em_no=" + vo.getEm_no()); // Ȯ���� ���
      links.add("<button type='button' onclick=\"location.href='./read.do?em_no="+vo.getEm_no()+"'\">����� ä�� ���� Ȯ��</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      
    } else {
      msgs.add("ä�� ���� ���濡 �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
 
    }
    
    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
    
  }
  
  /**
   * �н����� ���� �� ���
   * @param ei_no ������ �� ��ȣ
   * @return
   */
  @RequestMapping(value = "/employment_information/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int em_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/employment_information/delete"); // /webapp/enterprise_information/delete.jsp
    mav.addObject("em_no", em_no);
    
    return mav;
    
  }
  
  /**
   * ���� ó��
   * @param vo
   * @return
   */
  @RequestMapping(value = "/employment_information/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(EmploymentInformationVO vo) {
    ModelAndView mav = new ModelAndView();
    // mav.setViewName("/employment_information/message");
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (employmentInformationDAO.delete(vo.getEm_no()) == 1) {
      msgs.add("ä�������� �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("ä������ ������ �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }

}
