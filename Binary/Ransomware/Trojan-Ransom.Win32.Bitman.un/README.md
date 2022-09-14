# Ransomware Analysis and Mitigation

This is the respotiory of Ransomware Analysis and Mitigation senior project research. This research focus to study on how ransomware has created and distributed since the first ransomware appeared. The goals of this research are find solutions to prevent and mitigate damage from ransomware. Most of details and documents on this research are originally Thai. English version coming soon.

This research was conducted as bachelor's thesis from Information Technology faculty, King's Mongkut Institute of Technology Ladkrabang, Thailand by [pe3zx](https://keybase.io/pe3z)

## Description

**Ransomware Analysis and Mitigation (การวิเคราะห์มัลแวร์เรียกค่าไถ่และการลดผลกระทบ)**

- จุดประสงค์
	- การวิเคราะห์มัลแวร์เรียกค่าไถ่เพื่อศึกษาการทำงานและการค้นคว้าพัฒนาวิธีการในการป้องกับและลดผลกระทบที่เกิดจากมัลแวร์เรียกค่าไถ่
- แนวทางในการปฏิบติ
	- ทำการวิเคราะห์โดยใช้วิธีการแบบ dynamic analysis เพื่อตรวจสอบลักษณะของมัลแวร์เบื้องต้น และวิเคราะห์การทำงานของมัลแวร์ภายใต้สภาพแวดล้อมจำลองเพื่อศึกษาลักษณะการทำงานของมัลแวร์
	- ทำการวิเคราะห์โดยใช้วิธีการแบบ static analysis เพื่อศึกษาการทำงานของมัลแวร์ในระดับของโปรแกรม โดยการใช้วิศกรรมย้อนกลับเพื่อตรวจสอบแต่ละส่วนต่างๆ ของโปรแกรมซึ่งประกอบเป็นมัลแวร์
	- ค้นคว้าและพัฒนาวิธีการป้องกันและผลกระทบจากมัลแวร์โดยใช้ผลลัพธ์และข้อสรุปต่างๆ มาจากการวิเคราะห์ทั้งแบบ dynamic analysis และ static analysis
- ผลที่คาดว่าจะได้รับ
	- ความเข้าใจในขั้นตอนการทำงานของมัลแวร์เรียกค่าไถ่
	- แนวทางในการป้องกันและลดผลกระทบจากมัลแวร์เรียกค่าไถ่

## Abstract

มัลแวร์เรียกค่าไถ่มีการแพร่ระบาดและสร้างความเดือดร้อนแก่ผู้ใช้เป็นจำนวนมากและยังไม่มีหนทางในการแก้ไขอย่างมีประสิทธิภาพเพียงพอ เพราะถึงแม้จะมีวิธีการในการกำจัดมัลแวร์ได้ ผลกระทบที่เกิดจากการเข้ารหัสไฟล์โดยมัลแวร์ก็ยังคงอยู่ การวิจัยและการวิเคราะห์มัลแวร์เรียกค่าไถ่เพื่อศึกษาถึงการทำงานและหาวิธีการที่เป็นไปได้ในการป้องกันหรือลดผลกระทบที่จะเกิดขึ้นจึงเป็นเรื่องที่มีความสำคัญควบคู่ไปกับการพัฒนาของภัยคุกคาม โดยในการวิเคราะห์มัลแวร์เรียกค่าไถ่จะเป็นการศึกษาการทำงานของมัลแวร์ตั้งแต่ระดับโครงสร้างจนถึงการจำลองการทำงานของมัลแวร์เพื่อหาปัจจัยหรือข้อบกพร่องที่อาจนำไปสู่การพัฒนาวิธีการป้องกันและลดผลกระทบจากมัลแวร์เรียกค่าไถ่ได้ การวิเคราะห์มัลแวร์เรียกค่าไถ่จะพุ่งเป้าไปทั้งมัลแวร์เรียกค่าไถ่ที่เคยมีการแพร่กระจายเป็นจำนวนมาก เช่น CryptoLocker และมัลแวร์เรียกค่าไถ่ที่ยังคงแพร่กระจายสร้างความเสียหายอยู่ เช่น TeslaCrypt ซึ่งนำไปสู่การคิดค้นและพัฒนาเป็นวิธีการในการลดผลกระทบ อาทิ การตรวจจับมัลแวร์เรียกค่าไถ่จากพฤติกรรมการเข้ารหัสไฟล์ หรือพฤติกรรมการเขียนไฟล์ซ้ำเป็นจำนวนมาก เป็นต้น

Ransomware is a type of malware that has been around for a long time but still cause’s damage since it was invented. By the evolution of threat, the solutions to encounter ransomware today are not completely effective to what ransomware has done. The encrypted files are still encrypted, even after the ransomware has been removed by anti-malware software. On the goals to studying, mitigate and recover if possible, research and analysis are required to achieve by study on ransomware from its structure to operations to find the possible solution against consequence of ransomware. In this research, the analysis aimed to either the well-known ransomware: CryptoLocker and the still damaging and distributing ransomware: TeslaCrypt. As the results of analyst, the analyst came up with many assumptions that can be use as ransomware detection methods e.g. detection based-on file encryption behavior, detection based-on repetitive files creation and massive files modification on multiple directories.