<%@ page import="de.webmpuls.cms.people.ShiroRole" %>

<shiro:hasRole name="${ShiroRole.BENUTZER}">
	<g:form action="delete" controller="anzeigen" id="${anzeige.id}" name="AnzeigeDeleteForm_${anzeige.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
	<jq:jquery>
		$("#anzeigen_del_${anzeige.id}").click(function () {
			if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
			{
				document.forms.AnzeigeDeleteForm_${anzeige.id}.submit();
			}
		});
	</jq:jquery>
</shiro:hasRole>
<g:render template="/global/ui/accordionTab" model="[itemName: 'anzeigen', item: anzeige, accordionTabUeberschrift1: anzeige.ueberschrift1 ?: anzeige.abteilung.name, accordionTabUeberschrift2: anzeige.ueberschrift2, text: anzeige.inhalt, isEditable: true]" />