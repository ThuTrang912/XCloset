import 'package:flutter/material.dart';

class PopupMenuExample extends StatefulWidget {
  const PopupMenuExample({super.key});

  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

enum SampleItem { itemOne, itemTwo }

class _PopupMenuExampleState extends State<PopupMenuExample> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      icon: Icon(
        Icons.more_vert,
        color: const Color(0xFF002140),
      ),
      initialValue: selectedItem,
      onSelected: (SampleItem item) {
        setState(() {
          selectedItem = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text(
            'All',
            style: TextStyle(
                fontFamily: 'philosopher',
                color: Color(0xFF002140),
                fontSize: 15),
          ),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text(
            'Like',
            style: TextStyle(
                fontFamily: 'philosopher',
                color: Color(0xFF002140),
                fontSize: 15),
          ),
        ),
      ],
    );
  }
}
