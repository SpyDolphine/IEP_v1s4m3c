package dev.mvc.dat;
 
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

import dev.mvc.gurume.*;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;
 
@Controller
public class DatCont {
  @Autowired
  @Qualifier("dev.mvc.dat.DatDAO")
  private DatDAOInter datDAO;
  
  @Autowired
  @Qualifier("dev.mvc.gurume.GurumeDAO")
  private GurumeDAOInter GurumeDAO;
  
  public DatCont(){
    System.out.println("--> DatCont created.");
  }
  
  /**
   * 등록
   * @param gu_no
   * @return
   */
  @RequestMapping(value = "/dat/create.do", method = RequestMethod.GET)
  public ModelAndView create(int gu_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/dat/create"); 
 
    DatVO datVO = datDAO.read(gu_no);
    mav.addObject("gu_no", gu_no);
    
    return mav;
  }
 
  @RequestMapping(value = "/dat/create.do", method = RequestMethod.POST)
  public ModelAndView create(DatVO datVO,
                             HttpServletRequest request, 
                             HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (datDAO.create(datVO) == 1) {
      mav.setViewName("redirect:/dat/datlist.do?gu_no=" + datVO.getGu_no());
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
   * gu_no에 의한 목록(선택목록)
   * @param gu_no
   * @return
   */
  @RequestMapping(value = "/dat/datlist.do", method = RequestMethod.GET)
  public ModelAndView list(int gu_no){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/dat/datlist");      // list.jsp
    
    List<DatVO> list = datDAO.datlist(gu_no);
    
    Iterator<DatVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      DatVO datVO = iter.next();  // 요소 추출
      datVO.setD_date(datVO.getD_date().substring(0, 10));   // 년월일 까지만 출력
    }
    
    mav.addObject("list", list);
    mav.addObject("gu_no", gu_no);
    
    
    return mav;
  }
  
  /**
   * 수정폼
   * @param dno
   * @return
   */
  @RequestMapping(value="/dat/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int dno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/dat/update"); 
    mav.addObject("datVO", datDAO.datread(dno)); 
 
    return mav;
  }
   
  /**
   * 수정 처리
   * @param datVO
   * @return
   */
  @RequestMapping(value="/dat/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(DatVO datVO,  
                                     HttpServletRequest request, 
                                     HttpSession session){
    ModelAndView mav = new ModelAndView();
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(datDAO.update(datVO) == 1){
      mav.setViewName("redirect:/dat/datlist.do?gu_no=" + datVO.getGu_no());
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
   * @param dno
   * @return
   */
  @RequestMapping(value = "/dat/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int dno) {
    ModelAndView mav = new ModelAndView();

    DatVO datVO = datDAO.datread(dno);
    if (datDAO.delete(dno) == 1) {
      mav.setViewName("redirect:/dat/datlist.do?gu_no=" + datVO.getGu_no());
    } else { 
    }
    return mav;
  }
 

  /**
   * 답변 기능
   * @param gu_no
   * @return
   */
  @RequestMapping(value = "/dat/dat.do", method = RequestMethod.GET)
  public ModelAndView dat(DatVO datVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/dat/dat"); 
    mav.addObject("datVO", datVO);
    
    datVO = datDAO.read(datVO.getGu_no());
    mav.addObject("datVO", datVO);
    
    return mav;
  }
  
  /**
   * 답변 처리입니다
   * @param datVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/dat/dat.do", method = RequestMethod.POST)
  public ModelAndView dat(DatVO datVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // ---------- 답변 관련 코드 시작 ---------- 
    DatVO parentVO = datDAO.read(datVO.getDno()); // 부모글 정보 추출
    datVO.setGrpno(parentVO.getGrpno()); // 그룹 번호
    datVO.setAnsnum(parentVO.getAnsnum()); // 답변 순서
    
    datDAO.updateAnsnum(datVO); // 현재 등록된 답변 뒤로 +1 처리함.
    
    datVO.setIndent(parentVO.getIndent()+1); // 답변 차수 증가
    datVO.setAnsnum(parentVO.getAnsnum()+1); //부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ---------- 
    
    if (datDAO.dat(datVO) == 1) {
      mav.setViewName("redirect:/dat/datlist.do");
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
  @RequestMapping(value = "/dat/likeup.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeup(int dno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("dno", datDAO.datread(dno));
    
    int cnt = datDAO.likeup(dno); //필수템!@@!!!! 
    int likeup = datDAO.datread(dno).getLikeup();
  
    JSONObject obj = new JSONObject();
    obj.put("likeup", likeup);
    obj.put("dno", dno);
    
    return obj.toJSONString();
  }
  
  /**
   * 비추천 처리
   */
  @ResponseBody
  @RequestMapping(value = "/dat/likedown.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likedown(int dno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("dno", datDAO.datread(dno));
    
    int cnt = datDAO.likedown(dno);
    int likedown = datDAO.datread(dno).getLikedown();

    JSONObject obj = new JSONObject();
    obj.put("likedown", likedown);
    obj.put("dno", dno);
    
    return obj.toJSONString();
  }  
  
  
  /**
   * 글을 조회합니다
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/dat/read.do", method = RequestMethod.GET)
  public ModelAndView read(int gu_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/dat/read");
  
    DatVO datVO = datDAO.read(gu_no); 
    GurumeVO gurumeVO = GurumeDAO.read(gu_no);
    
    mav.addObject("datVO", datVO); 
    mav.addObject("gu_no", gu_no); 
    
    return mav;
  }
   
  
}