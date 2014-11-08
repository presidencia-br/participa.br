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

<%@page import="org.apache.commons.lang.StringUtils"%>
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
<%@ page import="org.dspace.eperson.EPerson" %>



<%
	EPerson user = (EPerson) request.getAttribute("dspace.current.user");
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
    
    String navbarEmail = null;

    if (user != null)
    {
        navbarEmail = user.getEmail();
    }

%>

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
					 <!-- Comentado: funcionalidade em desenvolvimento -->
					<!-- 
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
					 -->
					 <!-- Comentado: funcionalidade em desenvolvimento -->
					 <!-- 
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
					  -->

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
								shape="rect" href="http://twitter.com/participabr" title="" alt="">
							<area target="_self" style="outline: none;" coords="39,0,73,33"
								shape="rect" href="http://facebook.com/participabr" title="" alt="">
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
					style="height: 30px; background-color: #F8C300; width: 100%; max-width: 3000px;padding-top: 10px;font-size: 12px;text-align: center;"
					id="sobre2">
					<%
						if (user != null)
					    {
						%>
							<span>Esta página está sendo acessada por: </span>
							<span><b><%= StringUtils.abbreviate(navbarEmail, 40) %></b></span>
							<span>&nbsp;<a class="logout-link" href="<%= request.getContextPath() %>/logout"><span class="glyphicon glyphicon-log-out"></span> <fmt:message key="jsp.layout.navbar-default.logout"/></a></span>
					<%
					    }
					%>
					
				</div>

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
		
           <dspace:include page="/layout/location-bar.jsp" />
		


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

