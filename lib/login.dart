import 'package:flutter/material.dart';
import 'signUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_manager/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

 void _login(BuildContext context) async {
  String email = _emailTextController.text.trim();
  String password = _passwordTextController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please enter your email and password')),
    );
    return;
  }

  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // If sign in is successful, navigate to the homepage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => homepage()),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login failed: $e')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 300),
              Text(
                "BIT-MASTERS: Task Manager",
                style: TextStyle(
                  fontSize: 36, // Increased font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 100),
              Container(
                width: 500,
                child: TextField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 500,
                child: TextField(
                  controller: _passwordTextController,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 500,
                child: ElevatedButton(
                  onPressed: () {
                    _login(context);
                  },
                  child: Text("Login"),
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 6, 60)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}