import 'package:assets_audio_player/assets_audio_player.dart';

class AudioService {
  static final _player = AssetsAudioPlayer();

  static Future<void> playAlert() async {
    await _player.open(
      Audio('assets/alert.mp3'),
      autoStart: true,
      showNotification: false,
    );
  }
}
