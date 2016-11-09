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
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  /**
   * if_no에 의한 목록(선택목록)
   * @param if_no
   * @return
   */
  @RequestMapping(value = "/failreply/replylist.do", method = RequestMethod.GET)
  public ModelAndView list(int if_no){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/failreply/replylist");      // list.jsp
    
    List<FailReplyVO> list = failreplyDAO.replylist(if_no);
    
    Iterator<FailReplyVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      FailReplyVO failreplyVO = iter.next();  // 요소 추출
      failreplyVO.setRdate(failreplyVO.getRdate().substring(0, 10));   // 년월일 까지만 출력
    }
    
    // 댓글 수 출력
    
    mav.addObject("replycnt", failreplyDAO.replycnt(if_no));
    mav.addObject("list", list);
    mav.addObject("if_no", if_no);

    
    
    return mav;
  }
  
  /**
   * 수정폼
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
   * 수정 처리
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
      msgs.add("수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
     
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    
    return mav;
  }
  
  /**
   * 삭제폼
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
   * 답변 기능
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
   * 답변 처리입니다
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
 
    // ---------- 답변 관련 코드 시작 ---------- 
    FailReplyVO parentVO = failreplyDAO.read(failreplyVO.getRno()); // 부모글 정보 추출
    failreplyVO.setGrpno(parentVO.getGrpno()); // 그룹 번호
    failreplyVO.setAnsnum(parentVO.getAnsnum()); // 답변 순서
    
    failreplyDAO.updateAnsnum(failreplyVO); // 현재 등록된 답변 뒤로 +1 처리함.
    
    failreplyVO.setIndent(parentVO.getIndent()+1); // 답변 차수 증가
    failreplyVO.setAnsnum(parentVO.getAnsnum()+1); //부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ---------- 
    
    if (failreplyDAO.reply(failreplyVO) == 1) {
      mav.setViewName("redirect:/failreply/replylist.do");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links
          .add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  /**
   * 추천 처리
   */
  @ResponseBody
  @RequestMapping(value = "/failreply/likeup.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeup(int rno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("rno", failreplyDAO.replyread(rno));
    
    int cnt = failreplyDAO.likeup(rno); //필수템!@@!!!! 
    int likeup = failreplyDAO.replyread(rno).getLikeup();
  
    JSONObject obj = new JSONObject();
    obj.put("likeup", likeup);
    obj.put("rno", rno);
    
    return obj.toJSONString();
  }
  
  /**
   * 비추천 처리
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
   * 글을 조회합니다
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