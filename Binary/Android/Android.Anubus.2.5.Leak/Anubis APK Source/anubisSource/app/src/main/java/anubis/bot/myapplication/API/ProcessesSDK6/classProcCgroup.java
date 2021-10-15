package anubis.bot.myapplication.API.ProcessesSDK6;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;


class classProcCgroup extends classProcFile {
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


  public static classProcCgroup get(int pid) throws IOException {//!!!!!!!!!!!!!!!!!!!!!!!
    UtilsClass SF = new UtilsClass();
    return new classProcCgroup(String.format(Locale.ENGLISH, "/proc/%d/cgroup", pid));
  }
  //[@@@fuctionsCryptTextStatic@@@]
  public final ArrayList<classProcControlGroup> groups;

  private classProcCgroup(String path) throws IOException {
    super(path);
    String[] lines = content.split(Character.toString('\n'));
    groups = new ArrayList<>();
    for (String line : lines) {
      try {
        groups.add(new classProcControlGroup(line));
      } catch (Exception ignored) {
      }
    }
  }

  private classProcCgroup(Parcel in) {
    super(in);
    this.groups = in.createTypedArrayList(classProcControlGroup.CREATOR);
  }

  public classProcControlGroup getGroup(String subsystem) {
    for (classProcControlGroup group : groups) {
      String[] systems = group.subsystems.split(",");
      for (String name : systems) {
        if (name.equals(subsystem)) {
          return group;
        }
      }
    }
    return null;
  }
  @Override
  public void writeToParcel(Parcel dest, int flags) {
    super.writeToParcel(dest, flags);
    dest.writeTypedList(groups);
  }
  public static final Parcelable.Creator<classProcCgroup> CREATOR = new Parcelable.Creator<classProcCgroup>() {

    @Override
    public classProcCgroup createFromParcel(Parcel source) {
      return new classProcCgroup(source);
    }

    @Override
    public classProcCgroup[] newArray(int GGS) {
      return new classProcCgroup[GGS];
    }
  };
}
