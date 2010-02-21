<%@ page contentType="text/html;charset=UTF-8" %>

<g:render template="/global/javascript/jQueryUIJS" />
<jq:jquery>

	$('#dialog').dialog( {
				title: 'Auswahl-Dialog',
				bgiframe: true,
				autoOpen: false,
				closeOnEscape: true,
				modal: true,
				resizable: false,
				hide: 'explode',
				width: 450,
				<g:if test="${isMultiUpload}">
					buttons: {
						"Warteschlange löschen": function() {
							$('#albumFotos').uploadifyClearQueue();
						},
						"Upload starten": function() {
							var queryString = { 'album.id': '${album.id}', 'rotate': $('#rotate').val() };
							$('#albumFotos').uploadifySettings('scriptData', queryString);
							$('#albumFotos').uploadifyUpload();
						}
					}
				</g:if>
				<g:else>
					buttons: {
					"Auswahl bestätigen": function() {
							var valueSelect = $("input[name='picture_select_hidden']").val();
							var valueUpload = $("input[name='fotos']").val();

							if(valueSelect == "true" || valueUpload != "")
							{
								if(valueSelect == "true" && valueUpload == "")
								{
									$("form[name='PictureSelectForm']").submit();
								}
								else
								{
									$("form[name='PictureUploadForm']").submit();
								}
							}
							else
							{
								$("#dialog_error").slideDown("slow");
							}
						}
					}
				</g:else>
		});

</jq:jquery>

<g:render template="/global/javascript/buttonJS" />

<g:render template="/global/css/buttonCSS" />