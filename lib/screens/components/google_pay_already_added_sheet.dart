import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GooglePayAlreadyAddedSheet extends StatelessWidget {
  final String cardTitle;
  final String lastFourDigits;

  const GooglePayAlreadyAddedSheet({
    super.key,
    required this.cardTitle,
    required this.lastFourDigits,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.height < 600;
    
    return Container(
      padding: EdgeInsets.fromLTRB(
        24.0,
        16.0,
        24.0,
        isSmallScreen ? 16.0 : 24.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(bottom: isSmallScreen ? 12.0 : 20.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'This card is already added to',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2B244E),
                  ),
                ),
                Text(
                  'Google Pay',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2B244E),
                  ),
                ),
                SizedBox(height: isSmallScreen ? 8 : 12),
                Text(
                  'Safely make in-store and online purchases.',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 13 : 15,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isSmallScreen ? 16 : 24),
          SizedBox(
            width: screenSize.width * 0.85,
            child: _buildCardVisual(context, cardTitle, lastFourDigits),
          ),
          SizedBox(height: isSmallScreen ? 20 : 30),
          SizedBox(
            width: double.infinity,
            height: isSmallScreen ? 45 : 50,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.grey[700],
                side: BorderSide(color: Colors.grey[300]!),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                textStyle: TextStyle(
                  fontSize: isSmallScreen ? 14 : 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: const Text('Okay'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardVisual(BuildContext context, String title, String lastDigits) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.height < 600;
    
    return AspectRatio(
      aspectRatio: 1.586,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF3EEFF),
              Color(0xFFE6DFFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _CardBackgroundWavePainter(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'ΛLΛΛN',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 16 : 20,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF6A29E0),
                            ),
                          ),
                          Text(
                            'Virtual',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 8 : 10,
                              color: const Color(0xFF6A29E0),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 10 : 12,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 2 : 4),
                    Text(
                      '●●●●  $lastDigits',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF333333),
                        letterSpacing: 2,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'VISA',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 22 : 26,
                              fontWeight: FontWeight.bold,
                              fontStyle: ui.FontStyle.italic,
                              color: const Color(0xFF1A1F71),
                            ),
                          ),
                          Text(
                            'Business',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 8 : 9,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1A1F71),
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardBackgroundWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.3, size.height * 0.15,
        size.width * 0.65, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.6,
        size.width, size.height * 0.45);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);

    final paint2 = Paint()
      ..color = Colors.white.withAlpha(51)
      ..style = PaintingStyle.fill;
    
    final path2 = Path();
    path2.moveTo(0, size.height * 0.5);
    path2.quadraticBezierTo(
        size.width * 0.4, size.height * 0.3,
        size.width * 0.75, size.height * 0.6);
    path2.quadraticBezierTo(
        size.width * 0.95, size.height * 0.8,
        size.width, size.height * 0.7);
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);
    path2.close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}