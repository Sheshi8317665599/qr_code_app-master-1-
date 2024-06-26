import 'package:flutter/material.dart';

class History extends StatelessWidget {
  final List<Map<String, String>> transactionHistory = [
    {'date': '2024-06-20', 'description': 'Transaction 1', 'amount': '\$100'},
    {'date': '2024-06-21', 'description': 'Transaction 2', 'amount': '\$200'},
  ];

  final List<Map<String, String>> qrCodeHistory = [
    {'date': '2024-06-20', 'description': 'QR Code 1'},
    {'date': '2024-06-21', 'description': 'QR Code 2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transaction History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transactionHistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text(transactionHistory[index]['description']!),
                      subtitle: Text(transactionHistory[index]['date']!),
                      trailing: Text(transactionHistory[index]['amount']!),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                'QR Code Sent History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: qrCodeHistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.qr_code),
                      title: Text(qrCodeHistory[index]['description']!),
                      subtitle: Text(qrCodeHistory[index]['date']!),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
