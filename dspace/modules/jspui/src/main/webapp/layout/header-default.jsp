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
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/favicon.ico" type="image/x-icon"/>
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/jquery-ui-1.10.3.custom/redmond/jquery-ui-1.10.3.custom.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/participa-br/bootstrap.css" type="text/css" />
	    
	    <!-- 
	    	Folhas de estilo do participa.br
	     -->
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/participa-br/reset-cachekey-85cc61bfb0ce648e03622791da04dd32.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/participa-br/base-cachekey-37a150862a358cc0e22d4463c5b58e09.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/participa-br/embedder-cachekey-555a62dfc783c030b80eb2b3a238f063.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/participa-br/cabecalho-amarelo-theme.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/participa-br/participa-br.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/participa-br/resourcesecom.brasil.portalmain-cachekey-0c2dbf552f398e99f90011b684a2b182.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/participa-br/style.css" media="screen" />
	    <!-- 
	    	FIM: folhas de estilo do participa.br
	     -->
	    
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
   
    <!-- 
       	Scripts da presidência
     -->
    <!-- 
       	Fim: scripts da presidência
     -->

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
    <body class="undernavigation">
<a class="sr-only" href="#content">Skip navigation</a>
<header class="navbar navbar-inverse navbar-fixed-top">    
	
	
	<!-- 
		Barra do governo
	 -->
	<div id="barra-brasil">
		<div id="wrapper-barra-brasil">
			<div class="brasil-flag">
				<a class="link-barra" href="http://brasil.gov.br/">Brasil</a>
			</div><span class="acesso-info"><a class="link-barra" href="http://brasil.gov.br/barra#acesso-informacao">Acesso à informação</a></span>
		</div>
	</div>
	
	
	<!-- 
		Logo do repositório
	 -->
	 <div id="wrapper" class="wrelativo">

	
		 <div id="header" role="banner">
	
					<div>
	
						<ul id="accessibility">
							<li>
								<a accesskey="1" href="http://www.brasil.gov.br/#acontent" id="link-conteudo"> Ir para o conteúdo <span>1</span> </a>
							</li>
							<li>
								<a accesskey="2" href="http://www.brasil.gov.br/#anavigation" id="link-navegacao"> Ir para o menu <span>2</span> </a>
							</li>
							<li>
								<a accesskey="3" href="http://www.brasil.gov.br/#SearchableText" id="link-buscar"> Ir para a busca <span>3</span> </a>
							</li>
							<li class="last-item">
								<a accesskey="4" href="http://www.brasil.gov.br/#afooter" id="link-rodape"> Ir para o rodapé <span>4</span> </a>
							</li>
						</ul>
						<ul id="portal-siteactions">
							<li id="siteaction-accessibility">
								<a href="http://www.brasil.gov.br/acessibilidade" title="Acessibilidade" accesskey="5">Acessibilidade</a>
							</li>
							<li id="siteaction-contraste">
								<a href="http://www.brasil.gov.br/#" title="Alto Contraste" accesskey="6">Alto Contraste</a>
							</li>
							<li id="siteaction-mapadosite" class="last-item">
								<a href="http://www.brasil.gov.br/mapadosite" title="Mapa do Site" accesskey="7">Mapa do Site</a>
							</li>
						</ul>
						<div id="logo">
							<a id="portal-logo" title="" href="index.html">
							<br/>
							<br/>
							<img src="<%= request.getContextPath() %>/image/participa-br/nometopo.png"> </a>
						</div>
	
						<div id="portal-searchbox">
	
							<form id="nolivesearchGadget_form" action="http://www.brasil.gov.br/@@busca">
								<fieldset class="LSBox">
									<legend class="hiddenStructure">
										Buscar no site
									</legend>
									<label class="hiddenStructure" for="nolivesearchGadget">Busca</label>
	
									<input name="SearchableText" size="18" title="Search Site" placeholder="Buscar no site" class="searchField" id="nolivesearchGadget" type="text">
									<input class="searchButton" value="Buscar" type="submit">
	
									<div class="LSResult" id="LSResult">
										<div class="LSShadow" id="LSShadow"></div>
									</div>
								</fieldset>
							</form>
	
						</div>
	
						<div id="social-icons">
							<img src="<%= request.getContextPath() %>/image/participa-br/social_links.png" usemap="#image-maps-2014-10-05-103938" alt="" border="0" height="20">
							<map name="image-maps-2014-10-05-103938" id="ImageMapsCom-image-maps-2014-10-05-103938">
								<area alt="" title="" href="#" shape="rect" coords="2,0,32,32" style="outline:none;" target="_self">
								<area alt="" title="" href="#" shape="rect" coords="39,0,73,33" style="outline:none;" target="_self">
								<area alt="" title="" href="#" shape="rect" coords="79,0,113,32" style="outline:none;" target="_self">
								<area alt="" title="" href="#" shape="rect" coords="119,0,151,32" style="outline:none;" target="_self">
								<area shape="rect" coords="149,31,151,33" alt="Image Map" style="outline:none;" title="Image Map" href="http://www.image-maps.com/index.php?aff=mapped_users_0">
							</map>
						</div>
	
					</div>
	
					<div id="sobre2" style="height: 30px; background-color: #F8C300; width: 100%; max-width: 3000px">
						&nbsp;
					</div>
	
					<div id="sobre">
						<ul>
							<li id="portalservicos-perguntas-frequentes-1" class="portalservicos-item">
								<a href="index.html">PÁGINA INICIAL</a>
							</li>
							<li id="portalservicos-fale-com-o-governo" class="portalservicos-item">
								<a href="a_biblioteca.html">A BIBLIOTECA</a>
							</li>
							<li id="portalservicos-fale-com-o-governo" class="portalservicos-item">
								<a href="meu_espaco.html">MEU ESPAÇO</a>
							</li>
							<li id="portalservicos-fale-com-o-governo" class="portalservicos-item">
								<a href="recomendamos.html">RECOMENDAMOS</a>
							</li>
							<li id="portalservicos-fale-com-o-governo" class="portalservicos-item last-item">
								<a href="fale_conosco.html">FALE CONOSCO</a>
							</li>
						</ul>
					</div>
				</div>
	 </div>
	
    <%
    if (!navbar.equals("off"))
    {
%>
       <%--      <div class="container">
                <dspace:include page="<%= navbar %>" />
            </div> --%>
<%
    }
    else
    {
    	%>
        <div class="container">
            <dspace:include page="/layout/navbar-minimal.jsp" />
        </div>
<%    	
    }
%>
</header>

<main id="content" role="main">

	
	
	<!-- 
		
		Topo do repositório
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