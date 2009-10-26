<%@ page import="de.webmpuls.cms.section.Abteilung; de.webmpuls.cms.people.Funktion; de.webmpuls.cms.people.Person" %>
<html>
    <head>
        <title>
            Adressliste
        </title>
        <meta name="layout" content="main" />
		<style type="text/css">
		@page { size: A4 landscape }
		</style>
    </head>

    <body>
		<div class="body">
        	<h1>Adressliste</h1>

			<div class="list">
				<table>
					<tr class="odd">
						<th>Name</th>
						<th>Vorname</th>
						<th>Strasse</th>
						<th>PLZ</th>
						<th>Ort</th>
						<th>Telefon</th>
						<th>Handy</th>
						<th>E-Mail</th>
						<th></th>
					</tr>
					<g:if test="${mitgliederList != null && !mitgliederList.isEmpty()}">
						<g:each status="i" var="mitglied" in="${mitgliederList}">
							<%
							    String funktionenString = ""
							    if(mitglied.funktionen)
								{
									for(Funktion tmpFunktion : mitglied.funktionen)
									{
										if(!funktionenString && mitglied.funktionen.size() > 1)
										{
											funktionenString += "${tmpFunktion}, "
										}
										else
										{
											funktionenString += "${tmpFunktion}"
										}
									}
								}
							%>
							<g:render template="tableCell" model="[person: mitglied, funktion: funktionenString, tableClass: (i % 2) == 0 ? 'odd' : 'even']" />
						</g:each>
					</g:if>
				</table>
			</div>
		</div>
    </body>
</html>