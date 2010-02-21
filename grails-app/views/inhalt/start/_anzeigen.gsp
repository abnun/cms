<%@ page import="de.webmpuls.cms.people.ShiroRole" %>
<g:render template="/global/javascript/jQueryUIJS" />
<script type="text/javascript">
	$(function() {
		$("#accordion").accordion({
			header: "h3",
			active: false,
			autoHeight: false,
			collapsible: true,
			icons: {
				header: "own-icon-circle-arrow-e",
				headerSelected: "own-icon-circle-arrow-s"
			}

		});
	});
	</script>
<style type="text/css">
	.ui-widget {
		font-family: sans-serif;
		font-size: inherit;
	}

	.ui-widget-content {
		background: none;
		border: none;
	}

	.ui-accordion .ui-accordion-header .ui-icon {
		left: 0.1em;
	}
	.ui-accordion .ui-accordion-content {
		padding: inherit;
	}
	.ui-state-default .ui-icon,
	.ui-state-hover .ui-icon {
		background-image: url('${resource(dir: 'bilder/divers', file: 'arrow_right.jpg')}');
	}
	.ui-state-active .ui-icon {
		background-image: url('${resource(dir: 'bilder/divers', file: 'arrow_down.jpg')}');
	}
	.ui-state-default, .ui-state-active {
		background: none;
		border: none;
		font-weight: normal;
		color: inherit;
	}
	.own-icon-circle-arrow-e {
		background-image: url('${resource(dir: 'bilder/divers', file: 'arrow_right.jpg')}')
	}
	.own-icon-circle-arrow-s {
		background-image: url('${resource(dir: 'bilder/divers', file: 'arrow_down.jpg')}')
	}
</style>
<table width="270" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td width="270" height="32" valign="bottom" background="${resource(dir: 'bilder/divers', file: 'kopf_hblau.jpg')}" class="headline_dunkel">SVL
		Anzeigenmarkt
			<shiro:hasRole name="${ShiroRole.ADMINISTRATOR}">
			<span>
				<g:link controller="anzeigen" action="list">
					<img src="${resource(dir: '/images/skin', file: 'database_table.png')}" alt="Übersicht Anzeigen" title="Übersicht Anzeigen" border="0"/>
				</g:link>
			</span>
			</shiro:hasRole>
		</td>
	</tr>
</table>
<g:if test="${anzeigenList}">
	<table width="27" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFCC">
		<tr>
			<td class="copy"><br>
				<div id="accordion" style="width: 270px;">
					<g:each status="i" var="anzeige" in="${anzeigenList}">
						<g:if test="${anzeige?.takeEndDate}">
							<g:if test="${anzeige?.endDatum && ((Date)anzeige?.endDatum)?.after(new Date() - 1)}">
								<g:render template="/inhalt/start/anzeige" model="['anzeige': anzeige, 'i': i]" />
							</g:if>
						</g:if>
						<g:else>
							<g:render template="/inhalt/start/anzeige" model="['anzeige': anzeige, 'i': i]" />
						</g:else>
					</g:each>
				</div>
			</td>
		</tr>
	</table>
</g:if>
<g:else>
	Derzeit sind keine Anzeigen vorhanden.
</g:else>
<shiro:hasRole name="${ShiroRole.BENUTZER}">
<br />
<br/>
<span>
	<g:link controller="anzeigen" action="create">
		<img src="${resource(dir: '/images/skin', file: 'database_add.png')}" alt="Neue Anzeige" border="0"/>&nbsp;Neue Anzeige
	</g:link>
</span>
</shiro:hasRole>
<p>&nbsp;</p>