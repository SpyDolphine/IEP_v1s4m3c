package dev.mvc.memberEx;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import web.tool.AES256Util;
import web.tool.DESedeCrypto;
import web.tool.Tool;

@Controller
public class MemberExCont {

  @Autowired
  @Qualifier("dev.mvc.memberEx.MemberExDAO")
  private MemberExDAOInter memberExDAO;

  @RequestMapping(value = "/memberex/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/memberexv1_create");
    return mav;
  }
  
  @RequestMapping(value = "/memberex/create.do", method = RequestMethod.POST)
  public ModelAndView create(MemberExVO memberexVO, DESedeCrypto security) {
    System.out.println("--> create() Post called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/message");
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    // ����Ű ��� 

    // ��й�ȣ ��ȣȭ�Ͽ� ����
    String me_pw = memberexVO.getMe_pw();
    AES256Util aes256;
    try {
      aes256 = new AES256Util();
      String me_pwsc = aes256.aesEncode(me_pw);
      memberexVO.setMe_pw(me_pwsc);
      
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    
    
    
    if (memberExDAO.create(memberexVO) == 1) {

      msgs.add("ȸ�������� ó���Ǿ����ϴ�.");
      msgs.add("�������ּż� �����մϴ�.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">�α���</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("ȸ�� ���Կ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./index.do'\">Ȩ������</button>");
    }
    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  @RequestMapping(value = "/memberex/create_com.do", method = RequestMethod.GET)
  public ModelAndView create_com() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/memberexv1_create_com");
    return mav;
  }
  
  @RequestMapping(value = "/memberex/create_com.do", method = RequestMethod.POST)
  public ModelAndView create_com(MemberExVO memberexVO) {
    System.out.println("--> create() Post called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // ����Ű ��� 
    String auth = Tool.key();
    
    memberexVO.setMe_auth(auth);
    // ��й�ȣ ��ȣȭ�Ͽ� ����
    String me_pw = memberexVO.getMe_pw();
    AES256Util aes256;
    try {
      aes256 = new AES256Util();
      String me_pwsc = aes256.aesEncode(me_pw);
      memberexVO.setMe_pw(me_pwsc);
      
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    
    if (memberExDAO.create_com(memberexVO) == 1) {
      msgs.add("ȸ�������� ó���Ǿ����ϴ�.");
      msgs.add("�������ּż� �����մϴ�.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">�α���</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("ȸ�� ���Կ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./index.do'\">Ȩ������</button>");
    }
    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  /**
   * �ߺ� ���̵� �˻��մϴ�.
   * 
   * @param me_id
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/memberex/checkId.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String checkId(String me_id) {

    JSONObject obj = new JSONObject();

    int cnt = memberExDAO.checkId(me_id);
    obj.put("cnt", cnt);

    return obj.toJSONString();
  }

  /**
   * �ߺ� �г����� �˻��մϴ�.
   * 
   * @param me_nick
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/memberex/checkNick.do", 
                            method = RequestMethod.POST, 
                            produces = "text/plain;charset=UTF-8")
  public String checkNick(String me_nick) {

    JSONObject obj = new JSONObject();

    int cnt = memberExDAO.checkNick(me_nick);
    obj.put("cnt", cnt);

    return obj.toJSONString();
  }

  @ResponseBody
  @RequestMapping(value = "/object", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String object(Locale locale, Model model) {

    JSONObject obj = new JSONObject();

    obj.put("name", "Spring ����");

    return obj.toJSONString();
  }

  @RequestMapping(value = "/memberex/read.do", method = RequestMethod.GET)
  public ModelAndView read(int me_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/member_read");
    mav.addObject("memberExVO", memberExDAO.read(me_no));

    return mav;
  }

  /*
   * �α��� ��
   */
  @RequestMapping(value = "/memberex/login.do", method = RequestMethod.GET)
  public ModelAndView login() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/login_form"); // webapp/member/login_ck_form.jsp

    return mav;
  }

  @RequestMapping(value = "/memberex/login.do", method = RequestMethod.POST)
  public ModelAndView login(MemberExVO memberExVO, HttpSession session, HttpServletRequest request,
      HttpServletResponse response, String me_id) {
    ModelAndView mav = new ModelAndView();
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // ��й�ȣ ��ȣȭ�Ͽ� ����
    String me_pw = memberExVO.getMe_pw();
    AES256Util aes256;
    try {
      aes256 = new AES256Util();
      String me_pwsc = aes256.aesEncode(me_pw);
      memberExVO.setMe_pw(me_pwsc);
      
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    
   if (memberExDAO.login(memberExVO) == 1) {
      session.setAttribute("me_id", memberExVO.getMe_id());
      session.setAttribute("me_pw", memberExVO.getMe_pw());
      
      if (memberExDAO.memberInfo(me_id) != null) {
        int me_no = memberExDAO.memberInfo(me_id).getMe_no();
        String me_nick = memberExDAO.memberInfo(me_id).getMe_nick();
        String me_grade = memberExDAO.memberInfo(me_id).getMe_grade();
        String me_vis = memberExDAO.memberInfo(me_id).getMe_vis();
        session.setAttribute("me_no", me_no);
        session.setAttribute("me_nick", me_nick);
        session.setAttribute("me_grade", me_grade);
        session.setAttribute("me_vis", me_vis);
      }
      // ------------------------------------------------------------------
      // id ���� ���� ��Ű ����
      // ------------------------------------------------------------------
      String id_save = Tool.checkNull(memberExVO.getId_save());
      if (id_save.equals("Y")) { // id ���� �� ���
        Cookie ck_id = new Cookie("ck_id", memberExVO.getMe_id()); // id ����
        ck_id.setMaxAge(600); // �� ���� 10��
        response.addCookie(ck_id);
      } else { // id�� �������� ���� ���
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0); // ��
        response.addCookie(ck_id);
      }
      // id ���� ���θ� �����ϴ� ��� ���, Y or "" ����
      Cookie ck_id_save = new Cookie("ck_id_save", memberExVO.getId_save());
      ck_id_save.setMaxAge(600); // ��
      response.addCookie(ck_id_save);
      // ------------------------------------------------------------------

      // ------------------------------------------------------------------
      // passwd ���� ���� ��Ű ����
      // ------------------------------------------------------------------
      String passwd_save = Tool.checkNull(memberExVO.getPasswd_save());
      if (passwd_save.equals("Y")) {
        Cookie ck_passwd = new Cookie("ck_passwd", memberExVO.getMe_pw());
        ck_passwd.setMaxAge(600); // ��
        response.addCookie(ck_passwd);

      } else { // passwd�� �������� ���� ���
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setMaxAge(0); // ��
        response.addCookie(ck_passwd);
      }
      // passwd ���� ���θ� �����ϴ� ��� ���, Y or "" ����
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", memberExVO.getPasswd_save());
      ck_passwd_save.setMaxAge(600); // ��
      response.addCookie(ck_passwd_save);
      // ------------------------------------------------------------------

      String url_address = Tool.checkNull(memberExVO.getUrl_address());

      if (url_address.length() > 0) {
        mav.setViewName("redirect:" + memberExVO.getUrl_address());
      } else {
        System.out.println("--> index.jsp �������� �̵��մϴ�.");
        mav.setViewName("redirect:/index.do"); // Ȯ���� ���
      }

    } else {
      mav.setViewName("/memberex/message");
      msgs.add("�α��ο� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./index.do'\">Ȩ������</button>");
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;

  }

  @RequestMapping(value = "/memberex/logout.do", method = RequestMethod.GET)
  public ModelAndView logout(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/message"); // /webapp/member/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    msgs.add("�̿����ּż� �����մϴ�.");
    msgs.add("from ���...");
    links.add("<button type='button' onclick=\"location.href='../index.jsp'\">Ȩ������</button>");

    session.invalidate(); // session ���� ����

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/memberex/update.do", method = RequestMethod.POST)
  public ModelAndView update(MemberExVO memberExVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (memberExDAO.update(memberExVO) == 1) {
      msgs.add("ȸ�������� �����Ǿ����ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./read.do?me_no=" + memberExVO.getMe_no()
          + "'\">����� ȸ������ Ȯ��</button>");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ������</button>");
    } else {
      msgs.add("ȸ�� ���� ���濡 �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ������</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./index.jsp'\">���</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  // @RequestMapping(value = "/index.do", method = RequestMethod.GET)
  // public ModelAndView memberInfo(
  // HttpSession session,
  // HttpServletRequest request,
  // String me_id) {
  // ModelAndView mav = new ModelAndView();
  // mav.setViewName("/index");
  // mav.addObject("memberExVO", memberExDAO.memberInfo(me_id));
  //
  // return mav;
  // }
  @RequestMapping(value = "/index.do", method = RequestMethod.GET)
  public ModelAndView memberInfo(MemberExVO memberExVO, HttpSession session, HttpServletRequest request, String me_id) {
    System.out.println("--> ����� ����: " + request.getRemoteAddr());
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/index"); // /webapp/index.jsp
    return mav;
  }
@RequestMapping(value = "/memberex/memberout.do", method = RequestMethod.GET)
public ModelAndView memberout(MemberExVO memberExVO){
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/memberex/memberout");
  return mav;
  
}
  @RequestMapping(value = "/memberex/memberout.do", method = RequestMethod.POST)
  public ModelAndView memberout(MemberExVO memberExVO, HttpSession session, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/message");
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (memberExDAO.memberout(memberExVO) == 1) {
      msgs.add("ȸ�� Ż�� �Ϸ� �Ǿ����ϴ�.");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ������</button>");
      session.invalidate(); // session ���� ����
    } else {
      msgs.add("ȸ��Ż�� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
     
    }
  
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  @RequestMapping(value = "/memberex/memberin.do", method = RequestMethod.GET)
  public ModelAndView memberin(MemberExVO memberExVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/memberin");
    return mav;
    
  }
  @RequestMapping(value = "/memberex/memberin.do", method = RequestMethod.POST)
  public ModelAndView memberin(MemberExVO memberExVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/message");
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (memberExDAO.memberin(memberExVO) == 1) {
      msgs.add("ȸ�� ���Ͱ� �Ϸ� �Ǿ����ϴ�.");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ������</button>");
    } else {
      msgs.add("ȸ�� ���Ͱ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
      System.out.println(memberExDAO.memberout(memberExVO));   
     
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    return mav;
  }
  @RequestMapping(value = "/memberex/memberlist.do", method = RequestMethod.GET)
  public ModelAndView memberlist() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/memberlist");  // /webapp/member/list.jsp
    mav.addObject("memberlist", memberExDAO.memberlist());
 
    return mav;
  }
  @RequestMapping(value = "/memberex/passwd.do", method = RequestMethod.GET)
  public ModelAndView passwd(int me_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/passwd"); // /webapp/member/passwd.jsp
 
    mav.addObject("me_no", me_no);
    return mav;
  }
  
  @RequestMapping(value = "/memberex/passwd.do", method = RequestMethod.POST)
  public ModelAndView passwd(MemberExVO memberExVO) {
    System.out.println("���� �н�����: " + memberExVO.getOld_passwd());
    System.out.println("���ο� �н�����: " + memberExVO.getMe_pw());
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    String me_pw = memberExVO.getMe_pw();
    AES256Util aes256;
    try {
      aes256 = new AES256Util();
      String me_pwsc = aes256.aesEncode(me_pw);
      memberExVO.setMe_pw(me_pwsc);
      
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    
    // ���� �н����� ��ġ ���� �˻�
    if (memberExDAO.passwdCheck(memberExVO.getMe_no(), memberExVO.getOld_passwd()) == 1){
      // �н����� ���� ����
      if (memberExDAO.update_passwd(memberExVO.getMe_no(), memberExVO.getMe_pw()) == 1) {
        msgs.add("�н����带 �����߽��ϴ�.");
      } else {
        msgs.add("�н����� ���濡 �����߽��ϴ�.");
        msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
        links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
        links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ������</button>");
      } 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
     }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
}
