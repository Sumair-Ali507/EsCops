import 'package:blue_thermal_printer/blue_thermal_printer.dart';

class PrinterService {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  Future<void> connectToPrinter() async {
    List<BluetoothDevice> devices = await bluetooth.getBondedDevices();
    if (devices.isNotEmpty) {
      // Connect to the first bonded device (you can modify this to select a specific device)
      await bluetooth.connect(devices.first);
    }
  }

  Future<void> printText(String text) async {
    bool? isConnected = await bluetooth.isConnected;
    if (isConnected == true) {
      bluetooth.printNewLine();
      bluetooth.printCustom(text, 1, 1);
      bluetooth.printNewLine();
      bluetooth.paperCut();
    } else {
      print('Printer is not connected');
    }
  }

  Future<void> disconnectPrinter() async {
    await bluetooth.disconnect();
  }
}