
<%@ page import="de.webmpuls.cms.people.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="sv_leingarten" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        %{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%

		<g:render template="/global/javascript/jQueryUIJS" />
		<jq:jquery>
			$("#tabs").tabs();
		</jq:jquery>
		<style type="text/css">
			.ui-widget-content {
				background: white;
			}
		</style>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(controller: 'admin')}">Home</a></span>
			<g:render template="/global/menu/admin" />
		</div>
		<div class="nav">
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
        <div class="body">
            %{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<br/>
			<p class="copy">
				Es sind ${personInstanceTotal} Mitglieder im System hinterlegt.
			</p>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <th>&nbsp;</th>

                            <g:sortableColumn property="vorname" title="${message(code: 'person.vorname.label', default: 'Vorname')}" />

                            <g:sortableColumn property="nachname" title="${message(code: 'person.nachname.label', default: 'Nachname')}" />

                            <g:sortableColumn property="strasse" title="${message(code: 'person.strasse.label', default: 'Strasse')}" />

                            <g:sortableColumn property="plz" title="${message(code: 'person.plz.label', default: 'Plz')}" />

                            <g:sortableColumn property="ort" title="${message(code: 'person.ort.label', default: 'Ort')}" />

                            <g:sortableColumn property="telefon1" title="${message(code: 'person.telefon1.label', default: 'Telefon1')}" />

                            <g:sortableColumn property="telefon2" title="${message(code: 'person.telefon2.label', default: 'Telefon2')}" />

                            <g:sortableColumn property="email" title="${message(code: 'person.email.label', default: 'Email')}" />

                            <g:sortableColumn property="adresseAnzeigen" title="${message(code: 'person.adresseAnzeigen.label', default: 'Adresse Anzeigen')}" />

							<th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personInstanceList}" status="i" var="personInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${personInstance.id}">${i + 1}</g:link></td>

                            <td>${fieldValue(bean: personInstance, field: "vorname")}</td>

                            <td>${fieldValue(bean: personInstance, field: "nachname")}</td>

                            <td>${fieldValue(bean: personInstance, field: "strasse")}</td>

                            <td>${fieldValue(bean: personInstance, field: "plz")}</td>

                            <td>${fieldValue(bean: personInstance, field: "ort")}</td>

                            <td>${fieldValue(bean: personInstance, field: "telefon1")}</td>

                            <td>${fieldValue(bean: personInstance, field: "telefon2")}</td>

                            <td>${fieldValue(bean: personInstance, field: "email")}</td>

                            <td><g:formatBoolean boolean="${personInstance.adresseAnzeigen}" /></td>

							<td><g:link action="edit" id="${personInstance.id}"><g:message code="person.edit" default="Bearbeiten" /></g:link></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>--}%

			<br/>
			<%
			    boolean personInstanceTotalNotZero = personInstanceTotal > 0
			%>
			<p class="headline" style="margin-left: 10px;">Funktionen:</p>
			<div id="tabs">
				<ul>
					<g:if test="${personInstanceTotalNotZero}">
						<li><a href="#tabs-1">Export</a></li>
					</g:if>
					<li><a href="#tabs-2">Import</a></li>
				</ul>
				<g:if test="${personInstanceTotalNotZero}">
					<div id="tabs-1">

						<table style="font-size: 10px;">
							<tr>
								<td>
										<g:pdfLink url="/export/pdfExportVorstand" filename="AdressenlisteVorstand.pdf" class="pdf_link">Vorstand- und Abteilungsleiterliste PDF-Export</g:pdfLink>
								</td>
								<td>
									<span style="margin-left: 20px;">
										&nbsp;
									</span>
								</td>
								<td>
										<g:link controller="export" action="excelExportVorstand" params="[fileName: 'AdressenlisteVorstand']" class="excel_link">Vorstand- und Abteilungsleiterliste Excel-Export</g:link>
								</td>
							</tr>
							<tr>
								<td>
										<g:pdfLink url="/export/pdfExportMitglieder" filename="Mitgliederliste.pdf" class="pdf_link">Mitgliederliste PDF-Export</g:pdfLink>
								</td>
								<td>
									<span style="margin-left: 20px;">
										&nbsp;
									</span>
								</td>
								<td>
										<g:link controller="export" action="excelExportMitglieder" params="[fileName: 'Mitgliederliste']" class="excel_link">Mitgliederliste Excel-Export</g:link>
								</td>
							</tr>
						</table>
					</div>
				</g:if>

				<div id="tabs-${personInstanceTotalNotZero ? '2' : '1'}">
					<div>
						<span>
							<g:uploadForm controller="import" action="excelImport" name="ExcelUploadForm">
								<input type="file" name="file"/>
								<a href="javascript: void(0);" class="excel_link" onclick="document.forms.ExcelUploadForm.submit();">Excel-File einlesen</a>
							</g:uploadForm>
						</span>
					</div>
				</div>
			</div>
        </div>
    </body>
</html>
