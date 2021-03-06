import 'package:findjobs/Auth.dart';
import 'package:findjobs/services/auth.dart';
import 'package:findjobs/widgets/original_button.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final AuthType authType;

  const AuthForm({Key key, @required this.authType}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';
  AuthBase authBase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: '',
              ),
              onChanged: (value) {
                _email = value;
              },
              validator: (value) =>
              value.isEmpty ? 'Masukkan email valid' : null,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              validator: (value) => value.length <= 6
                  ? 'Password lebih dari 6 karakter'
                  : null,
            ),
            SizedBox(height: 20),
            OriginalButton(
                text: widget.authType == AuthType.login ? 'Masuk' : 'Daftar',
                bgColor: Colors.lightBlue,
                textColor: Colors.white,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    if (widget.authType == AuthType.login) {
                      await authBase.loginWithEmailAndPassword(_email, _password);
                      Navigator.of(context).pushReplacementNamed('sidebarlayout');
                    } else {
                      await authBase.registerWithEmailAndPassword(_email, _password);
                      Navigator.of(context).pushReplacementNamed('login');
                    }
//                  print(_email);
//                  print(_password);
                  }
                }
            ),
            SizedBox(height: 6),
            FlatButton(
              onPressed: () {
                if (widget.authType == AuthType.login) {
                  Navigator.of(context).pushReplacementNamed('register');
                  print(widget.authType);
                } else {
                  Navigator.of(context).pushReplacementNamed('login');
                }
              },
              child: Text(
                widget.authType == AuthType.login
                    ? 'Buat akun baru'
                    : 'Sudah memiliki akun?',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
