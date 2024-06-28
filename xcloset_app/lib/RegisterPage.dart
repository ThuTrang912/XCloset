import 'package:flutter/material.dart';
import 'package:xcloset/LoginPage.dart';
import 'package:xcloset/MyHomePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  bool isVisible = false;

  void toggleShowPassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void setName(String name) {
    this.name = name;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void setConfirmPassword(String confirmPassword) {
    this.confirmPassword = confirmPassword;
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
                    // name
                    TextFormField(
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
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF002140)),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            color: Color(0xFF002140),
                            fontFamily: 'philosopher'),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      onChanged: (text) {
                        setName(text);
                      },
                    ),

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
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF002140)),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Color(0xFF002140),
                            fontFamily: 'philosopher'),
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
                        fillColor: Colors.transparent,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF002140)),
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Color(0xFF002140),
                            fontFamily: 'philosopher'),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            color: const Color(0xFF002140),
                          ),
                          onPressed: toggleShowPassword,
                        ),
                      ),
                      onChanged: (text) {
                        setPassword(text);
                      },
                    ),

                    // confirm password
                    TextFormField(
                      obscureText: !isVisible,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF002140)),
                        ),
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(
                            color: Color(0xFF002140),
                            fontFamily: 'philosopher'),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            color: const Color(0xFF002140),
                          ),
                          onPressed: toggleShowPassword,
                        ),
                      ),
                      onChanged: (text) {
                        setConfirmPassword(text);
                      },
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Registration successful!')),
                          );
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
                        'Register',
                        style: TextStyle(
                            fontFamily: 'philosopher',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
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
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
