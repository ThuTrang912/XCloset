import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xcloset/LoginPage.dart';
import 'package:xcloset/MyHomePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isVisible = false;

  void toggleShowPassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  Future<void> register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/users/upload'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword
      }),
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      // Đăng ký thành công
      final jsonData = jsonDecode(response.body);
      final userData = jsonData['data']; // Điều chỉnh nếu cấu trúc JSON khác

      // Lưu thông tin người dùng
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', userData['id'].toString());
      await prefs.setString('user_name', userData['name']);
      await prefs.setString('user_email', userData['email']);
      await prefs.setString('user_created_at', userData['created_at']);
      await prefs.setString('user_updated_at', userData['updated_at']);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful!')),
      );
      // Chuyển hướng sang MyHomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      // Xử lý lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed!')),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create',
                  style: TextStyle(
                    fontFamily: 'philosopher',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF002140),
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                const Text(
                  'your account',
                  style: TextStyle(
                    fontFamily: 'philosopher',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF002140),
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // name
                      TextFormField(
                        controller: nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF002140)),
                          ),
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: Color(0xFF002140),
                            fontFamily: 'philosopher',
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),

                      // email
                      TextFormField(
                        controller: emailController,
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
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF002140)),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color(0xFF002140),
                            fontFamily: 'philosopher',
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),

                      // password
                      TextFormField(
                        controller: passwordController,
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
                          fillColor: Colors.transparent,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF002140)),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Color(0xFF002140),
                            fontFamily: 'philosopher',
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible ? Icons.visibility : Icons.visibility_off,
                              color: const Color(0xFF002140),
                            ),
                            onPressed: toggleShowPassword,
                          ),
                        ),
                      ),

                      // confirm password
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: !isVisible,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF002140)),
                          ),
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(
                            color: Color(0xFF002140),
                            fontFamily: 'philosopher',
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible ? Icons.visibility : Icons.visibility_off,
                              color: const Color(0xFF002140),
                            ),
                            onPressed: toggleShowPassword,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            register();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered))
                                return const Color(0xFF596A68).withOpacity(0.7);
                              return const Color(0xFF596A68);
                            },
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            const StadiumBorder(),
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(147, 51),
                          ),
                          mouseCursor: MaterialStateProperty.all<MouseCursor>(
                            SystemMouseCursors.click,
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontFamily: 'philosopher',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontFamily: 'Philosopher',
                              fontSize: 14,
                              color: Color(0xFF002140),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Philosopher',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),
                          );
                        },
                        child: const Text('myhomepage'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
