package dev.mvc.contest;

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

import dev.mvc.memberEx.MemberExDAOInter;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class ContestCont {

  @Autowired
  @Qualifier("dev.mvc.memberEx.MemberExDAO")
  private MemberExDAOInter memberExDAO;

  @Autowired
  @Qualifier("dev.mvc.contest.ContestDAO")
  private ContestDAOInter contestDAO;

  @RequestMapping(value = "/contest/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/create"); // /webapp/blog/create.jsp
    return mav;
  }

  @RequestMapping(value = "/contest/create.do", method = RequestMethod.POST)
  public ModelAndView create(ContestVO contestVO, HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/contest/storage");
    MultipartFile file2MF = contestVO.getFile2MF();
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);

      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) {
        file1 = Tool.preview(upDir, file2, 200, 350); // thumb �̹��� ����
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
    }
    contestVO.setCt_file1(file1); // Thumb �̹���
    contestVO.setCt_file2(file2); // ���� �̹���
    contestVO.setCt_size2(size2); // ���� �̹���
    // -------------------------------------------------------------------

    Integer itg = (Integer) (session.getAttribute("me_no"));
    contestVO.setMe_no(itg.intValue());

    if (contestDAO.create(contestVO) == 1) {
      // blogcategoryDAO.increaseCnt(blogVO.getBlogcategoryno());
      msgs.add("���� ����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./create.do>��� ���</button>");
    } else {
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./index.do'\">Ȩ������</button>");
    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/contest/list.do", method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/list");

    int totalRecord = 0;
    // HashMap hashMap = new HashMap();
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

    List<ContestVO> list = contestDAO.list();
    Iterator<ContestVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      ContestVO vo = iter.next(); // ��� ����
      vo.setCt_title(Tool.textLength(vo.getCt_title(), 10)); // ���ڿ� 10�� �и�
      // vo.setCt_rdate(vo.getCt_rdate().substring(0, 10)); // �����
      // vo.setFile1(Tool.textLength(vo.getFile1(), 10));
      vo.setCt_file2(Tool.textLength(vo.getCt_file2(), 10));
    }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * ���� ��ȸ�մϴ�
   * 
   * @param blogno
   * @return
   */
  @RequestMapping(value = "/contest/read.do", method = RequestMethod.GET)
  public ModelAndView read(int ct_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/read");
    ContestVO contestVO = contestDAO.read(ct_no);
    mav.addObject("contestVO", contestVO);

    return mav;
  }

  /**
   * �׸��� �����մϴ�. /** ������
   * 
   * @param blogno
   * @return
   */
  @RequestMapping(value = "/contest/update.do", method = RequestMethod.GET)
  public ModelAndView update(int ct_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/update");

    ContestVO contestVO = contestDAO.read(ct_no);
    mav.addObject("contestVO", contestVO);
    return mav;

  }

  /**
   * �۰� ������ ���� ó��
   * 
   * @param con
   * @return
   */
  @RequestMapping(value = "/contest/update.do", method = RequestMethod.POST)
  public ModelAndView update(ContestVO contestVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // ���� ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/contest/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile file2MF = contestVO.getFile2MF();
    ContestVO oldVO = contestDAO.read(contestVO.getCt_no());

    size2 = file2MF.getSize();
    if (size2 > 0) { // ���ο� ������ �����ϴ��� Ȯ��
      Tool.deleteFile(upDir, oldVO.getCt_file2()); // ���� ��ϵ� ���� ����
      file2 = Upload.saveFileSpring(file2MF, upDir); // ���ο� ���� ����

      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) { // �̹������� �˻�
        Tool.deleteFile(upDir, oldVO.getCt_file1()); // ���� ����
        file1 = Tool.preview(upDir, file2, 200, 350); // thumb �̹��� ����
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
    } else {
      file1 = oldVO.getCt_file1(); // ���� ���ε带���� �ʴ� ���
      file2 = oldVO.getCt_file2();
      size2 = oldVO.getCt_size2();
    }
    contestVO.setCt_file1(file1);
    contestVO.setCt_file2(file2);
    contestVO.setCt_size2(size2);
    // -------------------------------------------------------------------
    System.out.println(contestDAO.update(contestVO));
    if (contestDAO.update(contestVO) == 1) {
      // ������ ��ȸ�� �ڵ� �̵�
      System.out.println(contestDAO.update(contestVO) + "dfasdf");
      mav.setViewName("redirect:/contest/read.do?ct_no=" + contestVO.getCt_no()); // Ȯ����
                                                                                  // ���
    } else {
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' oncl ick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }

  @RequestMapping(value = "/contest/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int ct_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/delete"); // /webapp/blog/delete.jsp
    mav.addObject("ct_no", ct_no);
   return mav;
  }

  /**
   * ���� ó��
   * 
   * @param contentVO
   * @return
   */
  @RequestMapping(value = "/contest/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(ContestVO contestVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/contest/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (contestDAO.delete(contestVO.getCt_no()) == 1) {
      msgs.add("�� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
    } else {
      msgs.add("�� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
}
