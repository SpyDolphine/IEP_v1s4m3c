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
   * ���
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
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  /**
   * gu_no�� ���� ���(���ø��)
   * @param sc_no
   * @return
   */
  @RequestMapping(value = "/sdat/sdatlist.do", method = RequestMethod.GET)
  public ModelAndView list(int sc_no){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sdat/sdatlist");      // list.jsp
    
    List<SdatVO> list = sdatDAO.sdatlist(sc_no);
    
    Iterator<SdatVO> iter = list.iterator();
    while(iter.hasNext() == true){  // ���� ��� �˻�
      SdatVO sdatVO = iter.next();  // ��� ����
      sdatVO.setSd_date(sdatVO.getSd_date().substring(0, 10));   // ����� ������ ���
    }
    
    mav.addObject("list", list);
    mav.addObject("sc_no", sc_no);
    
    
    return mav;
  }
  
  /**
   * ������
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
   * ���� ó��
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
   * �亯 ���
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
   * �亯 ó���Դϴ�
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
 
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    SdatVO parentVO = sdatDAO.read(sdatVO.getSd_no()); // �θ�� ���� ����
    sdatVO.setGrpno(parentVO.getGrpno()); // �׷� ��ȣ
    sdatVO.setAnsnum(parentVO.getAnsnum()); // �亯 ����
    
    sdatDAO.updateAnsnum(sdatVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.
    
    sdatVO.setIndent(parentVO.getIndent()+1); // �亯 ���� ����
    sdatVO.setAnsnum(parentVO.getAnsnum()+1); //�θ� �ٷ� �Ʒ� ���
    // ---------- �亯 ���� �ڵ� ���� ---------- 
    
    if (sdatDAO.sdat(sdatVO) == 1) {
      mav.setViewName("redirect:/sdat/sdatlist.do");
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
  @RequestMapping(value = "/sdat/likeup.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String likeup(int sd_no) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("sd_no", sdatDAO.sdatread(sd_no));
    
    int cnt = sdatDAO.likeup(sd_no); //�ʼ���!@@!!!! 
    int likeup = sdatDAO.sdatread(sd_no).getLikeup();
  
    JSONObject obj = new JSONObject();
    obj.put("likeup", likeup);
    obj.put("sd_no",sd_no);
    
    return obj.toJSONString();
  }
  
  /**
   * ����õ ó��
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
   * ���� ��ȸ�մϴ�
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