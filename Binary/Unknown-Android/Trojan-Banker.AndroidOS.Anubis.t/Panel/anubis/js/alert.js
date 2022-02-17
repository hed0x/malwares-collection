function startNatif(success,message){
$('#showAlert').append("<div class='alert alert-"+success+" fade in' id='alert' style='top:6%; left: 77%; width:19%;position: absolute;'><a href='#' class='close' data-dismiss='alert'>×</a>"+message+"</div>");
setTimeout("$('.alert').alert('close')", 4000);
}
