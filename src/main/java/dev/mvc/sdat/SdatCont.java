package dev.mvc.sdat;
 
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

import dev.mvc.seico.*;

import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;
 
@Controller
public class SdatCont {
  @Autowired
  @Qualifier("dev.mvc.sdat.SdatDAO")
  private SdatDAOInter sdatDAO;
  
  @Autowired
  @Qualifier("dev.mvc.seico.SeicoDAO")
  private SeicoDAOInter SeicoDAO;
  
  public SdatCont(){
    System.out.println("--> SdatCont created.");
  }
  
  /**
   * 등록
   * @param sc_no
   * @return
   */
  @RequestMapping(value = "/sdat/create.do", method = RequestMethod.GET)
  public ModelAndView create(int sc_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sdat/create"); 
 
    SdatVO sdatVO = sdatDAO.read(sc_no);
    mav.addObject("sc_no", sc_no);
    
    return mav;
  }
 
  @RequestMapping(value = "/sdat/create.do", method = RequestMethod.POST)
  public ModelAndView create(SdatVO sdatVO,
                             HttpServletRequest request, 
                             HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (sdatDAO.create(sdatVO) == 1) {
      mav.setViewName("redirect:/sdat/sdatlist.do?sc_no=" + sdatVO.getSc_no());
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
   * @param sc_no
   * @return
   */
  @RequestMapping(value = "/sdat/sdatlist.do", method = RequestMethod.GET)
  public ModelAndView list(int sc_no){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sdat/sdatlist");      // list.jsp
    
    List<SdatVO> list = sdatDAO.sdatlist(sc_no);
    
    Iterator<SdatVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      SdatVO sdatVO = iter.next();  // 요소 추출
      sdatVO.setSd_date(sdatVO.getSd_date().substring(0, 10));   // 년월일 까지만 출력
    }
    
    mav.addObject("list", list);
    mav.addObject("sc_no", sc_no);
    
    
    return mav;
  }
  
  /**
   * 수정폼
   * @param sd_no
   * @return
   */
  @RequestMapping(value="/sdat/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int sd_no){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sdat/update"); 
    mav.addObject("sdatVO", sdatDAO.sdatread(sd_no)); 
 
    return mav;
  }
   
  /**
   * 수정 처리
   * @param sdatVO
   * @return
   */
  @RequestMapping(value="/sdat/update.do", 
                             method=RequestMethod.POST) 
  public ModelAndView update(SdatVO sdatVO,  
                                     HttpServletRequest request, 
                                     HttpSession session){
    ModelAndView mav = new ModelAndView();
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(sdatDAO.update(sdatVO) == 1){
      mav.setViewName("redirect:/sdat/sdatlist.do?sc_no=" + sdatVO.getSc_no());
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
   * @param sd_no
   * @return
   */
  @RequestMapping(value = "/sdat/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int sd_no) {
    ModelAndView mav = new ModelAndView();

    SdatVO sdatVO = sdatDAO.sdatread(sd_no);
    if (sdatDAO.delete(sd_no) == 1) {
      mav.setViewName("redirect:/sdat/sdatlist.do?sc_no=" + sdatVO.getSc_no());
    } else { 
    }
    return mav;
  }
 

  /**
   * 답변 기능
   * @param sc_no
   * @return
   */
  @RequestMapping(value = "/sdat/sdat.do", method = RequestMethod.GET)
  public ModelAndView reply(SdatVO sdatVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sdat/sdat"); 
    mav.addObject("sdatVO", sdatVO);
    
    sdatVO = sdatDAO.read(sdatVO.getSc_no());
    mav.addObject("sdatVO", sdatVO);
    
    return mav;
  }
  
  /**
   * 답변 처리입니다
   * @param datVO
   * @param request
   * @return
   */
  @RequestMapping(value = "/sdat/sdat.do", method = RequestMethod.POST)
  public ModelAndView sdat(SdatVO sdatVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // ---------- 답변 관련 코드 시작 ---------- 
    SdatVO parentVO = sdatDAO.read(sdatVO.getSd_no()); // 부모글 정보 추출
    sdatVO.setGrpno(parentVO.getGrpno()); // 그룹 번호
    sdatVO.setAnsnum(parentVO.getAnsnum()); // 답변 순서
    
    sdatDAO.updateAnsnum(sdatVO); // 현재 등록된 답변 뒤로 +1 처리함.
    
    sdatVO.setIndent(parentVO.getIndent()+1); // 답변 차수 증가
    sdatVO.setAnsnum(parentVO.getAnsnum()+1); //부모 바로 아래 등록
    // ---------- 답변 관련 코드 종료 ---------- 
    
    if (sdatDAO.sdat(sdatVO) == 1) {
      mav.setViewName("redirect:/sdat/sdatlist.do");
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
  @RequestMapping(value = "/sdat/likeup.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeup(int sd_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("sd_no", sdatDAO.sdatread(sd_no));
    
    int cnt = sdatDAO.likeup(sd_no); //필수템!@@!!!! 
    int likeup = sdatDAO.sdatread(sd_no).getLikeup();
  
    JSONObject obj = new JSONObject();
    obj.put("likeup", likeup);
    obj.put("sd_no",sd_no);
    
    return obj.toJSONString();
  }
  
  /**
   * 비추천 처리
   */
  @ResponseBody
  @RequestMapping(value = "/sdat/likedown.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likedown(int sd_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("sd_no", sdatDAO.sdatread(sd_no));
    
    int cnt = sdatDAO.likedown(sd_no);
    int likedown = sdatDAO.sdatread(sd_no).getLikedown();

    JSONObject obj = new JSONObject();
    obj.put("likedown", likedown);
    obj.put("sd_no", sd_no);
    
    return obj.toJSONString();
  }  
  
  
  /**
   * 글을 조회합니다
   * @param cm_no
   * @return
   */
  @RequestMapping(value = "/sdat/read.do", method = RequestMethod.GET)
  public ModelAndView read(int sc_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sdat/read");
  
    SdatVO sdatVO = sdatDAO.read(sc_no); 
    SeicoVO seicoVO = SeicoDAO.read(sc_no);
    
    mav.addObject("sdatVO", sdatVO); 
    mav.addObject("sc_no", sc_no); 
    
    return mav;
  }
   
  
}