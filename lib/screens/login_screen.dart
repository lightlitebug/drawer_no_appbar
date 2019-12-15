import 'package:drawer_no_appbar_ex/screens/flower_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginScreen extends StatefulWidget {
  static final route = 'login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _autovalidate = false;

  void _submit() {
    setState(() => _autovalidate = true);

    if (!_fbKey.currentState.validate()) {
      return;
    }

    print(_fbKey.currentState.value);
    Navigator.pushReplacementNamed(context, FlowerScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Image.asset(
                  'assets/images/login_background.jpg',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Drawer without AppBar',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            FormBuilder(
              key: _fbKey,
              autovalidate: _autovalidate,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: 'email',
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ],
                    ),
                    SizedBox(height: 30),
                    FormBuilderTextField(
                      attribute: 'password',
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.email),
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                        FormBuilderValidators.maxLength(20),
                      ],
                      obscureText: true,
                      maxLines: 1,
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      onPressed: _submit,
                      minWidth: 150,
                      height: 45,
                      color: Colors.indigo,
                      textColor: Colors.white,
                      elevation: 9,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
