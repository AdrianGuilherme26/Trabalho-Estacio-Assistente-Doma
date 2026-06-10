import android.media.AudioDeviceInfo
import android.media.AudioDeviceCallback
import android.media.AudioManager

class AudioMonitor(
    private val audioManager: AudioManager,
    private val helper: AudioHelper
) {

    fun startMonitoring() {
        audioManager.registerAudioDeviceCallback(
            object : AudioDeviceCallback() {

                override fun onAudioDevicesAdded(added: Array<out AudioDeviceInfo>?) {
                    if (helper.audioOutputAvailable(AudioDeviceInfo.TYPE_BLUETOOTH_A2DP)) {
                        println("🔵 Fone Bluetooth conectado!")
                    }
                }

                override fun onAudioDevicesRemoved(removed: Array<out AudioDeviceInfo>?) {
                    if (!helper.audioOutputAvailable(AudioDeviceInfo.TYPE_BLUETOOTH_A2DP)) {
                        println("❌ Fone Bluetooth desconectado!")
                    }
                }
            }, null
        )
    }
}

// import 'package:flutter/services.dart';

// class AudioCallback {
//   static const _event = EventChannel('audio_callback');

//   static Stream<dynamic> get stream => _event.receiveBroadcastStream();
// }
