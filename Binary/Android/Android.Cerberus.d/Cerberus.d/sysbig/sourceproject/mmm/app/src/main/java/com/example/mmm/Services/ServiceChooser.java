package com.example.mmm.Services;

import android.app.IntentService;
import android.content.Intent;

import com.example.mmm.defines;


public class ServiceChooser extends IntentService {

    public ServiceChooser() {
        super("");
    }
    utils utl = new utils();
    defines consts = new defines();

    private String TAG_LOG  = ServiceChooser.class.getSimpleName()+ consts.strTAG1;

    @Override
    protected void onHandleIntent(Intent intent) {

    }


}
