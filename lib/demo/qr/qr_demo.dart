import 'package:flutter/material.dart';
import 'package:qr/qr.dart';

class QrDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Qr')),
        body: Center(
          child: QrCodeView(data: "QrCode test"),
        ));
  }
}

class QrCodeView extends StatelessWidget {
  String data;
  Color qrColor;
  Color backgroundColor;
  int typeNumber;
  int errorCorrectLevel;
  QrCodeView(
      {this.data,
      this.typeNumber = 5,
      this.errorCorrectLevel = 2,
      this.qrColor = Colors.black,
      this.backgroundColor = Colors.white});
  @override
  Widget build(BuildContext context) {
    final code = QrCode(typeNumber, errorCorrectLevel)
      ..addData(data)
      ..make();
    print(code.moduleCount);
    final squares = <bool>[];

    for (var x = 0; x < code.moduleCount; x++) {
      for (var y = 0; y < code.moduleCount; y++) {
        squares.add(code.isDark(y, x));
      }
    }
    return new CustomPaint(
      foregroundPainter:
          new QrPainter(moduleCount: code.moduleCount, squares: squares),
      child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(color: backgroundColor)),
    );
  }
}

class QrPainter extends CustomPainter {
  int moduleCount;
  List<bool> squares;
  Color qrColor;
  QrPainter({this.moduleCount, this.squares, this.qrColor});

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double itemWidth = (width - (moduleCount - 1) * 0.1) / moduleCount;
    Paint paint = new Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    for (var x = 0; x < moduleCount; x++) {
      for (var y = 0; y < moduleCount; y++) {
        if (squares[x * moduleCount + y]) {
          Rect rect = Rect.fromLTWH(x * (itemWidth + 0.1),
              y * (itemWidth + 0.1), itemWidth, itemWidth);
          canvas.drawRect(rect, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
