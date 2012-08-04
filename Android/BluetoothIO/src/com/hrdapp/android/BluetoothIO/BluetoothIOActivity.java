package com.hrdapp.android.BluetoothIO;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.widget.CompoundButton;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class BluetoothIOActivity extends BluetoothBaseActivity implements ToggleButton.OnCheckedChangeListener{
    
    // Layout Views
    private TextView mTitle;
    private TextView mSWStatus;
    private ToggleButton mToggleButton;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Set up the window layout
        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
        setContentView(R.layout.main);
        getWindow().setFeatureInt(Window.FEATURE_CUSTOM_TITLE, R.layout.custom_title);

        // Set up the custom title
        mTitle = (TextView) findViewById(R.id.title_left_text);
        mTitle.setText(R.string.app_name);
        mTitle = (TextView) findViewById(R.id.title_right_text);

        mSWStatus = (TextView) findViewById(R.id.SWStatus);
        
        mToggleButton = (ToggleButton)findViewById(R.id.LEDtoggleButton);
        mToggleButton.setChecked(false);
        mToggleButton.setOnCheckedChangeListener(this);
        
        if(!initBT())
        {
	        Toast.makeText(this, "Bluetooth is not available", Toast.LENGTH_LONG).show();
	        finish();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.option_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
        case R.id.connect:
            // Launch the DeviceListActivity to see devices and do scan
            Intent serverIntent = new Intent(this, DeviceListActivity.class);
            startActivityForResult(serverIntent, REQUEST_CONNECT_DEVICE);
            return true;
        case R.id.disconnect:
        	stopBTIO();
            return true;
        }
        return false;
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        switch (requestCode) {
        case REQUEST_CONNECT_DEVICE:
            // When DeviceListActivity returns with a device to connect
            if (resultCode == Activity.RESULT_OK) {
                // Get the device MAC address
                String address = data.getExtras()
                                     .getString(DeviceListActivity.EXTRA_DEVICE_ADDRESS);
                connectionBT(address);
            }
            break;
        case REQUEST_ENABLE_BT:
            // When the request to enable Bluetooth returns
            if (resultCode == Activity.RESULT_OK) {
                // Bluetooth is now enabled, so set up a io session
                setupBTIO();
            } else {
                // User did not enable Bluetooth or an error occured
                Toast.makeText(this, R.string.bt_not_enabled_leaving, Toast.LENGTH_SHORT).show();
                finish();
            }
        }
    }

    @Override
    public void onChangeConnectionStatus(int status) {
	    switch (status) {
	    case BluetoothBaseService.STATE_CONNECTED:
	        mTitle.setText(R.string.title_connected_to);
	        mTitle.append(getmConnectedDeviceName());
            Toast.makeText(getApplicationContext(), "Connected to "
                    + getmConnectedDeviceName(), Toast.LENGTH_SHORT).show();
	        break;
	    case BluetoothBaseService.STATE_CONNECTING:
	        mTitle.setText(R.string.title_connecting);
	        break;
	    case BluetoothBaseService.STATE_LISTEN:
	    case BluetoothBaseService.STATE_NONE:
	        mTitle.setText(R.string.title_not_connected);
	        break;
	    }
    }

	// トグルボタンの変化イベント
	public void onCheckedChanged(CompoundButton _tbutton,boolean _checked){
		// 状態によりBluetoothへメッセージ送信
		if(_checked){
        	sendMessage("L1");
		}else{
        	sendMessage("L0");
		}
	}

	// Bluetoothのメッセージ受信
    @Override
    public void onReviceMessage(String message)
    {
    	if(message.equals("S1")){
    		mSWStatus.setText(R.string.SW_ON);
    	}else{
    		mSWStatus.setText(R.string.SW_OFF);    		
    	}
    }
}