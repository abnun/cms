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
								<g:link controller="infoBox" action="edit" id="${infoBox.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Infobox ändern" title="Infobox ändern" border="0"/></g:link>
								<jq:jquery>
									$("#infoBox_del_${infoBox?.id}").click(function () {
										if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
										{
											document.forms.InfoBoxDeleteForm_${infoBox?.id}.submit();
										}
									});
								</jq:jquery>
								<a href="javascript: void(0);" id="infoBox_del_${infoBox?.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Infobox löschen" title="Infobox löschen" border="0"/></a>
								<g:form action="delete" controller="infoBox" id="${infoBox?.id}" name="InfoBoxDeleteForm_${infoBox?.id}" method="post" style="height: 0px; line-height: 0px;">
									<g:hiddenField name="abteilung.id" value="${abteilungInstance.id}" />
								</g:form>
							</span>
						</shiro:hasRole>
					</p>
				</div>
			</div>
			<g:render template="/global/ui/box/boxFooter"/>
		</div>
	</g:each>

</g:if>