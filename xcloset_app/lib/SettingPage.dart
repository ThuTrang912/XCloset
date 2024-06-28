import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String _userName = 'ran ran ';
  String _userPassword = '********';
  String _userEmail = 'Ranran@example.com';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool _isEditingName = false;
  bool _isEditingPassword = false;
  bool _isEditingEmail = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = _userName;
    _passwordController.text = _userPassword;
    _emailController.text = _userEmail;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
          style: TextStyle(
              fontFamily: 'philosopher',
              color: Color(0xFF002140),
              fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFABBFBD),
              radius: width * 0.2,
              child: const CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('images/user.png'),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'User Information',
              style: TextStyle(
                fontFamily: 'philosopher',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002140),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildEditableField(
                      label: 'Name',
                      controller: _nameController,
                      isEditing: _isEditingName,
                      toggleEditing: _toggleEditing,
                    ),
                    const SizedBox(height: 20),
                    _buildEditableField(
                      label: 'Email',
                      controller: _emailController,
                      isEditing: _isEditingEmail,
                      toggleEditing: _toggleEditing,
                    ),
                    const SizedBox(height: 20),
                    _buildEditableField(
                      label: 'Password',
                      controller: _passwordController,
                      isEditing: _isEditingPassword,
                      toggleEditing: _toggleEditing,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 30,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Color(0xFF596A68)),
              mini: true,
              backgroundColor: const Color.fromARGB(255, 204, 220, 218),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: FloatingActionButton(
              onPressed: () {
                _updateInformation();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Update Successful',
                        style: TextStyle(
                          fontFamily: 'philosopher',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF002140),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              fontFamily: 'philosopher',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF002140),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.check, color: Color(0xFF596A68)),
              backgroundColor: const Color.fromARGB(255, 204, 220, 218),
              mini: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required bool isEditing,
    required Function(String) toggleEditing,
    bool isPassword = false,
  }) {
    return isEditing
        ? TextFormField(
            controller: controller,
            autofocus: true,
            obscureText: isPassword,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(
                color: Color(0xFF002140),
                fontFamily: 'philosopher',
              ),
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              suffixIcon: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () => toggleEditing(label.toLowerCase()),
              ),
            ),
          )
        : InkWell(
            onTap: () => toggleEditing(label.toLowerCase()),
            child: IgnorePointer(
              child: TextFormField(
                controller: controller,
                readOnly: true,
                obscureText: isPassword,
                decoration: InputDecoration(
                  labelText: label,
                  labelStyle: const TextStyle(
                    color: Color(0xFF002140),
                    fontFamily: 'philosopher',
                  ),
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: const Icon(Icons.edit),
                ),
              ),
            ),
          );
  }

  void _toggleEditing(String field) {
    setState(() {
      if (field == 'name') {
        _isEditingName = !_isEditingName;
      } else if (field == 'email') {
        _isEditingEmail = !_isEditingEmail;
      } else if (field == 'password') {
        _isEditingPassword = !_isEditingPassword;
      }
    });
  }

  void _updateInformation() {
    setState(() {
      _userName = _nameController.text;
      _userEmail = _emailController.text;
      _userPassword = _passwordController.text;
      _isEditingName = false;
      _isEditingEmail = false;
      _isEditingPassword = false;
    });
    print('Updated Name: $_userName');
    print('Updated Email: $_userEmail');
    print('Updated Password: $_userPassword');
  }
}
