package dev.mvc.category;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryCont {
  @Autowired
  @Qualifier("dev.mvc.category.CategoryDAO")
  private CategoryDAOInter categoryDAO;

  public CategoryCont(){
    System.out.println("--> CategoryCont created.");
  }
  
  @RequestMapping(value = "/category/create.do", 
      method = RequestMethod.GET)
  public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/category/create"); // /webapp/category/create.jsp
  
  return mav;
  }
  @RequestMapping(value = "/category/create.do", 
      method = RequestMethod.POST)
  public ModelAndView create(CategoryVO categoryVO) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/message"); // /webapp/message.jsp
  
  ArrayList<String> msgs = new ArrayList<String>();
  ArrayList<String> links = new ArrayList<String>();
  
  if (categoryDAO.create(categoryVO) == 1) {
  msgs.add("분류등록을 완료했습니다.");
  links.add("<button type='button' onclick=\"location.href='./login.do'\">로그인</button>");
  links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
  } else {
  msgs.add("분류등록에 실패했습니다.");
  msgs.add("죄송하지만 다시한번 시도해주세요.");
  links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
  links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
  }
  
  links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
  
  mav.addObject("msgs", msgs);
  mav.addObject("links", links);
  
  return mav;
  }
  
  /**
   * 전체 목록을 출력합니다.
   * @return
   */
  @RequestMapping(value = "/category/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/category/list"); // /webapp/category/list.jsp
    mav.addObject("list", categoryDAO.list());

    return mav;
  }
  
  @RequestMapping(value = "/category/update.do", 
      method = RequestMethod.GET)
  public ModelAndView update(int categoryno) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/category/update"); // /webapp/category/create.jsp
  CategoryVO categoryVO = categoryDAO.read(categoryno);
  mav.addObject("categoryVO", categoryVO); 
   
  return mav;
  }
  
  /**
   * 목록 수정합니다
   * @param categoryVO
   * @return
   */
  @RequestMapping(value = "/category/update.do", method = RequestMethod.POST)
  public ModelAndView update(CategoryVO categoryVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (categoryDAO.update(categoryVO) == 1) {
      mav.setViewName("redirect:/category/list.do");
    } else {
      msgs.add("Category 정보 변경에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
  
  /**
   * 레코드 1건을 삭제합니다.
   * @param categoryno
   * @return
   */
  @RequestMapping(value = "/category/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(CategoryVO categoryVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // division 테이블에서 코드를 사용하고 있는지 검사
    // 코드에 등록된 게시판 갯수
    // int count = divisionDAO.countByCategoryno(categoryVO.getCategoryno());
    
    int count = 0;
    
    if (count == 0){
      if (categoryDAO.delete(categoryVO.getCategoryno() ) == 1) {
        mav.setViewName("redirect:/category/list.do");
      } else {
        msgs.add("삭제에 실패했습니다.");
        msgs.add("죄송하지만 다시한번 시도해주세요.");
        links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
        links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
        links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
        mav.addObject("msgs", msgs);
        mav.addObject("links", links);
 
      }
    }else{
      msgs.add("현재 삭제하려는 코드에 등록된 게시판 " +count+ " 개가 있습니다.");
      msgs.add("삭제하려는 게시판을 모두 삭제해야 코드 삭제가 가능합니다.");
      msgs.add("대분류 코드 삭제후 복구 할 수 없습니다.");
      
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
 
    }
 
    return mav;
  }
  
}