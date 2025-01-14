import 'dart:math';

import 'package:flutter/material.dart';

class WaveAnimation extends StatefulWidget {
  const WaveAnimation({
    required this.colors,
    this.backgroundColor = Colors.transparent,
    super.key,
  });

  final List<Color> colors;
  final Color backgroundColor;

  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: WavePainter(
                widget.colors,
                widget.backgroundColor,
                _controller.value,
                constraints.maxWidth,
                constraints.maxHeight,
              ),
              size: Size(constraints.maxWidth, constraints.maxHeight),
            );
          },
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  WavePainter(this.colors, this.backgroundColor, this.progress, this.width, this.height);

  final List<Color> colors;
  final Color backgroundColor;
  final double progress;
  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = backgroundColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    for (var i = 0; i < colors.length; i++) {
      // Смешиваем круговое и "волноподобное" движение
      final angle = (progress + i / colors.length) * 2 * pi;
      final offsetX = cos(angle) * (size.width * 0.2) + sin(angle * 2) * (size.width * 0.1); // Дополнительное движение
      final offsetY = sin(angle) * (size.height * 0.2) + cos(angle * 2) * (size.height * 0.1); // Дополнительное движение

      final dx = (size.width / 2) + offsetX;
      final dy = (size.height / 2) + offsetY;

      final radius = size.width * 0.4 + sin(angle * 3) * 30; // Радиус изменяется

      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            colors[i].withOpacity(0.4),
            colors[i].withOpacity(0.0),
          ],
          stops: const [0.5, 1.0],
        ).createShader(Rect.fromCircle(center: Offset(dx, dy), radius: radius));

      canvas.drawCircle(Offset(dx, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
