import 'package:flutter/material.dart';
import 'package:xcloset/LoginPage.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({Key? key}) : super(key: key);

  @override
  _WellcomeState createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/floor.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            SizedBox(
                width: width, height: height * 0.1, child: const AppbarClass()),
            SizedBox(
              width: width,
              height: height - (height * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: width,
                      height: (height - (height * 0.1)) * 0.5,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                EllipseContainerWithBorder(),
                                const SizedBox(width: 25),
                                EllipseContainerWithBorder()
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomPaint(
                              size: Size(width * 0.45, 49),
                              painter: SmilePainter(),
                            ),
                          ])),
                  SizedBox(height: (height - (height * 0.1)) * 1 / 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFFFFF).withOpacity(0.4),
                      fixedSize: Size(width * 0.4, 50),
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'START',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF002140),
                        fontFamily: 'philosopher',
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppbarClass extends StatelessWidget {
  const AppbarClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TitleText(),
        Container(
          margin: const EdgeInsetsDirectional.only(top: 10),
          child: Transform.rotate(
            angle: -14 * 3.14159 / 180, // Chuyển đổi độ sang radian
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.fill,
              height: 87,
            ),
          ),
        )
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'X',
          style: TextStyle(
              color: Color(0xFF002140),
              fontFamily: 'Philosopher',
              fontSize: 30),
        ),
        Text(
          'CLOSET',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Philosopher', fontSize: 24),
        )
      ],
    );
  }
}

class EllipseContainerWithBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13,
      height: 79,
      child: CustomPaint(
        painter: EllipsePainter(),
      ),
    );
  }
}

class EllipsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    double centerX = width / 2;
    double centerY = height / 2;

    double radiusX = width * 0.5;
    double radiusY = height * 0.5;

    // Vẽ hình elip màu xanh
    Paint ellipsePaint = Paint()
      ..color = const Color(0xFFABBFBD)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(centerX, centerY), width: width, height: height),
        ellipsePaint);

    Paint borderPaint = Paint()
      ..color = const Color(0xFF775546)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(centerX, centerY), width: width, height: height),
        borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SmilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Circle

    Paint paint_fill_1 = Paint()
      ..color = const Color(0xFFABBFBD)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4866500, size.height * 0.8390833);
    path_1.cubicTo(
        size.width * 0.8342000,
        size.height * 0.8683676,
        size.width * 0.7528500,
        size.height * 0.0640166,
        size.width * 0.8275000,
        size.height * 0.4554828);
    path_1.cubicTo(
        size.width * 0.8235500,
        size.height * 0.7414285,
        size.width * 0.6830000,
        size.height * 0.9993000,
        size.width * 0.4736500,
        size.height * 0.9993000);
    path_1.cubicTo(
        size.width * 0.3336000,
        size.height * 0.9995420,
        size.width * 0.1828000,
        size.height * 0.7472370,
        size.width * 0.1685000,
        size.height * 0.4035696);
    path_1.cubicTo(
        size.width * 0.2685500,
        size.height * 0.1747404,
        size.width * 0.1915500,
        size.height * 0.8070157,
        size.width * 0.4866500,
        size.height * 0.8390833);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);

    // Circle

    Paint paint_stroke_1 = Paint()
      ..color = const Color(0xFF775546)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_1, paint_stroke_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
