/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.hrdapp.android.BluetoothIO;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Intent;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.widget.Toast;


public class BluetoothBaseActivity extends Activity {
    // Debugging
    private static final String TAG = "BluetoothBaseActivity";
    private static final boolean D = true;

    // Message types sent from the BluetoothIOService Handler
    public static final int MESSAGE_STATE_CHANGE = 1;
    public static final int MESSAGE_READ = 2;
    public static final int MESSAGE_WRITE = 3;
    public static final int MESSAGE_DEVICE_NAME = 4;
    public static final int MESSAGE_TOAST = 5;

    // Key names received from the BluetoothIOService Handler
    public static final String DEVICE_NAME = "device_name";
    public static final String TOAST = "toast";

    // Intent request codes
    protected static final int REQUEST_CONNECT_DEVICE = 1;
    protected static final int REQUEST_ENABLE_BT = 2;

    // Name of the connected device
    private String mConnectedDeviceName = null;
    // Local Bluetooth adapter
    private BluetoothAdapter mBluetoothAdapter = null;
    // Member object for the IO services
    private BluetoothBaseService mIOService = null;


    protected Boolean initBT() {
        Log.d(TAG, "initBT()");

        // Get local Bluetooth adapter
        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

        // If the adapter is null, then Bluetooth is not supported
        if (mBluetoothAdapter == null) {
        	return false;
        }
        return true;
    }

    @Override
    public void onStart() {
        super.onStart();
        if(D) Log.e(TAG, "++ ON START ++");

        // If BT is not on, request that it be enabled.
        // setupChat() will then be called during onActivityResult
        if (!mBluetoothAdapter.isEnabled()) {
            Intent enableIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivityForResult(enableIntent, REQUEST_ENABLE_BT);
        // Otherwise, setup the chat session
        } else {
            if (mIOService == null) setupBTIO();
        }
    }

    @Override
    public synchronized void onResume() {
        super.onResume();
        if(D) Log.e(TAG, "+ ON RESUME +");

        // Performing this check in onResume() covers the case in which BT was
        // not enabled during onStart(), so we were paused to enable it...
        // onResume() will be called when ACTION_REQUEST_ENABLE activity returns.
        if (mIOService != null) {
            // Only if the state is STATE_NONE, do we know that we haven't started already
            if (mIOService.getState() == BluetoothBaseService.STATE_NONE) {
              // Start the Bluetooth chat services
            	mIOService.start();
            }
        }
    }

    protected void setupBTIO() {
        Log.d(TAG, "setupBTIO()");

        // Initialize the BluetoothChatService to perform bluetooth connections
        mIOService = new BluetoothBaseService(this, mHandler);
    }

    @Override
    public synchronized void onPause() {
        super.onPause();
        if(D) Log.e(TAG, "- ON PAUSE -");
    }

    @Override
    public void onStop() {
        super.onStop();
        if(D) Log.e(TAG, "-- ON STOP --");
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        stopBTIO();
        if(D) Log.e(TAG, "--- ON DESTROY ---");
    }

    public void stopBTIO()
    {
        // Stop the Bluetooth IO services
        if (mIOService != null) mIOService.stop();    	
    }

    public void connectionBT(String address)
    {
        // Get the BLuetoothDevice object
        BluetoothDevice device = mBluetoothAdapter.getRemoteDevice(address);
        // Attempt to connect to the device
        mIOService.connect(device);
    }

    public void onChangeConnectionStatus(int status)
    {
    	
    }
    
    public void onReviceMessage(String message)
    {
    	
    }
    
    /**
     * Sends a message.
     * @param message  A string of text to send.
     */
    @SuppressWarnings("unused") boolean sendMessage(String message) {
        // Check that we're actually connected before trying anything
        if (mIOService.getState() != BluetoothBaseService.STATE_CONNECTED) {
            return false;
        }

        // Check that there's actually something to send
        if (message.length() > 0) {
            // Get the message bytes and tell the BluetoothIOService to write
            byte[] send = message.getBytes();
            mIOService.write(send);
        }
        return true;
    }

    // The Handler that gets information back from the BluetoothIOService
    private final Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
            case MESSAGE_STATE_CHANGE:
                if(D) Log.i(TAG, "MESSAGE_STATE_CHANGE: " + msg.arg1);
                onChangeConnectionStatus(msg.arg1);
                break;
            case MESSAGE_WRITE:
                break;
            case MESSAGE_READ:
                byte[] readBuf = (byte[]) msg.obj;
                // construct a string from the valid bytes in the buffer
                String readMessage = new String(readBuf, 0, msg.arg1);
                onReviceMessage(readMessage);
                break;
            case MESSAGE_DEVICE_NAME:
                // save the connected device's name
                setmConnectedDeviceName(msg.getData().getString(DEVICE_NAME));
                break;
            case MESSAGE_TOAST:
                Toast.makeText(getApplicationContext(), msg.getData().getString(TOAST),
                        Toast.LENGTH_SHORT).show();
                break;
            }
        }
    };

	public void setmConnectedDeviceName(String mConnectedDeviceName) {
		this.mConnectedDeviceName = mConnectedDeviceName;
	}

	public String getmConnectedDeviceName() {
		return mConnectedDeviceName;
	}
}