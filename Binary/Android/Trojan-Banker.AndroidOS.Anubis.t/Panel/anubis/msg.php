
<style type="text/css">

.mymagicoverbox_fenetre {
  z-index:9999;
  position:fixed;
  margin-left:50%;
  top:100px;
  text-align:center;
  display:none;
  padding:5px;
  border-radius: 2px;
  color:#A52A2A;
 
}
.mymagicoverbox_fermer {
  color:#FFFFE0;
  cursor:pointer;
  font-weight:400;
  font-size:14px;
  font-style:normal
  font-family:'Roboto';
}


</style>

<?php 



function ShowMessage($text, $color)
{
echo "
	<script src='http://code.jquery.com/jquery-1.11.1.js'></script>

	<div id='block' class='mymagicoverbox_fenetre mymagicoverbox_fermer' 
	style='left:350px; top: 35px; width:250px;  background-color: $color; border: 0.1 px groove #fff; display: none;'>
	$text
	</div>

	<script type='text/javascript'>
	function delete_cookie ( cookie_name )
	{
	  var cookie_date = new Date ( );  
	  cookie_date.setTime ( cookie_date.getTime() - 1 );
	  document.cookie = cookie_name += '=; expires=' + cookie_date.toGMTString();
	}

	$('#block').fadeIn(250);

	$('#block').click(function()
	{
		   $('#block').fadeOut(250); 
		 delete_cookie('msg');
		   
	});
	</script>";
}
?>