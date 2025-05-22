import 'package:flutter/material.dart';

class GPayScreenActions extends StatelessWidget {
  final VoidCallback onAddToGPay;
  final VoidCallback onMaybeLater;

  const GPayScreenActions({
    super.key,
    required this.onAddToGPay,
    required this.onMaybeLater,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final buttonHeight = size.height * 0.065;
    final fontSize = size.width * 0.045;
    final iconSize = size.width * 0.055;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(
        size.width * 0.06,
        size.height * 0.025,
        size.width * 0.06,
        size.height * 0.02 + bottomPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: buttonHeight,
            child: ElevatedButton(
              onPressed: onAddToGPay,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonHeight / 2),
                ),
                elevation: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add to ',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Image.asset(
                    'assets/images/googleIcon.png',
                    height: iconSize,
                  ),
                 
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.015),
          TextButton(
            onPressed: onMaybeLater,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
            ),
            child: Text(
              'Maybe Later',
              style: TextStyle(
                color: const Color(0xFF3C4061),
                decoration: TextDecoration.underline,
                decorationColor: const Color(0xFF3C4061),
                fontSize: fontSize * 0.9,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}