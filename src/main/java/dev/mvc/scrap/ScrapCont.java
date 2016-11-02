package dev.mvc.scrap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.contest.ContestDAOInter;
import dev.mvc.contest.ContestVO;
import dev.mvc.memberEx.MemberExDAOInter;
import web.tool.SearchDTO;
import web.tool.Tool;

@Controller
public class ScrapCont {

  @Autowired
  @Qualifier("dev.mvc.scrap.ScrapDAO")
  private ScrapDAOInter scrapDAO;

  @Autowired
  @Qualifier("dev.mvc.memberEx.MemberExDAO")
  private MemberExDAOInter memberExDAO;

  @Autowired
  @Qualifier("dev.mvc.contest.ContestDAO")
  private ContestDAOInter contestDAO;

  @RequestMapping(value = "/scrap/create.do", method = RequestMethod.GET)
  public ModelAndView create(ScrapVO scrapVO) {
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/scrap/create"); // /webapp/blog/create.jsp
    mav.addObject("scrapVO", scrapVO);
    return mav;
  }

  @RequestMapping(value = "/scrap/create.do", method = RequestMethod.POST)
  public ModelAndView create(ScrapVO scrapVO, HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/scrap/message");
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    Integer itg = (Integer) (session.getAttribute("me_no"));
    scrapVO.setMe_no(itg.intValue());

    if (scrapDAO.create(scrapVO) == 1) {
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"javascript:opener.location.reload(); self.close();\">확인</button>");
      } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  @RequestMapping(value = "/scrap/list.do", method = RequestMethod.GET)
  public ModelAndView list(int me_no, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/scrap/list");

     List<ScrapVO> list = scrapDAO.list(me_no);
    mav.addObject("list", list);
    return mav;
  }
  @RequestMapping(value = "/scrap/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int sp_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/scrap/delete"); // /webapp/blog/delete.jsp
    mav.addObject("sp_no", sp_no);
   return mav;
  }
  
  @RequestMapping(value = "/scrap/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(ScrapVO scrapVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/scrap/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (scrapDAO.delete(scrapVO.getSp_no()) == 1) {
      msgs.add("글 삭제에 성공했습니다.");
      links.add("<button type='button' onclick=\"javascript:opener.location.reload(); self.close();\">목록</button>");
    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
}
