import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _shareToMail,
        child: const Text("Share via Mail"),
      ),
    );
  }

  void _shareToMail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'example@example.com', // Default recipient email address
      queryParameters: {
        'subject': 'Example Subject',
        'body': 'Hello, this is a test email from my Flutter app.'
      },
    );

    final String url = emailLaunchUri.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: Mail())));
}

