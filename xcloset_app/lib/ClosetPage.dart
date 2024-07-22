// import 'package:flutter/material.dart';
// import 'package:xcloset/DrawerPage.dart';
// import 'package:xcloset/PopupMenuExample.dart';

// class ClosetPage extends StatefulWidget {
//   final List<dynamic> drawers; // Thay đổi để nhận danh sách drawers

//   const ClosetPage({Key? key, required this.drawers}) : super(key: key);

//   @override
//   _ClosetPageState createState() => _ClosetPageState();
// }

// class _ClosetPageState extends State<ClosetPage> {
//   int columnitems = 0;
//   List<Widget> classWidgets = [];

//   @override
//   void initState() {
//     super.initState();
//     _initializeDrawer();
//   }

//   void _initializeDrawer() {
//     setState(() {
//       classWidgets.add(IconButtonColumnPage(
//         key: UniqueKey(),
//         keyInt: columnitems,
//         newClassWidget: _addClassWidget,
//       ));
//       columnitems++;
      
//       // Chuyển dữ liệu từ API thành các DrawerPage
//       for (var drawer in widget.drawers) {
//         classWidgets.add(DrawerPage(
//           key: UniqueKey(),
//           keyInt: columnitems,
//           drawerName: drawer['drawer_name'], // Truyền thông tin drawer
//           keyCol: columnitems,
//         ));
//         columnitems++;
//       }
//     });
//   }

//   void _addClassWidget() {
//     setState(() {
//       int clickkey = IconButtonColumnPage.clicked;
//       int insertIndex = -1;

//       for (int i = 0; i < classWidgets.length; i++) {
//         if (classWidgets[i] is IconButtonColumnPage &&
//             (classWidgets[i] as IconButtonColumnPage).keyInt == clickkey) {
//           insertIndex = i;
//           break;
//         }
//       }

//       if (insertIndex == 0) {
//         classWidgets.insert(
//           0,
//           IconButtonColumnPage(
//             key: UniqueKey(),
//             keyInt: columnitems,
//             newClassWidget: _addClassWidget,
//           ),
//         );
//         columnitems++;
//         classWidgets.insert(
//           1,
//           MyClassWidget(key: UniqueKey(), columnitems: columnitems),
//         );
//         columnitems++;
//       } else if (insertIndex == (classWidgets.length - 1)) {
//         classWidgets.add(
//           MyClassWidget(key: UniqueKey(), columnitems: columnitems),
//         );
//         columnitems++;
//         classWidgets.add(
//           IconButtonColumnPage(
//             key: UniqueKey(),
//             keyInt: columnitems,
//             newClassWidget: _addClassWidget,
//           ),
//         );
//         columnitems++;
//       } else {
//         classWidgets.insert(
//           insertIndex,
//           IconButtonColumnPage(
//             key: UniqueKey(),
//             keyInt: columnitems,
//             newClassWidget: _addClassWidget,
//           ),
//         );
//         columnitems++;
//         classWidgets.insert(
//           insertIndex + 1,
//           MyClassWidget(key: UniqueKey(), columnitems: columnitems),
//         );
//         columnitems++;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           top: 0,
//           right: 0,
//           child: Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 border: const Border(
//                   left: BorderSide(color: Color(0xFFC08065), width: 8.0),
//                   top: BorderSide(color: Color(0xFFC08065), width: 8.0),
//                   right: BorderSide(color: Color(0xFFC08065), width: 8.0),
//                 ),
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ...classWidgets,
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const Positioned(
//           top: 0,
//           right: 0,
//           child: PopupMenuExample(),
//         ),
//       ],
//     );
//   }
// }

// class MyClassWidget extends StatefulWidget {
//   final int columnitems;

//   const MyClassWidget({Key? key, required this.columnitems}) : super(key: key);

//   @override
//   _MyClassWidgetState createState() => _MyClassWidgetState();
// }

// class _MyClassWidgetState extends State<MyClassWidget> {
//   List<Widget> classDrawerList = [];
//   int keyInt = 0;
//   int clickkey = 0;

//   @override
//   void initState() {
//     super.initState();
//     _initializeDrawer();
//   }

//   void _addclassDrawer() {
//     int insertIndex = -1;
//     clickkey = IconButtonPage.clicked;

//     for (int i = 0; i < classDrawerList.length; i++) {
//       if (classDrawerList[i] is IconButtonPage &&
//           (classDrawerList[i] as IconButtonPage).keyInt == clickkey) {
//         insertIndex = i;
//         break;
//       }
//     }

//     setState(() {
//       if (insertIndex == 0) {
//         classDrawerList.insert(
//           0,
//           IconButtonPage(
//             key: UniqueKey(),
//             keyInt: keyInt,
//             newClassWidget: _addclassDrawer,
//           ),
//         );
//         keyInt++;
//         classDrawerList.insert(
//           1,
//           DrawerPage(
//             key: UniqueKey(),
//             keyInt: keyInt,
//             keyCol: widget.columnitems,
//             drawerName: 'Drawer $keyInt', // Placeholder, update as needed
//           ),
//         );
//         keyInt++;
//       } else if (insertIndex == (classDrawerList.length - 1)) {
//         classDrawerList.add(
//           DrawerPage(
//             key: UniqueKey(),
//             keyInt: keyInt,
//             keyCol: widget.columnitems,
//             drawerName: 'Drawer $keyInt', // Placeholder, update as needed
//           ),
//         );
//         keyInt++;
//         classDrawerList.add(
//           IconButtonPage(
//             key: UniqueKey(),
//             keyInt: keyInt,
//             newClassWidget: _addclassDrawer,
//           ),
//         );
//         keyInt++;
//       } else {
//         classDrawerList.insert(
//           insertIndex,
//           IconButtonPage(
//             key: UniqueKey(),
//             keyInt: keyInt,
//             newClassWidget: _addclassDrawer,
//           ),
//         );
//         keyInt++;
//         classDrawerList.insert(
//           insertIndex + 1,
//           DrawerPage(
//             key: UniqueKey(),
//             keyInt: keyInt,
//             keyCol: widget.columnitems,
//             drawerName: 'Drawer $keyInt', // Placeholder, update as needed
//           ),
//         );
//         keyInt++;
//       }

//       clickkey = IconButtonPage.clicked;
//     });
//   }

//   void _initializeDrawer() {
//     setState(() {
//       classDrawerList.add(
//         IconButtonPage(
//           key: UniqueKey(),
//           keyInt: keyInt,
//           newClassWidget: _addclassDrawer,
//         ),
//       );
//       keyInt++;

//       classDrawerList.add(
//         DrawerPage(
//           key: UniqueKey(),
//           keyInt: keyInt,
//           keyCol: widget.columnitems,
//           drawerName: 'Drawer $keyInt', // Placeholder, update as needed
//         ),
//       );
//       keyInt++;

//       classDrawerList.add(
//         IconButtonPage(
//           key: UniqueKey(),
//           keyInt: keyInt,
//           newClassWidget: _addclassDrawer,
//         ),
//       );
//       keyInt++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     return Center(
//       child: Container(
//         width: width,
//         height: MediaQuery.of(context).size.height * 0.035 + 90,
//         decoration: const BoxDecoration(
//           border: Border(
//             bottom: BorderSide(color: Color(0xFFC08065), width: 8.0),
//           ),
//         ),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ...classDrawerList,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class IconButtonPage extends StatelessWidget {
//   final VoidCallback newClassWidget;
//   final int keyInt;

//   const IconButtonPage({
//     Key? key,
//     required this.keyInt,
//     required this.newClassWidget,
//   }) : super(key: key);

//   static int clicked = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.zero,
//       child: Container(
//         width: 20,
//         height: 70,
//         alignment: Alignment.center,
//         child: Transform.translate(
//           offset: const Offset(0, -6),
//           child: IconButton(
//             icon: const Icon(
//               Icons.add,
//               color: Color(0xffABBFBD),
//               size: 18,
//             ),
//             alignment: Alignment.center,
//             padding: EdgeInsets.zero,
//             constraints: const BoxConstraints(),
//             onPressed: () {
//               clicked = keyInt;
//               newClassWidget();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class IconButtonColumnPage extends StatelessWidget {
//   final VoidCallback newClassWidget;
//   final int keyInt;

//   const IconButtonColumnPage({
//     Key? key,
//     required this.keyInt,
//     required this.newClassWidget,
//   }) : super(key: key);

//   static int clicked = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 20,
//       height: 20,
//       alignment: Alignment.center,
//       child: Transform.translate(
//         offset: const Offset(0, -3),
//         child: IconButton(
//           icon: const Icon(
//             Icons.add,
//             color: Color(0xffABBFBD),
//             size: 18,
//           ),
//           alignment: Alignment.center,
//           padding: EdgeInsets.zero,
//           constraints: const BoxConstraints(),
//           onPressed: () {
//             clicked = keyInt;
//             newClassWidget();
//           },
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:xcloset/PopupMenuExample.dart';
import 'package:xcloset/DrawerPage.dart'; // Đảm bảo rằng DrawerPage đã được định nghĩa và nhập khẩu chính xác

class ClosetPage extends StatefulWidget {
  final List<dynamic> drawers; // Dữ liệu drawers được truyền từ MyHomePage

  const ClosetPage({Key? key, required this.drawers}) : super(key: key);

  @override
  _ClosetPageState createState() => _ClosetPageState();
}

class _ClosetPageState extends State<ClosetPage> {
  @override
  void initState() {
    super.initState();
    // In ra dữ liệu drawers để kiểm tra
    print('Drawers in ClosetPage: ${widget.drawers}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: const Border(
                    left: BorderSide(color: Color(0xFFC08065), width: 8.0),
                    top: BorderSide(color: Color(0xFFC08065), width: 8.0),
                    right: BorderSide(color: Color(0xFFC08065), width: 8.0),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: widget.drawers.isEmpty
                    ? Center(child: Text('No drawers available'))
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Đặt số cột là 2
                          crossAxisSpacing: 8.0, // Khoảng cách giữa các cột
                          mainAxisSpacing: 1.0, // Khoảng cách giữa các hàng
                          childAspectRatio: 1.0, // Tỉ lệ khung hình của mỗi item
                        ),
                        itemCount: widget.drawers.length,
                        itemBuilder: (context, index) {
                          final drawer = widget.drawers[index];
                          return DrawerPage(
                            key: UniqueKey(),
                            keyInt: index,
                            drawerName: drawer['drawer_name'],
                            keyCol: index,
                          );
                        },
                      ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: PopupMenuExample(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



