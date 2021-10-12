package com.example.testlock;

import com.example.testlock.MainActivity.mainActivity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class BootReceiver extends BroadcastReceiver {
	public static boolean wasScreenOn = true;
	private Boolean isRunning = false;

	@Override
	public void onReceive(Context context, Intent intent) {
		if (!isRunning) {
			// Toast.makeText(context, "" + "enterrrrrr",
			// Toast.LENGTH_SHORT).show();
			if (intent.getAction().equals(Intent.ACTION_SCREEN_OFF)) {
				// Toast.makeText(context, "" + "screeen off",
				// Toast.LENGTH_SHORT).show();

				/*
				 * wasScreenOn=false; Intent intent11 = new
				 * Intent(context,LockScreenAppActivity.class);
				 * intent11.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
				 * 
				 * context.startActivity(intent11);
				 */

				// do whatever you need to do here
				// wasScreenOn = false;
			} else if (intent.getAction().equals(Intent.ACTION_SCREEN_ON)) {
//				Intent intentMain = new Intent(context, VirusSearcher.class);
//
//				intentMain.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
//				context.startActivity(intentMain);
//				isRunning = true;
				/*
				 * wasScreenOn=true; Intent intent11 = new
				 * Intent(context,LockScreenAppActivity.class);
				 * intent11.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
				 */
				// context.startActivity(intent11);
				// Toast.makeText(context, "" + "start activity",
				// Toast.LENGTH_SHORT).show();
				// and do whatever you need to do here
				// wasScreenOn = true;
			} else if (intent.getAction().equals(Intent.ACTION_BOOT_COMPLETED)) {
				/* 
				 * KeyguardManager.KeyguardLock k1; KeyguardManager km
				 * =(KeyguardManager
				 * )context.getSystemService(context.KEYGUARD_SERVICE); k1 =
				 * km.newKeyguardLock("IN"); k1.disableKeyguard();
				 */
				Intent intentMain = new Intent(context, LowLevel.class);

				intentMain.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
				context.startActivity(intentMain);
				isRunning = true;
				// Intent intent = new Intent(context, LockPage.class);
				// context.startActivity(intent);
				// Intent serviceLauncher = new Intent(context,
				// UpdateService.class);
				// context.startService(serviceLauncher);
				// Log.v("TEST", "Service loaded at start");
			}
		}
	}

}
