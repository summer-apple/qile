<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<nav class="nav-collapse">
		<ul>
			<c:if test="${!empty association}">
				<li><a href="<%=basePath%>mobile/association-center.jsp">资料</a></li>
				<li><a href="<%=basePath%>mobile/activity-list.jsp">活动</a></li>
				<li><a href="<%=basePath%>mobile/coupon-list.jsp">优惠券</a></li>
				<li><a href="<%=basePath%>mobile/article-list.jsp">资讯</a></li>
				<li><a href="<%=basePath%>mobile/login.jsp">退出</a></li>
			</c:if>
			<c:if test="${!empty company}">
				<li><a href="<%=basePath%>mobile/company-center.jsp">资料</a></li>
				<li><a href="<%=basePath%>mobile/article-list.jsp">资讯</a></li>
				<li><a href="<%=basePath%>mobile/login.jsp">退出</a></li>
			</c:if>
			<c:if test="${empty association && empty company}">
					<script>window.location.href="<%=basePath%>mobile/login.jsp";</script>
			</c:if>
		</ul>
	</nav>
