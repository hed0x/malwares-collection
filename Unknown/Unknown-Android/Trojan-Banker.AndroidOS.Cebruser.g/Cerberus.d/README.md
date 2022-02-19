# Cerberus Android Malware Main Subject

[![Png|Url](https://consumersforinternetcompetition.com/images2/news/bigimage/2020/02/2020-02-27-image-35.jpg)](https://consumersforinternetcompetition.com/)  

Cerberus is a Trojan Horse intended to steal bank accounts that emerged in 2019. A three-headed dog with a lot of functionality, but whose main purpose is to steal bank accounts.

I never knew that Cerberus would be an essential for me. It’s a software I’ve been studying for a long time and doing countless research on. It was a product that really took me a lot of time but, I was finally able to install and test it. Source codes were made public about 1 year ago. You can access the source code on github.

It is a malware that stands out the most among its competitors by the time it comes out and is still used. Perhaps one of the reasons it came to these degrees is that it was written entirely from scratch. Unlike other malicious banking software, React JS has started to use it to simultaneously view data. In addition to React JS, it has been used in languages such as php, java, javascript.

Third-party software used :
> The Lightweight PHP Database Framework
> JavaScript obfuscator
> ProGuard

C2 (command and control server) servers communicate with restapi and send commands to the bot. The main server only runs on tor and exchanges data with restapi servers over the tor network. Restapi servers, on the other hand, send information from their database to the main server.
[![Cerberus|Analysis](https://miro.medium.com/max/700/0*aFMyNVAg29iNr4YN.png)](https://baranertemir.medium.com/cerberus-android-malware-analysis-part-1-62d975c8620)

Restapi servers run on the tor network and on the web network. These side servers only have 2 files. One of them is the restapi.php file running on tor, and the other is the gate.php file running on the web network.
Devices exposed to malware first send a request to the gate.php file of the side server.
[![Cerberus|Analysis](https://miro.medium.com/max/700/0*rE-ic6TNb_t9hd3b.png)](https://baranertemir.medium.com/cerberus-android-malware-analysis-part-1-6)

According to the data in the incoming request, the gate file saves this data in the database after the operation. After this process, the main server requests the data by sending a request to the restapi.php file running on the tor network, and then the restapi.php file sends the data to the main server.
All side servers are accessed through the main server and the data of the side servers are never mixed with each other. Because each user has a defined access key and authorize key.

## Features

- Sending SMS
- 2FA Grabber
- Interception of SMS
- Covert SMS Interception
- Lock Your Device
- Mute The Sound
- Keylogger
- Execution USSD Commands
- Call Forwarding
- Lanuch Any Installed Application
- Bank Push Notification
- Open Url Browser
- Get All Installed Apps
- Retrieve All Contacts From Their Phone Book
- Retrieve All Saved SMS
- Removing Any Application
- Bot Self-Destruction
- Automatic Confirmation Of Rights and Permissions
- The Bot Can Have Several Spare Urls to Connect to The Server
- Injections ( Html + Javascript+ CSS + Download to The Device and Run From Disk, Poor Connection or lack of Internet Will Not Affect Operation of Injections)
- Card Grabber
- Mail Grabber
- Automatic Inclusion of Injections after The Time Specified in The Admin Panel
- Anti-Emulator (Bot Starts Working After the Device is Active)

[![Cerberus|Analysis](https://miro.medium.com/max/700/0*Mr0l7yw-nipt-Y3s.png)](https://baranertemir.medium.com/cerberus-android-malware-analysis-part-1-6)
_Cerberus Simple İnject Generator (V1)_

Cerberus was launched in two different versions, v1 and v2. In the Injections section, credit cards, emails and bank accounts were kept in separate places when it first came out, while in the V2 version they were all presented in bulk.

[![Cerberus|Analysis](https://miro.medium.com/max/700/0*k_AXjlSc-fKoo2r5.png)](https://baranertemir.medium.com/cerberus-android-malware-analysis-part-1-6)

On the other hand, it has unique features such as play protect disable, device admin, 2FA grabber as well as injections. But after testing, I observed that the automatic play protect disable feature does not work very stable. These features work smoothly on all android versions up to android 11.
As I mentioned, cerberus continued to be developed until the V2 version, but malicious software developers took advantage of people’s ignorance and developed many copies of software.
# CTRL + C & CTRL + V Scam Softwares

[![Cerberus|Analysis](https://miro.medium.com/max/700/0*BgSAYW9-KpkXhpio)](https://baranertemir.medium.com/cerberus-android-malware-analysis-part-1-6)
_Chimera Android Botnet_

[![Cerberus|Analysis](https://miro.medium.com/max/700/1*byH8W7Aj792D3WeeRDk_kw.png)](https://baranertemir.medium.com/cerberus-android-malware-analysis-part-1-6)
_Cerberus V3 Android Botnet_

[![Cerberus|Analysis](https://miro.medium.com/max/1838/1*xTGC8thmiX3Atlhxu0fmng.png)](https://baranertemir.medium.com/cerberus-android-malware-analysis-part-1-62d975c8620)
_Cerberus V4 Android Botnet_

