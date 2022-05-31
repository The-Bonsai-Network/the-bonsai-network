import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';

import 'package:bonsai_network/foundation/theme.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  Future<ui.Image> loadImage(String imagePath) async {
    ByteData bd = await rootBundle.load(imagePath);
    final Uint8List bytes = Uint8List.view(bd.buffer);

    final img.Image image = img.decodeImage(bytes)!;
    final img.Image resized = img.copyResize(image, width: 300);

    final Uint8List resizedBytes = Uint8List.fromList(
      img.encodePng(resized),
    );

    final Completer<ui.Image> completer = Completer();

    ui.decodeImageFromList(
      resizedBytes,
      (ui.Image img) => completer.complete(img),
    );

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primaryBackground.color,
      body: Center(
        child: FutureBuilder<ui.Image>(
            future: loadImage('assets/images/bonsai.png'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomPaint(
                  foregroundPainter: ConcentricCirclesPainter(snapshot.data!),
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}

class ConcentricCirclesPainter extends CustomPainter {
  final ui.Image image;

  ConcentricCirclesPainter(this.image) : super();

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
          ..color = Colors.white
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
