<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
Hello, This is EEIT86 TestWebSite

<ul>
	<li><a href="${pageContext.request.contextPath}/book/bookList.jsp">Book Management</a></li>
	<li>App Management
		<ol>
			<li><a href="${pageContext.request.contextPath}/app/AppList.jsp">SELECT ALL</a></li>
			<li><a href="${pageContext.request.contextPath}/app/AppAdd.jsp">INSERT APP</a></li>
			<li><a href="#">UPDATE APP</a></li>
		</ol>
	</li>
	<li><a href="${pageContext.request.contextPath}/coffee/coffeeList.jsp">Coffee Management</a></li>
	<li><a href="${pageContext.request.contextPath}/movie/movieList.jsp">Movie Management</a></li>
	<li><a href="${pageContext.request.contextPath}/notebook/notebookList.jsp">NoteBook Management</a></li>
	<li><a href="${pageContext.request.contextPath}/drama/dramaList.jsp">Drama Management</a></li>
	<li><a href="${pageContext.request.contextPath}/music/musicList.jsp">Music Management</a></li>
</ul>
