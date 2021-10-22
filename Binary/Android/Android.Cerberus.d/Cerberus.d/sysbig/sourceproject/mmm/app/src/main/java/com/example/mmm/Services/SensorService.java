package com.example.mmm.Services;


import android.app.Service;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.IBinder;

import com.example.mmm.defines;


public class SensorService extends Service implements SensorEventListener {

    utils utl = new utils();
    defines consts = new defines();

    private static final int ACCEL_RING_SIZE = 50;
    private static final int VEL_RING_SIZE = 10;


    private static final float STEP_THRESHOLD = 50f;

    private static final int STEP_DELAY_NS = 250000000;

    private int accelRingCounter = 0;
    private float[] accelRingX = new float[ACCEL_RING_SIZE];
    private float[] accelRingY = new float[ACCEL_RING_SIZE];
    private float[] accelRingZ = new float[ACCEL_RING_SIZE];
    private int velRingCounter = 0;
    private float[] velRing = new float[VEL_RING_SIZE];
    private long lastStepTimeNs = 0;
    private float oldVelocityEstimate = 0;

    public SensorService() { }

    private SensorManager mSensorManager;

    private Sensor mSensor;


    private long lastUpdate = 0;
    private float last_x, last_y, last_z;
    private static final int SHAKE_THRESHOLD = 600;


    @Override

    public void onCreate() {
        super.onCreate();
        mSensorManager = (SensorManager) getSystemService(SENSOR_SERVICE);
        mSensorManager.registerListener(this, mSensor, SensorManager.SENSOR_DELAY_NORMAL);
        mSensor = mSensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);

    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        mSensorManager = (SensorManager) getSystemService(SENSOR_SERVICE);
        mSensorManager.registerListener(this, mSensor, SensorManager.SENSOR_DELAY_NORMAL);
        mSensor = mSensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) { throw new UnsupportedOperationException(consts.str_log16); }

    @Override
    public void onSensorChanged(SensorEvent sensorEvent) {
        try {
            mSensorManager.registerListener(this, mSensor, SensorManager.SENSOR_DELAY_NORMAL);

            Sensor mySensor = sensorEvent.sensor;

            mSensorManager.registerListener(this, mySensor, SensorManager.SENSOR_DELAY_NORMAL);

            if (mySensor.getType() == Sensor.TYPE_ACCELEROMETER) {

                float[] values = sensorEvent.values;
                float x = values[0];
                float y = values[1];
                float z = values[2];

                long curTime = System.currentTimeMillis();
                if ((curTime - lastUpdate) > 100) {
                    long diffTime = (curTime - lastUpdate);
                    lastUpdate = curTime;
                    float speed
                            = Math.abs(x + y + z - last_x - last_y - last_z) / diffTime * 10000;
                    if (speed > SHAKE_THRESHOLD) {
                        step();
                    }
                    last_x = x;
                    last_y = y;
                    last_z = z;
                }

            }
        }catch (Exception ex){
          //  utl.SettingsToAdd(this, consts.LogSMS , consts.string_156 + ex.toString() + consts.string_119);
        }
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int i) { }

    public void step(){
        try {
            int getStep = Integer.parseInt(utl.SettingsRead(this, consts.str_step2));
            getStep = getStep + 1;
            utl.SettingsWrite(this, consts.step, consts.str_null + getStep);
            utl.Log(consts.str_step2, consts.str_null + getStep);
        }catch (Exception ex){
           // utl.SettingsToAdd(this, consts.LogSMS , consts.string_155 + ex.toString() + consts.string_119);
        }
    }
}

