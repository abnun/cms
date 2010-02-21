<jq:jquery>
	$('#dialog_link').click(function() {
		$('#dialog').dialog('open');
	});

	$('#dialog_link, ul#icons li').hover(
		function() { $(this).addClass('ui-state-hover'); },
		function() { $(this).removeClass('ui-state-hover'); }
	);
</jq:jquery>