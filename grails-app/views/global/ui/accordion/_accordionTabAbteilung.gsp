<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="de.webmpuls.photo_album.Album; de.webmpuls.photo_album.Picture; de.webmpuls.cms.people.ShiroRole" %>
<div style="width: 695px;">
	<h3>
		<a name="bericht_${item.id}" href="javascript: void(0);">
			<g:render template="/global/ui/accordion/accordionHeaderAbteilung" model="[abteilung: abteilung, accordionTabUeberschrift1: accordionTabUeberschrift1, accordionTabUeberschrift2: accordionTabUeberschrift2, datum: datum]"/>
		</a>
	</h3>
	<div style="width: 695px;">
		<g:if test="${isEditable}">

			<shiro:hasRole name="${ShiroRole.BENUTZER}">
				<span>
					<g:link controller="${itemName}" action="edit" id="${item.id}" params="${params}"><img src="${resource(dir: '/images/skin', file: 'database_edit.png')}" alt="ändern" title="ändern" border="0"/></g:link>
					<a href="javascript: void(0);" id="${itemName}_del_${item.id}"><img src="${resource(dir: '/images/skin', file: 'database_delete.png')}" alt="löschen" title="löschen" border="0"/></a>
				</span>
				<br/>
			</shiro:hasRole>
		</g:if>
		<span style="display: block; width: 670px;">
			<%
			    Album tmpAlbum = item.album
				Picture bild = null

				int size = 0

				if(tmpAlbum && tmpAlbum.getPictures())
				{
					bild = tmpAlbum.getPictures()?.first()
					size = tmpAlbum.getPictures()?.size()
				}
			%>
			<g:if test="${bild}">
				<span style="display: block; margin-left: 10px; margin-right: 10px; width: 140px; min-width: 140px; max-width: 140px; float: right;">
					<table width="140" border="0" cellpadding="3" bordercolor="#93C9FF">
						<tr>
							<td style="width: 140px; height: 140px; border: 1px solid #999999;" colspan="2" class="infohead"><img width="140" alt="" border="0" src="${wm_photo_album.pathToImage(picture: bild)}" /></td>
						</tr>
						<tr>
							<td valign="bottom" bordercolor="#999999" class="copy">Bild
							1 von ${size}</td>
							<td valign="bottom" bordercolor="#999999" class="copy"><div align="right"><img src="${resource(dir: 'bilder/divers', file: 'icon_zoom.jpg')}" width="16" height="16"></div></td>
						</tr>
					</table>
				</span>
			</g:if>
			<g:else>
				<shiro:hasRole name="${ShiroRole.BENUTZER}">
					<span style="display: block; margin-left: 10px; margin-right: 10px; width: 140px; min-width: 140px; max-width: 140px; float: right;">
						<table width="140" border="0" cellpadding="3" bordercolor="#93C9FF">
							<tr>
								<td style="width: 140px; height: 140px; border: 1px solid #999999;" class="infohead"><img width="140" alt="" border="0" src="${resource(dir: 'images', file: 'nopicavailable.gif', plugin: 'photo-album')}" /></td>
							</tr>
							<tr>
								<td colspan="2" valign="bottom" bordercolor="#999999" class="copy"><a href="javascript: void(0);" id="dialog_link">Bilder hinzufügen</a></td>
							</tr>
						</table>
					</span>
				</shiro:hasRole>
			</g:else>
			<g:if test="${bild}">
				<span style="display: block; width: 480px; min-width: 500px; max-width: 500px;">
					${text}
				</span>
			</g:if>
			<g:else>
				<span style="display: block; width: 650px; min-width: 650px; max-width: 650px;">
					${text}
				</span>
			</g:else>

		</span>
	</div>
</div>
