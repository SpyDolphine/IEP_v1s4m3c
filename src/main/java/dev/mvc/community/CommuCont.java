package dev.mvc.community;
 
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.community.PagingC;
import web.tool.*;

@Controller
public class CommuCont {
  @Autowired
  @Qualifier("dev.mvc.community.CommuDAO")
  private CommuInter commuDAO;
  
  public CommuCont(){
    //System.out.println("--> CommuCont created.");
  }
  
  /**
   * ��� �մϴ�.
   * 
   * @return
   */
  @RequestMapping(value = "/community/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    //System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/create"); // member�� create.do�� ���� ��� �̵� -> /webapp/community/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/community/create.do", method = RequestMethod.POST)
  public ModelAndView create(CommuVO commuVO,  
                                    HttpServletRequest request, 
                                    HttpSession session) {
    //System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/community/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

 // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/community/storage");
    MultipartFile file2MF = commuVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      commuVO.setFile2(file2); // ���۵� ���ϸ� ����
      commuVO.setSize2(size2);
 
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
    commuVO.setFile1(file1); // Thumb �̹���
    commuVO.setFile2(file2); // ���� �̹���
    commuVO.setSize2(size2);
    // -------------------------------------------------------------------
    
    
    if (commuDAO.create(commuVO) == 1) {
      if(commuVO.getCm_ch().equals("A")){
        msgs.add("���� ����߽��ϴ�.");
        links.add("<button type='button' onclick=\"location.href='./listA.do'\">Ȯ��</button>");
        links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
      }
      if(commuVO.getCm_ch().equals("B")){
        msgs.add("���� ����߽��ϴ�.");
        links.add("<button type='button' onclick=\"location.href='./listB.do'\">Ȯ��</button>");
        links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
      }
      if(commuVO.getCm_ch().equals("C")){
        msgs.add("���� ����߽��ϴ�.");
        links.add("<button type='button' onclick=\"location.href='./listC.do'\">Ȯ��</button>");
        links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
      }      
    } else {
      msgs.add("���� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./index.jsp'\">Ȩ������</button>");
    }
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
 
  /**
   * ������
   * @param cm_no
   * @return
   */
  @RequestMapping(value="/community/update.do", 
                             method=RequestMethod.GET)
  public ModelAndView update(int cm_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/update");
    CommuVO commuVO = commuDAO.read(cm_no);
    mav.addObject("commuVO", commuVO);
    
    return mav;
 
  }
   
  /**
   * �۰� ������ ���� ó��
   * @param commuVO
   * @return
   */
  @RequestMapping(value = "/community/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(CommuVO commuVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // ���� ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
 
    String upDir = Tool.getRealPath(request, "/community/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile file2MF = commuVO.getFile2MF();
    CommuVO oldVO = commuDAO.read(commuVO.getCm_no());
    
    size2 = file2MF.getSize();
    if (size2 > 0) { // ���ο� ������ �����ϴ��� Ȯ��
      Tool.deleteFile(upDir, oldVO.getFile2()); // ���� ��ϵ� ���� ����
      file2 = Upload.saveFileSpring(file2MF, upDir); // ���ο� ���� ����
      // -------------------------------------------------------------------
      // Thumb ���� ����
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) { // �̹������� �˻�
        Tool.deleteFile(upDir, oldVO.getFile1()); // ���� ����
        file1 = Tool.preview(upDir, file2, 120, 80); // thumb �̹��� ����
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------
 
    } else {
      file1 = oldVO.getFile1(); // ���� ���ε带���� �ʴ� ���
      file2 = oldVO.getFile2();
      size2 = oldVO.getSize2();
    }
    commuVO.setFile1(file1); 
    commuVO.setFile2(file2);
    commuVO.setSize2(size2);
    // -------------------------------------------------------------------
 
    if (commuDAO.update(commuVO) == 1) {
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/community/read.do?cm_no=" + commuVO.getCm_no());
    } else {
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
        if(commuVO.getCm_ch().equals("A")){
          links.add("<button type='button' onclick=\"location.href='./listA.do'\">���</button>");
        }
        if(commuVO.getCm_ch().equals("B")){
          links.add("<button type='button' onclick=\"location.href='./listB.do'\">���</button>");
        }
        if(commuVO.getCm_ch().equals("C")){
          links.add("<button type='button' onclick=\"location.href='./listC.do'\">���</button>");
        }        
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
 
    return mav;
  }
  
  /**
   * ���� ó��
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/community/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(@RequestParam List<String> arr) { // �Ķ���� ���� �迭�� �ٷ� �޴´�
    ModelAndView mav = new ModelAndView();
    CommuVO commuVO = commuDAO.read(Integer.parseInt(arr.get(0)));
    HashMap<String, Object> hashMap = new HashMap<String, Object>(); // �ؽ������� �����ؼ� ������
    
    System.out.println("���⿩��:" + commuVO.getCm_no() + commuVO.getCm_ch());
    
    if(commuVO.getCm_ch().equals("A")){
      hashMap.put("arr", arr);
      commuDAO.delete(hashMap);
      mav.setViewName("redirect:/community/listA.do");
    }
    
    if(commuVO.getCm_ch().equals("B")){
      hashMap.put("arr", arr);                        
      commuDAO.delete(hashMap);                       
      mav.setViewName("redirect:/community/listB.do");
    }
 
    if(commuVO.getCm_ch().equals("C")){
      hashMap.put("arr", arr);                        // �迭�� �ڵ����� ��Ƽ� �Ѱ��ְ�
      commuDAO.delete(hashMap);                       // ���� ���ϴ� �Լ��� ��Ƽ� �����ϰ�
      mav.setViewName("redirect:/community/listC.do");// �����ѵ� ���ư������ �ּҷ� GO
    }    
    
    return mav;
  }
 
  /**
   * �Խ��� ����� �˻�+����¡+�亯��
   * �����Ͽ� ����մϴ�.
   * 
   * @param cm_no
   *          ��ü ��Ͽ��� ������ �Խ��� ��ȣ
   * @param searchDTO �˻� ����         
   * @return ����� �Խ��� ���
   */
  @RequestMapping(value = "/community/listA.do", 
                             method = RequestMethod.GET)
  public ModelAndView listA(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/listA");
 
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
    
    int totalRecord = 0;
    
    List<CommuVO> list = commuDAO.listA(hashMap); // �˻�
    Iterator<CommuVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      CommuVO vo = iter.next(); // ��� ����
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = commuDAO.countA(hashMap);
    mav.addObject("totalRecord", commuDAO.countA(hashMap)); // �˻��� ���ڵ� ����
 
    String paging = new PagingC().paging1(totalRecord, 
                                           searchDTO.getNowPage(), 
                                           recordPerPage, 
                                           searchDTO.getCol(), 
                                           searchDTO.getWord());
    mav.addObject("paging", paging);
    
    return mav;
  }  
  
  /**
   * �Խ��� ����� �˻�+����¡+�亯��
   * �����Ͽ� ����մϴ�.
   * 
   * @param cm_no
   *          ��ü ��Ͽ��� ������ �Խ��� ��ȣ
   * @param searchDTO �˻� ����         
   * @return ����� �Խ��� ���
   */
  @RequestMapping(value = "/community/listB.do", 
                             method = RequestMethod.GET)
  public ModelAndView listB(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/listB");
 
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
    
    int totalRecord = 0;
    
    List<CommuVO> list = commuDAO.listB(hashMap); // �˻�
    Iterator<CommuVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      CommuVO vo = iter.next(); // ��� ����
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = commuDAO.countB(hashMap);
    mav.addObject("totalRecord", commuDAO.countB(hashMap)); // �˻��� ���ڵ� ����
 
    String paging = new PagingC().paging2(  totalRecord, 
                                           searchDTO.getNowPage(), 
                                           recordPerPage, 
                                           searchDTO.getCol(), 
                                           searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
  }    
  
  /**
   * �Խ��� ����� �˻�+����¡+�亯��
   * �����Ͽ� ����մϴ�.
   * 
   * @param cm_no
   *          ��ü ��Ͽ��� ������ �Խ��� ��ȣ
   * @param searchDTO �˻� ����         
   * @return ����� �Խ��� ���
   */
  @RequestMapping(value = "/community/listC.do", 
                             method = RequestMethod.GET)
  public ModelAndView listC(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/listC");
 
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
    
    int totalRecord = 0;
    
    List<CommuVO> list = commuDAO.listC(hashMap); // �˻�
    Iterator<CommuVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      CommuVO vo = iter.next(); // ��� ����
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = commuDAO.countA(hashMap);
    mav.addObject("totalRecord", commuDAO.countA(hashMap)); // �˻��� ���ڵ� ����
 
    String paging = new PagingC().paging1(totalRecord, 
                                           searchDTO.getNowPage(), 
                                           recordPerPage, 
                                           searchDTO.getCol(), 
                                           searchDTO.getWord());
    mav.addObject("paging", paging);
    
    return mav;
  }    
  
  /**
   * �亯 ���
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/community/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/reply"); 

    CommuVO commuVO = commuDAO.read(cm_no);
    mav.addObject("commuVO", commuVO);
    
    return mav;
  }
  
  /**
   * �亯 ó���Դϴ�
   * @param commuVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/community/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(CommuVO commuVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/community/storage");
    MultipartFile file2MF = commuVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      commuVO.setFile2(file2); // ���۵� ���ϸ� ����
      commuVO.setSize2(size2);
 
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
    commuVO.setFile1(file1); // Thumb �̹���
    commuVO.setFile2(file2); // ���� �̹���
    commuVO.setSize2(size2);
    // -------------------------------------------------------------------
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    CommuVO parentVO = commuDAO.read(commuVO.getCm_no()); // �θ�� ���� ����
    System.out.println("parentVO.getCm_no : " + parentVO.getCm_no());
    commuVO.setGrpno(parentVO.getGrpno()); // �׷� ��ȣ
    commuVO.setAnsnum(parentVO.getAnsnum()); // �亯 ����
    System.out.println("parentVO.getGrpno : " + parentVO.getGrpno());
    
    commuDAO.updateAnsnum(commuVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.
    
    commuVO.setIndent(parentVO.getIndent()+1); // �亯 ���� ����
    commuVO.setAnsnum(parentVO.getAnsnum()+1); //�θ� �ٷ� �Ʒ� ���
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    if (commuDAO.reply(commuVO) == 1) {
      msgs.add("���� ����߽��ϴ�.");
      links
          .add("<button type='button' onclick=\"location.href='./reply.do?cm_no="
              + commuVO.getCm_no() + "'\">��� ���</button>");
    } else {
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links
          .add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }
 
    links
        .add("<button type='button' onclick=\"location.href='./index.jsp'\">Ȩ������</button>");
    if(commuVO.getCm_ch().equals("A")){
      links.add("<button type='button' onclick=\"location.href='./listA.do'\">���</button>");
    }
    if(commuVO.getCm_ch().equals("B")){
      links.add("<button type='button' onclick=\"location.href='./listB.do'\">���</button>");
    }
    if(commuVO.getCm_ch().equals("C")){
      links.add("<button type='button' onclick=\"location.href='./listC.do'\">���</button>");
    }   
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  } 

  /**
   * ���� ��ȸ�մϴ� 
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/community/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cm_no,            
                                    HttpServletRequest request,
                                    HttpServletResponse response, String result) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/community/read");
    CommuVO commuVO = commuDAO.read(cm_no); 
    
    // ------------------------------------------------------------------
    // ���ƿ� ���� ���� ��Ű ����
    // ------------------------------------------------------------------
    Cookie[] cookies = request.getCookies(); 
    Cookie cookie = null; 
     
    String sw = null; 
     
    if (cookies != null){
      for (int i = 0; i < cookies.length; i++) { 
        cookie = cookies[i]; 
     
        if (cookie.getName().equals(Integer.toString(cm_no))){ 
          sw = cookie.getValue(); 
        } 
      }
    }
    
    if (sw != null){ // Cookie ������ �ִٸ�  
      System.out.println("������ >.<"); 
         
    }else{ 
      System.out.println("ù����");
      
      Cookie wcookie = null; 
     
      wcookie = new Cookie(Integer.toString(cm_no), "1N");     // �ѱ� ����� ����  
      wcookie.setMaxAge(60);                // 60��
      
      response.addCookie(wcookie);          // ��Ű�� Client�� �����մϴ�. 
    } 
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------ 
    
    // ------------------------------------------------------------------
    // ���ñ� ó��(����/������)
    // ------------------------------------------------------------------    
    CommuVO daum = new CommuVO();
    CommuVO ejun = new CommuVO();
    
    commuDAO.update_cnt(cm_no);
    List<CommuVO> listA = commuDAO.listmenuA(commuVO.getGrpno());
    List<CommuVO> listB = commuDAO.listmenuB(commuVO.getGrpno());
    List<CommuVO> listC = commuDAO.listmenuC(commuVO.getGrpno());

    List<CommuVO> bonlistA = commuDAO.bonlistA();
    if(commuVO.getCm_ch().equals("A")){
      
      for (int i = 0; i < bonlistA.size(); i++) {
        CommuVO vo1 = new CommuVO();
        CommuVO vo2 = bonlistA.get(i);
        CommuVO vo3 = new CommuVO();
        
        int minlistA = commuDAO.minlistA();
        int maxlistA = commuDAO.maxlistA();
        
        if(bonlistA.size() == 1) {
          vo2 = bonlistA.get(0);
          commuDAO.bonread(vo2.getGrpno());
          
          break;
        }
        
        if(cm_no == minlistA){
          if(bonlistA.get(i+1) != null){
            vo3 = bonlistA.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          } 
          break;
        }
    
        if(vo2.getCm_no() == cm_no){
          if(cm_no == maxlistA){
            if(bonlistA.get(i-1) != null){
              vo1 = bonlistA.get(i-1);
              ejun = commuDAO.bonread(vo1.getGrpno()); 
            }
            break;
          }
          if(bonlistA.get(i-1) != null){
            vo1 = bonlistA.get(i-1);
            ejun = commuDAO.bonread(vo1.getGrpno()); 
          }
          if(bonlistA.get(i+1) != null){
            vo3 = bonlistA.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          }
        }
      }
    }
 // ------------------------------------------------------------------
    List<CommuVO> bonlistB = commuDAO.bonlistB();
    if(commuVO.getCm_ch().equals("B")){
      
      for (int i = 0; i < bonlistB.size(); i++) {
        CommuVO vo1 = new CommuVO();
        CommuVO vo2 = bonlistB.get(i);
        CommuVO vo3 = new CommuVO();
        
        int minlistB = commuDAO.minlistB();
        int maxlistB = commuDAO.maxlistB();
        
        if(bonlistA.size() == 1) {
          vo2 = bonlistA.get(0);
          commuDAO.bonread(vo2.getGrpno());
          
          break;
        }
        
        if(cm_no == minlistB){
          if(bonlistB.get(i+1) != null){
            vo3 = bonlistB.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          } 
          break;
        }
    
        if(vo2.getCm_no() == cm_no){
          if(cm_no == maxlistB){
            if(bonlistB.get(i-1) != null){
              vo1 = bonlistB.get(i-1);
              ejun = commuDAO.bonread(vo1.getGrpno()); 
            }
            break;
          }
          if(bonlistB.get(i-1) != null){
            vo1 = bonlistB.get(i-1);
            ejun = commuDAO.bonread(vo1.getGrpno()); 
          }
          if(bonlistB.get(i+1) != null){
            vo3 = bonlistB.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          }
        }
      }
    }
    // ------------------------------------------------------------------
    List<CommuVO> bonlistC = commuDAO.bonlistC();
    if(commuVO.getCm_ch().equals("C")){
      
      for (int i = 0; i < bonlistC.size(); i++) {
        CommuVO vo1 = new CommuVO();
        CommuVO vo2 = bonlistC.get(i);
        CommuVO vo3 = new CommuVO();
        
        int minlistC = commuDAO.minlistC();
        int maxlistC = commuDAO.maxlistC();
        
        if(bonlistC.size() == 1) {
          vo2 = bonlistC.get(0);
          commuDAO.bonread(vo2.getGrpno());
          
          break;
        }
        
        if(cm_no == minlistC){
          if(bonlistC.get(i+1) != null){
            vo3 = bonlistC.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          } 
          break;
        }
    
        if(vo2.getCm_no() == cm_no){
          if(cm_no == maxlistC){
            if(bonlistC.get(i-1) != null){
              vo1 = bonlistC.get(i-1);
              ejun = commuDAO.bonread(vo1.getGrpno()); 
            }
            break;
          }
          if(bonlistC.get(i-1) != null){
            vo1 = bonlistC.get(i-1);
            ejun = commuDAO.bonread(vo1.getGrpno()); 
          }
          if(bonlistC.get(i+1) != null){
            vo3 = bonlistC.get(i+1);
            daum = commuDAO.bonread(vo3.getGrpno()); 
          }
        }
      }
    }    
    // ------------------------------------------------------------------
    // Ư������ó��
    String cm_content = commuVO.getCm_content();
    cm_content = Tool.convertChar(cm_content);  
    commuVO.setCm_content(cm_content);
    mav.addObject("commuVO", commuVO); 
    mav.addObject("listA", listA); 
    mav.addObject("listB", listB);
    mav.addObject("listC", listC);
    mav.addObject("daum", daum); 
    mav.addObject("ejun", ejun); 
    mav.addObject("minlistA", commuDAO.minlistA()); 
    mav.addObject("maxlistA", commuDAO.maxlistA()); 
    mav.addObject("maxlistC", commuDAO.maxlistA());
    mav.addObject("minlistB", commuDAO.minlistB()); 
    mav.addObject("maxlistB", commuDAO.maxlistB());
    mav.addObject("maxlistC", commuDAO.maxlistB());
    mav.addObject("chA", "�� �� ��");
    mav.addObject("chB", "����������");
    mav.addObject("chC", "���/������");
    
    return mav;
  }
  
  
  /**
   * ���ƿ� ó��
   * @throws IOException 
   */
  @ResponseBody
  @RequestMapping(value = "/community/likeit.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeit(int cm_no,HttpSession session, 
                                 HttpServletRequest request,
                                 HttpServletResponse response, String result) throws IOException {
    ModelAndView mav = new ModelAndView();
      // ------------------------------------------------------------------
      // ���ƿ� ���� ���� ��Ű ����
      // ------------------------------------------------------------------
        Cookie[] cookies = request.getCookies(); 
        Cookie cookie = null; 
         
        String sw = null; 
        String str = "";
        
        if (cookies != null){
          for (int i = 0; i < cookies.length; i++) { 
            //��Ű ������ ���� �����մϴ�. 
            cookie = cookies[i]; 
         
            if (cookie.getName().equals(Integer.toString(cm_no))){ 
              sw = cookie.getValue(); // 1N
              if (sw.substring(1, 2).equals("N")){
                str = cm_no + "Y";
              } else {
                str = cm_no + "N";
              }
              
            } 
          }
        }
        
        Cookie wcookie = null; 
        
        wcookie = new Cookie(Integer.toString(cm_no), str);     // �ѱ� ����� ����
        // System.out.println(wcookie.getValue());
        wcookie.setMaxAge(60);                // 60��
        response.addCookie(wcookie);          // ��Ű�� Client�� �����մϴ�. 

        
        if (sw == null){ // Cookie ������ �ִٸ�  
          System.out.println("���ƿ並 ����ұ���"); 
          
          mav.addObject("likedown", commuDAO.likedown(cm_no));
          
          JSONObject obj = new JSONObject();
          obj.put("cookie", wcookie);          
          
        }else{ 
          System.out.println("���ƿ��ұ���");
          
          commuDAO.likeit(cm_no); //�ʼ���!@@!!!! 
          
          JSONObject obj = new JSONObject();
          obj.put("cookie", wcookie);
        } 
      // ------------------------------------------------------------------
      // ------------------------------------------------------------------    
    
    mav.addObject("cm_no", commuDAO.read(cm_no));
    
    int cm_likeit= commuDAO.read(cm_no).getCm_likeit();
  
    JSONObject obj = new JSONObject();
    obj.put("cm_likeit", cm_likeit);
    obj.put("cm_no", cm_no);
    
    return obj.toJSONString();
  }
  
  
}