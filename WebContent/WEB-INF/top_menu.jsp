<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="navbar">
    <div class="w-container">
      <div class="w-row home-nav-row">
        <div class="w-col w-col-6 w-col-small-6 w-col-tiny-6 left-nav">
          <a class="w-inline-block" href="index.jsp"><img class="logo" src="images/logo foodbook.png" width="64" height="64" alt="545461e699d60fc6367cf45f_newfork_1x.png">
            <div class="brand">Food Book</div>
          </a>
        </div>

        
        <c:choose>
        	<c:when test="${sessionScope.role=='user'}">
        		<div class="w-col w-col-6 w-col-small-6 w-col-tiny-6 w-clearfix right-nav">
        			<a class="button sign-in sign-out" href="login.u?logout=yes">Sign out</a>
        			 
        			 <h1 class="header-status-user">welcome, ${sessionScope.id}</h1>
        			 
        			
		        </div>
        	</c:when>
        	<c:otherwise>
		        <!-- ------------------------------------------------------------------------------------ -->
		        <div class="w-col w-col-6 w-col-small-6 w-col-tiny-6 w-clearfix right-nav">
		        <a class="button sign-in" href="login.jsp">Sign in or Register</a>
		         </div>
		        <!-- ------------------------------------------------------------------------------------ -->
		    </c:otherwise>
        </c:choose>
       
      </div>
    </div>
  </div>