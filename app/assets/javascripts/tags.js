// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready;
ready = function() {
	$('#tag_color').simplecolorpicker({picker: true, theme: 'glyphicons'})
};

$(document).ready(ready);
$(document).on('page:load', ready);
