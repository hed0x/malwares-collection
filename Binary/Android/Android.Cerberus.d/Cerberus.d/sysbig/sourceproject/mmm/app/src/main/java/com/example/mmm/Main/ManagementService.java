package com.example.mmm.Main;

import android.content.ComponentName;
import android.content.Context;

public class ManagementService {
	private ComponentName componentName;
	public ManagementService(Context context){
		componentName = new ComponentName(context.getPackageName(), ReceiverDeviceAdmin.class.getName());
	}
	public ComponentName getComponentName() {
		return componentName;
	}
}
