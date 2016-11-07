package dev.mvc.WEB;

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
public class WebCont {
  @Autowired
  @Qualifier("dev.mvc.WEB.WebDAO")
  private WebDAOInter WebDAO;

  public WebCont() {
    System.out.println("--> WebCont created.");
  }

  @RequestMapping(value = "/web/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/web/create"); // /webapp/web/create.jsp
    return mav;
  }

  @RequestMapping(value = "/web/create.do", method = RequestMethod.POST)
  public ModelAndView create(WebVO webVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/web/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (WebDAO.create(webVO) == 1) {
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
  @RequestMapping(value = "/web/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/web/list"); // list.jsp

    List<WebVO> list = WebDAO.list();
    Iterator<WebVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      WebVO webVO = iter.next(); // ��� ����
      webVO.setWb_title(Tool.textLength(webVO.getWb_title(), 10));
      webVO.setWb_date(webVO.getWb_date().substring(0, 10));
      webVO.setWb_file1(Tool.textLength(webVO.getWb_file1(), 10));
      webVO.setWb_file2(Tool.textLength(webVO.getWb_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * ���� ��ȸ�մϴ�
   * 
   * @param wb_no
   * @return
   */
  @RequestMapping(value = "/web/read.do", method = RequestMethod.GET)
  public ModelAndView read(int wb_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/web/read");
    WebVO webVO = WebDAO.read(wb_no);
    webVO.getSize2Label();
    mav.addObject("webVO", webVO);
    // String content = boardVO.getContent();
    // content = Tool.convertChar(content); //Ư������ó��
    // boardVO.setContent(content);
    return mav;
  }
  
  /**
   * ������
   * @param wb_no
   * @return
   */
  @RequestMapping(value="/web/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int wb_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/web/update"); 
    mav.addObject("webVO", WebDAO.read(wb_no)); 
    
    return mav;
  }
   
  /**
   * ���� ó��
   * @param WebVO
   * @return
   */
  @RequestMapping(value="/web/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(WebVO webVO, HttpServletRequest request, 
      HttpSession session){
    ModelAndView mav = new ModelAndView();
    //�Խ��ǿ� ���� ���� �ľ�
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String wb_file1 = "";
    String wb_file2 = "";
 
    String upDir = Tool.getRealPath(request, "/web/storage");
    MultipartFile file2MF = webVO.getFile2MF();
    WebVO oldVO = WebDAO.read(webVO.getWb_no());
 
    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getWb_file2()); // ���� ����
      wb_file2 = Upload.saveFileSpring(file2MF, upDir);
      webVO.setWb_file2(wb_file2); // ���۵� ���ϸ� ����
      webVO.setWb_size2(file2MF.getSize());
 
      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(wb_file2)) {
        Tool.deleteFile(upDir, oldVO.getWb_file1()); // ���� ����
        wb_file1 = Tool.preview(upDir, wb_file2, 120, 80);
      } else {
        wb_file1 = "";
      }
      // -------------------------------------------------------------------
 
    } else {
      wb_file1 = oldVO.getWb_file1();
      wb_file2 = oldVO.getWb_file2();
    }
    webVO.setWb_file1(wb_file1);
    webVO.setWb_file2(wb_file2);
    // -------------------------------------------------------------------
//    
//    appVO.setMe_no(1); // ȸ�� ������ ����
//    //Integer itg = (Integer)(session.getAttribute("mno"));
//    //boardVO.setMno(itg.intValue());
//     
    if(WebDAO.update(webVO) == 1){
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/web/read.do?wb_no=" + webVO.getWb_no()); // Ȯ���� ���
    }else{
      msgs.add("�Խù� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?wb_no="+webVO.getWb_no()+"'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  /**
   * ������
   * @param wb_no
   * @return
   */
  @RequestMapping(value = "/web/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int wb_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/web/delete"); // /webapp/web/delete.jsp
    mav.addObject("wb_no", wb_no);
    
    return mav;
  }
  
  /**
   * ���� ó��
   * @param WebVO
   * @return
   */
  @RequestMapping(value = "/web/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(WebVO webVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    System.out.println(webVO.getWb_no());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (WebDAO.delete(webVO.getWb_no()) == 1) {
      mav.setViewName("redirect:/web/list.do?wb_no=" + webVO.getWb_no());//Ȯ���� ���
 
    } else {
      msgs.add("�Խù� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?wb_no="+webVO.getWb_no()+"'\">���</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}