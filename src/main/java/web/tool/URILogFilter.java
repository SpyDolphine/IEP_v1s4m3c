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
    // /WEB-INF/web.xml������ <init-param>�±��� ��
    charSet = config.getInitParameter("charSet");
 
    System.out.println("������������������������");
    System.out.println(" URI Logger start...");
    System.out.println("������������������������");
  }
 
  // ��û�� ���� �ڵ� ����
  public void doFilter(ServletRequest servletRequest, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
   
    HttpServletRequest request = (HttpServletRequest) servletRequest;

    
    // ------------------------------------------------------------------------------
    // session�� ��� ��
    // ------------------------------------------------------------------------------
    // ���ο� ������ ���������ʰ� ������ ���� ��ü�� ��ȯ
  
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
    } else { // �մ��̸� �α��� �������� �̵�
      System.out.println("�߸��� �����Դϴ�.");    
      System.out.println(login);    
      RequestDispatcher dispatcher = request.getRequestDispatcher("/memberex/login.do");
      dispatcher.forward(request, response);
    }

    // �ѱ� ���ڼ� ����
    request.setCharacterEncoding(charSet);
 
    // ��û uri ���� �κ�
    String uri = request.getRequestURI();
    System.out.println(uri);
  }
  public void destroy() {
  }
}