import 'package:flutter/material.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>(); //_formkey uniqueqly identify the form
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Here'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value){
                  if(value!.isEmpty) {
                    return 'please enter your email';
                  }

                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Please enter your password';
                  }

                },
                onSaved: (value){
                  _password = value!;
                },
              ),

              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    //add authentication
                  }
                },
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }

}
