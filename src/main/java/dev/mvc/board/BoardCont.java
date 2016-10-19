package dev.mvc.board;
 
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.division.DivisionDAO;
import dev.mvc.division.DivisionVO;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class BoardCont {
  @Autowired
  @Qualifier("dev.mvc.board.BoardDAO")
  private BoardDAOInter boardDAO;
  @Autowired
  @Qualifier("dev.mvc.division.DivisionDAO")
  private DivisionDAO divisionDAO;
  
  public BoardCont(){
    System.out.println("--> BoardCont created.");
  }

  @RequestMapping(value = "/board/create.do", method = RequestMethod.GET)
  public ModelAndView create(int divisionno) {
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/create"); // /webapp/board/create.jsp
 
    DivisionVO divisionVO = divisionDAO.read(divisionno);
    mav.addObject("divisionVO", divisionVO);
    
    return mav;
  } 

 
  @RequestMapping(value = "/board/create.do", method = RequestMethod.POST)
  public ModelAndView create(BoardVO boardVO, 
                                                    HttpServletRequest request, 
                                                    HttpSession session) {
    // System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/board/storage");
    MultipartFile file2MF = boardVO.getFile2MF();
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      boardVO.setFile2(file2); // ���۵� ���ϸ� ����
      boardVO.setSize2(file2MF.getSize());
      boardVO.setSize2Label(file2);
      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) {
        file1 = Tool.preview(upDir, file2, 120, 80);
      } else { 
        file1 = "";
      }
      // -------------------------------------------------------------------
    }
    boardVO.setFile1(file1);
    boardVO.setFile2(file2);
    // -------------------------------------------------------------------
    
    boardVO.setMe_no(1); // ȸ�� ������ ����
    //Integer itg = (Integer)(session.getAttribute("mno"));
    //boardVO.setMno(itg.intValue());
     
    if (boardDAO.create(boardVO) == 1) {
      divisionDAO.increaseCnt(boardVO.getDivisionno());
      msgs.add("���� ����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./create.do?divisionno="
              + boardVO.getDivisionno() + "'\">��� ���</button>");
    } else {
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    links.add("<button type='button' onclick=\"location.href='./list.do?divisionno="
            + boardVO.getDivisionno() + "'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  /**
   * ��ü ���
   * @return
   */
  @RequestMapping(value = "/board/list_total.do", method = RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/list_total"); // list_total.jsp
    
    List<BoardVO> list = boardDAO.list();
    Iterator<BoardVO> iter = list.iterator();
    while(iter.hasNext() == true){  // ���� ��� �˻�
      BoardVO boardVO = iter.next();  // ��� ����
      boardVO.setTitle(Tool.textLength(boardVO.getTitle(),10));
      boardVO.setRdate(boardVO.getRdate().substring(0, 10)); 
      boardVO.setFile1(Tool.textLength(boardVO.getFile1(),10));
      boardVO.setFile2(Tool.textLength(boardVO.getFile2(),10));
    }
    mav.addObject("list", list);
    
    return mav;
  }
  
  /**
   * ���� ��ȸ�մϴ�
   * @param boardno
   * @return
   */
  @RequestMapping(value = "/board/read.do", method = RequestMethod.GET)
  public ModelAndView read(int boardno, SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/read");
    BoardVO boardVO = boardDAO.read(boardno);
    
    //String content = boardVO.getContent();
    //content = Tool.convertChar(content); //Ư������ó��
    //boardVO.setContent(content);    
    mav.addObject("boardVO", boardVO); 
    boardVO.getSize2Label();
    //�Խ��ǿ� ���� ���� �ľ�
    DivisionVO divisionVO = divisionDAO.read(boardVO.getDivisionno());
    mav.addObject("divisionVO", divisionVO);
    
    return mav;
  }
  
  /**
   * ������
   * @param blogno
   * @return
   */
  @RequestMapping(value="/board/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int boardno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/update"); 
    mav.addObject("boardVO", boardDAO.read(boardno)); 
    
    return mav;
  }
   
  /**
   * ���� ó��
   * @param boardVO
   * @return
   */
  @RequestMapping(value="/board/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(BoardVO boardVO, HttpServletRequest request, 
      HttpSession session){
    ModelAndView mav = new ModelAndView();
    //�Խ��ǿ� ���� ���� �ľ�
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
 
    String upDir = Tool.getRealPath(request, "/board/storage");
    MultipartFile file2MF = boardVO.getFile2MF();
    BoardVO oldVO = boardDAO.read(boardVO.getBoardno());
 
    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getFile2()); // ���� ����
      file2 = Upload.saveFileSpring(file2MF, upDir);
      boardVO.setFile2(file2); // ���۵� ���ϸ� ����
      boardVO.setSize2(file2MF.getSize());
 
      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) {
        Tool.deleteFile(upDir, oldVO.getFile1()); // ���� ����
        file1 = Tool.preview(upDir, file2, 120, 80);
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
 
    } else {
      file1 = oldVO.getFile1();
      file2 = oldVO.getFile2();
    }
    boardVO.setFile1(file1);
    boardVO.setFile2(file2);
    // -------------------------------------------------------------------
    
    boardVO.setMe_no(1); // ȸ�� ������ ����
    //Integer itg = (Integer)(session.getAttribute("mno"));
    //boardVO.setMno(itg.intValue());
     
    if(boardDAO.update(boardVO) == 1){
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/board/read.do?boardno=" + boardVO.getBoardno() + "&divisionno=" + boardVO.getDivisionno()); // Ȯ���� ���
    }else{
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?divisionno="+boardVO.getDivisionno()+"'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  /**
   * ������
   * @param boardno
   * @return
   */
  @RequestMapping(value = "/board/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int boardno, int divisionno,SearchDTO searchDTO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/delete"); // /webapp/board/delete.jsp
    mav.addObject("boardno", boardno);
    mav.addObject("divisionno", divisionno);
    
    return mav;
  }
  
  /**
   * ���� ó��
   * @param boardVO
   * @return
   */
  @RequestMapping(value = "/board/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(BoardVO boardVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/message");
    System.out.println(boardVO.getDivisionno());
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (boardDAO.delete(boardVO.getBoardno()) == 1) {
      divisionDAO.decreaseCnt(boardVO.getDivisionno());
      mav.setViewName("redirect:/board/list.do?divisionno=" + boardVO.getDivisionno());//Ȯ���� ���
 
    } else {
      msgs.add("�� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?divisionno="+boardVO.getDivisionno()+"'\">���</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  /**
   * divisionno ���� �Խ��� ����� �˻�+����¡+�亯��
   * �����Ͽ� ����մϴ�.
   * 
   * @param divisionno
   *          ��ü ��Ͽ��� ������ �Խ��� ��ȣ
   * @param searchDTO �˻� ����         
   * @return ����� �Խ��� ���
   */
  @RequestMapping(value = "/board/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list4(int divisionno, 
                                        SearchDTO searchDTO,
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/list4");
    int totalRecord = 0;
 
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("divisionno", divisionno);
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
 
    List<BoardVO> list = boardDAO.list4(hashMap); // �˻�
    Iterator<BoardVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      BoardVO vo = iter.next(); // ��� ����
      vo.setTitle(Tool.textLength(vo.getTitle(), 10));
      vo.setRdate(vo.getRdate().substring(0, 10));
      // vo.setFile1(Tool.textLength(10, vo.getFile1()));
      // vo.setFile2(Tool.textLength(10, vo.getFile2()));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
 
    DivisionVO divisionVO = divisionDAO.read(divisionno);
    mav.addObject("divisionVO", divisionVO);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = boardDAO.count(hashMap);
    mav.addObject("totalRecord", boardDAO.count(hashMap)); // �˻��� ���ڵ� ����
 
    String paging = new Paging().paging5(
                                           divisionno,
                                           totalRecord, 
                                           searchDTO.getNowPage(), 
                                           recordPerPage, 
                                           searchDTO.getCol(), 
                                           searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
  }
  /**
   * 
   * @param divisionno
   * @return
   */
  @RequestMapping(value = "/board/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(BoardVO boardVO) {
     //System.out.println("--> reply() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/reply"); // /webapp/board/create.jsp
    mav.addObject("boardVO", boardVO);
    
    DivisionVO divisionVO = divisionDAO.read(boardVO.getDivisionno());
    mav.addObject("divisionVO", divisionVO);
    
    return mav;
  } 
  /**
   * �亯 ó���Դϴ�
   * @param boardVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/board/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(BoardVO boardVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/board/storage");
    MultipartFile file2MF = boardVO.getFile2MF();
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      boardVO.setFile2(file2); // ���۵� ���ϸ� ����
      boardVO.setSize2(file2MF.getSize());
 
      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) {
        file1 = Tool.preview(upDir, file2, 120, 80);
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
    }
    boardVO.setFile1(file1);
    boardVO.setFile2(file2);
    // -------------------------------------------------------------------
    
    boardVO.setMe_no(1); // ȸ�� ������ ����
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    BoardVO parentVO = boardDAO.read(boardVO.getBoardno()); // �θ�� ���� ����
    boardVO.setGrpno(parentVO.getGrpno()); // �׷� ��ȣ
    boardVO.setAnsnum(parentVO.getAnsnum()); // �亯 ����
    
    boardDAO.updateAnsnum(boardVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.
    System.out.println(boardDAO.updateAnsnum(boardVO)); //test
    
    boardVO.setIndent(parentVO.getIndent()+1); // �亯 ���� ����
    boardVO.setAnsnum(parentVO.getAnsnum()+1); // �θ� �ٷ� �Ʒ� ���
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    if (boardDAO.reply(boardVO) == 1) {
      divisionDAO.increaseCnt(boardVO.getDivisionno());
      msgs.add("���� ����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./create.do?divisionno="
              + boardVO.getDivisionno() + "'\">��� ���</button>");
    } else {
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    links.add("<button type='button' onclick=\"location.href='./list.do?divisionno="
            + boardVO.getDivisionno() + "'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  
}