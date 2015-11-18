<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="classes.*,java.util.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Day's Events</title>
</head>
<body style="background-color:lightblue">
<p align="right"><a href="Logout.jsp">Logout</a></p>

<FORM action="Calendar.jsp">
<input type="submit" value="Back">
</FORM>

<br>

<h1>Day's Events: <%String date = request.getParameter("id");
					out.println(date);
					int month, day, year;
					month = Integer.parseInt(date.substring(0,date.indexOf('/')));
					date = date.substring(date.indexOf('/')+1,date.length());
					day = Integer.parseInt(date.substring(0,date.indexOf('/')));
					date = date.substring(date.indexOf('/')+1,date.length());
					year = Integer.parseInt(date);
					%>
</h1>
					
<%
ArrayList<Event> events = new ArrayList<Event>();
TestData data = new TestData();

events = data.getEventArray(year, month, day);
int uid = Integer.parseInt((String)session.getAttribute("uID"));

String output = "";
	for(int i = 0; i < events.size(); i++){
		Event e = events.get(i);
		date = e.getMonth() + "/" + e.getDay() + "/" + e.getYear();
		output += "<h2>"+e.getTitle()+"</h2>"+"<h3>"+date+
			" - from "+e.getStartTime()+" to "+e.getEndTime()+"</h3>"+e.getAbout()+"<br><br>";
		
	if((String)session.getAttribute("userType") == "student"){
		
		ArrayList<Event> myEvents = data.getUserEventsArray(uid);
		boolean signedUp = false;
		for(int j = 0; j < myEvents.size(); j++){
			Event ev = myEvents.get(j);
			if(ev.getID() == e.getID()){
				signedUp = true;
				break;
			}
		}
		
		if(signedUp){
			output += "<FORM action=\"Cancel.jsp\">"+
					"<input type=\"hidden\" name = \"ID\" value=\"" + e.getID() + "|" + Integer.parseInt((String)session.getAttribute("uID")) + "\">" +
					"<input type=\"submit\" ID=\"" + e.getID() + "|" + Integer.parseInt((String)session.getAttribute("uID")) + "\" value=\"Un-Signup\">"+
						"</FORM><br>";	
		}
		
		else{
			output += "<FORM action=\"Signup.jsp\">"+
					"<input type=\"hidden\" name = \"ID\" value=\"" + e.getID() + "|" + uid + "|" +  year + "|" + month + "|" + day + "\">" +
					"<input type=\"submit\" ID=\"" + e.getID() + "|" + uid + "|" + year + "|" + month + "|" + day + "\" value=\"Sign Up\">"+
					"</FORM><br>";	
		}
	}
					
	else if((String)session.getAttribute("userType") == "volunteer"){
		
		ArrayList<Event> myEvents = data.getUserEventsArray(uid);
		boolean signedUp = false;
		for(int j = 0; j < myEvents.size(); j++){
			Event ev = myEvents.get(j);
			if(ev.getID() == e.getID()){
				signedUp = true;
				break;
			}
		}
		
		if(e.getUID() == uid){
			output += "<FORM action=\"Delete.jsp\">"+
						"<input type=\"hidden\" name = \"ID\" value=\"" + e.getID() + "\">" +
						"<input type=\"submit\" ID=\"" + e.getID() + "\" value=\"Delete Event\">"+
						"</FORM><br>";	
		}
		
		else if(signedUp){
			output += "<FORM action=\"Cancel.jsp\">"+
					"<input type=\"hidden\" name = \"ID\" value=\"" + e.getID() + "|" + uid + "\">" +
					"<input type=\"submit\" ID=\"" + e.getID() + "|" + uid + "\" value=\"Un-Signup\">"+
						"</FORM><br>";	
		}
		
		else{
			output += "<FORM action=\"Signup.jsp\">"+
					"<input type=\"hidden\" name = \"ID\" value=\"" + e.getID() + "|" + uid + "|" + year + "|" + month + "|" + day + "\">" +
					"<input type=\"submit\" ID=\"" + e.getID() + "|" + uid + "|" + year + "|" + month + "|" + day + "\" value=\"Volunteer\">"+
					"</FORM><br>";
		}
	}
			
	}
	out.println(output);
	out.println();
	
	data.close();
%>


</body>
</html>