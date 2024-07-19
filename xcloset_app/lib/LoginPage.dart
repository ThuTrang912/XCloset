import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xcloset/MyHomePage.dart'; // Replace with your actual home page import
import 'package:xcloset/RegisterPage.dart'; // Import RegisterPage if needed

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  bool isVisible = false;

  void toggleShowPassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  Future<void> login() async {
  final url = Uri.parse('http://127.0.0.1:8000/api/login'); // Replace with your API endpoint

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Decode the JSON response
      final jsonData = jsonDecode(response.body);
      print('JSON Data: $jsonData');

      if (jsonData['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(), // Replace MyHomePage() with your home page
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonData['message'] ?? 'Invalid email or password'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(jsonDecode(response.body)['message'] ?? 'Failed to login'),
        ),
      );
    }
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error logging in'),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, height * 0.15, 16.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login into',
                style: TextStyle(
                    fontFamily: 'philosopher',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF002140)),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('your account',
                  style: TextStyle(
                      fontFamily: 'philosopher',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF002140))),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // email
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Color(0xFF002140),
                            fontFamily: 'philosopher'),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF002140)),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      onChanged: (text) {
                        setEmail(text);
                      },
                    ),

                    // password
                    TextFormField(
                      obscureText: !isVisible,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Color(0xFF002140),
                            fontFamily: 'philosopher'),
                        fillColor: Colors.transparent,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF002140)),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xFF002140),
                          ),
                          onPressed: toggleShowPassword,
                        ),
                      ),
                      onChanged: (text) {
                        setPassword(text);
                      },
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          login();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return const Color(0xFF596A68).withOpacity(0.7);
                          return const Color(0xFF596A68);
                        }),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            const StadiumBorder()),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(147, 51)),
                        mouseCursor: MaterialStateProperty.all<MouseCursor>(
                            SystemMouseCursors.click),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: 'philosopher',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontFamily: 'philosopher',
                              fontSize: 15,
                              color: Color(0xFF002140)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
