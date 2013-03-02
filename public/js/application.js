jQuery(function() {

	$('.link-row').click(function() {
		window.location = $(this).attr('id');
	});
	
	$('a.job-link[data-status="Closed"]').hide();
	
	$('#job-list-toggle button').click(function() {
		$('#job-list-toggle button').removeClass('active');
		$(this).addClass('active');
		var status = $(this).attr('data-toggle');
		$('a.job-link').hide();
		$('a.job-link[data-status="' + status + '"]').show();
		return false;
	});
		
});