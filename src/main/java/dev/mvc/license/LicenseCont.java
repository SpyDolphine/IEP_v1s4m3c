package dev.mvc.license;

import java.util.ArrayList;
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
public class LicenseCont {
  @Autowired
  @Qualifier("dev.mvc.license.LicenseDAO")
  private LicenseDAOInter LicenseDAO;

  public LicenseCont() {
    System.out.println("--> LicenseCont created.");
  }

  @RequestMapping(value = "/license/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/create"); // /webapp/license/create.jsp
    return mav;
  }

  @RequestMapping(value = "/license/create.do", method = RequestMethod.POST)
  public ModelAndView create(LicenseVO licenseVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/license/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (LicenseDAO.create(licenseVO) == 1) {
      msgs.add("�ڰ��� ������(��) ��ϵǾ����ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("�ڰ��� ������(��) ��Ͽ� �����߽��ϴ�.");
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
   * ��ü ���
   * 
   * @return
   */
  @RequestMapping(value = "/license/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/list"); // list.jsp

    List<LicenseVO> list = LicenseDAO.list();
    Iterator<LicenseVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      LicenseVO licenseVO = iter.next(); // ��� ����
      licenseVO.setLc_title(Tool.textLength(licenseVO.getLc_title(), 10));
      licenseVO.setLc_date(licenseVO.getLc_date().substring(0, 10));
      licenseVO.setLc_file1(Tool.textLength(licenseVO.getLc_file1(), 10));
      licenseVO.setLc_file2(Tool.textLength(licenseVO.getLc_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * ���� ��ȸ�մϴ�
   * 
   * @param lc_no
   * @return
   */
  @RequestMapping(value = "/license/read.do", method = RequestMethod.GET)
  public ModelAndView read(int lc_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/read");
    LicenseVO licenseVO = LicenseDAO.read(lc_no);
    licenseVO.getSize2Label();
    mav.addObject("licenseVO", licenseVO);
    // String content = licenseVO.getContent();
    // content = Tool.convertChar(content); //Ư������ó��
    // licenseVO.setContent(content);
    return mav;
  }
  
  /**
   * ������
   * @param lc_no
   * @return
   */
  @RequestMapping(value="/license/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int lc_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/update"); 
    mav.addObject("licenseVO", LicenseDAO.read(lc_no)); 
    
    return mav;
  }
   
  /**
   * ���� ó��
   * @param LicenseVO
   * @return
   */
  @RequestMapping(value="/license/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(LicenseVO licenseVO, HttpServletRequest request, 
      HttpSession session){
    ModelAndView mav = new ModelAndView();
    //�Խ��ǿ� ���� ���� �ľ�
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String lc_file1 = "";
    String lc_file2 = "";
 
    String upDir = Tool.getRealPath(request, "/license/storage");
    MultipartFile file2MF = licenseVO.getFile2MF();
    LicenseVO oldVO = LicenseDAO.read(licenseVO.getLc_no());
 
    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getLc_file2()); // ���� ����
      lc_file2 = Upload.saveFileSpring(file2MF, upDir);
      licenseVO.setLc_file2(lc_file2); // ���۵� ���ϸ� ����
      licenseVO.setLc_size2(file2MF.getSize());
 
      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(lc_file2)) {
        Tool.deleteFile(upDir, oldVO.getLc_file1()); // ���� ����
        lc_file1 = Tool.preview(upDir, lc_file2, 120, 80);
      } else {
        lc_file1 = "";
      }
      // -------------------------------------------------------------------
 
    } else {
      lc_file1 = oldVO.getLc_file1();
      lc_file2 = oldVO.getLc_file2();
    }
    licenseVO.setLc_file1(lc_file1);
    licenseVO.setLc_file2(lc_file2);
    // -------------------------------------------------------------------
//    
//    licenseVO.setMe_no(1); // ȸ�� ������ ����
//    //Integer itg = (Integer)(session.getAttribute("mno"));
//    //boardVO.setMno(itg.intValue());
//     
    if(LicenseDAO.update(licenseVO) == 1){
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/license/read.do?lc_no=" + licenseVO.getLc_no()); // Ȯ���� ���
    }else{
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?lc_no="+licenseVO.getLc_no()+"'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  /**
   * ������
   * @param lc_no
   * @return
   */
  @RequestMapping(value = "/license/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int lc_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/license/delete"); // /webapp/license/delete.jsp
    mav.addObject("lc_no", lc_no);
    
    return mav;
  }
  
  /**
   * ���� ó��
   * @param LicenseVO
   * @return
   */
  @RequestMapping(value = "/license/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(LicenseVO licenseVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    System.out.println(licenseVO.getLc_no());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (LicenseDAO.delete(licenseVO.getLc_no()) == 1) {
      mav.setViewName("redirect:/license/list.do?lc_no=" + licenseVO.getLc_no());//Ȯ���� ���
 
    } else {
      msgs.add("�� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?lc_no="+licenseVO.getLc_no()+"'\">���</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}