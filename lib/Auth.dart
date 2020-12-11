import 'package:findjobs/widgets/auth_form.dart';
import 'package:flutter/material.dart';

enum AuthType { login, register }

class AuthScreen extends StatelessWidget {
  final AuthType authType;

  const AuthScreen({Key key, this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    Text(
                        authType == AuthType.login
                            ? 'Login'
                            : 'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        )
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      height: 280,
                    ),
                  ],
                )
              ],
            ),
            AuthForm(authType: authType),
          ],
        ),
      ),
    );
  }
}
