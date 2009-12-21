<ckeditor:config var="toolbar_Mytoolbar">
	[
		[ %{--'Source', '-', --}%'Styles', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink']
	]
</ckeditor:config>
<ckeditor:config contentsCss="${resource(dir: 'css', file: 'ckeditor.css')}" />
<ckeditor:config stylesCombo_stylesSet="sv_leingarten_styles:${resource(dir: 'js/ckeditor/styles', file: 'sv_leingarten.js')}" />
<ckeditor:editor name="inhalt" width="${width ?: '300'}" height="${height ?: '300'}" toolbar="Mytoolbar" >${inhalt}</ckeditor:editor>