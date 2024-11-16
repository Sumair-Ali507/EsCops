import 'package:flutter/material.dart';
import 'package:printer_app_use/print_service.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PrinterService _printerService = PrinterService();

  @override
  void initState() {
    super.initState();
    _printerService.connectToPrinter();
  }

  void _printSampleText() {
    _printerService.printText('Hello, this is a test print!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Press the button to print a sample text:'),
            ElevatedButton(
              onPressed: _printSampleText,
              child: const Text('Print Text'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _printerService.disconnectPrinter,
        tooltip: 'Disconnect Printer',
        child: const Icon(Icons.bluetooth_disabled),
      ),
    );
  }
}