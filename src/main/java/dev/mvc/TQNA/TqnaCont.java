package dev.mvc.TQNA;

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

import dev.mvc.TQNA.TqnaDAOInter;
import dev.mvc.TQNA.TqnaVO;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class TqnaCont {
  @Autowired
  @Qualifier("dev.mvc.TQNA.TqnaDAO")
  private TqnaDAOInter TqnaDAO;

  public TqnaCont() {
    System.out.println("--> TqnaCont created.");
  }

  @RequestMapping(value = "/tqna/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/create"); // /webapp/tqna/create.jsp
    return mav;
  }

  @RequestMapping(value = "/tqna/create.do", method = RequestMethod.POST)
  public ModelAndView create(TqnaVO tqnaVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/tqna/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (TqnaDAO.create(tqnaVO) == 1) {
      msgs.add("������(��) ��ϵǾ����ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("���� ��Ͽ� �����߽��ϴ�.");
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
  @RequestMapping(value = "/tqna/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/list"); // list.jsp

    List<TqnaVO> list = TqnaDAO.list();
    Iterator<TqnaVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      TqnaVO tqnaVO = iter.next(); // ��� ����
      tqnaVO.setQa_title(Tool.textLength(tqnaVO.getQa_title(), 10));
      tqnaVO.setQa_date(tqnaVO.getQa_date().substring(0, 10));
      tqnaVO.setQa_file1(Tool.textLength(tqnaVO.getQa_file1(), 10));
      tqnaVO.setQa_file2(Tool.textLength(tqnaVO.getQa_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * 
   * ���� ��ȸ�մϴ�
   * 
   * @param qa_no
   * @return
   */
  @RequestMapping(value = "/tqna/read.do", method = RequestMethod.GET)
  public ModelAndView read(int qa_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/read");
    TqnaVO tqnaVO = TqnaDAO.read(qa_no);
    tqnaVO.getSize2Label();
    mav.addObject("tqnaVO", tqnaVO);
    // String content = boardVO.getContent();
    // content = Tool.convertChar(content); //Ư������ó��
    // boardVO.setContent(content);
    return mav;
  }

  /**
   * ������
   * 
   * @param qa_no
   * @return
   */
  @RequestMapping(value = "/tqna/update.do", method = RequestMethod.GET)
  public ModelAndView update(int qa_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/update");
    mav.addObject("tqnaVO", TqnaDAO.read(qa_no));

    return mav;
  }

  /**
   * ���� ó��
   * 
   * @param TqnaVO
   * @return
   */
  @RequestMapping(value = "/tqna/update.do", method = RequestMethod.POST)
  public ModelAndView update(TqnaVO tqnaVO, HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    // �Խ��ǿ� ���� ���� �ľ�

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String qa_file1 = "";
    String qa_file2 = "";

    String upDir = Tool.getRealPath(request, "/tqna/storage");
    MultipartFile file2MF = tqnaVO.getFile2MF();
    TqnaVO oldVO = TqnaDAO.read(tqnaVO.getQa_no());

    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getQa_file2()); // ���� ����
      qa_file2 = Upload.saveFileSpring(file2MF, upDir);
      tqnaVO.setQa_file2(qa_file2); // ���۵� ���ϸ� ����
      tqnaVO.setQa_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(qa_file2)) {
        Tool.deleteFile(upDir, oldVO.getQa_file1()); // ���� ����
        qa_file1 = Tool.preview(upDir, qa_file2, 120, 80);
      } else {
        qa_file1 = "";
      }
      // -------------------------------------------------------------------

    } else {
      qa_file1 = oldVO.getQa_file1();
      qa_file2 = oldVO.getQa_file2();
    }
    tqnaVO.setQa_file1(qa_file1);
    tqnaVO.setQa_file2(qa_file2);
    // -------------------------------------------------------------------
    //
    // itosVO.setMe_no(1); // ȸ�� ������ ����
    // //Integer itg = (Integer)(session.getAttribute("mno"));
    // //boardVO.setMno(itg.intValue());
    //
    if (TqnaDAO.update(tqnaVO) == 1) {
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/tqna/read.do?qa_no=" + tqnaVO.getQa_no()); // Ȯ����
                                                                            // ���
    } else {
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add(
          "<button type='button' onclick=\"location.href='./list.do?qa_no=" + tqnaVO.getQa_no() + "'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }

  /**
   * ������
   * 
   * @param qa_no
   * @return
   */
  @RequestMapping(value = "/tqna/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int qa_no, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/delete"); // /webapp/tqna/delete.jsp
    mav.addObject("qa_no", qa_no);

    return mav;
  }

  /**
   * ���� ó��
   * 
   * @param TqnaVO
   * @return
   */
  @RequestMapping(value = "/tqna/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(TqnaVO tqnaVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    System.out.println(tqnaVO.getQa_no());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (TqnaDAO.delete(tqnaVO.getQa_no()) == 1) {
      mav.setViewName("redirect:/tqna/list.do?qa_no=" + tqnaVO.getQa_no());// Ȯ����
                                                                           // ���

    } else {
      msgs.add("�� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add(
          "<button type='button' onclick=\"location.href='./list.do?qa_no=" + tqnaVO.getQa_no() + "'\">���</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/tqna/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(TqnaVO tqnaVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/tqna/reply"); // /webapp/tqna/reply.jsp
    tqnaVO = TqnaDAO.read(tqnaVO.getQa_no());
    mav.addObject("tqnaVO", tqnaVO);

    return mav;
  }

  @RequestMapping(value = "/tqna/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(TqnaVO tqnaVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String qa_file1 = "";
    String qa_file2 = "";
    String upDir = Tool.getRealPath(request, "/tqna/storage");
    MultipartFile file2MF = tqnaVO.getFile2MF();

    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      qa_file2 = Upload.saveFileSpring(file2MF, upDir);
      tqnaVO.setQa_file2(qa_file2); // ���۵� ���ϸ� ����
      tqnaVO.setQa_size2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(qa_file2)) {
        qa_file1 = Tool.preview(upDir, qa_file2, 120, 80);
      } else {
        qa_file1 = "";
      }
      // -------------------------------------------------------------------
    }
    tqnaVO.setQa_file1(qa_file1);
    tqnaVO.setQa_file2(qa_file2);
    // -------------------------------------------------------------------

    // -------------------------------------------------------------------
    // tqnaVO.setMno(4); // ȸ�� ������ ����
    // -------------------------------------------------------------------

    // ---------- �亯 ���� �ڵ� ���� ----------
    TqnaVO parentVO = TqnaDAO.read(tqnaVO.getQa_no()); // �θ�� ���� ����
    tqnaVO.setQa_grpno(parentVO.getQa_grpno()); // �׷� ��ȣ
    tqnaVO.setQa_ansnum(parentVO.getQa_ansnum()); // �亯 ����

    TqnaDAO.updateAnsnum(tqnaVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.

    tqnaVO.setQa_indent(parentVO.getQa_indent() + 1); // �亯 ���� ����
    tqnaVO.setQa_ansnum(parentVO.getQa_ansnum() + 1); // �θ� �ٷ� �Ʒ� ���
    // ---------- �亯 ���� �ڵ� ���� ----------

    if (TqnaDAO.reply(tqnaVO) == 1) {
      msgs.add("���� ����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./create.do?qa_no=" + tqnaVO.getQa_no()
          + "'\">��� ���</button>");
    } else {
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    links.add(
        "<button type='button' onclick=\"location.href='./list.do?qa_no=" + tqnaVO.getQa_no() + "'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
//
//  /**
//   * blogcategoryno ���� �Խ��� ����� �˻�+����¡+�亯�� �����Ͽ� ����մϴ�.
//   * 
//   * @param blogcategoryno
//   *          ��ü ��Ͽ��� ������ �Խ��� ��ȣ
//   * @param searchDTO
//   *          �˻� ����
//   * @return ����� �Խ��� ���
//   */
//  @RequestMapping(value = "/itos/list.do", method = RequestMethod.GET)
//  public ModelAndView list1(int io_rno, SearchDTO searchDTO, HttpServletRequest request) {
//    ModelAndView mav = new ModelAndView();
//    mav.setViewName("/itos/list1");
//    int totalRecord = 0;
//
//    // HashMap hashMap = new HashMap();
//    HashMap<String, Object> hashMap = new HashMap<String, Object>();
//    hashMap.put("io_rno", io_rno);
//    hashMap.put("col", searchDTO.getCol());
//    hashMap.put("word", searchDTO.getWord());
//
//    int recordPerPage = 10; // �������� ����� ���ڵ� ����
//    // ���������� ����� ���� ���ڵ� ��ȣ ���, nowPage�� 1���� ����
//    int beginOfPage = (searchDTO.getNowPage() - 1) * 10;
//    // 1 page: 0
//    // 2 page: 10
//    // 3 page: 20
//    int startNum = beginOfPage + 1; // ���� rownum, 1
//    int endNum = beginOfPage + recordPerPage; // ���� rownum, 10
//    hashMap.put("startNum", startNum);
//    hashMap.put("endNum", endNum);
//
//    List<ItosVO> list = ItosDAO.list1(hashMap); // �˻�
//    Iterator<ItosVO> iter = list.iterator();
//    while (iter.hasNext() == true) { // ���� ��� �˻�
//      ItosVO vo = iter.next(); // ��� ����
//      vo.setIo_title(Tool.textLength(vo.getIo_title(), 10));
//      vo.setIo_date(vo.getIo_date().substring(0, 10));
//      // vo.setFile1(Tool.textLength(10, vo.getFile1()));
//      // vo.setFile2(Tool.textLength(10, vo.getFile2()));
//      vo.setSize2Label(Tool.unit(vo.getIo_size2()));
//    }
//    mav.addObject("list", list);
////
////    BlogcategoryVO blogcategoryVO = blogcategoryDAO.read(blogcategoryno);
////    mav.addObject("blogcategoryVO", blogcategoryVO);
////    mav.addObject("root", request.getContextPath());
//
//    totalRecord = ItosDAO.count(hashMap);
//    mav.addObject("totalRecord", ItosDAO.count(hashMap)); // �˻��� ���ڵ� ����
//
////    String paging = new Paging().paging5(blogcategoryno, totalRecord, searchDTO.getNowPage(), recordPerPage,
////        searchDTO.getCol(), searchDTO.getWord());
////    mav.addObject("paging", paging);
////    return mav;
//  }

}