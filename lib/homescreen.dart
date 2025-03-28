
import 'package:flutter/material.dart';

import 'package:qr_code_app/create.dart';
import 'package:qr_code_app/history.dart';
import 'package:qr_code_app/mail.dart';
import 'package:qr_code_app/print.dart';
import 'package:qr_code_app/qrscanner.dart';
import 'package:qr_code_app/settimgs_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void navigateNextPage(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
        return HomeScreen();
    },),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/PHOTOS.jpg'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sheshipreetham Yedugani',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'App Development',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => SettingsPage()));
              },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 1000,
                  color: Colors.white12,
                  child: Text(
                    'Welcome \n To Qr Code',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.white12,
                    child: Padding(
                      padding: EdgeInsets.only(left: 55),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: 100, 
                                      width: 70,
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Center(
                                            child: IconButton(
                                              icon: Icon(Icons.create_rounded),
                                              color: Colors.purpleAccent,
                                              iconSize: 50.0,
                                              onPressed: () {
                                                Navigator.push(context, 
                                                              MaterialPageRoute(builder: (context) => Create()));
                                                print('Icon button pressed');
                                              },
                                            ),
                                          ),
                                          Text(
                                            'create',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: 100, // Increased height to accommodate text
                                      width: 70,
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Center(
                                              child: Center(
                                                child: IconButton(
                                                  icon: Icon(Icons.qr_code_scanner_rounded),
                                                  color: Colors.redAccent,
                                                  iconSize: 50.0,
                                                  onPressed: () {
                                                    Navigator.push(context, 
                                                                  MaterialPageRoute(builder: (context) => QrScannerPage()));
                                                    print('Icon button pressed');
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Scan',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          height: 100, // Increased height to accommodate text
                                          width: 70,
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Center(
                                                  child: IconButton(
                                                    icon: Icon(Icons.mail_outline_rounded),
                                                    color: Colors.yellowAccent,
                                                    iconSize: 50.0,
                                                    onPressed: () {
                                                       Navigator.push(context, 
                                                                    MaterialPageRoute(builder: (context) => Mail()));
                                                      print('Icon button pressed');
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Mail',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          height: 100, // Increased height to accommodate text
                                          width: 70,
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Center(
                                                child: IconButton(
                                                  icon: Icon(Icons.print_rounded),
                                                  color: Colors.greenAccent,
                                                  iconSize: 50.0,
                                                  onPressed: () {
                                                     Navigator.push(context, 
                                                                  MaterialPageRoute(builder: (context) => Print()));
                                                    print('Icon button pressed');
                                                  },
                                                ),
                                              ),
                                              Text(
                                                'Download',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => History()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,  // 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 0),
                    ),
                    child: Text('HISTORY'),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    '2024 © QRcode Limited. All rights reserved\nTerms and Conditions',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
