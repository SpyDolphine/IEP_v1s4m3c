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
  msgs.add("�з������ �Ϸ��߽��ϴ�.");
  links.add("<button type='button' onclick=\"location.href='./login.do'\">�α���</button>");
  links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
  } else {
  msgs.add("�з���Ͽ� �����߽��ϴ�.");
  msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
  links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
  links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
  }
  
  links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
  
  mav.addObject("msgs", msgs);
  mav.addObject("links", links);
  
  return mav;
  }
  
  /**
   * ��ü ����� ����մϴ�.
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
   * ��� �����մϴ�
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
      msgs.add("Category ���� ���濡 �����߽��ϴ�.");
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
   * ���ڵ� 1���� �����մϴ�.
   * @param categoryno
   * @return
   */
  @RequestMapping(value = "/category/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(CategoryVO categoryVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // division ���̺��� �ڵ带 ����ϰ� �ִ��� �˻�
    // �ڵ忡 ��ϵ� �Խ��� ����
    // int count = divisionDAO.countByCategoryno(categoryVO.getCategoryno());
    
    int count = 0;
    
    if (count == 0){
      if (categoryDAO.delete(categoryVO.getCategoryno() ) == 1) {
        mav.setViewName("redirect:/category/list.do");
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
      msgs.add("���� �����Ϸ��� �ڵ忡 ��ϵ� �Խ��� " +count+ " ���� �ֽ��ϴ�.");
      msgs.add("�����Ϸ��� �Խ����� ��� �����ؾ� �ڵ� ������ �����մϴ�.");
      msgs.add("��з� �ڵ� ������ ���� �� �� �����ϴ�.");
      
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
 
    }
 
    return mav;
  }
  
}