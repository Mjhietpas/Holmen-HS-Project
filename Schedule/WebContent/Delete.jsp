<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="classes.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
TestData data = new TestData();
int eid = Integer.parseInt(request.getParameter("ID"));
data.deleteEvent(eid);

data.close();
%>

</body>
<meta http-equiv="Refresh" content="0;url=Calendar.jsp">
</html>