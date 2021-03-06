<%@ page isErrorPage="true"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="/WEB-INF/jspf/directive/page.jspf"%>
<%@ include file="/WEB-INF/jspf/directive/taglib.jspf"%>
<html>
<c:set var="title" value="Error" scope="page" />
<head>
<c:set var="title" value="Opps,Error!" />

<%@ include file="/WEB-INF/jspf/headContent.jspf"%>

</head>
<body>

	<table id="main-container">

		<%-- HEADER --%>
		<%@ include file="/WEB-INF/jspf/header.jspf"%>
		<%-- HEADER --%>

		<tr>
			<td class="content">
				<%-- CONTENT --%>

				<h2 class="error">The following error occurred</h2> <%-- this way we obtain an information about an exception (if it has been occurred) --%>
				<c:set var="code"
					value="${requestScope['javax.servlet.error.status_code']}" /> <c:set
					var="message"
					value="${requestScope['javax.servlet.error.message']}" /> <c:set
					var="exception"
					value="${requestScope['javax.servlet.error.exception']}" /> <c:if
					test="${not empty code}">
					<h3>Error code: ${code}</h3>
				</c:if> <c:if test="${not empty message}">
					<h3>${message}</h3>
				</c:if> <c:if test="${not empty exception}">
					<%
						exception.printStackTrace(new PrintWriter(out));
					%>
				</c:if> <%-- if we get this page using forward --%> <c:if
					test="${not empty requestScope.errorMessage}">
					<h3>${requestScope.errorMessage}</h3>
				</c:if> <%-- CONTENT --%>
			</td>
		</tr>
	</table>
		<input type="button"
			onclick="location.href='javascript:history.back()';" value="Back" />
			<%@ include file="/WEB-INF/jspf/footer.jspf"%>
</body>
</html>