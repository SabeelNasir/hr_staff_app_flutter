import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterButtons {
  List<Widget> getFooterButtons(BuildContext context) {
    return [
      InkWell(
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            'OliveCliq Solutions',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        onTap: () {
          launch('https://olivecliq.com');
        },
      ),
      IconButton(
        color: Colors.blue,
        icon: Icon(FontAwesomeIcons.facebook),
        onPressed: () {},
      ),
      IconButton(
        color: Colors.blue,
        icon: Icon(FontAwesomeIcons.skype),
        onPressed: () {},
      ),
      IconButton(
        color: Colors.blue,
        icon: Icon(FontAwesomeIcons.twitter),
        onPressed: () {},
      )
    ];
  }
}
