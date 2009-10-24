<%@ page import="de.webmpuls.cms.people.Person" %>
<%
    Person tmpPerson = person
%>
<g:if test="${tmpPerson && funktion}">
	<tr class="${tableClass}">
		<td>
			${tmpPerson.nachname?.encodeAsUnicode()}
		</td>
		<td>
			${tmpPerson.vorname?.encodeAsUnicode()}
		</td>
		<td>
			${tmpPerson.strasse?.encodeAsUnicode()}
		</td>
		<td>
			${tmpPerson.plz?.encodeAsUnicode()}
		</td>
		<td>
			${tmpPerson.ort?.encodeAsUnicode()}
		</td>
		<td>
			${tmpPerson.telefon1?.encodeAsUnicode()}
		</td>
		<td>
			${tmpPerson.telefon2?.encodeAsUnicode()}
		</td>
		<td>
			${tmpPerson.email?.encodeAsUnicode()}
		</td>
		<td>
			<b>${funktion.encodeAsUnicode()}</b>
		</td>
	</tr>
</g:if>