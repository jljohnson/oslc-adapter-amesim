<!DOCTYPE html>
<%--
/*********************************************************************************************
 * Copyright (c) 2014 Model-Based Systems Engineering Center, Georgia Institute of Technology.
 *                         http://www.mbse.gatech.edu/
 *                  http://www.mbsec.gatech.edu/research/oslc
 *
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  and Eclipse Distribution License v. 1.0 which accompanies this distribution.
 *
 *  The Eclipse Public License is available at http://www.eclipse.org/legal/epl-v10.html
 *  and the Eclipse Distribution License is available at
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *
 *	   Axel Reichwein, Koneksys (axel.reichwein@koneksys.com)		
 *******************************************************************************************/
--%>

<%@ page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%@ page
	import="org.eclipse.lyo.oslc4j.core.model.ServiceProviderCatalog"%>
<%@ page import="org.eclipse.lyo.oslc4j.core.model.ServiceProvider"%>
<%@ page import="org.eclipse.lyo.oslc4j.core.model.Link"%>
<%@ page import="java.net.URI"%>
<%@ page import="edu.gatech.mbsec.adapter.subversion.SubversionFile" %>
	
<%

SubversionFile resource = (SubversionFile)request.getAttribute("resource");
String requestURL = (String)request.getAttribute("requestURL");
%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>AMESim OSLC Adapter: Subversion File</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/simple.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/100px_white-oslc-favicon.ico">


</head>
<body onload="">

	<!-- header -->
	<p id="title">AMESim OSLC Adapter: Subversion File</p>

	<!-- main content -->
	<div id="main-body">
		
		<!-- oslc logo and adapter details -->
		<a id="oslclogo" href="http://open-services.net/" target="_blank"><img
			src="<%=request.getContextPath()%>/images/oslcLg.png"></a>
		<div id="adapter-details">
			<p class="word-break">
				This document: <a href="<%= requestURL %>"> <%= requestURL %>
				</a><br> Adapter Publisher: <a class="notfancy"
					href="http://www.mbsec.gatech.edu/research/oslc" target="_blank">Georgia
					Institute of Technology OSLC Tools Project</a><br> Adapter
				Identity: edu.gatech.mbsec.adapter.amesim
			</p>
		</div>
		<br>

		<!-- resource type and name -->
		<h1><span id="metainfo">Subversion File Metadata </span><%= resource.getName() %></h1>
		<p><span id="metainfo">Name </span><%= resource.getName() %></p>
		<p><span id="metainfo">Author </span><%= resource.getAuthor() %></p>
		<p><span id="metainfo">CommittedDate </span><%= resource.getCommittedDate() %></p>		
		<p><span id="metainfo">Path </span><%= resource.getPath() %></p>
		<p><span id="metainfo">RepositoryRootURL </span> <a href="<%= resource.getRepositoryRootURL()%>" target="_blank"><%= resource.getRepositoryRootURL()%></a></p>
		<p><span id="metainfo">Revision </span><%= resource.getRevision() %></p>
		<p><span id="metainfo">SvnURL </span> <a href="<%= resource.getSvnURL()%>" target="_blank"><%= resource.getSvnURL()%> </a></p>
		
		
		
		
		
		
		
				
		
		

	</div>


	<!-- footer -->
	<p id="footer">OSLC AMESim Adapter 1.1</p>
	 
</body>
</html>


<!-- Java functions -->
<%!
	public String getElementName(URI uri){
		String[] names = uri.getPath().split("::");
	    String last_name = names[names.length - 1]; 	    	
	    return last_name; 
	}
%>

<%!
	public String getElementQualifiedName(URI uri){
		String[] names = uri.getPath().split("/");
	    String last_name = names[names.length - 1]; 	    	
	    return last_name; 
	}
%>