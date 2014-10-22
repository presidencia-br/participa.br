<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - HTML header for main home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="org.dspace.app.webui.util.JSPManager" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.app.util.Util" %>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.*" %>

<%
    String title = (String) request.getAttribute("dspace.layout.title");
    String navbar = (String) request.getAttribute("dspace.layout.navbar");
    boolean locbar = ((Boolean) request.getAttribute("dspace.layout.locbar")).booleanValue();

    String siteName = ConfigurationManager.getProperty("dspace.name");
    String feedRef = (String)request.getAttribute("dspace.layout.feedref");
    boolean osLink = ConfigurationManager.getBooleanProperty("websvc.opensearch.autolink");
    String osCtx = ConfigurationManager.getProperty("websvc.opensearch.svccontext");
    String osName = ConfigurationManager.getProperty("websvc.opensearch.shortname");
    List parts = (List)request.getAttribute("dspace.layout.linkparts");
    String extraHeadData = (String)request.getAttribute("dspace.layout.head");
    String extraHeadDataLast = (String)request.getAttribute("dspace.layout.head.last");
    String dsVersion = Util.getSourceVersion();
    String generator = dsVersion == null ? "DSpace" : "DSpace "+dsVersion;
    String analyticsKey = ConfigurationManager.getProperty("jspui.google.analytics.key");
%>

<!DOCTYPE html>
<html>
    <head>
        <title><%= siteName %>: <%= title %></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="Generator" content="<%= generator %>" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/favicon.ico" type="image/x-icon"/>
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/jquery-ui-1.10.3.custom/redmond/jquery-ui-1.10.3.custom.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/bootstrap.min.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/bootstrap-theme.min.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/dspace-theme.css" type="text/css" />
	    <!-- Folha de estilo de sobreposição do participa-br -->
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/participa-br/style.css" type="text/css" />
<%
    if (!"NONE".equals(feedRef))
    {
        for (int i = 0; i < parts.size(); i+= 3)
        {
%>
        <link rel="alternate" type="application/<%= (String)parts.get(i) %>" title="<%= (String)parts.get(i+1) %>" href="<%= request.getContextPath() %>/feed/<%= (String)parts.get(i+2) %>/<%= feedRef %>"/>
<%
        }
    }
    
    if (osLink)
    {
%>
        <link rel="search" type="application/opensearchdescription+xml" href="<%= request.getContextPath() %>/<%= osCtx %>description.xml" title="<%= osName %>"/>
<%
    }

    if (extraHeadData != null)
        { %>
<%= extraHeadData %>
<%
        }
%>
        
	<script type='text/javascript' src="<%= request.getContextPath() %>/static/js/jquery/jquery-1.10.2.min.js"></script>
	<script type='text/javascript' src='<%= request.getContextPath() %>/static/js/jquery/jquery-ui-1.10.3.custom.min.js'></script>
	<script type='text/javascript' src='<%= request.getContextPath() %>/static/js/bootstrap/bootstrap.min.js'></script>
	<script type='text/javascript' src='<%= request.getContextPath() %>/static/js/holder.js'></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/utils.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/static/js/choice-support.js"> </script>

    <%--Gooogle Analytics recording.--%>
    <%
    if (analyticsKey != null && analyticsKey.length() > 0)
    {
    %>
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', '<%= analyticsKey %>']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>
    <%
    }
    if (extraHeadDataLast != null)
    { %>
		<%= extraHeadDataLast %>
		<%
		    }
    %>
    

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="<%= request.getContextPath() %>/static/js/html5shiv.js"></script>
  <script src="<%= request.getContextPath() %>/static/js/respond.min.js"></script>
<![endif]-->
    </head>

    <%-- HACK: leftmargin, topmargin: for non-CSS compliant Microsoft IE browser --%>
    <%-- HACK: marginwidth, marginheight: for non-CSS compliant Netscape browser --%>
    <body class="">
<a class="sr-only" href="#content">Skip navigation</a>
	
<main id="content" role="main">
		
		<!-- 
		Barra governo
	 -->
	<div id="barra-brasil">
		<div id="wrapper-barra-brasil">
			<div class="brasil-flag">
				<a class="link-barra" href="http://brasil.gov.br/">Brasil</a>
			</div>
			<span class="acesso-info"><a class="link-barra" href="http://brasil.gov.br/barra#acesso-informacao">Acesso à informação</a></span>
		</div>
	</div>
	
	<!-- 
		Banner do participa.br	
	 -->
	<div role="banner" id="header-banner">
	
			<div>

				<ul id="accessibility">
					<li><a id="link-conteudo" href="http://www.brasil.gov.br/#acontent" accesskey="1"> Ir para o conteúdo <span>1</span>
					</a></li>
					<li><a id="link-navegacao" href="http://www.brasil.gov.br/#anavigation" accesskey="2">
							Ir para o menu <span>2</span>
					</a></li>
					<li><a id="link-buscar" href="http://www.brasil.gov.br/#SearchableText" accesskey="3">
							Ir para a busca <span>3</span>
					</a></li>
					<li class="last-item"><a id="link-rodape" href="http://www.brasil.gov.br/#afooter" accesskey="4"> Ir
							para o rodapé <span>4</span>
					</a></li>
				</ul>
				<ul id="portal-siteactions">
					<li id="siteaction-accessibility"><a accesskey="5" title="Acessibilidade" href="http://www.brasil.gov.br/acessibilidade">Acessibilidade</a></li>
					<li id="siteaction-contraste"><a accesskey="6" title="Alto Contraste" href="http://www.brasil.gov.br/#">Alto Contraste</a></li>
					<li class="last-item" id="siteaction-mapadosite"><a accesskey="7" title="Mapa do Site" href="http://www.brasil.gov.br/mapadosite">Mapa do Site</a></li>
				</ul>
				
				<div id="logo">
					<a href="index.html" title="" id="portal-logo"> <br> <br>
						<img src="<%= request.getContextPath() %>/image/participa-br/nometopo.png">
					</a>
				</div>

				<div id="portal-searchbox">

					<form action="http://www.brasil.gov.br/@@busca" id="nolivesearchGadget_form">
						<fieldset class="LSBox">
							<legend class="hiddenStructure"> Buscar no site </legend>
							<label for="nolivesearchGadget" class="hiddenStructure">Busca</label>

							<input type="text" id="nolivesearchGadget" class="searchField" placeholder="Buscar no site" title="Search Site" size="18" name="SearchableText"> <input type="submit" value="Buscar" class="searchButton">

							<div id="LSResult" class="LSResult">
								<div id="LSShadow" class="LSShadow"></div>
							</div>
						</fieldset>
					</form>

				</div>

				<div id="social-icons">
					<img height="20" border="0" alt="" usemap="#image-maps-2014-10-05-103938" src="img/social_links.png">
					<map id="ImageMapsCom-image-maps-2014-10-05-103938" name="image-maps-2014-10-05-103938">
						<area target="_self" style="outline: none;" coords="2,0,32,32" shape="rect" href="#" title="" alt="">
						<area target="_self" style="outline: none;" coords="39,0,73,33" shape="rect" href="#" title="" alt="">
						<area target="_self" style="outline: none;" coords="79,0,113,32" shape="rect" href="#" title="" alt="">
						<area target="_self" style="outline: none;" coords="119,0,151,32" shape="rect" href="#" title="" alt="">
						<area href="http://www.image-maps.com/index.php?aff=mapped_users_0" title="Image Map" style="outline: none;" alt="Image Map" coords="149,31,151,33" shape="rect">
					</map>
				</div>

			</div>

			<div style="height: 30px; background-color: #F8C300; width: 100%; max-width: 3000px" id="sobre2">
				&nbsp;</div>

			<div id="sobre">
				<ul>
					<li class="portalservicos-item" id="portalservicos-perguntas-frequentes-1"><a href="index.html">PÁGINA
							INICIAL</a></li>
					<li class="portalservicos-item" id="portalservicos-fale-com-o-governo"><a href="a_biblioteca.html">A
							BIBLIOTECA</a></li>
					<li class="portalservicos-item" id="portalservicos-fale-com-o-governo"><a href="meu_espaco.html">MEU
							ESPAÇO</a></li>
					<li class="portalservicos-item" id="portalservicos-fale-com-o-governo"><a href="recomendamos.html">RECOMENDAMOS</a>
					</li>
					<li class="portalservicos-item last-item" id="portalservicos-fale-com-o-governo"><a href="fale_conosco.html">FALE
							CONOSCO</a></li>
				</ul>
			</div>
	
	</div>	
	
	<!-- 
		Fim: Banner do participa.br	
	 -->

	<div class="container banner">
		<div class="row">
			<div class="col-md-9 brand">
			<h1><fmt:message key="jsp.layout.header-default.brand.heading" /></h1>
	        <fmt:message key="jsp.layout.header-default.brand.description" /> 
	        </div>
	        <div class="col-md-3"><img class="pull-right" src="<%= request.getContextPath() %>/image/logo.gif">
	        </div>
		</div>
	</div>	
<br/>
                <%-- Location bar --%>
<%
    if (locbar)
    {
%>
<div class="container">
                <dspace:include page="/layout/location-bar.jsp" />
</div>                
<%
    }
%>


        <%-- Page contents --%>
<div class="container">
<% if (request.getAttribute("dspace.layout.sidebar") != null) { %>
	<div class="row">
		<div class="col-md-9">
<% } %>		