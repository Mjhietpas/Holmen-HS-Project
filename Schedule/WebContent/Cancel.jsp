<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="classes.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updating schedule...</title>
</head>
<body>

<%
TestData data = new TestData();
int uid, eid;
int ID, UID;
String param = request.getParameter("ID");
ID = Integer.parseInt(param.substring(0,param.indexOf('|')));
UID = Integer.parseInt(param.substring(param.indexOf('|')+1,param.length()));
data.unSignUpEvent(UID, ID);

data.close();
%>

</body>
<meta http-equiv="Refresh" content="0;url=Calendar.jsp">
</html>