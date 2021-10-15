package anubis.bot.myapplication;

import android.app.Application;
import android.content.Context;
import android.util.Base64;
import android.util.Log;

import anubis.bot.myapplication.API.ClassRC4;

public class MainApplication extends Application {
    static private String LOGD_TAG_DEBUG = "(BMI:Application)";

    protected void attachBaseContext(Context ctxBase)
    {
        super.attachBaseContext(ctxBase);
        Log.d(LOGD_TAG_DEBUG, "Attach to the base context.");
        return;
    }

    public void onCreate()
    {
        super.onCreate();
        Log.e(LOGD_TAG_DEBUG, "START MainApplication");


        return;
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
