import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              
              // SUCCESS! Title
              const Text(
                'SUCCESS!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 2,
                ),
              ),
              
              const SizedBox(height: 60),
              
              // Illustration
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Furniture illustration using CustomPaint
                    CustomPaint(
                      size: const Size(200, 200),
                      painter: FurnitureIllustrationPainter(),
                    ),
                    
                    // Green checkmark circle at bottom
                    Positioned(
                      bottom: 40,
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Color(0xFF27AE60),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Message text
              const Text(
                'Your order will be delivered soon.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 8),
              
              const Text(
                'Thank you for choosing our app!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              
              const Spacer(),
              
              // Back to Home button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    side: const BorderSide(color: Colors.black87, width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'BACK TO HOME',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class FurnitureIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw plant on left side
    // Plant pot
    final potPath = Path();
    potPath.moveTo(centerX - 80, centerY - 20);
    potPath.lineTo(centerX - 90, centerY - 10);
    potPath.lineTo(centerX - 70, centerY - 10);
    potPath.close();
    canvas.drawPath(potPath, paint);

    // Plant leaves
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX - 80, centerY - 35),
        width: 20,
        height: 30,
      ),
      paint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX - 70, centerY - 40),
        width: 18,
        height: 28,
      ),
      paint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX - 90, centerY - 38),
        width: 18,
        height: 26,
      ),
      paint,
    );

    // Small table under plant
    canvas.drawLine(
      Offset(centerX - 95, centerY - 10),
      Offset(centerX - 65, centerY - 10),
      paint,
    );
    canvas.drawLine(
      Offset(centerX - 90, centerY - 10),
      Offset(centerX - 92, centerY + 5),
      paint,
    );
    canvas.drawLine(
      Offset(centerX - 70, centerY - 10),
      Offset(centerX - 68, centerY + 5),
      paint,
    );

    // Draw armchair in center
    // Chair seat
    final seatPath = Path();
    seatPath.moveTo(centerX - 30, centerY + 10);
    seatPath.quadraticBezierTo(
      centerX - 25,
      centerY - 5,
      centerX - 10,
      centerY - 10,
    );
    seatPath.quadraticBezierTo(
      centerX + 5,
      centerY - 5,
      centerX + 10,
      centerY + 10,
    );
    canvas.drawPath(seatPath, paint);

    // Chair back
    final backPath = Path();
    backPath.moveTo(centerX - 28, centerY + 8);
    backPath.quadraticBezierTo(
      centerX - 30,
      centerY - 20,
      centerX - 20,
      centerY - 35,
    );
    backPath.quadraticBezierTo(
      centerX - 10,
      centerY - 45,
      centerX,
      centerY - 45,
    );
    backPath.quadraticBezierTo(
      centerX + 10,
      centerY - 45,
      centerX + 20,
      centerY - 35,
    );
    canvas.drawPath(backPath, paint);

    // Chair arms
    canvas.drawLine(
      Offset(centerX - 30, centerY + 5),
      Offset(centerX - 35, centerY - 10),
      paint,
    );
    canvas.drawLine(
      Offset(centerX + 10, centerY + 5),
      Offset(centerX + 15, centerY - 10),
      paint,
    );

    // Chair legs
    canvas.drawLine(
      Offset(centerX - 25, centerY + 10),
      Offset(centerX - 28, centerY + 25),
      paint,
    );
    canvas.drawLine(
      Offset(centerX + 5, centerY + 10),
      Offset(centerX + 8, centerY + 25),
      paint,
    );

    // Draw floor lamp on right side
    // Lamp base
    canvas.drawCircle(
      Offset(centerX + 85, centerY + 25),
      8,
      paint,
    );

    // Lamp pole
    canvas.drawLine(
      Offset(centerX + 85, centerY + 17),
      Offset(centerX + 70, centerY - 50),
      paint,
    );

    // Lamp shade
    final lampShadePath = Path();
    lampShadePath.moveTo(centerX + 65, centerY - 55);
    lampShadePath.quadraticBezierTo(
      centerX + 70,
      centerY - 65,
      centerX + 75,
      centerY - 55,
    );
    lampShadePath.lineTo(centerX + 70, centerY - 50);
    canvas.drawPath(lampShadePath, paint);

    // Lamp light bulb
    canvas.drawCircle(
      Offset(centerX + 70, centerY - 52),
      3,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
