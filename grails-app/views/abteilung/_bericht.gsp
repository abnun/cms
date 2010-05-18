<%@ page import="de.webmpuls.cms.people.ShiroRole" %>

<shiro:hasRole name="${ShiroRole.BENUTZER}">
	<g:form action="delete" controller="bericht" id="${bericht.id}" name="BerichtDeleteForm_${bericht.id}" method="post" style="height: 0px; line-height: 0px;"></g:form>
	<jq:jquery>
		$("#bericht_del_${bericht.id}").click(function () {
			if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
			{
				document.forms.BerichtDeleteForm_${bericht.id}.submit();
			}
		});
	</jq:jquery>
</shiro:hasRole>
<g:render template="/global/ui/accordionTab" model="[itemName: 'bericht', item: bericht, accordionTabUeberschrift1: bericht.ueberschrift, text: bericht.inhalt, isEditable: true]" />