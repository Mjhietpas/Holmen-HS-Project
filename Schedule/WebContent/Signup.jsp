<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="classes.*, java.util.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signing up...</title>
</head>
<body>

<h2>Signing up...</h2>

<%  //Sign student/volunteer up for event 

	TestData data = new TestData();
	int ID, UID;
	int year, month, day;
	String param = request.getParameter("ID");
	ID = Integer.parseInt(param.substring(0,param.indexOf('|')));
	param = param.substring(param.indexOf('|')+1,param.length());
	UID = Integer.parseInt(param.substring(0,param.indexOf('|')));
	param = param.substring(param.indexOf('|')+1,param.length());
	year = Integer.parseInt(param.substring(0,param.indexOf('|')));
	param = param.substring(param.indexOf('|')+1,param.length());
	month = Integer.parseInt(param.substring(0,param.indexOf('|')));
	param = param.substring(param.indexOf('|')+1,param.length());
	day = Integer.parseInt(param);
	
	ArrayList<Event> myEvents = data.getUserEventsArray(UID);
	ArrayList<Event> events = data.getEventArray(year, month, day);
	boolean conflict = false;
	Event event = null;
	
	for(int j = 0; j < events.size(); j++){
		Event e = events.get(j);
		if(e.getID() == ID){
			event = e;
			break;
		}
	}
	
	if(event != null){
	for(int j = 0; j < myEvents.size(); j++){
		Event e = myEvents.get(j);
		if(e.getDate().equals(event.getDate()))
			if(e.getStartTime().equals(event.getStartTime())){
				conflict = true;
				break;
		}
	}
	}
	
	String output = "";
	if(!conflict){
		data.signUpEvent(UID, ID);
		output += "</body><meta http-equiv=\"Refresh\" content=\"0;url=Calendar.jsp\"></html>";
	}
	
	else{
		output += "<h2>Unable to sign up.</h2> <h3>You're already signed up for a class at this time.</h3>";
		output += "<FORM action=\"Calendar.jsp\"><input type=\"submit\" value=\"Back\"></FORM>";
	}
	
	data.close();
%>

<%=output %>

