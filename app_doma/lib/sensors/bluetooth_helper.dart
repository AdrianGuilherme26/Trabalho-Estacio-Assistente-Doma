import android.content.Intent
import android.provider.Settings
import android.content.Context

class BluetoothHelper(private val context: Context) {

    fun openBluetoothSettings() {
        val intent = Intent(Settings.ACTION_BLUETOOTH_SETTINGS).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            putExtra("EXTRA_CONNECTION_ONLY", true)
            putExtra("EXTRA_CLOSE_ON_CONNECT", true)
        }

        context.startActivity(intent)
    }
}


// import 'package:flutter/services.dart';

// class BluetoothHelper {
//   static const _method = MethodChannel('bluetooth_helper');

//   static Future<void> openSettings() async {
//     await _method.invokeMethod('open_bluetooth_settings');
//   }
// }
