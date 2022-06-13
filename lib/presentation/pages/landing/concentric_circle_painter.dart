import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:bonsai_network/foundation/theme.dart';

class ConcentricCirclesPainter extends CustomPainter {
  final ui.Image image;
  final BuildContext context;

  ConcentricCirclesPainter(this.image, this.context) : super();

  List<Paint> get _painters => [
        Paint()
          ..color = ThemeColor.primaryGreen.color
          ..style = PaintingStyle.fill,
        Paint()
          ..color = ThemeColor.green1.color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 30.0,
        Paint()
          ..color = ThemeColor.green2.color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 20.0,
        Paint()
          ..color = ThemeColor.green3.color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 20.0,
        Paint()
          ..color = ThemeColor.green4.color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 40.0,
        Paint()
          ..color = ThemeColor.green5.color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 30.0,
        Paint()
          ..color =
              MediaQuery.of(context).platformBrightness == ui.Brightness.light
                  ? Colors.white
                  : Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 25.0,
      ];

  List<double> get _radii => [
        100,
        110,
        115,
        130,
        150,
        158,
        180,
      ];

  List<Offset> get _offsets => const [
        Offset(0, 9),
        Offset(0, 8),
        Offset(0, 7),
        Offset(0, 6),
        Offset(0, 5),
        Offset(0, 0),
        Offset(0, 0),
      ];

  @override
  void paint(Canvas canvas, Size size) async {
    canvas.scale(size.width / 12, size.height / 12);

    var range1 = List<int>.generate(4, (i) => i);
    for (int i in range1) {
      canvas.drawCircle(_offsets[i], _radii[i], _painters[i]);
    }

    canvas.drawImage(image, const Offset(-145.0, -125.0), Paint());

    var range2 = List<int>.generate(4, (i) => i);
    for (int i in range2) {
      canvas.drawCircle(_offsets[i + 3], _radii[i + 3], _painters[i + 3]);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
