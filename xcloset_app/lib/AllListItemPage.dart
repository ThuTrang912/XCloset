import 'package:flutter/material.dart';
import 'package:xcloset/ClosetPage.dart';
import 'dart:ui';

class AllListItemPage extends StatefulWidget {
  final int keyInt;
  final int keyCol;
  final String cardName;
  const AllListItemPage(
      {Key? key,
      required this.keyCol,
      required this.keyInt,
      required this.cardName})
      : super(key: key);

  @override
  _AllListItemPageState createState() => _AllListItemPageState();
}

final List<ItemWidget> allItems = [
  ItemWidget(title: '1'),
  ItemWidget(title: '2'),
  ItemWidget(title: '3'),
  ItemWidget(title: '4'),
  ItemWidget(title: '5'),
  ItemWidget(title: '6'),
  ItemWidget(title: '7'),
  ItemWidget(title: '8'),
  ItemWidget(title: '9'),
  ItemWidget(title: '10'),
];

class _AllListItemPageState extends State<AllListItemPage> {
  bool isDark = false;
  bool allLiked = false;
  List<ItemWidget> filteredItems = allItems;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterItems(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    final filtered = allItems.where((item) {
      return item.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredItems = filtered;
    });
  }

  void _toggleAllLikes() {
    setState(() {
      allLiked = !allLiked;
      for (var item in filteredItems) {
        item.setLikeState(allLiked);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFC08065), width: 1.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Color(0xFFABBFBD),
                            fontFamily: 'philosopher',
                            fontSize: 20),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFFABBFBD),
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      onChanged: (query) {
                        _filterItems(query);
                      },
                    ),
                  ),
                  Tooltip(
                    message: 'change brightness mode',
                    child: IconButton(
                      isSelected: isDark,
                      onPressed: () {
                        setState(() {
                          isDark = !isDark;
                        });
                      },
                      icon: const Icon(Icons.wb_sunny_outlined),
                      selectedIcon: const Icon(Icons.brightness_2_outlined),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${widget.cardName}',
              style: const TextStyle(
                  fontFamily: 'philosopher',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF596A68)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                child: ListView.separated(
                  itemCount: filteredItems.length,
                  separatorBuilder: (context, index) => SizedBox(
                      height:
                          8.0), // Phân cách giữa các item là SizedBox có chiều cao là 8.0
                  itemBuilder: (context, index) {
                    return filteredItems[
                        index]; // Trả về từng item trong danh sách
                  },
                ),
              ),
            ),
          ],
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
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: FloatingActionButton(
                onPressed: _toggleAllLikes,
                child: Icon(Icons.favorite, color: Colors.red),
                backgroundColor: const Color.fromARGB(255, 204, 220, 218),
                mini: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {
  final String title;
  final GlobalKey<_LikeCheckPageState> likeCheckKey =
      GlobalKey<_LikeCheckPageState>();
  ItemWidget({Key? key, required this.title}) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();

  void setLikeState(bool isChecked) {
    likeCheckKey.currentState?.setChecked(isChecked);
  }
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xFFABBFBD), width: 1.5))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.title}',
                  style: TextStyle(color: Color(0xFF596A68)),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'images/clothes/tshirt.png',
                    width: 25,
                    height: 25,
                  ),
                ),
                Spacer(),
                CheckBoxPage(),
                LikeCheckPage(key: widget.likeCheckKey),
              ]),
        ));
  }
}

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({Key? key}) : super(key: key);

  @override
  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      if (!isChecked) {
        return Colors.transparent;
      }
      return Colors.blue;
    }

    return Transform.scale(
      scale: 0.8, // Điều chỉnh tỷ lệ này để thay đổi kích thước checkbox
      child: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
        shape: CircleBorder(),
        side: BorderSide(color: Color(0xFFABBFBD), width: 1.5),
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      ),
    );
  }
}

class LikeCheckPage extends StatefulWidget {
  const LikeCheckPage({Key? key}) : super(key: key);

  @override
  _LikeCheckPageState createState() => _LikeCheckPageState();
}

class _LikeCheckPageState extends State<LikeCheckPage> {
  bool isChecked = false;

  void setChecked(bool checked) {
    setState(() {
      isChecked = checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Icon(
        isChecked ? Icons.favorite : Icons.favorite_border,
        color: isChecked ? Colors.red : Color(0xFFABBFBD),
        size: 17,
      ),
    );
  }
}
