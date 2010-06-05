<%@ page import="de.webmpuls.cms.result.Tabelle" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'tabelle.label', default: 'Tabelle')}" />
        %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
		<style type="text/css">
		div .list table td,
		div .list table th {
			vertical-align: top;
			text-align: right;
			height:14px;
			overflow: hidden;
		}
		</style>
    </head>
    <body>
		<table>
			<tr valign="middle" align="center">
				<td valign="top" align="center">
					<g:render template="/global/javascript/createButtonJS"/>
					<button id="createButton" style="margin-left: 10px;"><g:message code="default.new.label" args="[entityName]"/></button>
				</td>
				<td valign="top" align="center">
					<jq:jquery>
						$("#importListButton").button({
							icons: {
								primary: 'ui-icon-arrowreturnthick-1-s'
							}
						}).click(function() {
							document.forms.TabelleHTMLImportForm.submit();
						});

						$("#datepickerFrom").datepicker({
							dateFormat: 'dd.mm.yy'
						});
						$("#datepickerTo").datepicker({
							dateFormat: 'dd.mm.yy'
						});

						$("#htmlImportSubmit").button();
					</jq:jquery>
					<g:form controller="import" action="tableHTMLImport" name="TabelleHTMLImportForm" method="post">
						<table>
							<tbody>
							<tr>
								<td align="right" valign="middle">
									<p class="copy">
										<label for="datepickerFrom">Von</label>
									</p>
								</td>
								<td valign="top">
									<input name="datepickerFrom" id="datepickerFrom" type="text" autocomplete="off">
								</td>
								<td align="right" valign="middle">
									<p class="copy">
										<label for="datepickerTo">Bis</label>
									</p>
								</td>
								<td valign="top">
									<input name="datepickerTo" id="datepickerTo" type="text" autocomplete="off">
								</td>
								<td valign="top">
									<button id="importListButton" style="margin-left: 10px;"><g:message code="tabelle.import.button.label" /></button>
								</td>
							</tr>
							</tbody>
						</table>
					</g:form>
				</td>
			</tr>
		</table>

        <hr />
        <div class="body">
            <g:if test="${flash.message}">
				<div class="ui-widget">
					<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
							${flash.message}
						</p>
					</div>
				</div>
			</g:if>
			<g:if test="${flash.error}">
				<div class="ui-widget">
					<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong><g:message code="default.error" />:</strong>&nbsp;${flash.error}
						</p>
					</div>
				</div>
            </g:if>
			<br/>
			<p class="copy">
				Es sind ${tabelleInstanceTotal} Ergebnisse im System hinterlegt.
			</p>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <th>&nbsp;</th>
                        
                            <g:sortableColumn property="spieldatum" title="${message(code: 'tabelle.spieldatum.label', default: 'Spieldatum')}" />
                        
                            <g:sortableColumn property="spielkennung" title="${message(code: 'tabelle.spielkennung.label', default: 'Spielkennung')}" />
                        
                            <g:sortableColumn property="heimmannschaft" title="${message(code: 'tabelle.heimmannschaft.label', default: 'Heimmannschaft')}" />
                        
                            <g:sortableColumn property="gastmannschaft" title="${message(code: 'tabelle.gastmannschaft.label', default: 'Gastmannschaft')}" />
                        
                            <g:sortableColumn property="anstoss" title="${message(code: 'tabelle.anstoss.label', default: 'Anstoss')}" />
                        
                            <g:sortableColumn property="tore" title="${message(code: 'tabelle.tore.label', default: 'Tore')}" />
                        
                            <g:sortableColumn property="spielklasse" title="${message(code: 'tabelle.spielklasse.label', default: 'Spielklasse')}" />
                        
                            <g:sortableColumn property="typ" title="${message(code: 'tabelle.typ.label', default: 'Typ')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tabelleInstanceList}" status="i" var="tabelleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tabelleInstance.id}">${i + 1}</g:link></td>
                        
                            <td><g:formatDate date="${tabelleInstance.spieldatum}" /></td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "spielkennung")}</td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "heimmannschaft")}</td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "gastmannschaft")}</td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "anstoss")}</td>

							<g:if test="${tabelleInstance?.tore?.contains('png')}">
								<td>
									<div style="position: relative; display: block; float: right; margin: 0; border: none; width: 35px; height: 14px; overflow: hidden;">
										<img style="position: absolute; ${tabelleInstance.toreImageStyle ?: ''}" src="${resource(dir: 'bilder/tabellen/tore', file: tabelleInstance?.tore)}" alt="" border="0" />
									</div>
								</td>
							</g:if>
							<g:else>
								<td>${tabelleInstance?.tore}</td>
							</g:else>

                            <td>${fieldValue(bean: tabelleInstance, field: "spielklasse")}</td>
                        
                            <td>${fieldValue(bean: tabelleInstance, field: "typ")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${tabelleInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
