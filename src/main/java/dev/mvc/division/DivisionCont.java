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
    
  msgs.add("�Խ����� �����Ǿ����ϴ�.");
  links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
  } else {
  msgs.add("�Խ��� ������ �����߽��ϴ�.");
  msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
  links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
  }
  
  links.add("<button type='button' onclick=\"location.href='./list.do'\">ī�װ� ���</button>");
  
  mav.addObject("msgs", msgs);
  mav.addObject("links", links);
  
  return mav;
  }
  
  /**
   * Category, Division ���̺��� ���캰�� �з��Ͽ� �����ɴϴ�.
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
    
    // �з��� ����
    for (int index=0; index < list.size(); index++){
      Category_Division_VO category_division_VO = list.get(index);
      if (index == 0){
        sort_list.add(category_division_VO.getSort()); // code ���̺��� �з���
      }else{
        // ���� sort(�з�)�� ���� sort(�з�)�� �ٸ���츸 ��Ͽ� �߰�
        if (list.get(index-1).getSort().equals(category_division_VO.getSort()) == false){
          sort_list.add(category_division_VO.getSort());    
        }
      }
    }
    //��з� ����� ��ȯ�ϸ鼭 ��з��� �ش��ϴ� ī�װ� ��� ����
    for (int index=0; index < sort_list.size(); index++){
      String sort = sort_list.get(index);//�ϳ��� ��з� ����
      sort_title.add("<LI class='sort'>"+sort+"</LI>"); // �ڵ� �з���
      
      for (int j=0; j < list.size(); j++){
        Category_Division_VO category_division_VO = list.get(j);//JOIN ��ü ����
        // ��з� ����� ��з���� ���� Join ��ü�� ��з����� ������
        // �˻��Ͽ� ��з����� ������� �߰�
        if (sort.equals(category_division_VO.getSort()) == true && category_division_VO.getTitle() != null){
          sort_title.add("<LI class='sort_title'><A href='/notice/category/list.do?categoryno="+category_division_VO.getCategoryno()+"'>" + category_division_VO.getTitle()+"</A>("+category_division_VO.getCnt()+")</LI>"); // �Խ��� ���� ����
        }
      }
      
    }
    
    mav.addObject("list", sort_title);
 
    return mav;
  }
  /**
   * Category, division ���̺��� ���캰�� �з��Ͽ� �����ɴϴ�.
   * @return
   */
  @RequestMapping(value = "/division/index_list.do", 
      method = RequestMethod.POST)
  public ModelAndView index_list_post(HttpServletRequest request) {
    ModelAndView mav = index_list_get(request);
    return mav;
  }
  
  /** 
   * Category, Division ���̺��� ���캰�� �з��Ͽ� �����ɴϴ�.
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
   * ���� �� ���
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
    System.out.println("��ȣ : "+divisionVO.getDivisionno());

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/division/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (divisionDAO.update(divisionVO) == 1) {
      mav.setViewName("redirect:/division/list.do");
    } else {
      msgs.add("�Խ��� ���� ���濡 �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
  
  /**
   * ���� �� ���
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
   * ���ڵ� 1���� �����մϴ�.
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
 
    // division ���̺��� �ڵ带 ����ϰ� �ִ��� �˻�
    // �ڵ忡 ��ϵ� �Խ��� ����
    // int count = blogcateDAO.countByCodeno(codeVO.getCodeno());
    int count = 0; // ���� �ʿ�
    
    if (count == 0){
      if (divisionDAO.delete(divisionVO.getDivisionno() ) == 1) {
        mav.setViewName("redirect:/division/list.do");
      } else {
        msgs.add("������ �����߽��ϴ�.");
        msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
        links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
        links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
        links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
        mav.addObject("msgs", msgs);
        mav.addObject("links", links);
      }
    }else{
      msgs.add("���� �����Ϸ��� �Խ��ǿ� ��ϵ� �ۼ� " +count+ " ���� �ֽ��ϴ�.");
      msgs.add("�����Ϸ��� ���� ��� �����ؾ� �Խ��� ������ �����մϴ�.");
      msgs.add("�Խ��� ������ ���� �� �� �����ϴ�.");
      
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
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
      msgs.add("��� ���� ���濡 �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
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
      msgs.add("��� ���� ���濡 �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
  
}