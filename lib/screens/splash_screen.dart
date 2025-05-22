import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'banner.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BannerPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final logoSize = width * 0.10;
    final spacing1 = height * 0.02;
    final spacing2 = height * 0.004;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 24, 84),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                'assets/images/alaanLogo.svg',
                width: logoSize,
                height: logoSize,
              ),
            ),
            SizedBox(height: spacing1),
            SizedBox(height: spacing2),
          ],
        ),
      ),
    );
  }
}