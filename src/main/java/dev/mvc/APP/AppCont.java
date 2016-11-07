package dev.mvc.APP;

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
public class AppCont {
  @Autowired
  @Qualifier("dev.mvc.APP.AppDAO")
  private AppDAOInter AppDAO;

  public AppCont() {
    System.out.println("--> AppCont created.");
  }

  @RequestMapping(value = "/app/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/create"); // /webapp/app/create.jsp
    return mav;
  }

  @RequestMapping(value = "/app/create.do", method = RequestMethod.POST)
  public ModelAndView create(AppVO appVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/app/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (AppDAO.create(appVO) == 1) {
      msgs.add("�Խù���(��) ��ϵǾ����ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("�Խù� ��Ͽ� �����߽��ϴ�.");
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
  @RequestMapping(value = "/app/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/list"); // list.jsp

    List<AppVO> list = AppDAO.list();
    Iterator<AppVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      AppVO appVO = iter.next(); // ��� ����
      appVO.setAp_title(Tool.textLength(appVO.getAp_title(), 10));
      appVO.setAp_date(appVO.getAp_date().substring(0, 10));
      appVO.setAp_file1(Tool.textLength(appVO.getAp_file1(), 10));
      appVO.setAp_file2(Tool.textLength(appVO.getAp_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * ���� ��ȸ�մϴ�
   * 
   * @param ap_no
   * @return
   */
  @RequestMapping(value = "/app/read.do", method = RequestMethod.GET)
  public ModelAndView read(int ap_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/read");
    AppVO appVO = AppDAO.read(ap_no);
    appVO.getSize2Label();
    mav.addObject("appVO", appVO);
    // String content = boardVO.getContent();
    // content = Tool.convertChar(content); //Ư������ó��
    // boardVO.setContent(content);
    return mav;
  }
  
  /**
   * ������
   * @param ap_no
   * @return
   */
  @RequestMapping(value="/app/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int ap_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/update"); 
    mav.addObject("appVO", AppDAO.read(ap_no)); 
    
    return mav;
  }
   
  /**
   * ���� ó��
   * @param AppVO
   * @return
   */
  @RequestMapping(value="/app/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(AppVO appVO, HttpServletRequest request, 
      HttpSession session){
    ModelAndView mav = new ModelAndView();
    //�Խ��ǿ� ���� ���� �ľ�
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String ap_file1 = "";
    String ap_file2 = "";
 
    String upDir = Tool.getRealPath(request, "/app/storage");
    MultipartFile file2MF = appVO.getFile2MF();
    AppVO oldVO = AppDAO.read(appVO.getAp_no());
 
    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getAp_file2()); // ���� ����
      ap_file2 = Upload.saveFileSpring(file2MF, upDir);
      appVO.setAp_file2(ap_file2); // ���۵� ���ϸ� ����
      appVO.setAp_size2(file2MF.getSize());
 
      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(ap_file2)) {
        Tool.deleteFile(upDir, oldVO.getAp_file1()); // ���� ����
        ap_file1 = Tool.preview(upDir, ap_file2, 120, 80);
      } else {
        ap_file1 = "";
      }
      // -------------------------------------------------------------------
 
    } else {
      ap_file1 = oldVO.getAp_file1();
      ap_file2 = oldVO.getAp_file2();
    }
    appVO.setAp_file1(ap_file1);
    appVO.setAp_file2(ap_file2);
    // -------------------------------------------------------------------
//    
//    appVO.setMe_no(1); // ȸ�� ������ ����
//    //Integer itg = (Integer)(session.getAttribute("mno"));
//    //boardVO.setMno(itg.intValue());
//     
    if(AppDAO.update(appVO) == 1){
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/app/read.do?ap_no=" + appVO.getAp_no()); // Ȯ���� ���
    }else{
      msgs.add("�Խù� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?ap_no="+appVO.getAp_no()+"'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  /**
   * ������
   * @param ap_no
   * @return
   */
  @RequestMapping(value = "/app/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int ap_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/app/delete"); // /webapp/board/delete.jsp
    mav.addObject("ap_no", ap_no);
    
    return mav;
  }
  
  /**
   * ���� ó��
   * @param AppVO
   * @return
   */
  @RequestMapping(value = "/app/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(AppVO appVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    System.out.println(appVO.getAp_no());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (AppDAO.delete(appVO.getAp_no()) == 1) {
      mav.setViewName("redirect:/app/list.do?ap_no=" + appVO.getAp_no());//Ȯ���� ���
 
    } else {
      msgs.add("�Խù� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?ap_no="+appVO.getAp_no()+"'\">���</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}