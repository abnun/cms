<%@ page import="de.webmpuls.cms.people.ShiroRole" contentType="text/html;charset=UTF-8" %>
<g:if test="${infoBoxen}">

	<g:each var="infoBox" in="${infoBoxen}">
		<div class="box" id="identifier" style="width: 130px; margin-top: 20px; margin-left: 10px; float: left;">

			<g:render template="/global/ui/box/boxHeader" model="[header: infoBox.ueberschrift]"/>

			<div class="bd">
				<div class="c">
					<p class="copy" style="margin-top: 0px; margin-bottom: 0px;">
						${infoBox.inhalt}

						<shiro:hasRole name="${ShiroRole.BENUTZER}">
							<span>
								<g:link controller="infoBox" action="edit" id="${infoBox.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="InfoBox ändern" title="InfoBox ändern" border="0"/></g:link>
							</span>
						</shiro:hasRole>
					</p>
				</div>
			</div>
			<g:render template="/global/ui/box/boxFooter"/>
		</div>
	</g:each>

</g:if>