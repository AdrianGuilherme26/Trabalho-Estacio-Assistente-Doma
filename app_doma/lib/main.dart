import 'package:flutter/material.dart';

void main() {
  runApp(const DomaWearApp());
}

class DomaWearApp extends StatelessWidget {
  const DomaWearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doma Assistente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _mensagem =
      "Bem-vindo ao Assistente Wear OS da empresa Doma!\n\n"
      "Este app auxilia funcionários com necessidades especiais, "
      "lendo notificações e fornecendo alertas de segurança por áudio (simulado).";

  void _simularLeituraMensagem() {
    setState(() {
      _mensagem =
          "Mensagem recebida:\n\n"
          "\"Reunião de segurança às 14h na sala 3. "
          "Use os equipamentos de proteção adequados.\"";
    });
  }

  void _simularAlertaSeguranca() {
    setState(() {
      _mensagem =
          "🔊 Alerta de segurança (simulado):\n\n"
          "Evacuar o prédio imediatamente pela saída de emergência mais próxima.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Assistente Doma",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              const Text(
                "Mensagem recebida:",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _mensagem,
                    style: const TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _simularLeituraMensagem,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(20, 26),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  textStyle: const TextStyle(fontSize: 10),
                ),
                child: const Text(
                  "Ler notificação\n(simulado)",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: _simularAlertaSeguranca,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(20, 26),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  textStyle: const TextStyle(fontSize: 10),
                ),
                child: const Text(
                  "Alerta de segurança\n(simulado)",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
