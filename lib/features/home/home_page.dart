import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protfolio/features/home/widgets.dart';
import 'package:protfolio/nested.dart';
import 'package:protfolio/shared/extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFF), // keep this
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Stack(
          children: [
            /// 🔹 Background Image (Full Right Side Soft Blend)
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: const [0.0, 0.25, 0.5], // 👈 control fade width
                      colors: const [
                        Colors.transparent, // fully hidden at very left
                        Color(0xFFFAFBFF), // match scaffold color
                        Color(0xFFFAFBFF), // fully visible rest of image
                      ],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/image/profile_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            /// 🔹 Left Content
            Container(
              width: context.screenWidth * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Color(0xFF2563EB)),
                        ),
                        child: Text(
                          'Welcome',
                          style: TextStyle(color: Color(0xFF2563EB)),
                        ),
                      ),
                      SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Flutter Developer ',
                              style: TextStyle(
                                color: Color(0xFF0F172A),
                                fontSize: 56,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                            TextSpan(
                              text: 'Crafting High-Performance ',
                              style: TextStyle(
                                color: Color(0xFF2563EB),
                                fontSize: 56,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'Apps',
                              style: TextStyle(
                                color: Color(0xFF0F172A),
                                fontSize: 56,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'I build scalable moblie and web applications using Flutter, Firebase and Rest APIs with clean architc',
                        style: TextStyle(
                          color: Color(0xFF475569),
                          fontSize: 18,
                          height: 1.6,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          PrimaryButton(
                            text: 'View Projects',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PortfolioPage(),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 16),
                          SecondaryButton(
                            text: 'Download Resume',
                            onPressed: () {},
                          ),  
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
