import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawDemo extends StatelessWidget {
  DrawDemo() {
    if (!Platform.isAndroid && !Platform.isIOS) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      SystemChrome.setEnabledSystemUIOverlays([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PagerPainter(),
      ),
    );
  }
}

class PagerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(100, 100), 10, paint);
    canvas.drawLine(Offset(0, 0), Offset(94, 94), paint);
    Path path = Path();
    path.moveTo(100, 100);
    path.lineTo(200, 0);
    canvas.drawPath(path, paint..color = Colors.red);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 20;

    canvas.drawLine(
        Offset(50, 150), Offset(50, 200), paint..strokeCap = StrokeCap.butt);
    canvas.drawLine(
        Offset(100, 150), Offset(100, 200), paint..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(150, 150), Offset(150, 200),
        paint..strokeCap = StrokeCap.square);
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 20;
    path.moveTo(50, 250);
    path.lineTo(50, 350);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.bevel);

    path.reset();
    path.moveTo(50 + 150.0, 250);
    path.lineTo(50 + 150.0, 350);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.miter);

    path.reset();
    path.moveTo(50 + 150.0 * 2, 250);
    path.lineTo(50 + 150.0 * 2, 350);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.round);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeJoin = StrokeJoin.miter
      ..strokeWidth = 20;
    for (int i = 0; i < 4; i++) {
      path.reset();
      path.moveTo(50 + 150.0 * i, 450);
      path.lineTo(50 + 150.0 * i, 550);
      path.relativeLineTo(100, -(40.0 * i + 20));
      canvas.drawPath(path, paint..strokeMiterLimit = 2);
    }
    for (int i = 0; i < 4; i++) {
      path.reset();
      path.moveTo(50 + 150.0 * i, 50 + 550.0);
      path.lineTo(50 + 150.0 * i, 150 + 550.0);
      path.relativeLineTo(100, -(40.0 * i + 20));
      canvas.drawPath(path, paint..strokeMiterLimit = 3);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/**
 * 1. Canvas
 * 画布状态
 * void save() 
 * void saveLayer(Rect dounds, Paint paint)
 * void restore() 
 * int getSaveCount()
 * 画布变换 
 * void skew(double sx, double sy)
 * void rotate(double radians)
 * void scale(double sx, [double sy])
 * void translate(double dx, double dy)
 * void transform(Float64List matrix4)
 * 画布裁剪
 * void clipRect(Rect rect, { ClipOp clipOp = ClipOp.intersect, bool doAntiAlias = true })
 * void clipRRect(RRect rrect, {bool doAntiAlias = true})
 * void clipPath(Path path, {bool doAntiAlias = true})
 * 画布绘制 点
 * void drawPoints(PointMode pointMode, List<Offset> points, Paint paint)
 * void drawRawPoints(PointMode pointMode, Float32List points, Paint paint)
 * void drawLine(offset p1, offset p2, Paint paint)
 * void drawVertices(Vertices vertices, BlendMode blendMode, Paint paint)
 * 画布绘制 矩形
 * void drawRect(Rect rect, Paint paint)
 * void drawRRect(RRect rrect, Paint paint)
 * void drawDRect(RRect outer, RRect inner, Paint paint)
 * 画布绘制 圆
 * void drawOval(Rect rect, Paint paint)
 * void drawCircle(Offset c, double radius, Paint paint)
 * void drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint)
 * 画布绘制 图片
 * void drawImage(Image image, offset p, Paint paint)
 * void drawImageRect(image image, Rect src, Rect dst, Paint paint)
 * void drawImageNine(Image image, Rect center, Rect dst, Paint paint)
 * void drawAtlas(Image atlas, LisT<RSTransform> transform, List<Rect> rects, List<Color> colors, BlendMode blendMode, Rect cullRect, Paint paint)
 * void drawRawAtlas(Image atlas, Float32List rstTransform, Float32List rects, Int32List colors, BlendMode blendMode, Rect cullRect, Paint paint)
 * 画布绘制 文字
 * void drawParagraph(Paragraph paragraph, Offset offset)
 * 画布绘制 其他
 * void drawColor(Color color, BlendMode blendMode)
 * void drawPath(Path path, Paint paint)
 * void drawPaint(Paint paint)
 * void drawShadow(Path path, Color color, double elevation, bool transparentOccluder)
 * void drawPicture(Picture picture)
 * 
 * 2. Paint
 * isAntiAlias(抗锯齿) color(颜色) blendMode(混合模式) style(画笔样式)
 * strokeWith(线宽) strokeCap(线帽类型) strokeJoin(线接类型) strokeMiterLimit(斜接限制)
 * maskFilter(遮罩滤镜) shader(着色器) colorFilter(颜色滤镜) imageFilter(图片滤镜)
 * invertColors(是否反色) filterQuality(滤镜质量)
 * 
 * 3. path
 * 绝对移动
 * void moveTo(double x, double y)
 * void lineTo(double x, double y)
 * void quadraticBezierTo(double x1, double y1, double x2, double y2)
 * void cubicTo(double x1, double y1, double x2, double y2, double x3, double y3)
 * void conicTo(double x1, double y1, double x2, double y2, double w)
 * void arcTo(Rect rect, double startAngle, double sweepAngle, bool forceMoveTo)
 * void arcToPoint(Offset arcEnd, {Radius radius = Radius.zero, double rotation = 0.0, bool largeArc = false, bool clockwise = true })
 * 相对移动
 * void relativeMoveTo(double dx, double dy)
 * void relativeLineTo(double dx, double dy)
 * void relativeQuadraticBezierTo(double x1, double y1, double x2, double y2)
 * void relativeCubicTo(double x1, double y1, double x2, double y2, double x3, double y3)
 * void relativeConicTo(double x1, double y1, double x2, double y2, double w)
 * void relativeArcToPaint(Offset arcEndDelta, { Radius radius = Radius.zero, double rotation =0.0, bool largeArc = false, bool clockwise - false })
 * 添加路径
 * void addRect(Rect rect)
 * void addRRect(RRect rrect)
 * void addOval(Rect oval)
 * void addArc(Rect oval, double startAngle, double sweepAngle)
 * void addPolygon(List<Offset> points, bool close)
 * void addPath(Path path, Offset offset, {Float64List matrix4})
 * void extendWithPath(Path path, Offset offset, {Float64List matrix4})
 * 路径操作
 * void close()
 * void reset()
 * bool contsins(Offset point)
 * Path shift(Offset offset)
 * Path transform(Float64List matrix4)
 * Rect getBounds()
 * set fillType(PathFillType value)
 * static Path combine(PathOperation operation, Path path1, Path path2)
 * PathMetrics computeMetrics({bool forceClose = false})
 **/
