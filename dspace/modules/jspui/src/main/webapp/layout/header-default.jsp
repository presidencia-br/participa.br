<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - HTML header for main home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace"%>

<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="org.dspace.app.webui.util.JSPManager"%>
<%@ page import="org.dspace.core.ConfigurationManager"%>
<%@ page import="org.dspace.app.util.Util"%>
<%@ page import="javax.servlet.jsp.jstl.core.*"%>
<%@ page import="javax.servlet.jsp.jstl.fmt.*"%>
<%@ page import="org.dspace.core.Context" %>
<%@ page import="org.dspace.authorize.AuthorizeManager" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>



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
    
    Context context = UIUtil.obtainContext(request);
    boolean isAdmin = AuthorizeManager.isAdmin(context);

%>

<!DOCTYPE html>
<html>
<head>
<title>Portal Brasil: <%= title %></title>

<link rel="shortcut icon" href="<%= request.getContextPath() %>/favicon.png" type="image/png"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Generator" content="<%= generator %>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

	
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/static/css/jquery-ui-1.10.3.custom/redmond/jquery-ui-1.10.3.custom.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/static/css/participa-br/bootstrap.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/static/css/bootstrap/bootstrap-theme.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/static/css/bootstrap/dspace-theme.css"
	type="text/css" />
<!-- Folha de estilo de sobreposição do participa-br -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/static/css/participa-br/participa-br.css"
	type="text/css" />
<%
    if (!"NONE".equals(feedRef))
    {
        for (int i = 0; i < parts.size(); i+= 3)
        {
%>
<link rel="alternate" type="application/<%= (String)parts.get(i) %>"
	title="<%= (String)parts.get(i+1) %>"
	href="<%= request.getContextPath() %>/feed/<%= (String)parts.get(i+2) %>/<%= feedRef %>" />
<%
        }
    }
    
    if (osLink)
    {
%>
<link rel="search" type="application/opensearchdescription+xml"
	href="<%= request.getContextPath() %>/<%= osCtx %>description.xml"
	title="<%= osName %>" />
<%
    }

    if (extraHeadData != null)
        { %>
<%= extraHeadData %>
<%
        }
%>

<script type='text/javascript'
	src="<%= request.getContextPath() %>/static/js/jquery/jquery-1.10.2.min.js"></script>
<script type='text/javascript'
	src='<%= request.getContextPath() %>/static/js/jquery/jquery-ui-1.10.3.custom.min.js'></script>
<script type='text/javascript'
	src='<%= request.getContextPath() %>/static/js/bootstrap/bootstrap.min.js'></script>
<script type='text/javascript'
	src='<%= request.getContextPath() %>/static/js/holder.js'></script>
<script type="text/javascript"
	src="<%= request.getContextPath() %>/utils.js"></script>
<script type="text/javascript"
	src="<%= request.getContextPath() %>/static/js/choice-support.js"> </script>

<%--Gooogle Analytics recording.--%>
<%
    if (analyticsKey != null && analyticsKey.length() > 0)
    {
    %>
<script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', '<%= analyticsKey %>
	' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
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

	<main id="content" role="main"> <!-- 
		Barra governo
	 -->
	<div id="barra-brasil">
		<div id="wrapper-barra-brasil">
			<div class="brasil-flag">
				<a class="link-barra" href="http://brasil.gov.br/">Brasil</a>
			</div>
			<span class="acesso-info"><a class="link-barra"
				href="http://brasil.gov.br/barra#acesso-informacao">Acesso à informação</a></span>
		</div>
	</div>


	<!-- 
		Div container das modificações do participa.br, criada para isolar folha de estilo do DSpace e do portal	 
	  -->
	<div class="layout-participa">
	
		<div id="wrapper" class="wrelativo">


			<!-- 
			Banner do participa.br	
		 -->
			<div role="banner" id="header">

				<div>

					<ul id="accessibility">
						<li><a id="link-conteudo"
							href="http://www.brasil.gov.br/#acontent" accesskey="1"> Ir para o conteúdo <span>1</span>
						</a></li>
						<li><a id="link-navegacao"
							href="http://www.brasil.gov.br/#anavigation" accesskey="2">Ir para o menu <span>2</span>
						</a></li>
						<li><a id="link-buscar"
							href="http://www.brasil.gov.br/#SearchableText" accesskey="3">Ir para a busca <span>3</span>
						</a></li>
						<li class="last-item"><a id="link-rodape"
							href="http://www.brasil.gov.br/#afooter" accesskey="4"> Irpara o rodapé <span>4</span>
						</a></li>
					</ul>
					<ul id="portal-siteactions">
						<li id="siteaction-accessibility"><a accesskey="5"
							title="Acessibilidade"
							href="http://www.brasil.gov.br/acessibilidade">Acessibilidade</a></li>
						<li id="siteaction-contraste"><a accesskey="6"
							title="Alto Contraste" href="http://www.brasil.gov.br/#">Alto
								Contraste</a></li>
						<li class="last-item" id="siteaction-mapadosite"><a
							accesskey="7" title="Mapa do Site"
							href="http://www.brasil.gov.br/mapadosite">Mapa do Site</a></li>
					</ul>

					<div id="logo">
						<a href="<%= request.getContextPath() %>" title="" id="portal-logo"> <br> <br>
							<img
							src="<%= request.getContextPath() %>/image/participa-br/nometopo.png">
						</a>
					</div>

					<div id="portal-searchbox">
						
						<!-- Treinamento: modificação de variávies -->
						<form method="get" action="<%= request.getContextPath() %>/simple-search" scope="search">
							<fieldset class="LSBox">
								<legend class="hiddenStructure"> Buscar no site </legend>
								<label for="nolivesearchGadget" class="hiddenStructure">Busca</label>

								<input type="text" class="searchField"
									placeholder="Buscar no site" title="Search Site" size="18"
									name="query" id="tequery" size="25"> <input type="submit"
									value="Buscar" class="searchButton">

								<div id="LSResult" class="LSResult">
									<div id="LSShadow" class="LSShadow"></div>
								</div>
							</fieldset>
						</form>

					</div>

					<div id="social-icons">
						<img height="20" border="0" alt=""
							usemap="#image-maps-2014-10-05-103938"
							src="<%= request.getContextPath() %>/image/participa-br/social_links.png">
						<map id="ImageMapsCom-image-maps-2014-10-05-103938"
							name="image-maps-2014-10-05-103938">
							<area target="_self" style="outline: none;" coords="2,0,32,32"
								shape="rect" href="#" title="" alt="">
							<area target="_self" style="outline: none;" coords="39,0,73,33"
								shape="rect" href="#" title="" alt="">
							<area target="_self" style="outline: none;" coords="79,0,113,32"
								shape="rect" href="#" title="" alt="">
							<area target="_self" style="outline: none;" coords="119,0,151,32"
								shape="rect" href="#" title="" alt="">
							<area
								href="http://www.image-maps.com/index.php?aff=mapped_users_0"
								title="Image Map" style="outline: none;" alt="Image Map"
								coords="149,31,151,33" shape="rect">
						</map>
					</div>

				</div>

				<div
					style="height: 30px; background-color: #F8C300; width: 100%; max-width: 3000px"
					id="sobre2">&nbsp;</div>

				<div id="sobre">
					<ul>
						<li class="portalservicos-item"
							id="portalservicos-perguntas-frequentes-1"><a
							href="<%= request.getContextPath() %>">PÁGINA INICIAL</a></li>
						<li class="portalservicos-item"
							id="portalservicos-fale-com-o-governo"><a
							href="#">A BIBLIOTECA</a></li>
							
						<!-- Treinamento: Adição de verificação para usuário administrador -->
						<% if(isAdmin) { %>
							<li class="portalservicos-item"
								id="portalservicos-fale-com-o-governo">
								<a href="<%= request.getContextPath() %>/community-list">COMUNIDADES E COLEÇÕES</a></li>
						<% } %>
							
						<li class="portalservicos-item"
							id="portalservicos-fale-com-o-governo">
							<a href="<%= request.getContextPath() %>/mydspace">MEU ESPAÇO</a></li>
						<li class="portalservicos-item"
							id="portalservicos-fale-com-o-governo"><a
							href="#">RECOMENDAMOS</a></li>
						<li class="portalservicos-item last-item"
							id="portalservicos-fale-com-o-governo"><a
							href="<%= request.getContextPath() %>/feedback">FALE CONOSCO</a></li>
					</ul>
				</div>

			</div>

			<!-- 
			Fim: Banner do participa.br	
		 	-->



			<!-- 
		 	Barra de comunidades
		  -->
			<div style="margin-bottom: 0px" class="navbar-participa">
				<div class="container">
					<div class="row">
						<div
							style="padding-top: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 16px; color: #00316f; padding-left: 0px;"
							class="col-md-2">COMUNIDADES</div>
						<div
							style="padding-top: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 10px; color: #00316f; padding-right: 0px;"
							class="col-md-8 text-right">
							
							
							<!-- 
								Busca contextualizada
							 -->
							 
							
							<input type="text"
								style="font-family: Arial, Helvetica, sans-serif; font-size: 10px; color: #00316f"
								id="nolivesearchGadget" class="searchField"
								placeholder="Busca Simples nas Comunidades" size="60"
								name="SearchableText"> &nbsp; 
								<input type="image" style="height: 13px" src="<%= request.getContextPath() %>/image/participa-br/search-button.gif">
								&nbsp; 
								<input type="button" value="Busca Avançada nas Comunidades" class="searchButton">
								
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 fundo_com_hr">&nbsp;</div>
					</div>
					<div class="row">
						<div class="col-md-1">&nbsp;</div>
						
						<div style="alignment-adjust: central; padding-right: 0px;" class="col-md-12 communities-container">
							
							<a href="<%= request.getContextPath() %>/handle/<%= ConfigurationManager.getProperty("home.community.handle.politicagestaogovernanca") %>"> 
								<img src="<%= request.getContextPath() %>/image/participa-br/comu1.png"></a>&nbsp;&nbsp;
							
							<a href="<%= request.getContextPath() %>/handle/<%= ConfigurationManager.getProperty("home.community.handle.instanciasmecanismos") %>"> 
								<img src="<%= request.getContextPath() %>/image/participa-br/comu2.png">
							</a>&nbsp;&nbsp;
							
							<a href="<%= request.getContextPath() %>/handle/<%= ConfigurationManager.getProperty("home.community.handle.organizacoesmovimentos") %>">
								<img src="<%= request.getContextPath() %>/image/participa-br/comu3.png">
							</a>&nbsp;&nbsp;
							
							<a href="<%= request.getContextPath() %>/handle/<%= ConfigurationManager.getProperty("home.community.handle.processoseducativos") %>">
								<img src="<%= request.getContextPath() %>/image/participa-br/comu4.png">
							</a>&nbsp;&nbsp;
							
							<a href="<%= request.getContextPath() %>/handle/<%= ConfigurationManager.getProperty("home.community.handle.estudospesquisas") %>">
								<img src="<%= request.getContextPath() %>/image/participa-br/comu5.png">
							</a>&nbsp;&nbsp;
							
							
							<a href="<%= request.getContextPath() %>/handle/<%= ConfigurationManager.getProperty("home.community.handle.dialogossociais") %>">
								<img src="<%= request.getContextPath() %>/image/participa-br/comu6.png">
							</a>&nbsp;&nbsp;
							
							<a href="<%= request.getContextPath() %>/handle/<%= ConfigurationManager.getProperty("home.community.handle.governoaberto") %>">
								<img src="<%= request.getContextPath() %>/image/participa-br/comu7.png">
							</a>&nbsp;&nbsp;
							
							<a href="<%= request.getContextPath() %>/handle/<%= ConfigurationManager.getProperty("home.community.handle.marcoregulatorio") %>">
								<img src="<%= request.getContextPath() %>/image/participa-br/comu8.png">
							</a>
						</div>
						<div class="col-md-1">&nbsp;</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%-- Page contents --%>
	<div class="container">
		<% if (request.getAttribute("dspace.layout.sidebar") != null && !request.getAttribute("dspace.layout.sidebar").toString().trim().isEmpty()) { %>
			<div class="row">
				<div class="col-md-9">
		<% } %>