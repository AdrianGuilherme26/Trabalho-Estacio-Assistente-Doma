import 'package:flutter/material.dart';
import '../audio/audio_helper.dart';
import '../audio/bluetooth_helper.dart';
import '../audio/audio_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String status = "Aguardando...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(status, style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool speaker = await AudioHelper.isSpeakerAvailable();
                setState(() {
                  status = "Alto-falante: ${speaker ? 'SIM' : 'NÃO'}";
                });
              },
              child: Text("Detectar Speaker"),
            ),
            ElevatedButton(
              onPressed: () async {
                await BluetoothHelper.openSettings();
              },
              child: Text("Abrir Bluetooth"),
            ),
            ElevatedButton(
              onPressed: () async {
                await AudioService.playAlert();
                setState(() => status = "Reproduzido!");
              },
              child: Text("Tocar áudio"),
            ),
          ],
        ),
      ),
    );
  }
}
