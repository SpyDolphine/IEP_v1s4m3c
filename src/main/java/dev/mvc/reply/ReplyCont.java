package dev.mvc.reply;
 
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cfree.*;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;
 
@Controller
public class ReplyCont {
  @Autowired
  @Qualifier("dev.mvc.reply.ReplyDAO")
  private ReplyDAOInter replyDAO;
  
  @Autowired
  @Qualifier("dev.mvc.cfree.CmDAO")
  private CmInter cmDAO;
  
  public ReplyCont(){
    System.out.println("--> ReplyCont created.");
  }
  
  /**
   * ���
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/reply/create.do", method = RequestMethod.GET)
  public ModelAndView create(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/reply/create"); 
 
    ReplyVO replyVO = replyDAO.read(cm_no);
    mav.addObject("cm_no", cm_no);
    
    return mav;
  }
 
  @RequestMapping(value = "/reply/create.do", method = RequestMethod.POST)
  public ModelAndView create(ReplyVO replyVO,
                             HttpServletRequest request, 
                             HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (replyDAO.create(replyVO) == 1) {
      mav.setViewName("redirect:/reply/replylist.do?cm_no=" + replyVO.getCm_no());
    } else {
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  /**
   * cm_no�� ���� ���(���ø��)
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/reply/replylist.do", method = RequestMethod.GET)
  public ModelAndView list(int cm_no){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/reply/replylist");      // list.jsp
    
    List<ReplyVO> list = replyDAO.replylist(cm_no);
    
    Iterator<ReplyVO> iter = list.iterator();
    while(iter.hasNext() == true){  // ���� ��� �˻�
      ReplyVO replyVO = iter.next();  // ��� ����
      replyVO.setRdate(replyVO.getRdate().substring(0, 10));   // ����� ������ ���
    }
    
    mav.addObject("list", list);
    mav.addObject("cm_no", cm_no);
    
    
    return mav;
  }
  
  /**
   * ������
   * @param rno
   * @return
   */
  @RequestMapping(value="/reply/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int rno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/reply/update"); 
    mav.addObject("replyVO", replyDAO.replyread(rno)); 
 
    return mav;
  }
   
  /**
   * ���� ó��
   * @param replyVO
   * @return
   */
  @RequestMapping(value="/reply/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(ReplyVO replyVO,  
                                     HttpServletRequest request, 
                                     HttpSession session){
    ModelAndView mav = new ModelAndView();
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(replyDAO.update(replyVO) == 1){
      mav.setViewName("redirect:/reply/replylist.do?cm_no=" + replyVO.getCm_no());
    }else{
      msgs.add("������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
     
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    
    return mav;
  }
  
  /**
   * ������
   * @param rno
   * @return
   */
  @RequestMapping(value = "/reply/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int rno) {
    ModelAndView mav = new ModelAndView();

    ReplyVO replyVO = replyDAO.replyread(rno);
    if (replyDAO.delete(rno) == 1) {
      mav.setViewName("redirect:/reply/replylist.do?cm_no=" + replyVO.getCm_no());
    } else {
    }
    return mav;
  }
 

  /**
   * �亯 ���
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/reply/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(ReplyVO replyVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/reply/reply"); 
    mav.addObject("replyVO", replyVO);
    
    replyVO = replyDAO.read(replyVO.getCm_no());
    mav.addObject("replyVO", replyVO);
    
    return mav;
  }
  
  /**
   * �亯 ó���Դϴ�
   * @param replyVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/reply/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(ReplyVO replyVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    ReplyVO parentVO = replyDAO.read(replyVO.getRno()); // �θ�� ���� ����
    replyVO.setGrpno(parentVO.getGrpno()); // �׷� ��ȣ
    replyVO.setAnsnum(parentVO.getAnsnum()); // �亯 ����
    
    replyDAO.updateAnsnum(replyVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.
    
    replyVO.setIndent(parentVO.getIndent()+1); // �亯 ���� ����
    replyVO.setAnsnum(parentVO.getAnsnum()+1); //�θ� �ٷ� �Ʒ� ���
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    if (replyDAO.reply(replyVO) == 1) {
      mav.setViewName("redirect:/reply/replylist.do");
    } else {
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links
          .add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  /**
   * ��õ ó��
   */
  @ResponseBody
  @RequestMapping(value = "/reply/likeup.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeup(int rno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("rno", replyDAO.replyread(rno));
    
    int cnt = replyDAO.likeup(rno); //�ʼ���!@@!!!! 
    int likeup = replyDAO.replyread(rno).getLikeup();
  
    JSONObject obj = new JSONObject();
    obj.put("likeup", likeup);
    obj.put("rno", rno);
    
    return obj.toJSONString();
  }
  
  /**
   * ����õ ó��
   */
  @ResponseBody
  @RequestMapping(value = "/reply/likedown.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likedown(int rno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("rno", replyDAO.replyread(rno));
    
    int cnt = replyDAO.likedown(rno);
    int likedown = replyDAO.replyread(rno).getLikedown();

    JSONObject obj = new JSONObject();
    obj.put("likedown", likedown);
    obj.put("rno", rno);
    
    return obj.toJSONString();
  }  
  
  
  /**
   * ���� ��ȸ�մϴ�
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/reply/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/reply/read");
  
    ReplyVO replyVO = replyDAO.read(cm_no); 
    CmVO cmVO = cmDAO.read(cm_no);
    
    mav.addObject("replyVO", replyVO); 
    mav.addObject("cm_no", cm_no); 
    
    return mav;
  }
   
  
}