<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.lang.System"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>

<body>
	<script type="text/javascript">
		function validateInput() {
			try {
				var name = document.forms["clusterForm"]["attributeName"].value;
				 var value = document.forms["clusterForm"]["attributeValue"].value;
				 if (name == null || name == "") {
				 	alert("Name Can not be blank");
				   	return false;
				 } 
				 if (value == null || value == "") {
					 alert("Value Can not be blank");
					   	return false;
				 } 
				 
				 return true;
				
			} catch (e) {
				alert("There was some Javascript error. But We will submit the form anyway and lets see..")
				return true;
			} 
		}
		
	</script>
	
	<h2>Here are the server request details</h2>

	<div style="color: blue;">
		<ul>
			<li>SessionId : <%=request.getSession().getId()%>
			</li>
			<li>Is this a New Session : <%=request.getSession().isNew()%>
			</li>
			<li>Session Creation Date: <%=new Date(request.getSession().getCreationTime())%>
			</li>
			<li>Session Access Date : <%=new Date(request.getSession().getLastAccessedTime())%>
			</li>

			<li><span style="color: red"> Node Name: <%=System.getProperty("jboss.node.name")%>
			</span></li>
		</ul>
	</div>

	<br>
	<b>Session Attributes </b>

	<hr>
	<ul>
		<%
			String attributeName = request.getParameter("attributeName");
			String attributeValue = request.getParameter("attributeValue");

			Map<String, String> sessionAttributes = (Map<String, String>) request
					.getSession().getAttribute("sessiAttributes");

			//List<String> listOfBooks = (List<String>) request.getSession().getAttribute("sessiAttributes");

			if (sessionAttributes == null) {
				sessionAttributes = new HashMap<String, String>();
				request.getSession().setAttribute("sessiAttributes",
						sessionAttributes);
			}
			if (attributeName != null && !attributeName.isEmpty() && attributeValue != null && !attributeValue.isEmpty()) {
				sessionAttributes.put(attributeName, attributeValue);

				//listOfBooks.add(bookName);
				request.getSession().setAttribute("sessiAttributes",
						sessionAttributes);
			}

			for (String key : sessionAttributes.keySet()) {
				out.println("<li>Name = " + key + "|Value="
						+ sessionAttributes.get(key) + "</li>");
			}
		%>
	</ul>

	<hr>
	<form name="clusterForm" action="/SampleWebApp/ClusterTest" method="get" onsubmit="return validateInput()">
		Name :<input name="attributeName" type="text"> 
		<br> 
		Value : <input name="attributeValue" type="text"> <br> 
		
		<br>
		<input type="submit" value="Add Attributes to Session"
			style="font-style: bold;" >
	</form>

	<hr>

</body>
</html>