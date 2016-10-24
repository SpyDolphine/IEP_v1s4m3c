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

import web.tool.Tool;

@Controller
public class MemberExCont {
  
  @Autowired
  @Qualifier("dev.mvc.memberEx.MemberExDAO")
  private MemberExDAOInter memberExDAO;
      
 @RequestMapping(value = "/memberex/create.do", method = RequestMethod.GET)
  public ModelAndView create(){
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/memberexv1_create");
    
    return mav;
  }
  @RequestMapping(value = "/memberex/create.do", method = RequestMethod.POST)
  public ModelAndView create(MemberExVO memberexVO){
    System.out.println("--> create() Post called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/message");
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (memberExDAO.create(memberexVO) == 1) {
      msgs.add("회원가입이 처리되었습니다.");
      msgs.add("가입해주셔서 감사합니다.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">로그인</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("회원 가입에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./index.do'\">홈페이지</button>");
    }
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  /**
   * 중복 아이디를 검사합니다.
   * 
   * @param me_id
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/memberex/checkId.do",
                  method = RequestMethod.POST,
                  produces = "text/plain;charset=UTF-8")
  public String checkId(String me_id) {
 
    JSONObject obj = new JSONObject();
 
    int cnt = memberExDAO.checkId(me_id);
    obj.put("cnt", cnt);
 
    return obj.toJSONString();
  }
  /**
   * 중복 닉네임을 검사합니다.
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
 
    int cnt = memberExDAO.checkId(me_nick);
    obj.put("cnt", cnt);
 
    return obj.toJSONString();
  }
  @ResponseBody
  @RequestMapping(value = "/object", 
                            method = RequestMethod.GET,
                            produces="text/plain;charset=UTF-8")
  public String object(Locale locale, Model model) {
    
    JSONObject obj = new JSONObject();
    
    obj.put("name","Spring 수업");
 
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
   * 로그인 폼  
   */
  @RequestMapping(value = "/memberex/login.do", method = RequestMethod.GET)
  public ModelAndView login() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memberex/login_form");  //webapp/member/login_ck_form.jsp
   
    return mav;
  }

  @RequestMapping(value = "/memberex/login.do", method = RequestMethod.POST)
  public ModelAndView login(MemberExVO memberExVO, 
                                         HttpSession session, 
                                         HttpServletRequest request,
                                        HttpServletResponse response 
                                         ) {
    ModelAndView mav = new ModelAndView();
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (memberExDAO.login(memberExVO)  == 1) {
      session.setAttribute("me_id", memberExVO.getMe_id());
      session.setAttribute("me_pw", memberExVO.getMe_pw());
      session.setAttribute("me_nick", memberExVO.getMe_nick());
      session.setAttribute("me_no", memberExVO.getMe_no());
      memberExDAO.memberInfo(memberExVO);
      mav.addObject("memberExVO", memberExVO.getMe_nick());
      
      // ------------------------------------------------------------------
      // id 저장 관련 쿠키 저장
      // ------------------------------------------------------------------
      String id_save = Tool.checkNull(memberExVO.getId_save());
      if (id_save.equals("Y")){ // id 저장 할 경우
        Cookie ck_id = new Cookie("ck_id", memberExVO.getMe_id()); // id 저장
        ck_id.setMaxAge(600); // 초 단위 10분
        response.addCookie(ck_id);
      }else{ // id를 저장하지 않을 경우
        Cookie ck_id = new Cookie("ck_id", ""); 
        ck_id.setMaxAge(0); // 초
        response.addCookie(ck_id);
      }
      // id 저장 여부를 결정하는 쿠기 기록, Y or "" 저장
      Cookie ck_id_save = new Cookie("ck_id_save", memberExVO.getId_save());
      ck_id_save.setMaxAge(600); // 초
      response.addCookie(ck_id_save);
      // ------------------------------------------------------------------
   
      // ------------------------------------------------------------------
      // passwd 저장 관련 쿠키 저장
      // ------------------------------------------------------------------
      String passwd_save = Tool.checkNull(memberExVO.getPasswd_save());
      if (passwd_save.equals("Y")){ 
        Cookie ck_passwd = new Cookie("ck_passwd", memberExVO.getMe_pw()); 
        ck_passwd.setMaxAge(600); // 초
        response.addCookie(ck_passwd);
        
      }else{ // passwd를 저장하지 않을 경우
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setMaxAge(0); // 초
        response.addCookie(ck_passwd);
      }
      // passwd 저장 여부를 결정하는 쿠기 기록, Y or "" 저장
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", memberExVO.getPasswd_save());
      ck_passwd_save.setMaxAge(600); // 초
      response.addCookie(ck_passwd_save);
      // ------------------------------------------------------------------
    
      String url_address = Tool.checkNull(memberExVO.getUrl_address());
      if (url_address.length() > 0){
        mav.setViewName("redirect:" + memberExVO.getUrl_address());
      }else{
        System.out.println("--> index.jsp 페이지로 이동합니다.");
        mav.setViewName("redirect:/index.do"); // 확장자 명시
      }
      
    } else {
      mav.setViewName("/memberex/message");
      msgs.add("로그인에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./index.do'\">홈페이지</button>");
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
    
    msgs.add("이용해주셔서 감사합니다.");
    msgs.add("from 운영진...");
    links.add("<button type='button' onclick=\"location.href='../index.jsp'\">홈페이지</button>");
    
    session.invalidate(); // session 변수 삭제
    
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
      msgs.add("회원정보가 수정되었습니다.");
      links.add("<button type='button' onclick=\"location.href='./read.do?mno="+memberExVO.getMe_no()+"'\">변경된 회원정보 확인</button>");
      links.add("<button type='button' onclick=\"location.href='./index.do'\">홈페이지</button>");
    } else {
      msgs.add("회원 정보 변경에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./index.do'\">홈페이지</button>");
    }
 
    links.add("<button type='button' onclick=\"location.href='./index.jsp'\">목록</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
//  @RequestMapping(value = "/index.do", method = RequestMethod.GET)
//  public ModelAndView memberInfo(
//          HttpSession session, 
//      HttpServletRequest request,
//      String me_id) {
//    ModelAndView mav = new ModelAndView();
//    mav.setViewName("/index");
//    mav.addObject("memberExVO", memberExDAO.memberInfo(me_id));
// 
//    return mav;
//  }
  @RequestMapping(value = "/index.do", method = RequestMethod.GET)
  public ModelAndView memberInfo( MemberExVO memberExVO, 
                                                HttpSession session, 
                                                HttpServletRequest request,
                                                String me_id) {
    System.out.println("--> 사용자 접속: " + request.getRemoteAddr());
    ModelAndView mav = new ModelAndView();
 
    
    mav.setViewName("/index"); // /webapp/index.jsp
    return mav;
  }
 }
