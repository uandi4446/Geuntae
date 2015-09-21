# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
function openPopup(link) {
	link.hide()
	window.open(link.href, 'exam_dialog', 'toolbar=no, location=no, menubar=no, scrollbars=yes, resizable=no');
	return false;
}