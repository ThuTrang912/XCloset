import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  final List<String> items =
      List<String>.generate(20, (i) => 'notification $i');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'NOTIFICATION',
          style: TextStyle(
              fontFamily: 'philosopher',
              fontSize: 20,
              color: Color(0xFF002140),
              fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    items[index],
                    style: const TextStyle(
                      fontFamily: 'philosopher',
                      fontSize: 18,
                      color: Color(0xFF002140),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
