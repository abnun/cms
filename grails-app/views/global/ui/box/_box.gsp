<%@ page contentType="text/html;charset=UTF-8" %>
<div class="box" id="identifier" style="width: 130px; float: left;">
	<g:render template="/global/ui/box/boxHeader" model="${headerModel}" />

	<g:render template="/global/ui/box/boxBody" model="${bodyModel}" />

	<g:render template="/global/ui/box/boxSeparator" model="${separatorModel}" />

	<g:render template="/global/ui/box/boxFooter" model="${footerModel}" />
</div>