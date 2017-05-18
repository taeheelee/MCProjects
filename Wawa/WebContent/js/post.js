/**
 * 
 */
$(document).ready(function(){
	$('.postLink').click(function() {
	    var p = $(this).attr('href').split('?');
	    var action = p[0];
	    var params = p[1].split('&');
	    var form = $(document.createElement('form')).attr('action', action).attr('method','post');
	    $('body').append(form);
	    for (var i in params) {
	        var tmp= params[i].split('=');
	        var key = tmp[0], value = tmp[1];
	        $(document.createElement('input')).attr('type', 'hidden').attr('name', key).attr('value', value).appendTo(form);
	    }
	    $(form).submit();
	    return false;
	});
});