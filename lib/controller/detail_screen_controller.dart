import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreenController with ChangeNotifier {
  Future<void> launchURL(String url) async {
    // Check if the URL can be launched
    if (await canLaunch(url)) {
      // If yes, launch the URL
      await launch(url);
    } else {
      // If not, throw an error
      throw 'Could not launch $url';
    }
  }
}
