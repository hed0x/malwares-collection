package com.example.mmm.Main;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Settings;

import com.example.mmm.Services.Utitlies;
import com.example.mmm.defines;


public class ModeChanger extends Activity {
    Utitlies idutl= new Utitlies();
    defines consts = new defines();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            if (!idutl.is_dozemode(this)) {
                try {
                    Intent intent1 = new
                            Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
                            Uri.parse(consts.strPackage + getPackageName()));
                    intent1.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    intent1.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                    startActivity(intent1);
                } catch (Exception ex) {
                }
            }
        }catch (Exception ex){
        }
        finish();
    }
}
