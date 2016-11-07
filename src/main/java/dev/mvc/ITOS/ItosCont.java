package dev.mvc.ITOS;

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
public class ItosCont {
  @Autowired
  @Qualifier("dev.mvc.ITOS.ItosDAO")
  private ItosDAOInter ItosDAO;

  public ItosCont() {
    System.out.println("--> ItosCont created.");
  }

  @RequestMapping(value = "/itos/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/create"); // /webapp/itos/create.jsp
    return mav;
  }

  @RequestMapping(value = "/itos/create.do", method = RequestMethod.POST)
  public ModelAndView create(ItosVO itosVO, HttpServletRequest request, HttpSession session) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/itos/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String io_file1 = "";
    String io_file2 = "";
    String upDir = Tool.getRealPath(request, "/itos/storage");
    MultipartFile file2MF = itosVO.getFile2MF();

    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      io_file2 = Upload.saveFileSpring(file2MF, upDir);
      itosVO.setIo_file2(io_file2); // ���۵� ���ϸ� ����
      itosVO.setIo_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(io_file2)) {
        io_file1 = Tool.preview(upDir, io_file2, 120, 80);
      } else {
        io_file1 = "";
      }
      // -------------------------------------------------------------------
    }
    itosVO.setIo_file1(io_file1); // Thumb �̹���
    itosVO.setIo_file2(io_file2); // ���� �̹���
    // -------------------------------------------------------------------

    // itosVO.setMno(3); // ȸ�� ������ ����
    // Integer itg = (Integer)(session.getAttribute("mno"));
    // blogVO.setMno(itg.intValue());
    if (ItosDAO.create(itosVO) == 1) {
      msgs.add("�߰� ������(��) ��ϵǾ����ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("��ǰ ��Ͽ� �����߽��ϴ�.");
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
  @RequestMapping(value = "/itos/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/list"); // list.jsp

    List<ItosVO> list = ItosDAO.list();
    Iterator<ItosVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      ItosVO itosVO = iter.next(); // ��� ����
      itosVO.setIo_title(Tool.textLength(itosVO.getIo_title(), 10));
      itosVO.setIo_date(itosVO.getIo_date().substring(0, 10));
      itosVO.setIo_file1(Tool.textLength(itosVO.getIo_file1(), 10));
      itosVO.setIo_file2(Tool.textLength(itosVO.getIo_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * ���� ��ȸ�մϴ�
   * 
   * @param io_no
   * @return
   */
  @RequestMapping(value = "/itos/read.do", method = RequestMethod.GET)
  public ModelAndView read(int io_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/read");
    ItosVO itosVO = ItosDAO.read(io_no);
    itosVO.getSize2Label();
    mav.addObject("itosVO", itosVO);
    // String content = boardVO.getContent();
    // content = Tool.convertChar(content); //Ư������ó��
    // boardVO.setContent(content);
    return mav;
  }

  /**
   * ������
   * 
   * @param io_no
   * @return
   */
  @RequestMapping(value = "/itos/update.do", method = RequestMethod.GET)
  public ModelAndView update(int io_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/update");
    mav.addObject("itosVO", ItosDAO.read(io_no));

    return mav;
  }

  /**
   * ���� ó��
   * 
   * @param AppVO
   * @return
   */
  @RequestMapping(value = "/itos/update.do", method = RequestMethod.POST)
  public ModelAndView update(ItosVO itosVO, HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    // �Խ��ǿ� ���� ���� �ľ�

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String io_file1 = "";
    String io_file2 = "";

    String upDir = Tool.getRealPath(request, "/itos/storage");
    MultipartFile file2MF = itosVO.getFile2MF();
    ItosVO oldVO = ItosDAO.read(itosVO.getIo_no());

    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getIo_file2()); // ���� ����
      io_file2 = Upload.saveFileSpring(file2MF, upDir);
      itosVO.setIo_file2(io_file2); // ���۵� ���ϸ� ����
      itosVO.setIo_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(io_file2)) {
        Tool.deleteFile(upDir, oldVO.getIo_file1()); // ���� ����
        io_file1 = Tool.preview(upDir, io_file2, 120, 80);
      } else {
        io_file1 = "";
      }
      // -------------------------------------------------------------------

    } else {
      io_file1 = oldVO.getIo_file1();
      io_file2 = oldVO.getIo_file2();
    }
    itosVO.setIo_file1(io_file1);
    itosVO.setIo_file2(io_file2);
    // -------------------------------------------------------------------
    //
    // itosVO.setMe_no(1); // ȸ�� ������ ����
    // //Integer itg = (Integer)(session.getAttribute("mno"));
    // //boardVO.setMno(itg.intValue());
    //
    if (ItosDAO.update(itosVO) == 1) {
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/itos/read.do?io_no=" + itosVO.getIo_no()); // Ȯ����
                                                                            // ���
    } else {
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add(
          "<button type='button' onclick=\"location.href='./list.do?io_no=" + itosVO.getIo_no() + "'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }

  /**
   * ������
   * 
   * @param io_no
   * @return
   */
  @RequestMapping(value = "/itos/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int io_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/delete"); // /webapp/board/delete.jsp
    mav.addObject("io_no", io_no);

    return mav;
  }

  /**
   * ���� ó��
   * 
   * @param AppVO
   * @return
   */
  @RequestMapping(value = "/itos/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(ItosVO itosVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    System.out.println(itosVO.getIo_no());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (ItosDAO.delete(itosVO.getIo_no()) == 1) {
      mav.setViewName("redirect:/itos/list.do?io_no=" + itosVO.getIo_no());// Ȯ����
                                                                           // ���

    } else {
      msgs.add("�� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add(
          "<button type='button' onclick=\"location.href='./list.do?io_no=" + itosVO.getIo_no() + "'\">���</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/itos/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(ItosVO itosVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/itos/reply"); // /webapp/itos/reply.jsp
    itosVO = ItosDAO.read(itosVO.getIo_no());
    mav.addObject("itosVO", itosVO);

    return mav;
  }

  @RequestMapping(value = "/itos/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(ItosVO itosVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String io_file1 = "";
    String io_file2 = "";
    String upDir = Tool.getRealPath(request, "/itos/storage");
    MultipartFile file2MF = itosVO.getFile2MF();

    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      io_file2 = Upload.saveFileSpring(file2MF, upDir);
      itosVO.setIo_file2(io_file2); // ���۵� ���ϸ� ����
      itosVO.setIo_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(io_file2)) {
        io_file1 = Tool.preview(upDir, io_file2, 120, 80);
      } else {
        io_file1 = "";
      }
      // -------------------------------------------------------------------
    }
    itosVO.setIo_file1(io_file1);
    itosVO.setIo_file2(io_file2);
    // -------------------------------------------------------------------

    // -------------------------------------------------------------------
    // itosVO.setMno(4); // ȸ�� ������ ����
    // -------------------------------------------------------------------

    // ---------- �亯 ���� �ڵ� ���� ----------
    ItosVO parentVO = ItosDAO.read(itosVO.getIo_no()); // �θ�� ���� ����
    itosVO.setIo_grpno(parentVO.getIo_grpno()); // �׷� ��ȣ
    itosVO.setIo_ansnum(parentVO.getIo_ansnum()); // �亯 ����

    ItosDAO.updateAnsnum(itosVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.

    itosVO.setIo_indent(parentVO.getIo_indent() + 1); // �亯 ���� ����
    itosVO.setIo_ansnum(parentVO.getIo_ansnum() + 1); // �θ� �ٷ� �Ʒ� ���
    // ---------- �亯 ���� �ڵ� ���� ----------

    if (ItosDAO.reply(itosVO) == 1) {
      msgs.add("���� ����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./create.do?io_no=" + itosVO.getIo_no()
          + "'\">��� ���</button>");
    } else {
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    links
        .add("<button type='button' onclick=\"location.href='./list.do?io_no=" + itosVO.getIo_no() + "'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  //
  // /**
  // * blogcategoryno ���� �Խ��� ����� �˻�+����¡+�亯�� �����Ͽ� ����մϴ�.
  // *
  // * @param blogcategoryno
  // * ��ü ��Ͽ��� ������ �Խ��� ��ȣ
  // * @param searchDTO
  // * �˻� ����
  // * @return ����� �Խ��� ���
  // */
  // @RequestMapping(value = "/itos/list.do", method = RequestMethod.GET)
  // public ModelAndView list1(int io_rno, SearchDTO searchDTO,
  // HttpServletRequest request) {
  // ModelAndView mav = new ModelAndView();
  // mav.setViewName("/itos/list1");
  // int totalRecord = 0;
  //
  // // HashMap hashMap = new HashMap();
  // HashMap<String, Object> hashMap = new HashMap<String, Object>();
  // hashMap.put("io_rno", io_rno);
  // hashMap.put("col", searchDTO.getCol());
  // hashMap.put("word", searchDTO.getWord());
  //
  // int recordPerPage = 10; // �������� ����� ���ڵ� ����
  // // ���������� ����� ���� ���ڵ� ��ȣ ���, nowPage�� 1���� ����
  // int beginOfPage = (searchDTO.getNowPage() - 1) * 10;
  // // 1 page: 0
  // // 2 page: 10
  // // 3 page: 20
  // int startNum = beginOfPage + 1; // ���� rownum, 1
  // int endNum = beginOfPage + recordPerPage; // ���� rownum, 10
  // hashMap.put("startNum", startNum);
  // hashMap.put("endNum", endNum);
  //
  // List<ItosVO> list = ItosDAO.list1(hashMap); // �˻�
  // Iterator<ItosVO> iter = list.iterator();
  // while (iter.hasNext() == true) { // ���� ��� �˻�
  // ItosVO vo = iter.next(); // ��� ����
  // vo.setIo_title(Tool.textLength(vo.getIo_title(), 10));
  // vo.setIo_date(vo.getIo_date().substring(0, 10));
  // // vo.setFile1(Tool.textLength(10, vo.getFile1()));
  // // vo.setFile2(Tool.textLength(10, vo.getFile2()));
  // vo.setSize2Label(Tool.unit(vo.getIo_size2()));
  // }
  // mav.addObject("list", list);
  ////
  //// BlogcategoryVO blogcategoryVO = blogcategoryDAO.read(blogcategoryno);
  //// mav.addObject("blogcategoryVO", blogcategoryVO);
  //// mav.addObject("root", request.getContextPath());
  //
  // totalRecord = ItosDAO.count(hashMap);
  // mav.addObject("totalRecord", ItosDAO.count(hashMap)); // �˻��� ���ڵ� ����
  //
  //// String paging = new Paging().paging5(blogcategoryno, totalRecord,
  // searchDTO.getNowPage(), recordPerPage,
  //// searchDTO.getCol(), searchDTO.getWord());
  //// mav.addObject("paging", paging);
  //// return mav;
  // }

}