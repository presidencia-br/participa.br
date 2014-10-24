<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.dspace.app.webui.util.UIUtil"%>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

<%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
</div>
<div class="col-md-3">
	<%= sidebar %>
</div>
</div>
<%
    }
%>
</div>
</main>
<%-- Page footer --%>

<div class="layout-participa">
	<div
		style="background-color: #d0d1d3; width: 100%; height: 50px; alignment-adjust: central"
		class="footer rodape">
		<div class="container">
			<div class="row">
				<div class="col-md-1">&nbsp;</div>
				<div style="padding-top: 8px;" class="col-md-5">
					<a href="http://www.acessoainformacao.gov.br/"><img
						src="<%= request.getContextPath() %>/image/participa-br/acesso_info.png"></a>
				</div>
				<div style="padding-top: 8px;" class="col-md-5 text-right">
					<a href="http://www.brasil.gov.br/"><img
						src="<%= request.getContextPath() %>/image/participa-br/secretaria_geral.png"></a>
				</div>
				<div class="col-md-1">&nbsp;</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>