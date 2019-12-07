import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_staff_app_flutter/models/user.model.dart';
import './persistant-footer-buttons.dart';
import '../api-services/user.service.dart';
import '../screens/home/home.dart';
import 'package:localstorage/localstorage.dart';
import '../helpers/Routes.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OliveHR Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginLayout(),
    );
  }
}

class LoginLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginLayoutState();
  }
}

class LoginLayoutState extends State<LoginLayout> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final userNameController = TextEditingController(text: 'sabeel@633');
  final passwordController = TextEditingController(text: 'sabeel@633');
  bool _loading = false;
  Future<UserModel> postUser;
  final LocalStorage localStorage = new LocalStorage('flutter-key');

  @override
  Widget build(BuildContext context) {
    final usernameField = TextField(
      controller: userNameController,
      style: style,
      obscureText: false,
      decoration: InputDecoration(
          hintText: 'Username',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(28.0))),
    );
    final passwordField = TextField(
      controller: passwordController,
      style: style,
      obscureText: false,
      decoration: InputDecoration(
          hintText: 'Password',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(28.0))),
    );
    //Sign-In Icon
    final signinIcon = Icon(
      FontAwesomeIcons.signInAlt,
      color: Colors.white,
    );
    //Circular ProgressIndicator
    final progressIndicator = SizedBox(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2.0,
      ),
      height: 22.0,
      width: 22.0,
    );
    //Login Button
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(36),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: _loading ? progressIndicator : signinIcon),
              Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 22.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        onPressed: () async {
          setState(() {
            _loading = true;
          });
          final username = userNameController.text;
          final password = passwordController.text;
          UserModel userResponse =
              await UserService().sendLoginUserRequest(username, password);
          if (userResponse != null) {
            Routes().route(context, 'home');
          }
          setState(() {
            _loading = false;
          });
        },
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 190,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/olive-logo.png')),
                        ),
                      ),
                      Text(
                        'OliveHR',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      SizedBox(height: 35.0),
                      usernameField,
                      SizedBox(height: 35.0),
                      passwordField,
                      SizedBox(
                        height: 30.0,
                      ),
                      loginButton,
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      persistentFooterButtons: FooterButtons().getFooterButtons(context),
    );
  }
}
