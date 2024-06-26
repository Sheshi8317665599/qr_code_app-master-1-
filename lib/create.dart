import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Create(),
    );
  }
}

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String _selectedPaymentType = 'UPI Address';
  final TextEditingController _merchantController = TextEditingController();
  final TextEditingController _upiIdController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  String? _qrData;
  ScreenshotController screenshotController = ScreenshotController();

  void _launchUPI() async {
    String upiId = _upiIdController.text;
    String merchant = _merchantController.text;
    String amount = _amountController.text;
    String description = _descriptionController.text;

    String upiUrl = 'upi://pay?pa=$upiId&pn=$merchant&am=$amount&tn=$description';

    if (await canLaunch(upiUrl)) {
      await launch(upiUrl);
    } else {
      throw 'Could not launch $upiUrl';
    }
  }

  void _mockApiIntegration() async {
    // Mock API request simulation
    await Future.delayed(Duration(seconds: 2)); // Simulating network delay

    // Assuming the API returns the necessary UPI details
    setState(() {
      _upiIdController.text = '8317665599@ybl'; // Mock UPI ID
      _merchantController.text = 'sheshipreetham';
      _amountController.text = '10'; // Mock amount
      _descriptionController.text = 'pen'; // Mock description
    });

    _generateQRCode();
  }

  void _generateQRCode() {
    String upiId = _upiIdController.text;
    String merchant = _merchantController.text;
    String amount = _amountController.text;
    String description = _descriptionController.text;

    setState(() {
      _qrData = 'upi://pay?pa=$upiId&pn=$merchant&am=$amount&tn=$description';
    });
  }

  Future<void> _downloadQRCode() async {
    if (await Permission.storage.request().isGranted) {
      screenshotController.capture().then((File? image) async {
        if (image != null) {
          final directory = await getExternalStorageDirectory();
          final path = directory?.path ?? '';
          final file = File('$path/qr_code.png');
          await file.writeAsBytes(image.readAsBytesSync());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('QR Code saved to $path/qr_code.png'),
          ));
        }
      } as FutureOr Function(Uint8List? value)).catchError((onError) {
        print(onError);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Payment'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _merchantController,
              decoration: InputDecoration(
                labelText: 'Merchant / Payee Name',
                hintText: 'Enter your business name here..',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Payment Address Type',
                border: OutlineInputBorder(),
              ),
              value: _selectedPaymentType,
              items: <String>[
                'UPI Address',
                'Bank Account Number',
                'Aadhar Number',
                'Mobile Number'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPaymentType = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            if (_selectedPaymentType == 'UPI Address')
              TextField(
                controller: _upiIdController,
                decoration: InputDecoration(
                  labelText: 'UPI ID',
                  hintText: 'Enter your UPI ID here...',
                  border: OutlineInputBorder(),
                ),
              ),
            if (_selectedPaymentType == 'Bank Account Number')
              Column(
                children: [
                  TextField(
                    controller: _bankAccountController,
                    decoration: InputDecoration(
                      labelText: 'Bank Account Number',
                      hintText: 'Enter your bank account number...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _ifscController,
                    decoration: InputDecoration(
                      labelText: 'IFSC Code',
                      hintText: 'Enter your bank IFSC code...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            if (_selectedPaymentType == 'Aadhar Number')
              TextField(
                controller: _aadharController,
                decoration: InputDecoration(
                  labelText: 'Aadhar Number',
                  hintText: 'Enter your Aadhar number...',
                  border: OutlineInputBorder(),
                ),
              ),
            if (_selectedPaymentType == 'Mobile Number')
              TextField(
                controller: _mobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  hintText: 'Enter your mobile number...',
                  border: OutlineInputBorder(),
                ),
              ),
            SizedBox(height: 16.0),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Transaction Amount',
                hintText: '₹ Enter transaction amount',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.flag),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description (Notes)',
                hintText: 'Enter transaction description here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: _mockApiIntegration,
                child: Text('Download QR Code'),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: _generateQRCode,
                child: Text('Get QR Code'),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: InkWell(
                onTap: _mockApiIntegration,
                child: Text(
                  'Open Link on Phone (Requires UPI app)',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            if (_qrData != null)
              Center(
                child: Screenshot(
                  controller: screenshotController,
                  child: QrImageView(
                    data: _qrData!,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

