import 'package:flutter/material.dart';
import 'google_pay_screen.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final padding = MediaQuery.of(context).padding;
    const double appBarTopRadius = 20.0;
    const double bannerHeight = 72.0;
    const double iconSize = 40.0;
    const double iconPadding = 8.0;
    const double borderRadius = 16.0;
    const double innerBorderRadius = 15.0;

    return Stack(
      children: [
        Container(
          height: kToolbarHeight + padding.top,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff564194), Colors.black],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Banner', style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(appBarTopRadius)),
            ),
            child: Center(
              child: Container(
                width: width * 0.9,
                height: bannerHeight,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC0B2E6), Color(0x33C0B2E6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GooglePayScreen()),
                    ),
                    borderRadius: BorderRadius.circular(innerBorderRadius),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFC7CAFF),
                            Color(0xFFECE2FF),
                            Color(0xFFF9F0FF),
                            Color(0xFFECE2FF),
                            Color(0xFFC7CAFF),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(innerBorderRadius),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: iconSize,
                                  maxHeight: iconSize,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(iconPadding),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(iconPadding),
                                  child: Image.asset(
                                    'assets/images/gPay.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.03),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Pay safer & faster with Google Pay",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Color(0xFF333333),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Set up your card with Google Pay. It's easy!",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.black54),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}