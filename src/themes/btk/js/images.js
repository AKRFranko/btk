(function($) {

	var replaceImages = function() {
		$('img[data-hires-image]').each(function() {
			var hiressrc = $(this).data('hires-image');
			if (hiressrc !== $(this).attr('src')) {
				$(this).attr('src', hiressrc);
			}


		});
	}
	$(function() {
		window.requestAnimationFrame(replaceImages);

	})
})(jQuery)