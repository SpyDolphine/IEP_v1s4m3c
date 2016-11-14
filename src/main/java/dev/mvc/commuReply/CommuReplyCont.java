package dev.mvc.commuReply;
 
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

import dev.mvc.community.*;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;
 
@Controller
public class CommuReplyCont {
  @Autowired
  @Qualifier("dev.mvc.commuReply.CommuReplyDAO")
  private CommuReplyDAOInter commuReplyDAO;
  
  @Autowired
  @Qualifier("dev.mvc.community.CommuDAO")
  private CommuInter commuDAO;
  
  public CommuReplyCont(){
    System.out.println("--> CommuReplyCont created.");
  }
  

  @RequestMapping(value = "/commuReply/create.do", method = RequestMethod.POST)
  public ModelAndView create(CommuReplyVO commuReplyVO,
                             HttpServletRequest request, 
                             HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (commuReplyDAO.create(commuReplyVO) == 1) {
      mav.setViewName("redirect:/commuReply/replylist.do?cm_no=" + commuReplyVO.getCm_no());
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
   * cm_no에 의한 목록(선택목록)
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/commuReply/replylist.do", method = RequestMethod.GET)
  public ModelAndView list(int cm_no){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/commuReply/replylist");      // list.jsp
    
    List<CommuReplyVO> list = commuReplyDAO.replylist(cm_no);
    
    Iterator<CommuReplyVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      CommuReplyVO commuReplyVO = iter.next();  // 요소 추출
      commuReplyVO.setRdate(commuReplyVO.getRdate().substring(0, 10));   // 년월일 까지만 출력
    }
    
    // 댓글 수 출력
    
    mav.addObject("replycnt", commuReplyDAO.replycnt(cm_no));
    mav.addObject("list", list);
    mav.addObject("cm_no", cm_no);

    
    
    return mav;
  }
  
  /**
   * 수정폼
   * @param rno
   * @return
   */
  @RequestMapping(value="/commuReply/update.do", 
                                method=RequestMethod.GET)
  public ModelAndView update(int rno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/commuReply/update"); 
    mav.addObject("commuReplyVO", commuReplyDAO.replyread(rno)); 
 
    return mav;
  }
   
  /**
   * 수정 처리
   * @param commuReplyVO
   * @return
   */
  @RequestMapping(value="/commuReply/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(CommuReplyVO commuReplyVO,  
                                     HttpServletRequest request, 
                                     HttpSession session){
    ModelAndView mav = new ModelAndView();
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(commuReplyDAO.update(commuReplyVO) == 1){
      commuReplyVO = commuReplyDAO.replyread(commuReplyVO.getRno());
      mav.setViewName("redirect:../commuReply/replylist.do?cm_no=" + commuReplyVO.getCm_no());
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
  @RequestMapping(value = "/commuReply/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int rno) {
    ModelAndView mav = new ModelAndView();

    CommuReplyVO commuReplyVO = commuReplyDAO.replyread(rno);
    if (commuReplyDAO.delete(rno) == 1) {
      mav.setViewName("redirect:/commuReply/replylist.do?cm_no=" + commuReplyVO.getCm_no());
    } else {
    }
    return mav;
  }
 

  /**
   * 답변 기능
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/commuReply/reply.do", method = RequestMethod.GET)
  public ModelAndView reply(CommuReplyVO commuReplyVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/commuReply/reply"); 
    mav.addObject("commuReplyVO", commuReplyVO);
    
    commuReplyVO = commuReplyDAO.read(commuReplyVO.getCm_no());
    mav.addObject("commuReplyVO", commuReplyVO);
    
    return mav;
  }
  
  /**
   * 답변 처리입니다
   * @param commuReplyVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/commuReply/reply.do", method = RequestMethod.POST)
  public ModelAndView reply(CommuReplyVO commuReplyVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // ---------- 답변 관련 코드 시작 ---------- 
    CommuReplyVO parentVO = commuReplyDAO.read(commuReplyVO.getRno()); // 부모글 정보 추출
    commuReplyVO.setGrpno(parentVO.getGrpno()); // 그룹 번호
    commuReplyVO.setAnsnum(parentVO.getAnsnum()); // 답변 순서
    
    commuReplyDAO.updateAnsnum(commuReplyVO); // 현재 등록된 답변 뒤로 +1 처리함.
    
    commuReplyVO.setIndent(parentVO.getIndent()+1); // 답변 차수 증가
    commuReplyVO.setAnsnum(parentVO.getAnsnum()+1); //부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ---------- 
    
    if (commuReplyDAO.reply(commuReplyVO) == 1) {
      mav.setViewName("redirect:/commuReply/replylist.do");
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
  @RequestMapping(value = "/commuReply/likeup.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeup(int rno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("rno", commuReplyDAO.replyread(rno));
    
    int cnt = commuReplyDAO.likeup(rno); //필수템!@@!!!! 
    int likeup = commuReplyDAO.replyread(rno).getLikeup();
  
    JSONObject obj = new JSONObject();
    obj.put("likeup", likeup);
    obj.put("rno", rno);
    
    return obj.toJSONString();
  }
  
  /**
   * 비추천 처리
   */
  @ResponseBody
  @RequestMapping(value = "/commuReply/likedown.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likedown(int rno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("rno", commuReplyDAO.replyread(rno));
    
    int cnt = commuReplyDAO.likedown(rno);
    int likedown = commuReplyDAO.replyread(rno).getLikedown();

    JSONObject obj = new JSONObject();
    obj.put("likedown", likedown);
    obj.put("rno", rno);
    
    return obj.toJSONString();
  }  
  
  
  /**
   * 글을 조회합니다
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/commuReply/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cm_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/commuReply/read");
  
    CommuReplyVO commuReplyVO = commuReplyDAO.read(cm_no); 
    CommuVO commuVO = commuDAO.read(cm_no);
    
    mav.addObject("commuReplyVO", commuReplyVO); 
    mav.addObject("cm_no", cm_no); 
    
    return mav;
  }
   
  
}