import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(FontAwesomeIcons.clock),
            title: Text('Attendance'),
            trailing: Text('02,Dec 2019'),
          ),
          //Checked-In Time
          Container(
            height: 190,
            width: 180,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 220,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Checked In',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '09:25 AM',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Clock In Button
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 83, right: 80),
                    child: Material(
                      borderRadius: BorderRadius.circular(36),
                      child: MaterialButton(
                        elevation: 5.0,
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {},
                        color: Colors.lightGreen,
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 14.0),
                                child: Icon(
                                  Icons.fingerprint,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Clock In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Current Shift
          ListTile(
            leading: Icon(FontAwesomeIcons.calendar),
            title: Text('Nov Schedule'),
            subtitle: Text('General Shift'),
            trailing: Text('09:00 - 17:30'),
          ),
          //Next Shift
          ListTile(
            leading: Icon(FontAwesomeIcons.arrowRight),
            title: Text('Next Shift'),
            subtitle: Text('Evening Shift'),
            trailing: Text('18:00 - 23:00'),
          ),
        ],
      ),
    );
  }
}
