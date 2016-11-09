package dev.mvc.gfree;
 
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
public class GfreeCont {
  @Autowired
  @Qualifier("dev.mvc.gfree.GfreeDAO")
  private GfreeInter gfreeDAO;
  
  public GfreeCont(){
    System.out.println("--> GfreeCont created.");
  }
  
  /**
   * ��� �մϴ�.
   * 
   * @return
   */
  @RequestMapping(value = "/gfree/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gfree/create"); // member�� create.do�� ���� ��� �̵� -> /webapp/gfree/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/gfree/create.do", method = RequestMethod.POST)
  public ModelAndView create(GfreeVO gfreeVO,  
                                    HttpServletRequest request, 
                                    HttpSession session) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/gfree/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

 // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/gfree/storage");
    MultipartFile file2MF = gfreeVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      gfreeVO.setFile2(file2); // ���۵� ���ϸ� ����
      gfreeVO.setSize2(size2);
 
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
    gfreeVO.setFile1(file1); // Thumb �̹���
    gfreeVO.setFile2(file2); // ���� �̹���
    gfreeVO.setSize2(size2);
    // -------------------------------------------------------------------
    
    
    if (gfreeDAO.create(gfreeVO) == 1) {
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
  @RequestMapping(value="/gfree/update.do", 
                             method=RequestMethod.GET)
  public ModelAndView update(int cm_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gfree/update");
    GfreeVO gfreeVO = gfreeDAO.read(cm_no);
    mav.addObject("gfreeVO", gfreeVO);
    
    return mav;
 
  }
   
  /**
   * �۰� ������ ���� ó��
   * @param gfreeVO
   * @return
   */
  @RequestMapping(value = "/gfree/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(GfreeVO gfreeVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // ���� ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
 
    String upDir = Tool.getRealPath(request, "/gfree/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile file2MF = gfreeVO.getFile2MF();
    GfreeVO oldVO = gfreeDAO.read(gfreeVO.getCm_no());
    
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
    gfreeVO.setFile1(file1); 
    gfreeVO.setFile2(file2);
    gfreeVO.setSize2(size2);
    // -------------------------------------------------------------------
 
    if (gfreeDAO.update(gfreeVO) == 1) {
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/gfree/read.do?cm_no=" + gfreeVO.getCm_no());
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
  @RequestMapping(value = "/gfree/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int cm_no) {
    ModelAndView mav = new ModelAndView();

    GfreeVO gfreeVO = gfreeDAO.read(cm_no);
    if (gfreeDAO.delete(cm_no) == 1) {
      mav.setViewName("redirect:/gfree/list.do");
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
  @RequestMapping(value = "/gfree/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gfree/list");
 
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
    
    List<GfreeVO> list = gfreeDAO.list(hashMap); // �˻�
    Iterator<GfreeVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      GfreeVO vo = iter.next(); // ��� ����
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = gfreeDAO.count(hashMap);
    mav.addObject("totalRecord", gfreeDAO.count(hashMap)); // �˻��� ���ڵ� ����
 
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
  @RequestMapping(value = "/gfree/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gfree/reply"); 

    GfreeVO gfreeVO = gfreeDAO.read(cm_no);
    mav.addObject("mfVO", gfreeVO);
    
    return mav;
  }
  
  /**
   * �亯 ó���Դϴ�
   * @param gfreeVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/gfree/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(GfreeVO gfreeVO, HttpServletRequest request) {
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
    String upDir = Tool.getRealPath(request, "/gfree/storage");
    MultipartFile file2MF = gfreeVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      gfreeVO.setFile2(file2); // ���۵� ���ϸ� ����
      gfreeVO.setSize2(size2);
 
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
    gfreeVO.setFile1(file1); // Thumb �̹���
    gfreeVO.setFile2(file2); // ���� �̹���
    gfreeVO.setSize2(size2);
    // -------------------------------------------------------------------
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    GfreeVO parentVO = gfreeDAO.read(gfreeVO.getCm_no()); // �θ�� ���� ����
    System.out.println("parentVO.getCm_no : " + parentVO.getCm_no());
    gfreeVO.setGrpno(parentVO.getGrpno()); // �׷� ��ȣ
    gfreeVO.setAnsnum(parentVO.getAnsnum()); // �亯 ����
    System.out.println("parentVO.getGrpno : " + parentVO.getGrpno());
    
    gfreeDAO.updateAnsnum(gfreeVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.
    
    gfreeVO.setIndent(parentVO.getIndent()+1); // �亯 ���� ����
    gfreeVO.setAnsnum(parentVO.getAnsnum()+1); //�θ� �ٷ� �Ʒ� ���
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    if (gfreeDAO.reply(gfreeVO) == 1) {
      msgs.add("���� ����߽��ϴ�.");
      links
          .add("<button type='button' onclick=\"location.href='./reply.do?cm_no="
              + gfreeVO.getCm_no() + "'\">��� ���</button>");
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
  @RequestMapping(value = "/gfree/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/gfree/read");
    GfreeVO gfreeVO = gfreeDAO.read(cm_no); 
    List<GfreeVO> bonlist = gfreeDAO.bonlist();
    GfreeVO daum = new GfreeVO();
    GfreeVO ejun = new GfreeVO();
    for (int i = 0; i < bonlist.size(); i++) {
      GfreeVO vo1 = new GfreeVO();
      GfreeVO vo2 = bonlist.get(i);
      GfreeVO vo3 = new GfreeVO();
      
      int minlist = gfreeDAO.minlist();
      int maxlist = gfreeDAO.maxlist();
        
        if(cm_no == minlist){
            if(bonlist.get(i+1) != null){
              vo3 = bonlist.get(i+1);
              daum = gfreeDAO.bonread(vo3.getGrpno()); 
            }
          break;
        }
      
      if(vo2.getCm_no() == cm_no){
        if(cm_no == maxlist){
          if(bonlist.get(i-1) != null){
            vo1 = bonlist.get(i-1);
            ejun = gfreeDAO.bonread(vo1.getGrpno()); 
          }
          break;
        }
        if(bonlist.get(i-1) != null){
          vo1 = bonlist.get(i-1);
          ejun = gfreeDAO.bonread(vo1.getGrpno()); 
        }
        if(bonlist.get(i+1) != null){
          vo3 = bonlist.get(i+1);
          daum = gfreeDAO.bonread(vo3.getGrpno()); 
        }
      }
    }
    
    gfreeDAO.update_cnt(cm_no);
    List<GfreeVO> list = gfreeDAO.listmenu(gfreeVO.getGrpno());
    
    // Ư������ó��
    String cm_content = gfreeVO.getCm_content();
    cm_content = Tool.convertChar(cm_content);  
    gfreeVO.setCm_content(cm_content);
    mav.addObject("gfreeVO", gfreeVO); 
    mav.addObject("list", list); 
    mav.addObject("daum", daum); 
    mav.addObject("ejun", ejun); 
    mav.addObject("minlist", gfreeDAO.minlist()); 
    mav.addObject("maxlist", gfreeDAO.maxlist()); 
    
    return mav;
  }

}