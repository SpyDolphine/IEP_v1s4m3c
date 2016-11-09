package dev.mvc.failreply;
 
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

import dev.mvc.interviewfail.*;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;
 
@Controller
public class FailReplyCont {
  @Autowired
  @Qualifier("dev.mvc.failreply.FailReplyDAO")
  private FailReplyDAOInter failreplyDAO;
  
  @Autowired
  @Qualifier("dev.mvc.interviewfail.IfDAO")
  private IfInter ifDAO;
  
  public FailReplyCont(){
    System.out.println("--> FailReplyCont created.");
  }
  

  @RequestMapping(value = "/failreply/create.do", method = RequestMethod.POST)
  public ModelAndView create(FailReplyVO failreplyVO,
                             HttpServletRequest request, 
                             HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (failreplyDAO.create(failreplyVO) == 1) {
      mav.setViewName("redirect:/failreply/replylist.do?if_no=" + failreplyVO.getIf_no());
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
   * if_no�� ���� ���(���ø��)
   * @param if_no
   * @return
   */
  @RequestMapping(value = "/failreply/replylist.do", method = RequestMethod.GET)
  public ModelAndView list(int if_no){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/failreply/replylist");      // list.jsp
    
    List<FailReplyVO> list = failreplyDAO.replylist(if_no);
    
    Iterator<FailReplyVO> iter = list.iterator();
    while(iter.hasNext() == true){  // ���� ��� �˻�
      FailReplyVO failreplyVO = iter.next();  // ��� ����
      failreplyVO.setRdate(failreplyVO.getRdate().substring(0, 10));   // ����� ������ ���
    }
    
    // ��� �� ���
    
    mav.addObject("replycnt", failreplyDAO.replycnt(if_no));
    mav.addObject("list", list);
    mav.addObject("if_no", if_no);

    
    
    return mav;
  }
  
  /**
   * ������
   * @param rno
   * @return
   */
  @RequestMapping(value="/failreply/update.do", 
                                method=RequestMethod.GET)
  public ModelAndView update(int rno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/failreply/update"); 
    mav.addObject("failreplyVO", failreplyDAO.replyread(rno)); 
 
    return mav;
  }
   
  /**
   * ���� ó��
   * @param failreplyVO
   * @return
   */
  @RequestMapping(value="/failreply/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(FailReplyVO failreplyVO,  
                                     HttpServletRequest request, 
                                     HttpSession session){
    ModelAndView mav = new ModelAndView();
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(failreplyDAO.update(failreplyVO) == 1){
      failreplyVO = failreplyDAO.replyread(failreplyVO.getRno());
      mav.setViewName("redirect:../failreply/replylist.do?if_no=" + failreplyVO.getIf_no());
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
  @RequestMapping(value = "/failreply/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int rno) {
    ModelAndView mav = new ModelAndView();

    FailReplyVO failreplyVO = failreplyDAO.replyread(rno);
    if (failreplyDAO.delete(rno) == 1) {
      mav.setViewName("redirect:/failreply/replylist.do?if_no=" + failreplyVO.getIf_no());
    } else {
    }
    return mav;
  }
 

  /**
   * �亯 ���
   * @param if_no
   * @return
   */
  @RequestMapping(value = "/failreply/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(FailReplyVO failreplyVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/failreply/reply"); 
    mav.addObject("failreplyVO", failreplyVO);
    
    failreplyVO = failreplyDAO.read(failreplyVO.getIf_no());
    mav.addObject("failreplyVO", failreplyVO);
    
    return mav;
  }
  
  /**
   * �亯 ó���Դϴ�
   * @param failreplyVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/failreply/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(FailReplyVO failreplyVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    FailReplyVO parentVO = failreplyDAO.read(failreplyVO.getRno()); // �θ�� ���� ����
    failreplyVO.setGrpno(parentVO.getGrpno()); // �׷� ��ȣ
    failreplyVO.setAnsnum(parentVO.getAnsnum()); // �亯 ����
    
    failreplyDAO.updateAnsnum(failreplyVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.
    
    failreplyVO.setIndent(parentVO.getIndent()+1); // �亯 ���� ����
    failreplyVO.setAnsnum(parentVO.getAnsnum()+1); //�θ� �ٷ� �Ʒ� ���
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    if (failreplyDAO.reply(failreplyVO) == 1) {
      mav.setViewName("redirect:/failreply/replylist.do");
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
  @RequestMapping(value = "/failreply/likeup.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeup(int rno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("rno", failreplyDAO.replyread(rno));
    
    int cnt = failreplyDAO.likeup(rno); //�ʼ���!@@!!!! 
    int likeup = failreplyDAO.replyread(rno).getLikeup();
  
    JSONObject obj = new JSONObject();
    obj.put("likeup", likeup);
    obj.put("rno", rno);
    
    return obj.toJSONString();
  }
  
  /**
   * ����õ ó��
   */
  @ResponseBody
  @RequestMapping(value = "/failreply/likedown.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likedown(int rno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("rno", failreplyDAO.replyread(rno));
    
    int cnt = failreplyDAO.likedown(rno);
    int likedown = failreplyDAO.replyread(rno).getLikedown();

    JSONObject obj = new JSONObject();
    obj.put("likedown", likedown);
    obj.put("rno", rno);
    
    return obj.toJSONString();
  }  
  
  
  /**
   * ���� ��ȸ�մϴ�
   * @param if_no
   * @return
   */
  @RequestMapping(value = "/failreply/read.do", method = RequestMethod.GET)
  public ModelAndView read(int if_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/failreply/read");
  
    FailReplyVO failreplyVO = failreplyDAO.read(if_no); 
    IfVO ifVO = ifDAO.read(if_no);
    
    mav.addObject("failreplyVO", failreplyVO); 
    mav.addObject("if_no", if_no); 
    
    return mav;
  }
   
  
}