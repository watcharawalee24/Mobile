import 'package:flutter/material.dart';
import 'package:flutter_application_8/LoginResult.dart';
import 'package:http/http.dart' as http;

import 'models/login_result.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginScreen());
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _forkey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  late List<User> loginResult;

  Future<void> LoginState(email, password) async {
    var parameters = {"email": email, "password ": password};
    var uri = Uri.http("localhost:3000", "users", parameters);
    var resp = await http.get(uri);
    loginResult = userFromJson(resp.body);
    if (loginResult.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('email or password invalid')),
      );
    } else {
      Navigator.pushReplacement(
        context,MaterialPageRoute(builder: (context) => UserScreen()),
      );
        }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _forkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              emailInputField(),
              passwordInputField(),
              SizedBox(
                height: 10.0,
              ),
              SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailInputField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "input your email",
          icon: Icon(Icons.email)),
      validator: (value) {
        if (value!.isEmpty) {
          return "this field is required";
        }
        return null;
      },
      onSaved: (newValue) => email = newValue!,
    );
  }

  Widget passwordInputField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "input your password",
          icon: Icon(Icons.email)),
      validator: (value) {
        if (value!.isEmpty) {
          return "this field is required";
        }
        return null;
      },
      onSaved: (newValue) => password = newValue!,
    );
  }

  Widget SubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_forkey.currentState!.validate()) {
          _forkey.currentState!.save();
          LoginState(email, password);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('connect to server')),
          );
          print("$email $password");
          LoginState(email, password);
        }
      },
      child: Text("Login"),
    );
  }
}
