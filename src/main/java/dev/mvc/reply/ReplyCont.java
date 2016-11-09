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
   * 등록
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
  @RequestMapping(value = "/reply/replylist.do", method = RequestMethod.GET)
  public ModelAndView list(int cm_no){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/reply/replylist");      // list.jsp
    
    List<ReplyVO> list = replyDAO.replylist(cm_no);
    
    Iterator<ReplyVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      ReplyVO replyVO = iter.next();  // 요소 추출
      replyVO.setRdate(replyVO.getRdate().substring(0, 10));   // 년월일 까지만 출력
    }
    
    mav.addObject("list", list);
    mav.addObject("cm_no", cm_no);
    
    
    return mav;
  }
  
  /**
   * 수정폼
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
   * 수정 처리
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
   * 답변 기능
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
   * 답변 처리입니다
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
 
    // ---------- 답변 관련 코드 시작 ---------- 
    ReplyVO parentVO = replyDAO.read(replyVO.getRno()); // 부모글 정보 추출
    replyVO.setGrpno(parentVO.getGrpno()); // 그룹 번호
    replyVO.setAnsnum(parentVO.getAnsnum()); // 답변 순서
    
    replyDAO.updateAnsnum(replyVO); // 현재 등록된 답변 뒤로 +1 처리함.
    
    replyVO.setIndent(parentVO.getIndent()+1); // 답변 차수 증가
    replyVO.setAnsnum(parentVO.getAnsnum()+1); //부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ---------- 
    
    if (replyDAO.reply(replyVO) == 1) {
      mav.setViewName("redirect:/reply/replylist.do");
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
  @RequestMapping(value = "/reply/likeup.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeup(int rno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("rno", replyDAO.replyread(rno));
    
    int cnt = replyDAO.likeup(rno); //필수템!@@!!!! 
    int likeup = replyDAO.replyread(rno).getLikeup();
  
    JSONObject obj = new JSONObject();
    obj.put("likeup", likeup);
    obj.put("rno", rno);
    
    return obj.toJSONString();
  }
  
  /**
   * 비추천 처리
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
   * 글을 조회합니다
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