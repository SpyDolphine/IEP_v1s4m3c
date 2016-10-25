package dev.mvc.seico;
 
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

import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

@Controller
public class SeicoCont {
  @Autowired
  @Qualifier("dev.mvc.seico.SeicoDAO")
  private SeicoDAOInter seicoDAO;

  public SeicoCont(){
    System.out.println("--> SeicoCont created.");
  }
  @RequestMapping(value = "/seico/create.do", method = RequestMethod.GET)
  public ModelAndView create(/*int seico*/) {
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/create"); // /webapp/board/create.jsp
 
   /* SeicoVO seicoVO = seicoDAO.read(sc_no);
    mav.addObject("seicoVO", seicoVO);*/
    
    return mav;
  } 
 
  @RequestMapping(value = "/seico/create.do", method = RequestMethod.POST)
  public ModelAndView create(SeicoVO seicoVO, 
                                                    HttpServletRequest request, 
                                                    HttpSession session) {
    // System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/seico/storage");
    MultipartFile file2MF = seicoVO.getFile2MF();
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    if (file2MF.getSize() > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      seicoVO.setFile2(file2); // ���۵� ���ϸ� ����
      seicoVO.setSize2(file2MF.getSize());
      seicoVO.setSize2Label(file2);
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
    seicoVO.setFile1(file1);
    seicoVO.setFile2(file2);
    // -------------------------------------------------------------------
    
   // seicoVO.setMe_no(1); // ȸ�� ������ ����
    //Integer itg = (Integer)(session.getAttribute("mno"));
    //boardVO.setMno(itg.intValue());
      
    if (seicoDAO.create(seicoVO) == 1) {
      //divisionDAO.increaseCnt(boardVO.getDivisionno());
      msgs.add("���� ����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./create.do?divisionno="
              +/* seicoVO.getDivisionno()*/  "'\">��� ���</button>");
    } else {
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    links.add("<button type='button' onclick=\"location.href='./list4.do"
            + /*seicoVO.getDivisionno()*/ "'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  /**
   * ��ü ���
   * @return
   */
  @RequestMapping(value = "/seico/list.do", method = RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/list4"); 
    
    List<SeicoVO> list = seicoDAO.list();
    Iterator<SeicoVO> iter = list.iterator();
    while(iter.hasNext() == true){  // ���� ��� �˻�
      SeicoVO seicoVO = iter.next();  // ��� ����
      seicoVO.setSc_title(Tool.textLength(seicoVO.getSc_title(),10));
      seicoVO.setSc_date(seicoVO.getSc_date().substring(0, 10)); 
//      seicoVO.setFile1(Tool.textLength(seicoVO.getFile1(),10));
//      seicoVO.setFile2(Tool.textLength(seicoVO.getFile2(),10));
    }
    mav.addObject("list", list);
    
    return mav;
  }
  
  /**
   * ���� ��ȸ�մϴ�
   * @param sc_no
   * @return
   */
  @RequestMapping(value = "/seico/read.do", 
                             method = RequestMethod.GET)
  public ModelAndView read(int sc_no/*, SearchDTO searchDTO*/) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/read");
    SeicoVO seicoVO = seicoDAO.read(sc_no);
    seicoDAO.cntup(sc_no);
    //String content = boardVO.getContent();
    //content = Tool.convertChar(content); //Ư������ó��
    //boardVO.setContent(content);    
    mav.addObject("seicoVO", seicoVO); 
    seicoVO.getSize2Label();
    //�Խ��ǿ� ���� ���� �ľ�
   /* DivisionVO divisionVO = divisionDAO.read(boardVO.getDivisionno());
    mav.addObject("divisionVO", divisionVO);*/
    
    return mav;
  }
  /*
  *//**
   * ������
   * @param sc_no
   * @return
   */
  @RequestMapping(value="/seico/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int sc_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/update"); 
    mav.addObject("seicoVO", seicoDAO.read(sc_no)); 
    
    return mav;
  }

   
  /**
   * ���� ó��
   * @param seicoVO
   * @return
   */
  @RequestMapping(value="/seico/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(SeicoVO seicoVO, HttpServletRequest request, 
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
 
    String upDir = Tool.getRealPath(request, "/seico/storage");
    MultipartFile file2MF = seicoVO.getFile2MF();
    SeicoVO oldVO = seicoDAO.read(seicoVO.getSc_no());
 
    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getFile2()); // ���� ����
      file2 = Upload.saveFileSpring(file2MF, upDir);
      seicoVO.setFile2(file2); // ���۵� ���ϸ� ����
      seicoVO.setSize2(file2MF.getSize());
 
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
    seicoVO.setFile1(file1);
    seicoVO.setFile2(file2);
    // -------------------------------------------------------------------
    
   // boardVO.setMe_no(1); // ȸ�� ������ ����
    //Integer itg = (Integer)(session.getAttribute("mno"));
    //boardVO.setMno(itg.intValue());
     
    if(seicoDAO.update(seicoVO) == 1){
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/seico/read.do?sc_no=" + seicoVO.getSc_no()/* + "&divisionno=" + seicoVO.getDivisionno()*/); // Ȯ���� ���
    }else{
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list4.do'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  /**
   * ������
   * @param sc_no
   * @return
   */
  @RequestMapping(value = "/seico/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int sc_no/* int divisionno,SearchDTO searchDTO*/) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/delete"); // /webapp/board/delete.jsp
    System.out.println(sc_no);
    mav.addObject("sc_no", sc_no);
    //mav.addObject("divisionno", divisionno);
    
    return mav;
  }
  
  /**
   * ���� ó��
   * @param seicoVO
   * @return
   */
  @RequestMapping(value = "/seico/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete2(int sc_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (seicoDAO.delete(sc_no) == 1) {
      
      mav.setViewName("redirect:/seico/list4.do");//Ȯ���� ���
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
  
  /**
   * divisionno ���� �Խ��� ����� �˻�+����¡+�亯��
   * �����Ͽ� ����մϴ�.
   * 
   * @param divisionno
   *          ��ü ��Ͽ��� ������ �Խ��� ��ȣ
   * @param searchDTO �˻� ����         
   * @return ����� �Խ��� ���
   */
  @RequestMapping(value = "/seico/list4.do", 
                             method = RequestMethod.GET)
  public ModelAndView list4( /*int sc_no,*/
                                        SearchDTO searchDTO,
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/seico/list4");
    int totalRecord = 0;
    System.out.println("��Ʈ�ѷ�:"+searchDTO.getCol());
    System.out.println("��Ʈ�ѷ�:"+searchDTO.getWord());
    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    /*hashMap.put("divisionno", divisionno);*/
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    System.out.println(hashMap.get("col"));
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
 
    int  totalRecord1 = 0; 
    
    List<SeicoVO> list = seicoDAO.list4(hashMap); // �˻�
    Iterator<SeicoVO> iter = list.iterator();
    
    while (iter.hasNext() == true) { // ���� ��� �˻�
      SeicoVO vo = iter.next(); // ��� ����
      vo.setSc_title(Tool.textLength(vo.getSc_title(), 10));
      vo.setSc_date(vo.getSc_date().substring(0, 10));
      // vo.setFile1(Tool.textLength(10, vo.getFile1()));
      // vo.setFile2(Tool.textLength(10, vo.getFile2()));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
 
    totalRecord1 = seicoDAO.count(hashMap);
        mav.addObject("totalRecord", seicoDAO.count(hashMap));
    
    /*SeicoVO seicoVO = seicoDAO.read(sc_no);
    mav.addObject("seicoVO", seicoVO);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = seicoDAO.count(hashMap);
    mav.addObject("totalRecord", seicoDAO.count(hashMap)); */// �˻��� ���ڵ� ����
 
    String paging = new Paging2().paging5( 
                                           totalRecord1, 
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
   *//*
  @RequestMapping(value = "/board/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(SeicoVO boardVO) {
     //System.out.println("--> reply() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/reply"); // /webapp/board/create.jsp
    mav.addObject("boardVO", boardVO);
    
    DivisionVO divisionVO = divisionDAO.read(boardVO.getDivisionno());
    mav.addObject("divisionVO", divisionVO);
    
    return mav;
  } 
  *//**
   * �亯 ó���Դϴ�
   * @param boardVO
   * @param request
   * @return
   *//*
  @RequestMapping(value = "/board/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(SeicoVO boardVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
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
    SeicoVO parentVO = boardDAO.read(boardVO.getBoardno()); // �θ�� ���� ����
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
  }*/
  
  
}