package dev.mvc.ifree;
 
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

import web.tool.*;

@Controller
public class IfreeCont {
  @Autowired
  @Qualifier("dev.mvc.ifree.IfreeDAO")
  private IfreeInter ifreeDAO;
  
  public IfreeCont(){
    System.out.println("--> IfreeCont created.");
  }
  
  /**
   * ��� �մϴ�.
   * 
   * @return
   */
  @RequestMapping(value = "/ifree/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ifree/create"); // member�� create.do�� ���� ��� �̵� -> /webapp/ifree/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/ifree/create.do", method = RequestMethod.POST)
  public ModelAndView create(IfreeVO ifreeVO,  
                                    HttpServletRequest request, 
                                    HttpSession session) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/ifree/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

 // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/ifree/storage");
    MultipartFile file2MF = ifreeVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      ifreeVO.setFile2(file2); // ���۵� ���ϸ� ����
      ifreeVO.setSize2(size2);
 
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
    ifreeVO.setFile1(file1); // Thumb �̹���
    ifreeVO.setFile2(file2); // ���� �̹���
    ifreeVO.setSize2(size2);
    // -------------------------------------------------------------------
    
    
    if (ifreeDAO.create(ifreeVO) == 1) {
      msgs.add("���� ����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">Ȯ��</button>");
      links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
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
  @RequestMapping(value="/ifree/update.do", 
                             method=RequestMethod.GET)
  public ModelAndView update(int cm_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ifree/update");
    IfreeVO ifreeVO = ifreeDAO.read(cm_no);
    mav.addObject("ifreeVO", ifreeVO);
    
    return mav;
 
  }
   
  /**
   * �۰� ������ ���� ó��
   * @param ifreeVO
   * @return
   */
  @RequestMapping(value = "/ifree/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(IfreeVO ifreeVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // ���� ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
 
    String upDir = Tool.getRealPath(request, "/ifree/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile file2MF = ifreeVO.getFile2MF();
    IfreeVO oldVO = ifreeDAO.read(ifreeVO.getCm_no());
    
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
    ifreeVO.setFile1(file1); 
    ifreeVO.setFile2(file2);
    ifreeVO.setSize2(size2);
    // -------------------------------------------------------------------
 
    if (ifreeDAO.update(ifreeVO) == 1) {
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/ifree/read.do?cm_no=" + ifreeVO.getCm_no());
    } else {
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
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
  @RequestMapping(value = "/ifree/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int cm_no) {
    ModelAndView mav = new ModelAndView();

    IfreeVO ifreeVO = ifreeDAO.read(cm_no);
    if (ifreeDAO.delete(cm_no) == 1) {
      mav.setViewName("redirect:/ifree/list.do");
    } else {
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
  @RequestMapping(value = "/ifree/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ifree/list");
 
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
    
    List<IfreeVO> list = ifreeDAO.list(hashMap); // �˻�
    Iterator<IfreeVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      IfreeVO vo = iter.next(); // ��� ����
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = ifreeDAO.count(hashMap);
    mav.addObject("totalRecord", ifreeDAO.count(hashMap)); // �˻��� ���ڵ� ����
 
    String paging = new Paging().paging5(  totalRecord, 
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
  @RequestMapping(value = "/ifree/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ifree/reply"); 

    IfreeVO ifreeVO = ifreeDAO.read(cm_no);
    mav.addObject("mfVO", ifreeVO);
    
    return mav;
  }
  
  /**
   * �亯 ó���Դϴ�
   * @param ifreeVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/ifree/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(IfreeVO ifreeVO, HttpServletRequest request) {
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
    String upDir = Tool.getRealPath(request, "/ifree/storage");
    MultipartFile file2MF = ifreeVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      ifreeVO.setFile2(file2); // ���۵� ���ϸ� ����
      ifreeVO.setSize2(size2);
 
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
    ifreeVO.setFile1(file1); // Thumb �̹���
    ifreeVO.setFile2(file2); // ���� �̹���
    ifreeVO.setSize2(size2);
    // -------------------------------------------------------------------
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    IfreeVO parentVO = ifreeDAO.read(ifreeVO.getCm_no()); // �θ�� ���� ����
    System.out.println("parentVO.getCm_no : " + parentVO.getCm_no());
    ifreeVO.setGrpno(parentVO.getGrpno()); // �׷� ��ȣ
    ifreeVO.setAnsnum(parentVO.getAnsnum()); // �亯 ����
    System.out.println("parentVO.getGrpno : " + parentVO.getGrpno());
    
    ifreeDAO.updateAnsnum(ifreeVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.
    
    ifreeVO.setIndent(parentVO.getIndent()+1); // �亯 ���� ����
    ifreeVO.setAnsnum(parentVO.getAnsnum()+1); //�θ� �ٷ� �Ʒ� ���
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    if (ifreeDAO.reply(ifreeVO) == 1) {
      msgs.add("���� ����߽��ϴ�.");
      links
          .add("<button type='button' onclick=\"location.href='./reply.do?cm_no="
              + ifreeVO.getCm_no() + "'\">��� ���</button>");
    } else {
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links
          .add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }
 
    links
        .add("<button type='button' onclick=\"location.href='./index.jsp'\">Ȩ������</button>");
    links
        .add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  } 

  /**
   * ���� ��ȸ�մϴ�
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/ifree/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ifree/read");
    IfreeVO ifreeVO = ifreeDAO.read(cm_no); 
    List<IfreeVO> bonlist = ifreeDAO.bonlist();
    IfreeVO daum = new IfreeVO();
    IfreeVO ejun = new IfreeVO();
    for (int i = 0; i < bonlist.size(); i++) {
      IfreeVO vo1 = new IfreeVO();
      IfreeVO vo2 = bonlist.get(i);
      IfreeVO vo3 = new IfreeVO();
      
      int minlist = ifreeDAO.minlist();
      int maxlist = ifreeDAO.maxlist();
      
      
      if(cm_no == maxlist){
        if(vo2.getCm_no() == cm_no){
          if(bonlist.get(i-1) != null){
            vo1 = bonlist.get(i-1);
            ejun = ifreeDAO.bonread(vo1.getGrpno()); 
          }
        }
        break;
      }
      
      if(cm_no == minlist){
        if(vo2.getCm_no() == cm_no){
          if(bonlist.get(i+1) != null){
            vo3 = bonlist.get(i+1);
            daum = ifreeDAO.bonread(vo3.getGrpno()); 
          }
        }
        break;
      }
      
      if(vo2.getCm_no() == cm_no){
        if(bonlist.get(i-1) != null){
          vo1 = bonlist.get(i-1);
          ejun = ifreeDAO.bonread(vo1.getGrpno()); 
        }
        if(bonlist.get(i+1) != null){
          vo3 = bonlist.get(i+1);
          daum = ifreeDAO.bonread(vo3.getGrpno()); 
        }
      }
    }
    
    ifreeDAO.update_cnt(cm_no);
    List<IfreeVO> list = ifreeDAO.listmenu(ifreeVO.getGrpno());
    
    // Ư������ó��
    String cm_content = ifreeVO.getCm_content();
    cm_content = Tool.convertChar(cm_content);  
    ifreeVO.setCm_content(cm_content);
    mav.addObject("ifreeVO", ifreeVO); 
    mav.addObject("list", list); 
    mav.addObject("daum", daum); 
    mav.addObject("ejun", ejun); 
    mav.addObject("minlist", ifreeDAO.minlist()); 
    mav.addObject("maxlist", ifreeDAO.maxlist()); 
    
    return mav;
  }

}