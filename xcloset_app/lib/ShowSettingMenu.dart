import 'package:flutter/material.dart';
import 'package:xcloset/SettingPage.dart';

class ShowSettingMenu extends StatelessWidget {
  const ShowSettingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show menu when IconImage is tapped
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(100, 60, 0, 0),
          items: [
            PopupMenuItem(
              child: ListTile(
                  leading: const Icon(Icons.settings, color: Color(0xFF002140)),
                  title: const Text(
                    'Settings',
                    style: TextStyle(
                        fontFamily: 'philosopher',
                        color: Color(0xFF002140),
                        fontSize: 15),
                  ),
                  onTap: () {
                    // Handle Settings tap
                    print('Settings tapped');
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingPage(),
                      ),
                    );
                  }),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: const Icon(Icons.logout, color: Color(0xFF002140)),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                      fontFamily: 'philosopher',
                      color: Color(0xFF002140),
                      fontSize: 15),
                ),
                onTap: () {
                  // Handle Logout tap
                  print('Logout tapped');
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
              ),
            ),
          ],
          elevation: 8.0,
        );
      },
      child: const IconImage(assetPath: 'images/user.png'),
    );
  }
}

class IconImage extends StatelessWidget {
  final String assetPath;

  const IconImage({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      height: 30,
    );
  }
}
