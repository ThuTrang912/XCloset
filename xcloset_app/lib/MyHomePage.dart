import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xcloset/ClosetPage.dart';
import 'package:xcloset/HelpPage.dart';
import 'package:xcloset/NoticePage.dart';
import 'package:xcloset/ShowSettingMenu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 1;
  List<dynamic> _drawers = [];

  @override
  void initState() {
    super.initState();
    _fetchUserId();
  }

  Future<void> _fetchUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');
    
    if (userId != null) {
      _fetchDrawers(userId);
    } else {
      print('No user ID found');
    }
  }

  Future<void> _fetchDrawers(String userId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/drawers/$userId'));
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');
    
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print('Parsed JSON: $jsonResponse');
      setState(() {
        _drawers = jsonResponse['drawers'];
      });
    } else {
      print('Failed to load drawers');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/closettexture.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.1,
              color: Colors.yellow,
              child: const AppBarPage(),
            ),
            Expanded(
              child: IndexedStack(
                index: _index,
                children: [
                  NoticePage(),
                  ClosetPage(drawers: _drawers), // Pass the drawers data to ClosetPage
                  HelpPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _index,
        items: const <Widget>[
          Icon(
            Icons.notifications_on,
            size: 30,
            color: Colors.red,
          ),
          IconHomePage(),
          Icon(
            Icons.help,
            size: 30,
            color: Color.fromARGB(255, 228, 112, 62),
          ),
        ],
        color: Color(0xFFEBB094)!,
        buttonBackgroundColor: Color(0xFFABBFBD),
        backgroundColor: Color.fromARGB(255, 251, 212, 195),
        height: 50,
        animationCurve: Curves.linear,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}

class AppBarPage extends StatelessWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 224, 175, 153),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: Image.asset('images/logo.png',
                      height: 30)), // Adjusted height
              const SizedBox(width: 8), // Added spacing between logo and text
              const SizedBox(
                  child: Text('X',
                      style: TextStyle(
                          fontFamily: 'philosopher',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xFF002140)))), // Adjusted font size
              const SizedBox(
                  child: Text('CLOSET',
                      style: TextStyle(
                          fontFamily: 'philosopher',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFFF3530E)))),

              const Spacer(),
              // setting information and logout
              const ShowSettingMenu(),
            ],
          ),
        ));
  }
}

class IconHomePage extends StatelessWidget {
  const IconHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/wardrobe.png',
      width: 30,
      height: 30,
      fit: BoxFit.contain,
    );
  }
}
