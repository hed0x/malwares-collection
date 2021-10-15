$(document).ready(function(){
	function changeViewport(){
		if ($(window).width() < 150 || $(window).height() < 150){
			$('meta[name=viewport]').attr("content", "initial-scale=0");
		} else {
			$('meta[name=viewport]').attr("content", "width=device-width, initial-scale=1.0");
		}
	}

	changeViewport();
});