import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loggedIn = false;
  //late String name;
  //final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _userPasswordController = TextEditingController();
  bool _passwordVisible = false;

  var text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to Personal Expenses App'),
      ),
      body: Center(
        child: loggedIn ? _buildSuccess() : _buildLoginForm(),
      ),
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.check, color: Colors.orangeAccent),
      ],
    );
  }

  Widget _buildLoginForm() {
    void _validate() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        return;
      }
      setState(() {
        loggedIn = true;
      });
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Enter the user\'s mail';
                }

                final regex = RegExp('[^@]+@[^\.]+\..+');
                if (!regex.hasMatch(text)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _userPasswordController,
              obscureText:
                  !_passwordVisible, //This will obscure text dynamically
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                // Here is key idea
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Continue'),
              onPressed: _validate,
            )
          ],
        ),
      ),
    );
  }
}
