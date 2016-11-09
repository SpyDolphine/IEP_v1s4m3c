package dev.mvc.mfree;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import dev.mvc.cfree.CmDAO;
import web.tool.*;

@Controller
public class MfCont {
  @Autowired
  @Qualifier("dev.mvc.mfree.MfDAO")
  private MfInter mfDAO;
  
  public MfCont(){
    System.out.println("--> MfCont created.");
  }
  
  /**
   * ��� �մϴ�.
   * 
   * @return
   */
  @RequestMapping(value = "/mfree/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mfree/create"); // member�� create.do�� ���� ��� �̵� -> /webapp/mfree/create.jsp
 
    return mav;
  }
  
  @RequestMapping(value = "/mfree/create.do", method = RequestMethod.POST)
  public ModelAndView create(MfVO mfVO,  
                                    HttpServletRequest request, 
                                    HttpSession session) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message"); // /webapp/mfree/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

 // -------------------------------------------------------------------
    // ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
    String upDir = Tool.getRealPath(request, "/mfree/storage");
    MultipartFile file2MF = mfVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      mfVO.setFile2(file2); // ���۵� ���ϸ� ����
      mfVO.setSize2(size2);
 
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
    mfVO.setFile1(file1); // Thumb �̹���
    mfVO.setFile2(file2); // ���� �̹���
    mfVO.setSize2(size2);
    // -------------------------------------------------------------------
    
    
    if (mfDAO.create(mfVO) == 1) {
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
  @RequestMapping(value="/mfree/update.do", 
                             method=RequestMethod.GET)
  public ModelAndView update(int cm_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mfree/update");
    MfVO mfVO = mfDAO.read(cm_no);
    mav.addObject("mfVO", mfVO);
    
    return mav;
 
  }
   
  /**
   * �۰� ������ ���� ó��
   * @param mfVO
   * @return
   */
  @RequestMapping(value = "/mfree/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(MfVO mfVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // -------------------------------------------------------------------
    // ���� ���� ����
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";
    long size2 = 0;
 
    String upDir = Tool.getRealPath(request, "/mfree/storage");
    // <input type="file" name='file2MF' id='file2MF' size='40' >
    MultipartFile file2MF = mfVO.getFile2MF();
    MfVO oldVO = mfDAO.read(mfVO.getCm_no());
    
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
    mfVO.setFile1(file1); 
    mfVO.setFile2(file2);
    mfVO.setSize2(size2);
    // -------------------------------------------------------------------
 
    if (mfDAO.update(mfVO) == 1) {
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/mfree/read.do?cm_no=" + mfVO.getCm_no());
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
  @RequestMapping(value = "/mfree/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(@RequestParam List<String> arr) { // �Ķ���� ���� �迭�� �ٷ� �޴´�
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>(); // �ؽ������� �����ؼ� ������
    hashMap.put("arr", arr); // �迭�� �ڵ����� ��Ƽ� �Ѱ��ְ�
    mfDAO.delete(hashMap);  // ���� ���ϴ� �Լ��� ��Ƽ� �����ϰ�
    mav.setViewName("redirect:/mfree/list.do"); // �����ѵ� ���ư������ �ּҷ� GO
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
  @RequestMapping(value = "/mfree/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list(SearchDTO searchDTO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mfree/list");
 
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
    
    List<MfVO> list = mfDAO.list(hashMap); // �˻�
    Iterator<MfVO> iter = list.iterator();
    while (iter.hasNext() == true) { // ���� ��� �˻�
      MfVO vo = iter.next(); // ��� ����
      vo.setCm_title(Tool.textLength(vo.getCm_title(), 20));
      vo.setCm_date(vo.getCm_date().substring(0, 10));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = mfDAO.count(hashMap);
    mav.addObject("totalRecord", mfDAO.count(hashMap)); // �˻��� ���ڵ� ����
 
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
  @RequestMapping(value = "/mfree/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mfree/reply"); 

    MfVO mfVO = mfDAO.read(cm_no);
    mav.addObject("mfVO", mfVO);
    
    return mav;
  }
  
  /**
   * �亯 ó���Դϴ�
   * @param mfVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/mfree/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(MfVO mfVO, HttpServletRequest request) {
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
    String upDir = Tool.getRealPath(request, "/mfree/storage");
    MultipartFile file2MF = mfVO.getFile2MF();
    System.out.println("file2MF:"+file2MF);
    
    // System.out.println("file2MF.getSize(): " + file2MF.getSize());
    size2 = file2MF.getSize();
    if (size2 > 0) {
      file2 = Upload.saveFileSpring(file2MF, upDir);
      mfVO.setFile2(file2); // ���۵� ���ϸ� ����
      mfVO.setSize2(size2);
 
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
    mfVO.setFile1(file1); // Thumb �̹���
    mfVO.setFile2(file2); // ���� �̹���
    mfVO.setSize2(size2);
    // -------------------------------------------------------------------
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    MfVO parentVO = mfDAO.read(mfVO.getCm_no()); // �θ�� ���� ����
    System.out.println("parentVO.getCm_no : " + parentVO.getCm_no());
    mfVO.setGrpno(parentVO.getGrpno()); // �׷� ��ȣ
    mfVO.setAnsnum(parentVO.getAnsnum()); // �亯 ����
    System.out.println("parentVO.getGrpno : " + parentVO.getGrpno());
    
    mfDAO.updateAnsnum(mfVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.
    
    mfVO.setIndent(parentVO.getIndent()+1); // �亯 ���� ����
    mfVO.setAnsnum(parentVO.getAnsnum()+1); //�θ� �ٷ� �Ʒ� ���
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    if (mfDAO.reply(mfVO) == 1) {
      msgs.add("���� ����߽��ϴ�.");
      links
          .add("<button type='button' onclick=\"location.href='./reply.do?cm_no="
              + mfVO.getCm_no() + "'\">��� ���</button>");
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
  @RequestMapping(value = "/mfree/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mfree/read");
    MfVO mfVO = mfDAO.read(cm_no); 
    List<MfVO> bonlist = mfDAO.bonlist();
    MfVO daum = new MfVO();
    MfVO ejun = new MfVO();
    for (int i = 0; i < bonlist.size(); i++) {
      MfVO vo1 = new MfVO();
      MfVO vo2 = bonlist.get(i);
      MfVO vo3 = new MfVO();
      
      int minlist = mfDAO.minlist();
      int maxlist = mfDAO.maxlist();
      
      
      if(cm_no == minlist){
        if(bonlist.get(i+1) != null){
          vo3 = bonlist.get(i+1);
          daum = mfDAO.bonread(vo3.getGrpno()); 
        }
      break;
    }
  
  if(vo2.getCm_no() == cm_no){
    if(cm_no == maxlist){
      if(bonlist.get(i-1) != null){
        vo1 = bonlist.get(i-1);
        ejun = mfDAO.bonread(vo1.getGrpno()); 
      }
      break;
    }
    if(bonlist.get(i-1) != null){
      vo1 = bonlist.get(i-1);
      ejun = mfDAO.bonread(vo1.getGrpno()); 
    }
    if(bonlist.get(i+1) != null){
      vo3 = bonlist.get(i+1);
      daum = mfDAO.bonread(vo3.getGrpno()); 
    }
  }
}
    
    mfDAO.update_cnt(cm_no);
    List<MfVO> list = mfDAO.listmenu(mfVO.getGrpno());
    
    // Ư������ó��
    String cm_content = mfVO.getCm_content();
    cm_content = Tool.convertChar(cm_content);  
    mfVO.setCm_content(cm_content);
    mav.addObject("mfVO", mfVO); 
    mav.addObject("list", list); 
    mav.addObject("daum", daum); 
    mav.addObject("ejun", ejun); 
    mav.addObject("minlist", mfDAO.minlist()); 
    mav.addObject("maxlist", mfDAO.maxlist()); 
    
    return mav;
  }
  
  
  /**
   * ���ƿ� ó��
   */
  @ResponseBody
  @RequestMapping(value = "/mfree/likeit.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeit(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("cm_no", mfDAO.read(cm_no));
    //mav.addObject("likedown", mfDAO.likedown(cm_no));
    
    mfDAO.likeit(cm_no); //�ʼ���!@@!!!! 
    int cm_likeit= mfDAO.read(cm_no).getCm_likeit();
  
    JSONObject obj = new JSONObject();
    obj.put("cm_likeit", cm_likeit);
    obj.put("cm_no", cm_no);
    
/*    boolean a = true;
    if(a == true) {
                  System.out.println("a : " + a);
      obj.put("cm_likeit", cm_likeit);
      obj.put("cm_no", cm_no);
                  System.out.println("cm_likeit : " + cm_likeit);
      a = false;
                  System.out.println("a : " + a);
    } else {
      obj.put("likedown", mfDAO.likedown(cm_no));
      obj.put("cm_no", cm_no);
      System.out.println("likedown" + mfDAO.likedown(cm_no));
    }*/
    
    return obj.toJSONString();
  }
  
/* *//**
   * ���ƿ� ���
   *//*
  @ResponseBody
  @RequestMapping(value = "/mfree/likedown.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likedown(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("cm_no", mfDAO.read(cm_no));
    
    mfDAO.likedown(cm_no); //�ʼ���!@@!!!! 
  
    JSONObject obj = new JSONObject();
    obj.put("likedown", mfDAO.likedown(cm_no));
    
    return obj.toJSONString();
  }  */

}