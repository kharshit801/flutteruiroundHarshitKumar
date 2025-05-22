import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GPayScreenHeader extends StatelessWidget {
  const GPayScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    
    final imageSize = width * 0.22;
    final topPadding = height * 0.035;
    final spacing1 = height * 0.035;
    final spacing2 = height * 0.015;
    final spacing3 = height * 0.03;
    final horizontalPadding = width * 0.1;
    
    final titleFontSize = width * 0.06;
    final descriptionFontSize = width * 0.0375;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: topPadding),
        SvgPicture.asset(
          'assets/images/123.svg',
          height: imageSize,
          width: imageSize * 1.22,
        ),
        SizedBox(height: spacing1),
        Text(
          'Say hello to effortless and\nsecure payments',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1F2937),
          ),
        ),
        SizedBox(height: spacing2),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            'Add your Alaan card to Google Pay and enjoy quick, secure payments wherever you go.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: descriptionFontSize,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: spacing3),
      ],
    );
  }
}