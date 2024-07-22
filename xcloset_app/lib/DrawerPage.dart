import 'package:flutter/material.dart';
import 'package:xcloset/AllListItemPage.dart';

class DrawerPage extends StatefulWidget {
  final int keyInt;
  final int keyCol;
  final String drawerName; // Thêm tham số drawerName

  const DrawerPage({
    Key? key,
    required this.keyInt,
    required this.keyCol,
    required this.drawerName, // Thêm tham số drawerName
  }) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  late String cardName;
  late double widthCard;

  @override
  void initState() {
    super.initState();
    cardName = widget.drawerName; // Sử dụng drawerName từ widget
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Calculate widthCard here, after the widget has been fully initialized
    widthCard = MediaQuery.of(context).size.width * 0.3;
  }

  void _changeCardName() async {
    String? newName = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController textController = TextEditingController();
        return AlertDialog(
          title: const Text(
            'Enter new card name',
            style: TextStyle(
              fontFamily: 'philosopher',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002140),
            ),
          ),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: "New drawer name",
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
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
                Navigator.of(context).pop(textController.text);
              },
            ),
          ],
        );
      },
    );

    if (newName != null && newName.isNotEmpty) {
      setState(() {
        cardName = newName;
      });
    }
  }

  void _navigateToAllListItemPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllListItemPage(
          keyCol: widget.keyCol,
          keyInt: widget.keyInt,
          cardName: cardName,
        ),
      ),
    );
  }

  void _confirmDeleteCard() async {
    bool? confirmDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this card?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      setState(() {
        // Add your logic to delete the card here
        print('Card deleted');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use widthCard in the build method
    return GestureDetector(
        onDoubleTap: _changeCardName,
        onTap: _navigateToAllListItemPage,
        onLongPress: _confirmDeleteCard,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.37,
            child: Padding(
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Container(
                      height: 70,
                      // width: widthCard,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/drawer.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '$cardName',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'philosopher',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffABBFBD),
                    ),
                  ),
                ],
              ),
            )));
  }
}
