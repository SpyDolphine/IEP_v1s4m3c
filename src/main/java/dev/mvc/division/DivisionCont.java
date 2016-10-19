package dev.mvc.division;
 
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.category.CategoryDAOInter;
import dev.mvc.category.CategoryVO;

@Controller
public class DivisionCont {
  @Autowired
  @Qualifier("dev.mvc.category.CategoryDAO")
  private CategoryDAOInter categoryDAO;
  
  @Autowired
  @Qualifier("dev.mvc.division.DivisionDAO")
  private DivisionDAO divisionDAO;
  
  public DivisionCont(){
    System.out.println("--> DivisionCont created.");
  }
  
  @RequestMapping(value = "/division/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/division/create"); // /webapp/division/create.jsp
  List<CategoryVO> category_list = categoryDAO.list(); 
  mav.addObject("category_list", category_list);
  
  
  return mav;
  }
  
  @RequestMapping(value = "/division/create.do", method = RequestMethod.POST)
  public ModelAndView create(DivisionVO divisionVO) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/division/message");
  
  ArrayList<String> msgs = new ArrayList<String>();
  ArrayList<String> links = new ArrayList<String>();
  
  if (divisionDAO.create(divisionVO) == 1) {
    
  msgs.add("게시판이 생성되었습니다.");
  links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
  } else {
  msgs.add("게시판 생성에 실패했습니다.");
  msgs.add("죄송하지만 다시한번 시도해주세요.");
  links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
  }
  
  links.add("<button type='button' onclick=\"location.href='./list.do'\">카테고리 목록</button>");
  
  mav.addObject("msgs", msgs);
  mav.addObject("links", links);
  
  return mav;
  }
  
  /**
   * Category, Division 테이블을 구룹별로 분류하여 가져옵니다.
   * @return
   */
  @RequestMapping(value = "/division/index_list.do", 
                             method = RequestMethod.GET)
  public ModelAndView index_list_get(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/division/index_list"); // /division/index_list.jsp
    List<Category_Division_VO> list = divisionDAO.category_division_list();
    
    ArrayList<String> sort_list = new ArrayList<String>(); // Category: sort
    ArrayList<String> sort_title = new ArrayList<String>(); // division: sort
    
    // 분류명 추출
    for (int index=0; index < list.size(); index++){
      Category_Division_VO category_division_VO = list.get(index);
      if (index == 0){
        sort_list.add(category_division_VO.getSort()); // code 테이블의 분류명
      }else{
        // 이전 sort(분류)와 현재 sort(분류)가 다른경우만 목록에 추가
        if (list.get(index-1).getSort().equals(category_division_VO.getSort()) == false){
          sort_list.add(category_division_VO.getSort());    
        }
      }
    }
    //대분류 목록을 순환하면서 대분류에 해당하는 카테고리 목록 추출
    for (int index=0; index < sort_list.size(); index++){
      String sort = sort_list.get(index);//하나의 대분류 추출
      sort_title.add("<LI class='sort'>"+sort+"</LI>"); // 코드 분류명
      
      for (int j=0; j < list.size(); j++){
        Category_Division_VO category_division_VO = list.get(j);//JOIN 객체 추출
        // 대분류 목록의 대분류명과 련재 Join 객체의 대분류명이 같은지
        // 검사하여 대분류하의 목록으로 추가
        if (sort.equals(category_division_VO.getSort()) == true && category_division_VO.getTitle() != null){
          sort_title.add("<LI class='sort_title'><A href='/notice/category/list.do?categoryno="+category_division_VO.getCategoryno()+"'>" + category_division_VO.getTitle()+"</A>("+category_division_VO.getCnt()+")</LI>"); // 게시판 제목 추출
        }
      }
      
    }
    
    mav.addObject("list", sort_title);
 
    return mav;
  }
  /**
   * Category, division 테이블을 구룹별로 분류하여 가져옵니다.
   * @return
   */
  @RequestMapping(value = "/division/index_list.do", 
      method = RequestMethod.POST)
  public ModelAndView index_list_post(HttpServletRequest request) {
    ModelAndView mav = index_list_get(request);
    return mav;
  }
  
  /** 
   * Category, Division 테이블을 구룹별로 분류하여 가져옵니다.
   * @return
   */
  @RequestMapping(value = "/division/list.do", 
                             method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/division/list"); // /division/list.jsp
    List<Category_Division_VO> list = divisionDAO.list();

    mav.addObject("list", list);  
 
    return mav;
  }
  
  /**
   * 변경 폼 출력
   * @return
   */
  @RequestMapping(value = "/division/update.do", 
                             method = RequestMethod.GET)
  public ModelAndView update(int divisionno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/division/update"); // /webapp/division/update.jsp
    
    List<CategoryVO> category_list = categoryDAO.list();
    mav.addObject("category_list", category_list);
    
    DivisionVO divisionVO = divisionDAO.read(divisionno);
    mav.addObject("divisionVO",  divisionVO);
    
    return mav;
  }
 
  @RequestMapping(value = "/division/update.do", 
                                          method = RequestMethod.POST)
  public ModelAndView update(DivisionVO divisionVO, int divisionno) {
    
    System.out.println("divisionno : "+divisionno);
    System.out.println("번호 : "+divisionVO.getDivisionno());

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/division/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (divisionDAO.update(divisionVO) == 1) {
      mav.setViewName("redirect:/division/list.do");
    } else {
      msgs.add("게시판 정보 변경에 실패했습니다.");
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
   * 변경 폼 출력
   * @return
   */
  @RequestMapping(value = "/division/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete(int divisionno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/division/delete"); // /webapp/divisionno/delete.jsp
 
    mav.addObject("divisionno",  divisionno);
    
    return mav;
  }
  
  /**
   * 레코드 1건을 삭제합니다.
   * @param divisionno
   * @return
   */
  @RequestMapping(value = "/division/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(DivisionVO divisionVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/division/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // division 테이블에서 코드를 사용하고 있는지 검사
    // 코드에 등록된 게시판 갯수
    // int count = blogcateDAO.countByCodeno(codeVO.getCodeno());
    int count = 0; // 변경 필요
    
    if (count == 0){
      if (divisionDAO.delete(divisionVO.getDivisionno() ) == 1) {
        mav.setViewName("redirect:/division/list.do");
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
      msgs.add("현재 삭제하려는 게시판에 등록된 글수 " +count+ " 개가 있습니다.");
      msgs.add("삭제하려는 글을 모두 삭제해야 게시판 삭제가 가능합니다.");
      msgs.add("게시판 삭제후 복구 할 수 없습니다.");
      
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
 
    }
 
    return mav;
  }
  
  
  @RequestMapping(value = "/division/up.do", method = RequestMethod.GET)
  public ModelAndView up(DivisionVO divisionVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/division/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (divisionDAO.up(divisionVO) == 1) {
      mav.setViewName("redirect:/division/list.do");
    } else {
      msgs.add("출력 순서 변경에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
 
  @RequestMapping(value = "/division/down.do", method = RequestMethod.GET)
  public ModelAndView down(DivisionVO divisionVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/division/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (divisionDAO.down(divisionVO) == 1) {
      mav.setViewName("redirect:/division/list.do");
    } else {
      msgs.add("출력 순서 변경에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
  
}