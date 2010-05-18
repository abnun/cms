<jq:jquery>
	$('${dialogLinkId ? '#' + dialogLinkId : '#dialog_link'}').click(function() {
		$('${dialogId ? '#' + dialogId : '#dialog'}').dialog('open');
	});

	$('${dialogLinkId ? '#' + dialogLinkId : '#dialog_link'}, ul#icons li').hover(
		function() { $(this).addClass('ui-state-hover'); },
		function() { $(this).removeClass('ui-state-hover'); }
	);
</jq:jquery>