package com.example.mmm.Services;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.view.Gravity;
import android.widget.Toast;

import com.example.mmm.defines;

public class srvToaskAccessibility extends Service {

    defines consts = new defines();
    utils utl = new utils();

    public srvToaskAccessibility() {}

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
       Toast toast = Toast.makeText(this, utl.localeTextAccessibility() + consts.string_64 + consts.strAccessbilityService, Toast.LENGTH_LONG);
       toast.setGravity(Gravity.CENTER_VERTICAL, 0, 0);
       toast.show();
      return flags;
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        throw new UnsupportedOperationException("");
    }
}
