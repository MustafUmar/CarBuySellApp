<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <% response.sendRedirect(getServletContext().getContextPath()+"/admin/dashboard"); %>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_MANAGER')">
        <% response.sendRedirect(getServletContext().getContextPath()+"/mg/dashboard"); %>
    </sec:authorize>
</sec:authorize>
<t:wrapper>
    <jsp:body>
        
        
        <div class="login-body">
            <div class="container">

              <form class="form-signin" method="post" action="<c:url value="login" />">
                <h2 class="form-signin-heading">sign in now</h2>
                <div class="login-wrap">
                    <div class="user-login-info">
                        <input type="text" class="form-control" name="password" placeholder="User ID" autofocus>
                        <input type="password" name="password" class="form-control" placeholder="Password">
                    </div>
                    
                    <button class="btn btn-lg btn-login btn-block" type="submit">Sign in</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 

                    <div class="registration">
                        Don't have an account yet?
                        <a class="" href="registration.html">
                            Create an account
                        </a>
                    </div>

                </div>

                  <%--<!-- Modal -->
                  <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                      <div class="modal-dialog">
                          <div class="modal-content">
                              <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                  <h4 class="modal-title">Forgot Password ?</h4>
                              </div>
                              <div class="modal-body">
                                  <p>Enter your e-mail address below to reset your password.</p>
                                  <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                              </div>
                              <div class="modal-footer">
                                  <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                  <button class="btn btn-success" type="button">Submit</button>
                              </div>
                          </div>
                      </div>
                  </div>
                  <!-- modal -->--%>

              </form>

            </div>
        </div>
        
        
              <%--<header> --%>
            <%-- Include header.jsp --%>
            <%--<%@include file="/WEB-INF/views/segment/header.jsp" %>--%>
            <%--</header>
        <main>
            <c:if test="${param.error != null and param.error eq true}">
                <div style="width:60%;margin: 0 auto;padding: 8px;">
                    <font color="red">Mek una put correct credentials</font>
                </div>
            </c:if>--%>
            <form method="post" action="<c:url value="login" />">
<!--                <h1>Admin</h1>-->
                <div>
                    <label>Username:</label>
                    <input type="text" name="username"/>
                </div>
                <div>
                    <label>Password:</label>
                    <input type="password" name="password"/>
                </div>
                <div>
                    <input type="submit" value="Submit" />
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
            </form>
        <%--</main>
        <footer>--%>
            <%-- Include footer.jsp --%>
            <%--@include file="/WEB-INF/views/segment/footer.jsp"--%>
        <%--</footer>--%>
    </jsp:body>
</t:wrapper>
