import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.content.pm.PackageManager

class AudioHelper(private val context: Context) {

    private val audioManager =
        context.getSystemService(Context.AUDIO_SERVICE) as AudioManager

    fun audioOutputAvailable(type: Int): Boolean {

        // Verifica se o dispositivo tem saída de áudio
        if (!context.packageManager.hasSystemFeature(
                PackageManager.FEATURE_AUDIO_OUTPUT
            )
        ) {
            return false
        }

        return audioManager
            .getDevices(AudioManager.GET_DEVICES_OUTPUTS)
            .any { it.type == type }
    }
}


// import 'package:flutter/services.dart';

// class AudioHelper {
//   static const _method = MethodChannel('audio_helper');

//   static Future<bool> isOutputAvailable(String type) async {
//     final result = await platform.invokeMethod('audioOutputAvailable', {
//     'type': type,
//     });
//     return result ?? false;
//   }

//   static Future<bool> isSpeakerAvailable() async {
//     return await _method.invokeMethod('has_speaker');
//   }

//   static Future<bool> isBluetoothAvailable() async {
//     return await _method.invokeMethod('has_bluetooth');
//   }
// }
