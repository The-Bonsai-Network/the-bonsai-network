import 'package:bonsai_network/presentation/pages/landing/landing_button.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';

import 'package:bonsai_network/foundation/theme.dart';
import 'package:bonsai_network/presentation/pages/landing/concentric_circle_painter.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: FutureBuilder<ui.Image>(
              future: loadImage('assets/images/bonsai.png'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomPaint(
                    size: const Size(10, 10),
                    foregroundPainter: ConcentricCirclesPainter(snapshot.data!),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          const Spacer(),
          Text(
            'THE',
            style: TextStyles.aquireTitle3.style,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'BONSAI',
              style: TextStyles.aquireTitle1.style,
            ),
          ),
          Text(
            'NETWORK',
            style: TextStyles.aquireTitle3.style,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.0),
            child: Text(
              'Connecting Business Entrepreneurs',
              style: TextStyle(
                color: ThemeColor.primaryGreen.color,
                fontSize: 22,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: LandingButtonWidget(),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
