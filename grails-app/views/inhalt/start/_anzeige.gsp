<jq:jquery>
	$("#anzeige_open_${i}").click(function () {
		$("#anzeige_inhalt_${i}").slideToggle("normal");
		$("#anzeige_open_${i}").toggle();
		$("#anzeige_close_${i}").toggle();
	  });
	$("#anzeige_close_${i}").click(function () {
		$("#anzeige_inhalt_${i}").slideToggle("normal");
		$("#anzeige_close_${i}").toggle();
		$("#anzeige_open_${i}").toggle();
	  });
	$("#anzeige_del_${anzeige.id}").click(function () {
		if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}'))
		{
			$.post("${createLink(controller: 'anzeigen', action: 'delete', id: anzeige.id)}");
			location.reload();
		}
	});
</jq:jquery>
<table width="270" height="40" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="26" valign="top"><a id="anzeige_open_${i}" href="javascript: void(0);"><img id="anzeige_arrow_right_${i}" src="${resource(dir: 'bilder/divers', file: 'arrow_right.jpg')}" width="18" height="14" border="0"/></a><a id="anzeige_close_${i}" href="javascript: void(0);" style="display: none;"><img id="anzeige_arrow_down_${i}" src="${resource(dir: 'bilder/divers', file: 'arrow_down.jpg')}" width="18" height="14" border="0"/></a></td>
		<td valign="top">
			<p>
				<span class="copy">${anzeige.ueberschrift1 ?: anzeige.abteilung?.name}</span>
				<span class="wichtig"><br></span>
				<span class="subline">${anzeige.ueberschrift2}</span>
				<span>
					<g:link controller="anzeigen" action="edit" id="${anzeige.id}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="Anzeige ändern" title="Anzeige ändern" border="0" /></g:link>
					<a href="javascript: void(0);" id="anzeige_del_${anzeige.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="Anzeige löschen" title="Anzeige löschen" border="0" /></a>
				</span>
				<span class="headline_dunkel"><br /></span>
			</p>
		</td>
	</tr>
	<tr>
		<td valign="top" style="line-height: 0;">&nbsp;</td>
		<td width="294" valign="top" class="copy">
			<span id="anzeige_inhalt_${i}" style="display: none;">${anzeige.inhalt}</span>
		</td>
	</tr>
	<tr>
		<td height="5" colspan="2"><div align="left"><img src="${resource(dir: 'bilder/divers', file: 'linie_grau.png')}" width="270" height="3"></div></td>
	</tr>
</table>