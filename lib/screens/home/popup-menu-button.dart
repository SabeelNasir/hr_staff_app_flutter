import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../api-services/user.service.dart';
import '../../helpers/Routes.dart';

class WidgetPopupmenuButton {
  Widget getWidget(BuildContext context) {
    return PopupMenuButton(
      onSelected: (result) {
        if (result == 'logout') {
          UserService().logout(context);
        } else if (result == 'profile') {
          Routes().route(context, 'profile');
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
          ),
          value: 'profile',
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(FontAwesomeIcons.signOutAlt),
            title: Text('Logout'),
          ),
          value: 'logout',
        )
      ],
    );
  }
}
