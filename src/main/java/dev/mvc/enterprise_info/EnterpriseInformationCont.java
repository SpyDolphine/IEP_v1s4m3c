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
    // ���� ����
    // -------------------------------------------------------------------
    String ei_logofile1 = "";
    String ei_logofile2 = "";
    long ei_logosize2 = 0;
    
    // MultipartFile ���� ���
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
      vo.setEi_logofile2(ei_logofile2); // ���۵� ���ϸ� ����
      vo.setEi_logosize2(ei_logosize2);
    
 
      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
       
      if (Tool.isImage(ei_logofile2)) {
        ei_logofile1 = Tool.preview(upDir, ei_logofile2, 120, 80);
      } else {
        ei_logofile1 = "";
      }
      
      // -------------------------------------------------------------------
    }
    
    vo.setEi_logofile1(ei_logofile1); // Thumb �̹���
    vo.setEi_logofile2(ei_logofile2); // ���� �̹���
    vo.setEi_logosize2(ei_logosize2);
    // -------------------------------------------------------------------
    
    if (enterpriseInformationDAO.create(vo) == 1) {
      //msgs.add("������� �׽�Ʈ ������ ó��?���ϴ�.");
      msgs.add("������� ���Կ� ó�� �Ϸ��߽��ϴ�.");
      msgs.add("�������ּż� �����մϴ�.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">�α���</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("������� �׽�Ʈ ���Կ� �����߽��ϴ�.");
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
   * ���� ����� ����մϴ�.
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
   * ���� ����� ����մϴ�.
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
    
    // �Խ��ǿ� ���� ���� �ľ�
    // BlogcategoryVO blogcategoryVO = blogcategoryDAO.read(blogVO.getBlogcategoryno());
    // mav.addObject("blogcategoryVO", blogcategoryVO);
    
    mav.addObject("searchDTO", searchDTO);
    
    return mav;
  }
  
  /**
   * ���� ������ ����մϴ�.
   * �۰� ������ ���� ó��
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
    // ���� ���� ����
    // -------------------------------------------------------------------
    String ei_logofile1 = "";
    String ei_logofile2 = "";
    long ei_logosize2 = 0;
    
    // MultipartFile ���� ���
    String upDir = Tool.getRealPath(request, "/enterprise_information/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile ei_logofile2MF = vo.getEi_logofile2MF();
    System.out.println("ei_logofile2MF : " + ei_logofile2MF);
    EnterpriseInformationVO oldVO = enterpriseInformationDAO.read(vo.getEi_no());
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    
    ei_logosize2 = ei_logofile2MF.getSize();
    
    if (ei_logosize2 > 0) { // ���ο� ������ �����ϴ��� Ȯ��
      
      Tool.deleteFile(upDir, oldVO.getEi_logofile2()); // ���� ��ϵ� ���� ����
      ei_logofile2 = Upload.saveFileSpring(ei_logofile2MF, upDir); // ���ο� ���� ����
 
      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
       
      if (Tool.isImage(ei_logofile2)) { // �̹������� �˻�
        Tool.deleteFile(upDir, oldVO.getEi_logofile1()); // ���� ����
        ei_logofile1 = Tool.preview(upDir, ei_logofile2, 120, 80); // thumb �̹��� ����
      } else {
        ei_logofile1 = "";
      }
      
      // -------------------------------------------------------------------
      
    } else {
      ei_logofile1 = oldVO.getEi_logofile1(); // ���� ���ε带���� �ʴ� ���
      ei_logofile2 = oldVO.getEi_logofile2();
      ei_logosize2 = oldVO.getEi_logosize2();
    }
    
    vo.setEi_logofile1(ei_logofile1); // Thumb �̹���
    vo.setEi_logofile2(ei_logofile2); // ���� �̹���
    vo.setEi_logosize2(ei_logosize2);
    // -------------------------------------------------------------------
    
    if (enterpriseInformationDAO.update(vo) == 1) {
      // ������ ��ȸ�� �ڵ� �̵�
      msgs.add("��������� �����Ǿ����ϴ�.");
      mav.setViewName("redirect:/enterprise_information/read.do?ei_no=" + vo.getEi_no()); // Ȯ���� ���
      links.add("<button type='button' onclick=\"location.href='./read.do?ei_no="+vo.getEi_no()+"'\">����� ������� Ȯ��</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      
    } else {
      msgs.add("������� ���濡 �����߽��ϴ�.");
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
  @RequestMapping(value = "/enterprise_information/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int ei_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/enterprise_information/delete"); // /webapp/enterprise_information/delete.jsp
    mav.addObject("ei_no", ei_no);
    
    return mav;
    
  }
  
  /**
   * ���� ó��
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
      msgs.add("��������� �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("������� ������ �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
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
 
    List<EnterpriseInformationVO> list = enterpriseInformationDAO.list4(hashMap); // �˻�
    Iterator<EnterpriseInformationVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      EnterpriseInformationVO vo = iter.next(); // ��� ����
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
    mav.addObject("totalRecord", enterpriseInformationDAO.count(hashMap)); // �˻��� ���ڵ� ����
 
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
 
    List<EnterpriseInformationVO> list = enterpriseInformationDAO.list4(hashMap); // �˻�
    Iterator<EnterpriseInformationVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      EnterpriseInformationVO vo = iter.next(); // ��� ����
      vo.setEi_date(vo.getEi_date().substring(0, 10));
      vo.setEi_logofile1(Tool.textLength(vo.getEi_logofile1(), 10));
      vo.setSize2Label(Tool.unit(vo.getEi_logosize2()));
    }
    mav.addObject("list", list);
 
    mav.addObject("root", request.getContextPath());
    
    totalRecord = enterpriseInformationDAO.count(hashMap);
    mav.addObject("totalRecord", enterpriseInformationDAO.count(hashMap)); // �˻��� ���ڵ� ����
 
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
 
    List<EnterpriseInformationVO> list = enterpriseInformationDAO.list4(hashMap); // �˻�
    Iterator<EnterpriseInformationVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      EnterpriseInformationVO vo = iter.next(); // ��� ����
      vo.setEi_date(vo.getEi_date().substring(0, 10));
      vo.setEi_logofile1(Tool.textLength(vo.getEi_logofile1(), 10));
      vo.setSize2Label(Tool.unit(vo.getEi_logosize2()));
    }
    mav.addObject("list", list);
 
    mav.addObject("root", request.getContextPath());
    
    totalRecord = enterpriseInformationDAO.count(hashMap);
    mav.addObject("totalRecord", enterpriseInformationDAO.count(hashMap)); // �˻��� ���ڵ� ����
 
    String paging = new Paging().paging5(totalRecord, 
                                        searchDTO.getNowPage(), 
                                        recordPerPage, 
                                        searchDTO.getCol(), 
                                        searchDTO.getWord());
   
    
    mav.addObject("paging", paging);
    
    return mav;
  }
  
  
  
}
