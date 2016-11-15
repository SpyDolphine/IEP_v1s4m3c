package web.tool;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class URILogFilter implements Filter{
  private String charSet = null;
  
  @Override
  public void init(FilterConfig config) throws ServletException {
    // /WEB-INF/web.xml파일의 <init-param>태그의 값
    charSet = config.getInitParameter("charSet");
 
    System.out.println("────────────");
    System.out.println(" URI Logger start...");
    System.out.println("────────────");
  }
 
  // 요청이 오면 자동 실행
  public void doFilter(ServletRequest servletRequest, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
   
    HttpServletRequest request = (HttpServletRequest) servletRequest;

    
    // ------------------------------------------------------------------------------
    // session의 사용 ★
    // ------------------------------------------------------------------------------
    // 새로운 세션을 생성하지않고 기존의 세션 객체를 반환
  
    HttpSession session = request.getSession(false);
 
    boolean login = true;
    if (session != null) {
      if (session.getAttribute("me_id") == null && request.getRequestURI().equals("/compet/contest/create.do")) {
   login = false;
      }else if(session.getAttribute("me_id")==null && request.getRequestURI().equals("/compet/contest/update.do")){
        login = false;
      }else if(session.getAttribute("me_id")==null && request.getRequestURI().equals("/compet/contest/delete.do")){
        login = false;
      }else if(session.getAttribute("me_id")==null && request.getRequestURI().equals("/compet/scrap/create.do")){
        login = false;
      }else if(session.getAttribute("me_id")==null && request.getRequestURI().equals("/compet/scrap/delete.do")){
        login = false;
      }else if(session.getAttribute("me_id")==null && request.getRequestURI().equals("/compet/scrap/list.do")){
        login = false;
      }else if(session.getAttribute("me_id")==null && request.getRequestURI().equals("/compet/memberex/memberlist.do")){
        login = false;
      }
    }
    if (login) {
      chain.doFilter(request, response);
    } else { // 손님이면 로그인 페이지로 이동
      System.out.println("잘못된 접근입니다.");    
      System.out.println(login);    
      RequestDispatcher dispatcher = request.getRequestDispatcher("/memberex/login.do");
      dispatcher.forward(request, response);
    }

    // 한글 문자셋 변경
    request.setCharacterEncoding(charSet);
 
    // 요청 uri 추출 부분
    String uri = request.getRequestURI();
    System.out.println(uri);
  }
  public void destroy() {
  }
}