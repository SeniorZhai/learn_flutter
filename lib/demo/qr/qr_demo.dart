import 'package:flutter/material.dart';
import 'package:qr/qr.dart';

class QrDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Qr')),
        body: Center(
          child: QrCodeView(data: "QrCode test", isRound: true),
        ));
  }
}

class QrCodeView extends StatelessWidget {
  String data;
  Color qrColor;
  Color backgroundColor;
  int typeNumber;
  int errorCorrectLevel;
  bool isRound;
  QrCodeView(
      {this.data,
      this.typeNumber = 5,
      this.errorCorrectLevel = 2,
      this.qrColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.isRound = false})
      : assert(data != null),
        assert(typeNumber > 0 && typeNumber <= 10),
        assert(errorCorrectLevel >= 0 && errorCorrectLevel < 4);
  @override
  Widget build(BuildContext context) {
    final code = QrCode(typeNumber, errorCorrectLevel)
      ..addData(data)
      ..make();
    final squares = <bool>[];

    for (var x = 0; x < code.moduleCount; x++) {
      for (var y = 0; y < code.moduleCount; y++) {
        squares.add(code.isDark(y, x));
      }
    }
    return new CustomPaint(
      foregroundPainter: new QrPainter(
          moduleCount: code.moduleCount, squares: squares, isRound: isRound),
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
  bool isRound;
  QrPainter({this.moduleCount, this.squares, this.qrColor, this.isRound});

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
          if (isRound) {
            Offset offset = Offset(
              x * (itemWidth + 0.1),
              y * (itemWidth + 0.1),
            );
            canvas.drawCircle(offset, itemWidth / 2, paint);
          } else {
            Rect rect = Rect.fromLTWH(x * (itemWidth + 0.1),
                y * (itemWidth + 0.1), itemWidth, itemWidth);
            canvas.drawRect(rect, paint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
