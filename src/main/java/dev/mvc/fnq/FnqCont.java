package dev.mvc.fnq;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.servey.ServeyVO;

@Controller
public class FnqCont {
  @Autowired
  @Qualifier("dev.mvc.fnq.FnqDAO")
  private FnqDAOInter fnqDAO;

  
  public FnqCont(){
    System.out.println("--> FnqCont created.");
  }
  
  @RequestMapping(value = "/fnq/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/fnq/create"); // /webapp/fnq/create.jsp
  return mav;
  }
  
  @RequestMapping(value = "/fnq/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(FnqVO fnqVO) {
  ModelAndView mav = new ModelAndView();
  
  if (fnqDAO.create(fnqVO) == 1) {
    if(fnqVO.getFq_CH().equals("H")){
      mav.setViewName("redirect:/fnq/listh.do");
    }
    if(fnqVO.getFq_CH().equals("C")){
      mav.setViewName("redirect:/fnq/listc.do");
    }
  } else {
    
  }
  return mav;
  }
  
  /**
   * ȸ������ ����մϴ�.
   * @return
   */
  @RequestMapping(value = "/fnq/listc.do", 
                             method = RequestMethod.GET)
  public ModelAndView listc() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/fnq/list"); // /webapp/fnq/list.jsp
    mav.addObject("list", fnqDAO.listc());
    mav.addObject("ch", "ȸ��");
    return mav;
  }
  
  /**
   * ȸ������ ����մϴ�.
   * @return
   */
  @RequestMapping(value = "/fnq/listh.do", 
      method = RequestMethod.GET)
  public ModelAndView listh() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/fnq/list"); // /webapp/fnq/list.jsp
    mav.addObject("list", fnqDAO.listh());
    mav.addObject("ch", "Ȩ������");
    return mav;
  }
  
  @RequestMapping(value = "/fnq/update.do", method = RequestMethod.GET)
  public ModelAndView update(int fq_no) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/fnq/update"); // /webapp/fnq/create.jsp
  FnqVO fnqVO = fnqDAO.read(fq_no);
  mav.addObject("fnqVO", fnqVO); 
  return mav;
  }
  
  /**
   * �����մϴ�
   * @param fnqVO
   * @return
   */
  @RequestMapping(value = "/fnq/update.do", method = RequestMethod.POST)
  public ModelAndView update(FnqVO fnqVO) {
    ModelAndView mav = new ModelAndView();
 
    if (fnqDAO.update(fnqVO) == 1) {
      if(fnqVO.getFq_CH().equals("H")){
        mav.setViewName("redirect:/fnq/listh.do");
      }
      
      if(fnqVO.getFq_CH().equals("C")){
        mav.setViewName("redirect:/fnq/listc.do");
      }
    } else {
 
    }
    
    return mav;
  }
  /**
   * ���ڵ� 1���� �����մϴ�.
   * @param fq_no
   * @return
   */
  @RequestMapping(value = "/fnq/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int fq_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/fnq/delete");
    mav.addObject("fq_no", fq_no); 
    return mav;
  }
  
  @RequestMapping(value = "/fnq/delete.do", method = RequestMethod.POST)
  public ModelAndView delete2(int fq_no) {
    ModelAndView mav = new ModelAndView();
    FnqVO fnqVO = fnqDAO.read(fq_no);
    mav.addObject("fnqVO", fnqVO);
    if (fnqDAO.delete(fq_no) == 1) {
      if(fnqVO.getFq_CH().equals("H")){
        mav.setViewName("redirect:/fnq/listh.do");
      }
      
      if(fnqVO.getFq_CH().equals("C")){
        mav.setViewName("redirect:/fnq/listc.do");
      }
    } else {
    }
    return mav;
  }
}